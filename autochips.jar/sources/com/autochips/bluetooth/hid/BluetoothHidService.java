package com.autochips.bluetooth.hid;

import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothProfileManager.Profile;
import android.bluetooth.IBluetoothHid;
import android.bluetooth.IBluetoothHid.Stub;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.autochips.bluetooth.LocalBluetoothProfileManager;
import com.autochips.bluetooth.LocalBluetoothProfileManager.BTProfile;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;
import com.autochips.inputsource.HDMI;
import java.util.HashSet;
import java.util.Set;

public class BluetoothHidService extends Service {
    private static boolean DEBUG = true;
    private static final String TAG = "BluetoothHidService";
    private String addrConnected = BluetoothPbapClientPath.PBAP_ROOT_NAME;
    Intent intent_hid_state = new Intent(LocalBluetoothProfileManager.ACTION_PROFILE_STATE_UPDATE);
    private final Stub mHidBinder = new C00722();
    private Thread mHidListener;
    private final IBluetoothHidDeviceUtility.Stub mHidUtilBinder = new C00733();
    private volatile boolean mInterrupted;
    private int mNativeData;

    /* renamed from: com.autochips.bluetooth.hid.BluetoothHidService$2 */
    class C00722 extends Stub {
        C00722() {
        }

        public void connect(BluetoothDevice device) throws RemoteException {
            if (BluetoothHidService.this.addrConnected.isEmpty()) {
                String BT_Addr = device.getAddress();
                if (BluetoothHidService.DEBUG) {
                    Log.d(BluetoothHidService.TAG, "BluetoothHidServer Connect" + BT_Addr);
                }
                BluetoothHidService.this.deviceConnectReqNative(BT_Addr);
                return;
            }
            if (BluetoothHidService.DEBUG) {
                Log.d(BluetoothHidService.TAG, "BluetoothHid has been connected to " + BluetoothHidService.this.addrConnected);
            }
            BluetoothHidService.this.intent_hid_state.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 1);
            BluetoothHidService.this.intent_hid_state.putExtra("android.bluetooth.profilemanager.extra.PROFILE", Profile.Bluetooth_HID);
            BluetoothHidService.this.intent_hid_state.putExtra(LocalBluetoothProfileManager.EXTRA_PROFILE, BTProfile.Bluetooth_HID);
            BluetoothHidService.this.sendBroadcast(BluetoothHidService.this.intent_hid_state, "android.permission.BLUETOOTH");
        }

        public void disconnect(BluetoothDevice device) throws RemoteException {
            if (BluetoothHidService.DEBUG) {
                Log.d(BluetoothHidService.TAG, "BluetoothHidService Disconnect. addrConnected is " + BluetoothHidService.this.addrConnected);
            }
            if (device == null || device.getAddress().isEmpty() || device.getAddress().equals(BluetoothHidService.this.addrConnected)) {
                BluetoothHidService.this.deviceDisconnectReqNative();
            } else if (BluetoothHidService.DEBUG) {
                Log.d(BluetoothHidService.TAG, "call hid disconnect to " + device.getAddress() + ". do nothing.");
            }
        }

        public int getState(BluetoothDevice device) throws RemoteException {
            if (BluetoothHidService.DEBUG) {
                Log.d(BluetoothHidService.TAG, "BluetoothHidServer getState. addrConnected is " + BluetoothHidService.this.addrConnected);
            }
            if (device == null || device.getAddress().isEmpty()) {
                if (BluetoothHidService.DEBUG) {
                    Log.d(BluetoothHidService.TAG, "Calling getState with empty parameter.");
                }
                if (BluetoothHidService.this.addrConnected.isEmpty()) {
                    return 2;
                }
                return 1;
            } else if (!device.getAddress().equals(BluetoothHidService.this.addrConnected)) {
                return 2;
            } else {
                if (BluetoothHidService.DEBUG) {
                    Log.d(BluetoothHidService.TAG, "getState. return connected.");
                }
                return 1;
            }
        }

