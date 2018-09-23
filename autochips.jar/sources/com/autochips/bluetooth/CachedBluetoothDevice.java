package com.autochips.bluetooth;

import android.app.AlertDialog.Builder;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothProfileManager.Profile;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.ParcelUuid;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import android.view.ContextMenu;
import android.view.MenuItem;
import com.autochips.bluetooth.LocalBluetoothProfileManager.BTProfile;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class CachedBluetoothDevice implements Comparable<CachedBluetoothDevice> {
    public static final String ACTION_DISAPPEARED = "android.bluetooth.device.action.DISAPPEARED";
    public static final String ACTION_PAIRING_CANCEL = "android.bluetooth.device.action.PAIRING_CANCEL";
    private static final int BLUETOOTH_NAME_MAX_LENGTH = 59;
    private static final int CONTEXT_ITEM_CONNECT_ADVANCED = 5;
    private static final int CONTEXT_ITEM_DISCONNECT = 3;
    private static final int CONTEXT_ITEM_PAIR = 2;
    private static final int CONTEXT_ITEM_RENAME = 6;
    private static final int CONTEXT_ITEM_UNPAIR = 4;
    private static final boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugSettings);
    public static final String EXTRA_REASON = "android.bluetooth.device.extra.REASON";
    private static final long MAX_UUID_DELAY_FOR_AUTO_CONNECT = 5000;
    public static final int PAIRING_VARIANT_CONSENT = 3;
    public static final int PAIRING_VARIANT_DISPLAY_PASSKEY = 4;
    public static final int PAIRING_VARIANT_DISPLAY_PIN = 5;
    public static final int PAIRING_VARIANT_OOB_CONSENT = 6;
    public static final int PAIRING_VARIANT_PASSKEY = 1;
    public static final int PAIRING_VARIANT_PASSKEY_CONFIRMATION = 2;
    public static final int PAIRING_VARIANT_PIN = 0;
    private static final String TAG = "CachedBluetoothDevice";
    public static CachedBluetoothDevice mCachedDevice = null;
    private BluetoothClass mBtClass;
    private List<Callback> mCallbacks = new ArrayList();
    private boolean mConnectAfterPairing;
    private long mConnectAttempted;
    private final BluetoothDevice mDevice;
    private boolean mIsConnectingErrorPossible;
    private final LocalBluetoothManager mLocalManager;
    private String mName;
    private List<Profile> mProfiles = new ArrayList();
    private short mRssi;
    private boolean mVisible;
    private Thread mWaitUuidThread;

    /* renamed from: com.autochips.bluetooth.CachedBluetoothDevice$1 */
    class C00041 implements OnClickListener {
        C00041() {
        }

        public void onClick(DialogInterface dialog, int which) {
            CachedBluetoothDevice.this.disconnect();
        }
    }

    public interface Callback {
        void onDeviceAttributesChanged(CachedBluetoothDevice cachedBluetoothDevice);
    }

    private class waitUuidThread extends Thread {
        int cnt;

        private waitUuidThread() {
            this.cnt = 0;
        }

        public void run() {
            while (!CachedBluetoothDevice.this.updateProfiles() && this.cnt < 10) {
                try {
                    if (CachedBluetoothDevice.DEBUG) {
                        Log.d(CachedBluetoothDevice.TAG, "No profiles. Maybe we will connect later");
                    }
                    Thread.sleep(500);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                this.cnt++;
                if (CachedBluetoothDevice.DEBUG) {
                    Log.d(CachedBluetoothDevice.TAG, "Count is: " + this.cnt);
                }
            }
            CachedBluetoothDevice.this.mIsConnectingErrorPossible = true;
            CachedBluetoothDevice.this.connectAllProfiles();
        }
    }

    private String describe(CachedBluetoothDevice cachedDevice, Profile profile) {
        StringBuilder sb = new StringBuilder();
        sb.append("Address:").append(cachedDevice.mDevice);
        if (profile != null) {
            sb.append(" Profile:").append(profile.name());
        }
        return sb.toString();
    }

    private String describe(Profile profile) {
        return describe(this, profile);
    }

    public void onProfileStateChanged(Profile profile, int newProfileState) {
        if (DEBUG) {
            Log.d(TAG, "onProfileStateChanged: profile " + profile.toString() + " newProfileState " + newProfileState);
        }
        LocalBluetoothProfileManager profileManager = LocalBluetoothProfileManager.getProfileManager(this.mLocalManager);
        if (profileManager != null && profileManager.convertState(profile, newProfileState) == 1 && !this.mProfiles.contains(profile)) {
            this.mProfiles.add(profile);
        }
    }

    CachedBluetoothDevice(Context context, BluetoothDevice device) {
        Log.d(TAG, "CachedBluetoothDevice device 111");
        this.mLocalManager = LocalBluetoothManager.getInstance(context);
        if (this.mLocalManager == null) {
            throw new IllegalStateException("Cannot use CachedBluetoothDevice without Bluetooth hardware");
        }
        this.mDevice = device;
        fillData();
    }

    public static CachedBluetoothDevice getCachedDevice(Context context, BluetoothDevice device) {
        mCachedDevice = new CachedBluetoothDevice(context, device);
        return mCachedDevice;
    }

    public static byte[] convertPinToBytes(String pin) {
        return BluetoothDevice.convertPinToBytes(pin);
    }

    public static boolean setPasskey(BluetoothDevice device, int passkey) {
        return device.setPasskey(passkey);
    }

    public static boolean setRemoteOutOfBandData(BluetoothDevice device) {
        return device.setRemoteOutOfBandData();
    }

    public static boolean removeBond(BluetoothDevice device) {
        return device.removeBond();
    }

    public static boolean isBluetoothDock(BluetoothDevice device) {
        return device.isBluetoothDock();
    }

    public void onClicked() {
        int bondState = getBondState();
        if (DEBUG) {
            Log.d(TAG, "onClicked bondState " + bondState);
        }
        if (isConnected()) {
            askDisconnect();
        } else if (bondState == 12) {
            connect();
        } else if (bondState == 10) {
            pair();
        }
    }

    public void disconnect() {
        BluetoothAdapter adapter = this.mLocalManager.getBluetoothAdapter();
        if (adapter.isDiscovering()) {
            adapter.cancelDiscovery();
        }
        if (DEBUG) {
            Log.d(TAG, "disconnect()...");
        }
        for (Profile profile : this.mProfiles) {
            disconnectInt(this, profile);
        }
    }

    public void disconnect(BTProfile ATCprofile) {
        disconnectInt(this, Profile.values()[ATCprofile.ordinal()]);
    }

    private boolean disconnectInt(CachedBluetoothDevice cachedDevice, Profile profile) {
        LocalBluetoothProfileManager profileManager = LocalBluetoothProfileManager.getProfileManager(this.mLocalManager);
        if (profileManager == null) {
            return false;
        }
        if (DEBUG) {
            Log.d(TAG, "disconnectInt...");
        }
        if (!profileManager.isConnected(cachedDevice.mDevice, profile) || !profileManager.disconnect(cachedDevice.mDevice, profile)) {
            return false;
        }
        if (DEBUG) {
            Log.d(TAG, "Command sent successfully:DISCONNECT " + describe(profile));
        }
        return true;
    }

    public void askDisconnect() {
        Context context = this.mLocalManager.getForegroundActivity();
        if (context == null) {
            disconnect();
            return;
        }
        String name = getName();
        if (TextUtils.isEmpty(name)) {
            name = "handsfree/headset";
        }
        String message = name + " will be disconnected";
        new Builder(context).setTitle(getName()).setMessage(message).setPositiveButton("ok", new C00041()).setNegativeButton("cancel", null).show();
    }

    public void connect() {
        if (ensurePaired()) {
            if (DEBUG) {
                Log.d(TAG, "CacheBluetoothDevice Connect");
            }
            BluetoothAdapter adapter = this.mLocalManager.getBluetoothAdapter();
            if (adapter.isDiscovering()) {
                adapter.cancelDiscovery();
            }
            this.mConnectAttempted = SystemClock.elapsedRealtime();
            connectWithoutResettingTimer();
        }
    }

    void onBondingDockConnect() {
        connect();
    }

    private void connectWithoutResettingTimer() {
        if (DEBUG) {
            Log.d(TAG, "connectWithoutResettingTimer...");
        }
        if (this.mProfiles.size() == 0) {
            this.mWaitUuidThread = new waitUuidThread();
            this.mWaitUuidThread.start();
            return;
        }
        this.mIsConnectingErrorPossible = true;
        connectAllProfiles();
    }

    private void connectAllProfiles() {
        if (ensurePaired()) {
            if (DEBUG) {
                Log.d(TAG, "connectAllProfiles...");
            }
            this.mIsConnectingErrorPossible = true;
            for (Profile profile : this.mProfiles) {
                if (DEBUG) {
                    Log.d(TAG, "check profile connectable: " + profile.toString());
                }
                if (!(!isConnectableProfile(profile) || profile.equals(Profile.Bluetooth_PBAP_Client) || profile.equals(Profile.Bluetooth_A2DP_SINK) || profile.equals(Profile.Bluetooth_AVRCP_CT) || profile.equals(Profile.Bluetooth_DUN_DT) || profile.equals(Profile.Bluetooth_HID))) {
                    if (DEBUG) {
                        Log.d(TAG, "connect profile : " + profile.toString());
                    }
                    LocalBluetoothProfileManager profileManager = LocalBluetoothProfileManager.getProfileManager(this.mLocalManager);
                    if (profileManager != null) {
                        profileManager.setPreferred(this.mDevice, profile, false);
                        disconnectConnected(this, profile);
                        connectInt(this, profile);
                    } else {
                        return;
                    }
                }
            }
        }
    }

    public void connect(BTProfile ATCprofile) {
        Profile profile = Profile.values()[ATCprofile.ordinal()];
        BluetoothAdapter adapter = this.mLocalManager.getBluetoothAdapter();
        if (adapter.isDiscovering()) {
            adapter.cancelDiscovery();
        }
        if (DEBUG) {
            Log.d(TAG, "connect(profile)...");
        }
        this.mConnectAttempted = SystemClock.elapsedRealtime();
        this.mIsConnectingErrorPossible = true;
        if (!isConnectableToMultiDevices(profile)) {
            disconnectConnected(this, profile);
        }
        connectInt(this, profile);
    }

    private void disconnectConnected(CachedBluetoothDevice device, Profile profile) {
        if (DEBUG) {
            Log.d(TAG, "disconnectConnected(profile)...");
        }
        LocalBluetoothProfileManager profileManager = LocalBluetoothProfileManager.getProfileManager(this.mLocalManager);
        if (profileManager != null) {
            CachedBluetoothDeviceManager cachedDeviceManager = this.mLocalManager.getCachedDeviceManager();
            Set<BluetoothDevice> devices = profileManager.getConnectedDevices(profile);
            if (devices != null) {
                for (BluetoothDevice btDevice : devices) {
                    CachedBluetoothDevice cachedDevice = cachedDeviceManager.findDevice(btDevice);
                    if (!(cachedDevice == null || cachedDevice.equals(device))) {
                        disconnectInt(cachedDevice, profile);
                    }
                }
            }
        }
    }

    private boolean connectInt(CachedBluetoothDevice cachedDevice, Profile profile) {
        if (!cachedDevice.ensurePaired()) {
            return false;
        }
        if (DEBUG) {
            Log.i(TAG, "connectInt " + profile.toString() + " to " + cachedDevice.mName);
        }
        LocalBluetoothProfileManager profileManager = LocalBluetoothProfileManager.getProfileManager(this.mLocalManager);
        if (profileManager == null) {
            return false;
        }
        if (SettingsBtStatus.isConnectionStatusConnected(profileManager.getConnectionStatus(cachedDevice.mDevice, profile))) {
            if (!DEBUG) {
                return false;
            }
            Log.i(TAG, "Already connected");
            return false;
        } else if (profileManager.connect(cachedDevice.mDevice, profile)) {
            if (DEBUG) {
                Log.d(TAG, "Command sent successfully:CONNECT " + describe(profile));
            }
            return true;
        } else if (!DEBUG) {
            return false;
        } else {
            Log.i(TAG, "Failed to connect " + profile.toString() + " to " + cachedDevice.mName);
            return false;
        }
    }

    public void showConnectingError() {
        if (this.mIsConnectingErrorPossible) {
            this.mIsConnectingErrorPossible = false;
        }
    }

    private boolean ensurePaired() {
        if (getBondState() != 10) {
            return true;
        }
        pair();
        return false;
    }

    public void pair() {
        BluetoothAdapter adapter = this.mLocalManager.getBluetoothAdapter();
        if (adapter.isDiscovering()) {
            adapter.cancelDiscovery();
        }
        this.mConnectAfterPairing = true;
    }

    public void unpair() {
        BluetoothAdapter adapter = this.mLocalManager.getBluetoothAdapter();
        if (adapter.isDiscovering()) {
            adapter.cancelDiscovery();
        }
        disconnect();
        int state = getBondState();
        if (state == 11) {
            this.mDevice.cancelBondProcess();
        }
        if (state != 10) {
            BluetoothDevice dev = getDevice();
            if (dev == null) {
                return;
            }
            if (dev.removeBond()) {
                if (DEBUG) {
                    Log.d(TAG, "Command sent successfully:REMOVE_BOND " + describe(null));
                }
            } else if (DEBUG) {
                Log.v(TAG, "Framework rejected command immediately:REMOVE_BOND " + describe(null));
            }
        }
    }

    private void fillData() {
        fetchName();
        fetchBtClass();
        updateProfiles();
        this.mVisible = false;
        dispatchAttributesChanged();
    }

    public BluetoothDevice getDevice() {
        return this.mDevice;
    }

    public String getName() {
        return this.mName;
    }

    public void setName(String name) {
        if (!this.mName.equals(name)) {
            if (TextUtils.isEmpty(name)) {
                this.mName = this.mDevice.getAddress();
            } else {
                this.mName = name;
            }
            dispatchAttributesChanged();
        }
    }

    public void refreshName() {
        fetchName();
        dispatchAttributesChanged();
    }

    private void fetchName() {
        this.mName = this.mDevice.getName();
        if (TextUtils.isEmpty(this.mName)) {
            this.mName = this.mDevice.getAddress();
            if (DEBUG) {
                Log.d(TAG, "Default to address. Device has no name (yet) " + this.mName);
            }
        }
    }

    public void refresh() {
        dispatchAttributesChanged();
    }

    public boolean isVisible() {
        return this.mVisible;
    }

    void setVisible(boolean visible) {
        if (this.mVisible != visible) {
            this.mVisible = visible;
            dispatchAttributesChanged();
        }
    }

    public int getBondState() {
        return this.mDevice.getBondState();
    }

    void setRssi(short rssi) {
        if (this.mRssi != rssi) {
            this.mRssi = rssi;
            dispatchAttributesChanged();
        }
    }

    public boolean isConnected() {
        for (Profile profile : this.mProfiles) {
            LocalBluetoothProfileManager profileManager = LocalBluetoothProfileManager.getProfileManager(this.mLocalManager);
            if (profileManager == null) {
                return false;
            }
            if (SettingsBtStatus.isConnectionStatusConnected(profileManager.getConnectionStatus(this.mDevice, profile))) {
                return true;
            }
        }
        return false;
    }

    public boolean isAutoConnected() {
        for (Profile profile : this.mProfiles) {
            if (DEBUG) {
                Log.v(TAG, "isAutoConnected:" + profile);
            }
        }
        LocalBluetoothProfileManager profileManager = LocalBluetoothProfileManager.getProfileManager(this.mLocalManager);
        if (profileManager == null) {
            return false;
        }
        if (this.mProfiles.contains(Profile.Bluetooth_A2DP) && SettingsBtStatus.isConnectionStatusConnected(profileManager.getConnectionStatus(this.mDevice, Profile.Bluetooth_A2DP))) {
            return true;
        }
        if (this.mProfiles.contains(Profile.Bluetooth_SIMAP) && SettingsBtStatus.isConnectionStatusConnected(profileManager.getConnectionStatus(this.mDevice, Profile.Bluetooth_SIMAP))) {
            return true;
        }
        if (this.mProfiles.contains(Profile.Bluetooth_HEADSET) && SettingsBtStatus.isConnectionStatusConnected(profileManager.getConnectionStatus(this.mDevice, Profile.Bluetooth_HEADSET))) {
            return true;
        }
        return false;
    }

    public boolean isSupportConnectedProfile() {
        for (Profile profile : this.mProfiles) {
            if (profile.equals(Profile.Bluetooth_HF)) {
                return true;
            }
        }
        return false;
    }

    public boolean isBusy() {
        for (Profile profile : this.mProfiles) {
            LocalBluetoothProfileManager profileManager = LocalBluetoothProfileManager.getProfileManager(this.mLocalManager);
            if (profileManager == null) {
                return false;
            }
            if (SettingsBtStatus.isConnectionStatusBusy(profileManager.getConnectionStatus(this.mDevice, profile))) {
                return true;
            }
        }
        if (getBondState() == 11) {
            return true;
        }
        return false;
    }

    public int getBtClassDrawable() {
        return 0;
    }

    private void fetchBtClass() {
        this.mBtClass = this.mDevice.getBluetoothClass();
    }

    private boolean updateProfiles() {
        ParcelUuid[] uuids = this.mDevice.getUuids();
        if (uuids == null) {
            uuids = LocalBluetoothProfileManager.HF_PROFILE_UUIDS;
            Log.e(TAG, new StringBuilder().append("uudis = null?").append(uuids).toString() == null ? "yes" : "no");
        }
        LocalBluetoothProfileManager.updateProfiles(uuids, this.mProfiles);
        if (DEBUG) {
            Log.d(TAG, "updating profiles for " + this.mDevice.getName());
            boolean printUuids = true;
            BluetoothClass bluetoothClass = this.mDevice.getBluetoothClass();
            if (bluetoothClass != null) {
                if (bluetoothClass.doesClassMatch(0) != this.mProfiles.contains(Profile.Bluetooth_HEADSET)) {
                    Log.v(TAG, "headset classbits != uuid");
                    printUuids = true;
                }
                if (bluetoothClass.doesClassMatch(1) != this.mProfiles.contains(Profile.Bluetooth_A2DP)) {
                    Log.v(TAG, "a2dp classbits != uuid");
                    printUuids = true;
                }
                if (!(bluetoothClass.doesClassMatch(2) == this.mProfiles.contains(Profile.Bluetooth_OPP_Server) && bluetoothClass.doesClassMatch(2) == this.mProfiles.contains(Profile.Bluetooth_OPP_Client))) {
                    Log.v(TAG, "opp classbits != uuid");
                    printUuids = true;
                }
            }
            if (printUuids) {
                if (bluetoothClass != null) {
                    Log.v(TAG, "Class: " + bluetoothClass.toString());
                }
                Log.v(TAG, "UUID:");
                for (Object obj : uuids) {
                    Log.v(TAG, "  " + obj);
                }
            }
        }
        return true;
    }

    public void refreshBtClass() {
        fetchBtClass();
        dispatchAttributesChanged();
    }

    public void onUuidChanged() {
        updateProfiles();
        if (DEBUG) {
            Log.d(TAG, "onUuidChanged: Time since last connect" + (SystemClock.elapsedRealtime() - this.mConnectAttempted));
        }
        if (this.mProfiles.size() > 0 && this.mConnectAttempted + MAX_UUID_DELAY_FOR_AUTO_CONNECT > SystemClock.elapsedRealtime()) {
            connectWithoutResettingTimer();
        }
        dispatchAttributesChanged();
    }

    public void onBondingStateChanged(int bondState) {
        if (bondState == 10) {
            this.mProfiles.clear();
            this.mConnectAfterPairing = false;
        }
        refresh();
        if (bondState == 12) {
            if (this.mDevice.isBluetoothDock()) {
                onBondingDockConnect();
            } else if (this.mConnectAfterPairing) {
                connect();
            }
            this.mConnectAfterPairing = false;
            updateProfiles();
        }
    }

    public void setBtClass(BluetoothClass btClass) {
        if (btClass != null && this.mBtClass != btClass) {
            this.mBtClass = btClass;
            dispatchAttributesChanged();
        }
    }

    public List<Profile> getConnectableProfiles() {
        ArrayList<Profile> connectableProfiles = new ArrayList();
        for (Profile profile : this.mProfiles) {
            if (isConnectableProfile(profile)) {
                connectableProfiles.add(profile);
            }
        }
        return connectableProfiles;
    }

    private boolean isConnectableProfile(Profile profile) {
        return profile.equals(Profile.Bluetooth_HEADSET) || profile.equals(Profile.Bluetooth_FTP_Client) || profile.equals(Profile.Bluetooth_DUN) || profile.equals(Profile.Bluetooth_HID) || profile.equals(Profile.Bluetooth_PBAP) || profile.equals(Profile.Bluetooth_PAN_NAP) || profile.equals(Profile.Bluetooth_PAN_GN) || profile.equals(Profile.Bluetooth_PRXM) || profile.equals(Profile.Bluetooth_HF) || profile.equals(Profile.Bluetooth_OPP_Client) || profile.equals(Profile.Bluetooth_PBAP_Client) || profile.equals(Profile.Bluetooth_A2DP_SINK) || profile.equals(Profile.Bluetooth_AVRCP_CT) || profile.equals(Profile.Bluetooth_DUN_DT);
    }

    private boolean isPreferredConnectableProfile(Profile profile) {
        return profile.equals(Profile.Bluetooth_HEADSET);
    }

    private boolean isConnectableToMultiDevices(Profile profile) {
        if (DEBUG) {
            Log.v(TAG, "isConnectableToMultiDevices:" + profile.name());
        }
        return profile.equals(Profile.Bluetooth_HID) || profile.equals(Profile.Bluetooth_PAN_GN) || profile.equals(Profile.Bluetooth_PAN_NAP);
    }

    public void onCreateContextMenu(ContextMenu menu) {
        if (this.mLocalManager.getBluetoothState() == 12 && !isBusy()) {
            int bondState = getBondState();
            boolean isConnected = isConnected();
            for (Profile profile : this.mProfiles) {
                if (isConnectableProfile(profile)) {
                    return;
                }
            }
        }
    }

    public void onContextItemSelected(MenuItem item) {
    }

    private void showRenameDialog() {
    }

    public boolean renameRemoteDevice(String newNickName) {
        return this.mDevice.setName(newNickName);
    }

    public void registerCallback(Callback callback) {
        synchronized (this.mCallbacks) {
            this.mCallbacks.add(callback);
        }
    }

    public void unregisterCallback(Callback callback) {
        synchronized (this.mCallbacks) {
            this.mCallbacks.remove(callback);
        }
    }

    private void dispatchAttributesChanged() {
        synchronized (this.mCallbacks) {
            for (Callback callback : this.mCallbacks) {
                callback.onDeviceAttributesChanged(this);
            }
        }
    }

    public String toString() {
        return this.mDevice.toString();
    }

    public boolean equals(Object o) {
        if (o != null && (o instanceof CachedBluetoothDevice)) {
            return this.mDevice.equals(((CachedBluetoothDevice) o).mDevice);
        }
        throw new ClassCastException();
    }

    public int hashCode() {
        return this.mDevice.getAddress().hashCode();
    }

    public int compareTo(CachedBluetoothDevice another) {
        int i;
        int i2 = 1;
        if (another.isConnected()) {
            i = 1;
        } else {
            i = 0;
        }
        int comparison = i - (isConnected() ? 1 : 0);
        if (comparison != 0) {
            return comparison;
        }
        if (another.getBondState() == 12) {
            i = 1;
        } else {
            i = 0;
        }
        comparison = i - (getBondState() == 12 ? 1 : 0);
        if (comparison != 0) {
            return comparison;
        }
        if (another.mVisible) {
            i = 1;
        } else {
            i = 0;
        }
        if (!this.mVisible) {
            i2 = 0;
        }
        comparison = i - i2;
        if (comparison != 0) {
            return comparison;
        }
        comparison = another.mRssi - this.mRssi;
        if (comparison != 0) {
            return comparison;
        }
        return getName().compareTo(another.getName());
    }
}
