package com.autochips.bluetooth.a2dpsink;

import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothProfileManager.Profile;
import android.bluetooth.IBluetoothA2dpSink;
import android.bluetooth.IBluetoothA2dpSink.Stub;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.LocalBluetoothProfileManager;
import com.autochips.bluetooth.LocalBluetoothProfileManager.BTProfile;
import com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService;

public class BluetoothA2dpSinkService extends Service {
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugMusic);
    private static final String PROPERTY_STATE = "State";
    private static final String TAG = "BluetoothA2dpSinkService";
    public static int mA2dpSinkState = 13;
    public static String mA2dpSourceAddr = null;
    private static BluetoothA2dpSinkService mInstance = null;
    private final Stub mA2dpSinkCtrl = new C00183();
    private BluetoothDevice mA2dpSourceDevice = null;
    private A2dpSinkListener mListener;
    private final BroadcastReceiver mReceiver = new C00161();
    private Handler mServiceHandler = new C00172();
    Intent update_state_intent = new Intent(LocalBluetoothProfileManager.ACTION_PROFILE_STATE_UPDATE);

    /* renamed from: com.autochips.bluetooth.a2dpsink.BluetoothA2dpSinkService$1 */
    class C00161 extends BroadcastReceiver {
        C00161() {
        }

        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals(BluetoothAvrcpCtService.ACTION_BTMUSIC_ACTION_MANAGE)) {
                switch (intent.getIntExtra(BluetoothAvrcpCtService.COMMAND_BTMUSIC_ACTION_SET, 0)) {
                    case 0:
                        if (BluetoothA2dpSinkService.this.mA2dpSourceDevice != null && BluetoothA2dpSinkService.this.mA2dpSinkCtrl != null) {
                            try {
                                BluetoothA2dpSinkService.this.mA2dpSinkCtrl.disconnect(BluetoothA2dpSinkService.this.mA2dpSourceDevice);
                                return;
                            } catch (RemoteException ex) {
                                Log.e(BluetoothA2dpSinkService.TAG, "ERROR:exception:" + ex);
                                return;
                            }
                        }
                        return;
                    case 1:
                        if (BluetoothA2dpSinkService.this.mA2dpSinkCtrl != null) {
                            try {
                                BluetoothA2dpSinkService.this.mA2dpSinkCtrl.connect((BluetoothDevice) intent.getParcelableExtra(BluetoothAvrcpCtService.EXTRA_BTMUSIC_DEVICE));
                                return;
                            } catch (RemoteException ex2) {
                                Log.e(BluetoothA2dpSinkService.TAG, "ERROR:exception:" + ex2);
                                return;
                            }
                        }
                        return;
                    default:
                        return;
                }
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.a2dpsink.BluetoothA2dpSinkService$2 */
    class C00172 extends Handler {
        C00172() {
        }

        public void handleMessage(Message msg) {
            String deviceAddr;
            BluetoothA2dpSinkService.this.printLog("[MSG] handleMessage(" + msg.what + ")");
            BluetoothAdapter btAdapter = BluetoothAdapter.getDefaultAdapter();
            Bundle data = msg.getData();
            if (data != null) {
                deviceAddr = data.getString("device_addr");
            } else {
                deviceAddr = null;
            }
            BluetoothDevice device = BluetoothA2dpSinkService.this.getBluetoothDevice(deviceAddr);
            BluetoothA2dpSinkService.this.update_state_intent.putExtra("device_addr", deviceAddr);
            BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_PROFILE, BTProfile.Bluetooth_A2DP_SINK);
            BluetoothA2dpSinkService.this.update_state_intent.putExtra("android.bluetooth.profilemanager.extra.PROFILE", Profile.Bluetooth_A2DP_SINK);
            switch (msg.what) {
                case 0:
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_PREVIOUS_STATE, BluetoothA2dpSinkService.mA2dpSinkState);
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 11);
                    BluetoothA2dpSinkService.mA2dpSinkState = 11;
                    BluetoothA2dpSinkService.this.sendBroadcast(BluetoothA2dpSinkService.this.update_state_intent, "android.permission.BLUETOOTH");
                    return;
                case 1:
                    BluetoothAvrcpCtService.mPlaybackStatus = 0;
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_PREVIOUS_STATE, BluetoothA2dpSinkService.mA2dpSinkState);
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 1);
                    BluetoothA2dpSinkService.mA2dpSinkState = 1;
                    BluetoothA2dpSinkService.mA2dpSourceAddr = deviceAddr;
                    BluetoothA2dpSinkService.this.mA2dpSourceDevice = BluetoothA2dpSinkService.this.getBluetoothDevice(BluetoothA2dpSinkService.mA2dpSourceAddr);
                    BluetoothA2dpSinkService.this.sendBroadcast(BluetoothA2dpSinkService.this.update_state_intent, "android.permission.BLUETOOTH");
                    btAdapter.updateConnectionState(device, 2, 2, 1);
                    return;
                case 2:
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_PREVIOUS_STATE, BluetoothA2dpSinkService.mA2dpSinkState);
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 2);
                    BluetoothA2dpSinkService.mA2dpSinkState = 2;
                    BluetoothA2dpSinkService.this.mA2dpSourceDevice = null;
                    BluetoothA2dpSinkService.mA2dpSourceAddr = null;
                    BluetoothA2dpSinkService.this.sendBroadcast(BluetoothA2dpSinkService.this.update_state_intent, "android.permission.BLUETOOTH");
                    btAdapter.updateConnectionState(device, 2, 0, 3);
                    return;
                case 3:
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_PREVIOUS_STATE, BluetoothA2dpSinkService.mA2dpSinkState);
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 3);
                    BluetoothA2dpSinkService.mA2dpSinkState = 3;
                    BluetoothA2dpSinkService.this.sendBroadcast(BluetoothA2dpSinkService.this.update_state_intent, "android.permission.BLUETOOTH");
                    return;
                case 13:
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_PREVIOUS_STATE, BluetoothA2dpSinkService.mA2dpSinkState);
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 13);
                    BluetoothA2dpSinkService.mA2dpSinkState = 13;
                    BluetoothA2dpSinkService.this.sendBroadcast(BluetoothA2dpSinkService.this.update_state_intent, "android.permission.BLUETOOTH");
                    return;
                case 15:
                    BluetoothAvrcpCtService.mPlaybackStatus = 1;
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_PREVIOUS_STATE, BluetoothA2dpSinkService.mA2dpSinkState);
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 15);
                    BluetoothA2dpSinkService.mA2dpSinkState = 15;
                    BluetoothA2dpSinkService.this.sendBroadcast(BluetoothA2dpSinkService.this.update_state_intent, "android.permission.BLUETOOTH");
                    return;
                case 16:
                    BluetoothAvrcpCtService.mPlaybackStatus = 2;
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_PREVIOUS_STATE, BluetoothA2dpSinkService.mA2dpSinkState);
                    BluetoothA2dpSinkService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 1);
                    if (BluetoothAvrcpCtService.mAudioState == 0) {
                        BluetoothA2dpSinkService.mA2dpSinkState = 19;
                    } else {
                        BluetoothA2dpSinkService.mA2dpSinkState = 1;
                    }
                    BluetoothA2dpSinkService.this.sendBroadcast(BluetoothA2dpSinkService.this.update_state_intent, "android.permission.BLUETOOTH");
                    return;
                default:
                    return;
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.a2dpsink.BluetoothA2dpSinkService$3 */
    class C00183 extends Stub {
        C00183() {
        }

        public BluetoothDevice getA2dpSource() {
            if (BluetoothA2dpSinkService.mA2dpSinkState != 1 && BluetoothA2dpSinkService.mA2dpSinkState != 15 && BluetoothA2dpSinkService.mA2dpSinkState != 19) {
                BluetoothA2dpSinkService.this.printLog("mA2dpSinkState != BluetoothProfileManager.STATE_CONNECTED");
                return null;
            } else if (BluetoothA2dpSinkService.this.mA2dpSourceDevice != null) {
                BluetoothA2dpSinkService.this.printLog("mA2dpSourceDevice != null");
                return BluetoothA2dpSinkService.this.mA2dpSourceDevice;
            } else {
                BluetoothA2dpSinkService.this.printLog("mA2dpSource = null");
                return null;
            }
        }

        public int getState() {
            BluetoothA2dpSinkService.this.printLog("getState()");
            return BluetoothA2dpSinkService.mA2dpSinkState;
        }

        public BluetoothDevice getConnectedDevice() {
            if (BluetoothA2dpSinkService.mA2dpSinkState != 1 && BluetoothA2dpSinkService.mA2dpSinkState != 15 && BluetoothA2dpSinkService.mA2dpSinkState != 19) {
                BluetoothA2dpSinkService.this.printLog("mA2dpSinkState != BluetoothProfileManager.STATE_CONNECTED");
                return null;
            } else if (BluetoothA2dpSinkService.this.mA2dpSourceDevice != null) {
                BluetoothA2dpSinkService.this.printLog("mA2dpSourceDevice != null");
                return BluetoothA2dpSinkService.this.mA2dpSourceDevice;
            } else {
                BluetoothA2dpSinkService.this.printLog("mA2dpSource = null");
                return null;
            }
        }

        public void connect(BluetoothDevice device) {
            BluetoothA2dpSinkService.this.printLog("connectSource(" + device + ")");
            if (device != null) {
                String BT_Addr = device.getAddress();
                BluetoothA2dpSinkService.this.printLog(BT_Addr);
                BluetoothA2dpSinkService.this.connectSource(BT_Addr);
                return;
            }
            BluetoothA2dpSinkService.this.printLog("a2dpsinkservice, connect device == null");
        }

        public void disconnect(BluetoothDevice device) {
            BluetoothA2dpSinkService.this.printLog("disconnect:" + device);
            if (device != null) {
                String BT_Addr = device.getAddress();
                BluetoothA2dpSinkService.this.printLog(BT_Addr);
                BluetoothA2dpSinkService.this.disconnectSource(BT_Addr);
                return;
            }
            BluetoothA2dpSinkService.this.printLog("a2dpsinkservice, disconnect device == null");
        }

        public boolean isConnected(BluetoothDevice device) {
            if (BluetoothA2dpSinkService.this.mA2dpSourceDevice == device) {
                return true;
            }
            return false;
        }
    }

    private class A2dpSinkListener extends Thread {
        public boolean mStopListen;

        private A2dpSinkListener() {
        }

        public void run() {
            BluetoothA2dpSinkService.this.printLog("Start listening");
            while (!this.mStopListen) {
                if (!BluetoothA2dpSinkService.this.listenIndicationNative(false)) {
                    BluetoothA2dpSinkService.this.errorLog("listen failed");
                    this.mStopListen = true;
                }
            }
            BluetoothA2dpSinkService.this.printLog("SocketListener stopped.");
        }
    }

    private static native void classInitNative();

    private native void cleanupNativeDataNative();

    private native boolean connectNative(String str);

    private native void disableNative();

    private native void disconnectNative(String str);

    private native boolean enableNative();

    private native void initializeNativeDataNative();

    private native boolean listenIndicationNative(boolean z);

    private native void setAudioStateNative(int i, boolean z);

    private native void wakeupListenerNative();

    static {
        System.loadLibrary("exta2dpsink_jni");
        classInitNative();
    }

    public static BluetoothA2dpSinkService getInstance() {
        return mInstance;
    }

    public IBinder onBind(Intent intent) {
        String action = intent.getAction();
        printLog("Enter onBind() action = " + action);
        if (IBluetoothA2dpSink.class.getName().equals(action)) {
            printLog("Enter onBind() mA2dpSinkCtrl ");
            return this.mA2dpSinkCtrl;
        }
        printLog("Enter onBind return null ");
        return null;
    }

    public void onCreate() {
        printLog("onCreate()");
        mInstance = this;
        this.mA2dpSourceDevice = null;
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.bluetooth.device.action.BOND_STATE_CHANGED");
        filter.addAction(LocalBluetoothProfileManager.ACTION_DISABLE_PROFILES);
        filter.addAction(BluetoothAvrcpCtService.ACTION_BTMUSIC_ACTION_MANAGE);
        registerReceiver(this.mReceiver, filter);
        localCreateService();
    }

    public void onDestroy() {
        printLog("onDestroy()");
        mInstance = null;
        BluetoothA2dpSinkDisable();
        unregisterReceiver(this.mReceiver);
        super.onDestroy();
    }

    public void onTaskRemoved(Intent rootIntent) {
        printLog("onTaskRemoved ");
        super.onTaskRemoved(rootIntent);
        stopSelf();
    }

    void localCreateService() {
        printLog("localCreateService mServerState = " + mA2dpSinkState);
        if (mA2dpSinkState != 11) {
            initializeNativeDataNative();
            printLog(" start SocketListener");
            mA2dpSinkState = 10;
            if (!BluetoothA2dpSinkEnable()) {
                this.update_state_intent.putExtra("android.bluetooth.profilemanager.extra.PROFILE", Profile.Bluetooth_A2DP_SINK);
                this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_PROFILE, BTProfile.Bluetooth_A2DP_SINK);
                this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 14);
                sendBroadcast(this.update_state_intent, "android.permission.BLUETOOTH");
                mA2dpSinkState = 13;
            }
        }
    }

    private boolean BluetoothA2dpSinkEnable() {
        printLog("BluetoothA2dpSinkEnable()");
        if (enableNative()) {
            return true;
        }
        errorLog("enableNative send failed");
        return false;
    }

    private void BluetoothA2dpSinkDisable() {
        printLog("BluetoothA2dpSinkDisable()");
        disableNative();
        cleanupNativeDataNative();
    }

    public boolean connectSource(String BT_Addr) {
        printLog("connectA2dpSource:" + BT_Addr);
        mA2dpSinkState = 3;
        boolean ret = connectNative(BT_Addr);
        if (!ret) {
            errorLog("a2dpsinkservice:connectSource failure ,return value is" + ret);
        }
        return ret;
    }

    public void disconnectSource(String BT_Addr) {
        printLog("disconnectA2dpSource:" + BT_Addr);
        mA2dpSinkState = 4;
        disconnectNative(BT_Addr);
    }

    private void onPropertyChanged(String path, String[] propValues) {
        String name = propValues[0];
        printLog("###" + path);
        if (name.equals(PROPERTY_STATE)) {
            int state = convertBluezSinkStringtoState(propValues[1]);
            Message msg = Message.obtain();
            msg.what = state;
            Bundle data = new Bundle();
            data.putString("device_addr", path);
            msg.setData(data);
            this.mServiceHandler.sendMessage(msg);
        }
    }

    private void printLog(String msg) {
        if (DEBUG) {
            Log.d(TAG, msg);
        }
    }

    private void errorLog(String msg) {
        Log.e(TAG, msg);
    }

    private BluetoothDevice getBluetoothDevice(String BT_Addr) {
        return BluetoothAdapter.getDefaultAdapter().getRemoteDevice(BT_Addr);
    }

    private int convertBluezSinkStringtoState(String value) {
        if (value.equalsIgnoreCase("activated")) {
            return 0;
        }
        if (value.equalsIgnoreCase("deactivated")) {
            return 13;
        }
        if (value.equalsIgnoreCase("disconnected")) {
            return 2;
        }
        if (value.equalsIgnoreCase("connecting")) {
            return 3;
        }
        if (value.equalsIgnoreCase("connected")) {
            return 1;
        }
        if (value.equalsIgnoreCase("playing")) {
            return 15;
        }
        if (value.equalsIgnoreCase("suspend")) {
            return 16;
        }
        if (value.equalsIgnoreCase("standstill")) {
            return 19;
        }
        return -1;
    }
}