        public BluetoothDevice[] getCurrentDevices() throws RemoteException {
            if (BluetoothHidService.DEBUG) {
                Log.d(BluetoothHidService.TAG, "getCurrentDevices");
            }
            Set<BluetoothDevice> deviceList = new HashSet();
            Set<BluetoothDevice> pairedDevices = BluetoothAdapter.getDefaultAdapter().getBondedDevices();
            if (BluetoothHidService.this.addrConnected.isEmpty()) {
                if (BluetoothHidService.DEBUG) {
                    Log.d(BluetoothHidService.TAG, "getCurrentDevices. no connected device.");
                }
            } else if (pairedDevices != null) {
                for (BluetoothDevice tmpDevice : pairedDevices) {
                    if (tmpDevice.getAddress().equals(BluetoothHidService.this.addrConnected)) {
                        deviceList.add(tmpDevice);
                        break;
                    }
                }
            }
            if (BluetoothHidService.DEBUG) {
                Log.v(BluetoothHidService.TAG, "getCurrentDevices:deviceList.size=" + deviceList.size());
            }
            return (BluetoothDevice[]) deviceList.toArray(new BluetoothDevice[deviceList.size()]);
        }
    }

    /* renamed from: com.autochips.bluetooth.hid.BluetoothHidService$3 */
    class C00733 extends IBluetoothHidDeviceUtility.Stub {
        C00733() {
        }

        public boolean connect(String addr) throws RemoteException {
            if (BluetoothHidService.this.addrConnected.isEmpty()) {
                String BT_Addr = addr;
                if (BluetoothHidService.DEBUG) {
                    Log.d(BluetoothHidService.TAG, "BluetoothHidServer Connect" + BT_Addr);
                }
                BluetoothHidService.this.deviceConnectReqNative(BT_Addr);
                return true;
            }
            if (BluetoothHidService.DEBUG) {
                Log.d(BluetoothHidService.TAG, "BluetoothHid has been connected to " + BluetoothHidService.this.addrConnected);
            }
            BluetoothHidService.this.intent_hid_state.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 1);
            BluetoothHidService.this.intent_hid_state.putExtra("android.bluetooth.profilemanager.extra.PROFILE", Profile.Bluetooth_HID);
            BluetoothHidService.this.intent_hid_state.putExtra(LocalBluetoothProfileManager.EXTRA_PROFILE, BTProfile.Bluetooth_HID);
            BluetoothHidService.this.sendBroadcast(BluetoothHidService.this.intent_hid_state, "android.permission.BLUETOOTH");
            return false;
        }

        public boolean disconnect() throws RemoteException {
            if (BluetoothHidService.DEBUG) {
                Log.d(BluetoothHidService.TAG, "BluetoothHidServer Disconnect. addrConnected is " + BluetoothHidService.this.addrConnected);
            }
            BluetoothHidService.this.deviceDisconnectReqNative();
            return true;
        }

        public boolean isHidConnected() {
            return !BluetoothHidService.this.addrConnected.isEmpty();
        }

        public String getConnectedAddr() {
            return BluetoothHidService.this.addrConnected;
        }

        public boolean sendIntData(byte[] data, int len) throws RemoteException {
            if (BluetoothHidService.this.addrConnected.isEmpty()) {
                if (!BluetoothHidService.DEBUG) {
                    return false;
                }
                Log.d(BluetoothHidService.TAG, "BluetoothHid has not been connected. sendIntData fail.");
                return false;
            } else if (len >= 0 && len <= HDMI.RCP_KEY_INVAILD) {
                BluetoothHidService.this.deviceSendInputReportNative(len, data);
                return true;
            } else if (!BluetoothHidService.DEBUG) {
                return false;
            } else {
                Log.d(BluetoothHidService.TAG, "len parameter invalid. sendIntData fail.");
                return false;
            }
        }

        public boolean sendCtlData(byte[] data, int len) throws RemoteException {
            if (BluetoothHidService.this.addrConnected.isEmpty()) {
                if (BluetoothHidService.DEBUG) {
                    Log.d(BluetoothHidService.TAG, "BluetoothHid has not been connected. sendCtlData fail.");
                }
            } else if (len >= 0 && len <= HDMI.RCP_KEY_INVAILD) {
                Log.d(BluetoothHidService.TAG, "sendCtlData is not implemented.");
            } else if (BluetoothHidService.DEBUG) {
                Log.d(BluetoothHidService.TAG, "len parameter invalid. sendCtlData fail.");
            }
            return false;
        }
    }

    private native void cleanServiceNative();

    private native void deviceActivateReqNative();

    private native boolean deviceConnectReqNative(String str);

    private native void deviceDeactivateReqNative();

    private native void deviceDisconnectReqNative();

    private native void deviceSendInputReportNative(int i, byte[] bArr);

    private native void forceClearServerNative();

    private native boolean initServiceNative();

    private native boolean listentoSocketNative();

    private native void stopListentoSocketNative();

    private native void wakeupListenerNative();

    static {
        System.loadLibrary("exthid_jni");
    }

    public void onCreate() {
        Log.i(TAG, "Enter onCreate");
        if (initServiceNative() && startHidListenerThread()) {
            this.intent_hid_state.putExtra("android.bluetooth.profilemanager.extra.PROFILE", Profile.Bluetooth_HID);
            this.intent_hid_state.putExtra(LocalBluetoothProfileManager.EXTRA_PROFILE, BTProfile.Bluetooth_HID);
            this.intent_hid_state.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 11);
            sendBroadcast(this.intent_hid_state);
        }
        deviceActivateReqNative();
        super.onCreate();
    }

    public IBinder onBind(Intent intent) {
        String action = intent.getAction();
        if (DEBUG) {
            Log.i(TAG, "Enter onBind(): " + action);
        }
        if (IBluetoothHid.class.getName().equals(action)) {
            return this.mHidBinder;
        }
        return this.mHidUtilBinder;
    }

    public void onDestroy() {
        if (DEBUG) {
            Log.i(TAG, "onDestroy()");
        }
        if (this.mHidListener != null) {
            this.mInterrupted = true;
            wakeupListenerNative();
            try {
                this.mHidListener.join(5000);
            } catch (InterruptedException ex) {
                Log.e(TAG, "mHidListener exit error: " + ex);
            }
        }
        stopListentoSocketNative();
        cleanServiceNative();
        forceClearServerNative();
        this.intent_hid_state.putExtra("android.bluetooth.profilemanager.extra.PROFILE", Profile.Bluetooth_HID);
        this.intent_hid_state.putExtra(LocalBluetoothProfileManager.EXTRA_PROFILE, BTProfile.Bluetooth_HID);
        this.intent_hid_state.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 13);
        sendBroadcast(this.intent_hid_state);
        super.onDestroy();
    }

    public void onTaskRemoved(Intent rootIntent) {
        if (DEBUG) {
            Log.d(TAG, "onTaskRemoved()");
        }
        super.onTaskRemoved(rootIntent);
        stopSelf();
    }

    private synchronized boolean startHidListenerThread() {
        if (DEBUG) {
            Log.i(TAG, "[API] start");
        }
        if (this.mHidListener == null) {
            this.mHidListener = new Thread(TAG) {
                public void run() {
                    if (BluetoothHidService.DEBUG) {
                        Log.i(BluetoothHidService.TAG, "Hid Listener Thread  starting");
                    }
                    while (!BluetoothHidService.this.mInterrupted) {
                        if (!BluetoothHidService.this.listentoSocketNative()) {
                            if (BluetoothHidService.DEBUG) {
                                Log.i(BluetoothHidService.TAG, "Hidd Indication interrupted , exiting");
                            }
                            BluetoothHidService.this.mInterrupted = true;
                        }
                    }
                    if (BluetoothHidService.DEBUG) {
                        Log.i(BluetoothHidService.TAG, "Hid Thread finished");
                    }
                }
            };
            this.mInterrupted = false;
            this.mHidListener.start();
        }
        return true;
    }

    private synchronized void onUpdateDeviceConnected(String address) {
        if (DEBUG) {
            Log.d(TAG, "onUpdateDeviceConnected. new address is " + (address == null ? "null" : address));
        }
        if (DEBUG) {
            Log.d(TAG, "onUpdateDeviceConnected. old addrConnected is " + (this.addrConnected == null ? "null" : this.addrConnected));
        }
        if (address == null || address.isEmpty()) {
            if (DEBUG) {
                Log.d(TAG, "disconnected");
            }
            this.addrConnected = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        } else {
            if (DEBUG) {
                Log.d(TAG, "connected  " + address);
            }
            this.addrConnected = address;
        }
        this.intent_hid_state.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, this.addrConnected.isEmpty() ? 2 : 1);
        this.intent_hid_state.putExtra("android.bluetooth.profilemanager.extra.PROFILE", Profile.Bluetooth_HID);
        this.intent_hid_state.putExtra(LocalBluetoothProfileManager.EXTRA_PROFILE, BTProfile.Bluetooth_HID);
        sendBroadcast(this.intent_hid_state, "android.permission.BLUETOOTH");
    }
}
