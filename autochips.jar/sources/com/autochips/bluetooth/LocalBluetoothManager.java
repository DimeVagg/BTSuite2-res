package com.autochips.bluetooth;

import android.app.Activity;
import android.app.AlertDialog;
import android.bluetooth.BluetoothA2dp;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.ParcelUuid;
import android.util.Log;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

public class LocalBluetoothManager {
    public static final String ACTION_ATC_BT_UP = "com.autochips.bluetooth.action.BT_UP";
    public static final String ACTION_ATC_SHOWERROR = "com.autochips.bluetooth.action.SHOWERROR";
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugSettings);
    private static long GRACE_PERIOD_TO_SHOW_DIALOGS_IN_FOREGROUND = 60000;
    public static final ParcelUuid HFAG = ParcelUuid.fromString("0000111F-0000-1000-8000-00805F9B34FB");
    public static final ParcelUuid HSAG = ParcelUuid.fromString("00001112-0000-1000-8000-00805F9B34FB");
    private static LocalBluetoothManager INSTANCE = null;
    private static final int SCAN_EXPIRATION_MS = 120000;
    public static final String SHARED_PREFERENCES_KEY_DISCOVERING_TIMESTAMP = "last_discovering_time";
    private static final String SHARED_PREFERENCES_KEY_DOCK_AUTO_CONNECT = "auto_connect_to_dock";
    private static final String SHARED_PREFERENCES_KEY_LAST_SELECTED_DEVICE = "last_selected_device";
    private static final String SHARED_PREFERENCES_KEY_LAST_SELECTED_DEVICE_TIME = "last_selected_device_time";
    private static final String SHARED_PREFERENCES_NAME = "bluetooth_settings";
    private static final String TAG = "LocalBluetoothManager";
    private BluetoothAdapter mAdapter;
    private BluetoothA2dp mBluetoothA2dp;
    private CachedBluetoothDeviceManager mCachedDeviceManager;
    private List<Callback> mCallbacks = new ArrayList();
    private Context mContext;
    private AlertDialog mErrorDialog = null;
    private BluetoothEventRedirector mEventRedirector;
    private Activity mForegroundActivity;
    private boolean mInitialized;
    private long mLastScan;
    private int mState = Integer.MIN_VALUE;

    public interface Callback {
        void onDeviceAdded(CachedBluetoothDevice cachedBluetoothDevice);

        void onDeviceDeleted(CachedBluetoothDevice cachedBluetoothDevice);

        void onScanningStateChanged(boolean z);
    }

    public boolean setScanMode(int mode) {
        return this.mAdapter.setScanMode(mode);
    }

    public boolean setScanMode(int mode, int duration) {
        return this.mAdapter.setScanMode(mode, duration);
    }

    public static LocalBluetoothManager getInstance(Context context) {
        LocalBluetoothManager localBluetoothManager;
        synchronized (LocalBluetoothManager.class) {
            if (INSTANCE == null) {
                INSTANCE = new LocalBluetoothManager();
            }
            if (INSTANCE.init(context)) {
                localBluetoothManager = INSTANCE;
            } else {
                localBluetoothManager = null;
            }
        }
        return localBluetoothManager;
    }

    private boolean init(Context context) {
        if (this.mInitialized) {
            return true;
        }
        this.mInitialized = true;
        this.mContext = context.getApplicationContext();
        this.mAdapter = BluetoothAdapter.getDefaultAdapter();
        if (this.mAdapter == null) {
            return false;
        }
        this.mCachedDeviceManager = new CachedBluetoothDeviceManager(this);
        this.mEventRedirector = new BluetoothEventRedirector(this);
        this.mEventRedirector.start();
        return true;
    }

    public BluetoothAdapter getBluetoothAdapter() {
        return this.mAdapter;
    }

    public Context getContext() {
        return this.mContext;
    }

    public Activity getForegroundActivity() {
        return this.mForegroundActivity;
    }

    public void setForegroundActivity(Activity activity) {
        if (this.mErrorDialog != null) {
            this.mErrorDialog.dismiss();
            this.mErrorDialog = null;
        }
        this.mForegroundActivity = activity;
    }

    public SharedPreferences getSharedPreferences() {
        return this.mContext.getSharedPreferences(SHARED_PREFERENCES_NAME, 0);
    }

    public CachedBluetoothDeviceManager getCachedDeviceManager() {
        return this.mCachedDeviceManager;
    }

    List<Callback> getCallbacks() {
        return this.mCallbacks;
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

    public void startScanning(boolean force) {
        if (this.mAdapter.isDiscovering()) {
            dispatchScanningStateChanged(true);
        } else if ((force || this.mLastScan + 120000 <= System.currentTimeMillis()) && this.mAdapter.startDiscovery()) {
            this.mLastScan = System.currentTimeMillis();
        }
    }

    public void stopScanning() {
        if (this.mAdapter.isDiscovering()) {
            this.mAdapter.cancelDiscovery();
        }
    }

    public int getBluetoothState() {
        if (this.mState == Integer.MIN_VALUE) {
            syncBluetoothState();
        }
        return this.mState;
    }

    void setBluetoothStateInt(int state) {
        this.mState = state;
        if (state == 12 || state == 10) {
            this.mCachedDeviceManager.onBluetoothStateChanged(state == 12);
        }
    }

    private void syncBluetoothState() {
        int bluetoothState = this.mAdapter != null ? this.mAdapter.isEnabled() ? 12 : 10 : Integer.MIN_VALUE;
        setBluetoothStateInt(bluetoothState);
    }

    public void setBluetoothEnabled(boolean enabled) {
        if (enabled ? this.mAdapter.enable() : this.mAdapter.disable()) {
            int i;
            if (enabled) {
                i = 11;
            } else {
                i = 13;
            }
            setBluetoothStateInt(i);
            return;
        }
        if (DEBUG) {
            Log.v(TAG, "setBluetoothEnabled call, manager didn't return success for enabled: " + enabled);
        }
        syncBluetoothState();
    }

    public void setBluetoothPower(int on_off) {
        if (DEBUG) {
            Log.d(TAG, "setBluetoothPower: " + on_off);
        }
        this.mAdapter.setPower(on_off);
    }

    void onScanningStateChanged(boolean started) {
        this.mCachedDeviceManager.onScanningStateChanged(started);
        dispatchScanningStateChanged(started);
    }

    private void dispatchScanningStateChanged(boolean started) {
        synchronized (this.mCallbacks) {
            for (Callback callback : this.mCallbacks) {
                callback.onScanningStateChanged(started);
            }
        }
    }

    public void showError(BluetoothDevice device, int titleResId, int messageResId) {
        CachedBluetoothDevice cachedDevice = this.mCachedDeviceManager.findDevice(device);
        String name = null;
        if (cachedDevice == null) {
            if (device != null) {
                name = device.getName();
            }
            if (name == null) {
                name = "bluetooth device";
            }
        } else {
            name = cachedDevice.getName();
        }
        Toast.makeText(this.mContext, " ", 1).show();
    }

    public boolean shouldShowDialogInForeground(String deviceAddress) {
        return this.mForegroundActivity != null;
    }

    void persistSelectedDeviceInPicker(String deviceAddress) {
        Editor editor = getSharedPreferences().edit();
        editor.putString(SHARED_PREFERENCES_KEY_LAST_SELECTED_DEVICE, deviceAddress);
        editor.putLong(SHARED_PREFERENCES_KEY_LAST_SELECTED_DEVICE_TIME, System.currentTimeMillis());
        editor.apply();
    }

    public boolean hasDockAutoConnectSetting(String addr) {
        return getSharedPreferences().contains(SHARED_PREFERENCES_KEY_DOCK_AUTO_CONNECT + addr);
    }

    public boolean getDockAutoConnectSetting(String addr) {
        return getSharedPreferences().getBoolean(SHARED_PREFERENCES_KEY_DOCK_AUTO_CONNECT + addr, false);
    }

    public void saveDockAutoConnectSetting(String addr, boolean autoConnect) {
        Editor editor = getSharedPreferences().edit();
        editor.putBoolean(SHARED_PREFERENCES_KEY_DOCK_AUTO_CONNECT + addr, autoConnect);
        editor.apply();
    }

    public void removeDockAutoConnectSetting(String addr) {
        Editor editor = getSharedPreferences().edit();
        editor.remove(SHARED_PREFERENCES_KEY_DOCK_AUTO_CONNECT + addr);
        editor.apply();
    }

    public void setA2DPActive(boolean isActive) {
        if (DEBUG) {
            Log.d(TAG, "setA2DPActive: " + isActive);
        }
        if (this.mEventRedirector != null) {
            this.mEventRedirector.resetA2dpAudio(isActive);
        }
    }
}
