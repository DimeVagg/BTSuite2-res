package com.autochips.bluetooth.dundt;

import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothProfileManager.Profile;
import android.bluetooth.IBluetoothDunDt;
import android.bluetooth.IBluetoothDunDt.Stub;
import android.bluetooth.IDunCallback;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.RemoteCallbackList;
import android.os.RemoteException;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.LocalBluetoothProfileManager;
import com.autochips.bluetooth.LocalBluetoothProfileManager.BTProfile;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;

public class BluetoothDunDtService extends Service {
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugSMS);
    private static final int DUN_CONNECT_SUCCESS = 0;
    private static final int DUN_DT_ABORT_CNF = 90008;
    private static final int DUN_DT_CONNECT_CNF = 90002;
    private static final int DUN_DT_DISABLE_CNF = 90005;
    private static final int DUN_DT_DISCONNECT_CNF = 90003;
    private static final int DUN_DT_DISCONNECT_IND = 90004;
    private static final int DUN_DT_ENABLE_CNF = 90001;
    private static final int DUN_DT_GET_DATA_CNF = 90007;
    private static final int DUN_DT_SEND_DATA_CNF = 90006;
    private static final int DUN_ENABLE_SUCCESS = 1;
    private static final int DUN_STATE_DISCONNECT = -2;
    private static final int DUN_STATUS_FAIL = -1;
    private static final String TAG = "BluetoothDunDtSevice";
    BluetoothAdapter mAdapter = null;
    String mAtCmd = null;
    private RemoteCallbackList mCallbacks = new RemoteCallbackList();
    private final Stub mDunDtCtrl = new C00302();
    private int mDunDtState = -2;
    private DunSocketListener mDunListener;
    private Handler mDunServiceHandler = new C00291();
    private int mNativeData;
    BluetoothDevice mRemoteDevice = null;
    StringBuilder response = new StringBuilder();
    StringBuilder sb = new StringBuilder();

    /* renamed from: com.autochips.bluetooth.dundt.BluetoothDunDtService$1 */
    class C00291 extends Handler {
        C00291() {
        }

        public void handleMessage(Message msg) {
            BluetoothDunDtService.this.printLog("[MSG] handleMessage (" + msg.what + ")");
            switch (msg.what) {
                case BluetoothDunDtService.DUN_DT_ENABLE_CNF /*90001*/:
                    if (1 == Integer.parseInt(msg.obj.toString())) {
                        BluetoothDunDtService.this.broadcastDunState(11);
                        BluetoothDunDtService.this.printLog("DUN Enable Success");
                        return;
                    }
                    BluetoothDunDtService.this.errorLog("DUN Enable fail");
                    BluetoothDunDtService.this.stopSelf();
                    BluetoothDunDtService.this.broadcastDunState(14);
                    return;
                case BluetoothDunDtService.DUN_DT_CONNECT_CNF /*90002*/:
                    int result = Integer.parseInt(msg.obj.toString());
                    if (result == 0) {
                        BluetoothDunDtService.this.notifyConnect(true);
                        BluetoothDunDtService.this.broadcastDunState(1);
                        return;
                    }
                    BluetoothDunDtService.this.notifyConnect(false);
                    BluetoothDunDtService.this.errorLog("DUN connect fail,result code is: " + result);
                    BluetoothDunDtService.this.broadcastDunState(2);
                    return;
                case BluetoothDunDtService.DUN_DT_DISCONNECT_CNF /*90003*/:
                    BluetoothDunDtService.this.printLog("disconnect cnf");
                    BluetoothDunDtService.this.notifyDisConnect(true);
                    BluetoothDunDtService.this.broadcastDunState(2);
                    return;
                case BluetoothDunDtService.DUN_DT_DISCONNECT_IND /*90004*/:
                    BluetoothDunDtService.this.printLog("disconnect ind");
                    BluetoothDunDtService.this.notifyDisConnect(false);
                    BluetoothDunDtService.this.broadcastDunState(2);
                    return;
                case BluetoothDunDtService.DUN_DT_DISABLE_CNF /*90005*/:
                    if (1 == Integer.parseInt(msg.obj.toString())) {
                        BluetoothDunDtService.this.broadcastDunState(13);
                        BluetoothDunDtService.this.printLog("DUN disable Success");
                        return;
                    }
                    BluetoothDunDtService.this.broadcastDunState(14);
                    BluetoothDunDtService.this.errorLog("DUN disable fail");
                    return;
                case BluetoothDunDtService.DUN_DT_SEND_DATA_CNF /*90006*/:
                    BluetoothDunDtService.this.printLog("Send AT CMD Success");
                    return;
                case BluetoothDunDtService.DUN_DT_GET_DATA_CNF /*90007*/:
                    BluetoothDunDtService.this.sb.append(msg.obj.toString());
                    if (BluetoothDunDtService.this.sb.toString().indexOf("OK") >= 0 || BluetoothDunDtService.this.sb.toString().indexOf("ERROR") >= 0) {
                        BluetoothDunDtService.this.response.append(BluetoothDunDtService.this.sb.toString());
                        BluetoothDunDtService.this.printLog("Complete packet");
                        BluetoothDunDtService.this.notifyGetData(BluetoothDunDtService.this.response.toString());
                        BluetoothDunDtService.this.sb.setLength(0);
                        BluetoothDunDtService.this.response.setLength(0);
                        return;
                    }
                    BluetoothDunDtService.this.printLog("DUN response need to packet");
                    return;
                default:
                    return;
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.dundt.BluetoothDunDtService$2 */
    class C00302 extends Stub {
        C00302() {
        }

        public void registerCallback(IDunCallback cb) throws RemoteException {
            if (cb != null) {
                BluetoothDunDtService.this.mCallbacks.register(cb);
            }
        }

        public void unregisterCallback(IDunCallback cb) throws RemoteException {
            if (cb != null) {
                BluetoothDunDtService.this.mCallbacks.unregister(cb);
            }
        }

        public BluetoothDevice getServer() {
            if (BluetoothDunDtService.this.mDunDtState == 1) {
                return BluetoothDunDtService.this.mRemoteDevice;
            }
            return null;
        }

        public int getState() {
            return BluetoothDunDtService.this.mDunDtState;
        }

        public BluetoothDevice getConnectedDevice() {
            if (BluetoothDunDtService.this.mDunDtState == 1) {
                return BluetoothDunDtService.this.mRemoteDevice;
            }
            return null;
        }

        public void write(byte[] buffer) {
            BluetoothDunDtService.this.mAtCmd = new String(buffer);
            BluetoothDunDtService.this.printLog("Send At command is:" + BluetoothDunDtService.this.mAtCmd);
            BluetoothDunDtService.this.sentAtCmd(BluetoothDunDtService.this.mAtCmd);
        }

        public void connect(BluetoothDevice device) {
            BluetoothDunDtService.this.printLog("connect to " + device.getAddress());
            BluetoothDunDtService.this.mRemoteDevice = device;
            String BT_Addr = device.getAddress();
            BluetoothDunDtService.this.broadcastDunState(3);
            BluetoothDunDtService.this.connectDunDevice(BT_Addr);
        }

        public void disconnect() {
            BluetoothDunDtService.this.printLog("disconnect");
            BluetoothDunDtService.this.broadcastDunState(4);
            BluetoothDunDtService.this.disconnectDunDevice();
        }

        public boolean isConnected(BluetoothDevice device) {
            if (BluetoothDunDtService.this.mRemoteDevice == device) {
                return true;
            }
            return false;
        }
    }

    private class DunSocketListener extends Thread {
        public boolean mDunStopListen;

        private DunSocketListener() {
        }

        public void run() {
            BluetoothDunDtService.this.printLog("DunSocketListener start.");
            while (!this.mDunStopListen) {
                if (!BluetoothDunDtService.this.listenIndicationNative(false)) {
                    this.mDunStopListen = true;
                }
            }
            BluetoothDunDtService.this.printLog("DunSocketListener stopped.");
        }
    }

    private static native void classInitNative();

    private native void cleanupNativeDataNative();

    private native boolean dunConnectNative(String str);

    private static native void dunDialupRspNative(String str, int i);

    private native void dunDisableNative();

    private native void dunDisconnectNative();

    private native boolean dunEnableNative();

    private native void initializeNativeDataNative();

    private native boolean listenIndicationNative(boolean z);

    private native void wakeupListenerNative();

    static {
        System.loadLibrary("extdundt_jni");
        classInitNative();
    }

    private void broadcastDunState(int state) {
        this.mDunDtState = state;
        Intent intent = new Intent(LocalBluetoothProfileManager.ACTION_PROFILE_STATE_UPDATE);
        Profile profile = Profile.Bluetooth_DUN_DT;
        intent.putExtra("android.bluetooth.profilemanager.extra.PROFILE", profile);
        intent.putExtra(LocalBluetoothProfileManager.EXTRA_PROFILE, BTProfile.values()[profile.ordinal()]);
        intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, state);
        sendBroadcast(intent, "android.permission.BLUETOOTH");
    }

    public void onCreate() {
        printLog("onCreate");
        broadcastDunState(10);
        this.mAdapter = BluetoothAdapter.getDefaultAdapter();
        initializeNativeDataNative();
        if (!bluetoothDunDtEnable()) {
            errorLog("[ERR] DUN Enable fail");
            this.mAdapter = null;
            stopSelf();
            broadcastDunState(14);
        }
    }

    public void onDestroy() {
        printLog("onDestroy");
        broadcastDunState(12);
        bluetoothDunDtDisable();
        cleanupNativeDataNative();
        broadcastDunState(13);
    }

    private void notifyConnect(boolean result) {
        int N = this.mCallbacks.beginBroadcast();
        int i = 0;
        while (i < N) {
            try {
                ((IDunCallback) this.mCallbacks.getBroadcastItem(i)).notifyConnect(result);
                i++;
            } catch (RemoteException e) {
                Log.e(TAG, BluetoothPbapClientPath.PBAP_ROOT_NAME + e);
            }
        }
        this.mCallbacks.finishBroadcast();
    }

    private void notifyDisConnect(boolean result) {
        int N = this.mCallbacks.beginBroadcast();
        int i = 0;
        while (i < N) {
            try {
                ((IDunCallback) this.mCallbacks.getBroadcastItem(i)).notifyDisConnect(result);
                i++;
            } catch (RemoteException e) {
                Log.e(TAG, BluetoothPbapClientPath.PBAP_ROOT_NAME + e);
            }
        }
        this.mCallbacks.finishBroadcast();
    }

    private void notifyGetData(String mResString) {
        int N = this.mCallbacks.beginBroadcast();
        int i = 0;
        while (i < N) {
            try {
                ((IDunCallback) this.mCallbacks.getBroadcastItem(i)).notifyGetData(mResString);
                i++;
            } catch (RemoteException e) {
                Log.e(TAG, BluetoothPbapClientPath.PBAP_ROOT_NAME + e);
            }
        }
        this.mCallbacks.finishBroadcast();
    }

    public IBinder onBind(Intent intent) {
        String action = intent.getAction();
        printLog("onBind() action = " + action);
        if (IBluetoothDunDt.class.getName().equals(action)) {
            printLog("onBind() mDunDtCtrl ");
            return this.mDunDtCtrl;
        }
        printLog("onBind return null ");
        return null;
    }

    public boolean bluetoothDunDtEnable() {
        printLog("[API] bluetoothDunDtEnable");
        this.mDunListener = new DunSocketListener();
        if (dunEnableNative()) {
            this.mDunListener.mDunStopListen = false;
            this.mDunListener.start();
            return true;
        }
        errorLog("bluetoothDunDtEnable failed");
        this.mDunListener = null;
        return false;
    }

    public void sentAtCmd(String mAtCmd) {
        printLog("before sendAtCmd" + mAtCmd);
        dunDialupRspNative(mAtCmd, mAtCmd.length());
        printLog("after sendAtCmd" + mAtCmd);
    }

    public boolean bluetoothDunDtDisable() {
        printLog("[API] bluetoothDunDtDisable");
        if (this.mDunListener != null) {
            this.mDunListener.mDunStopListen = true;
            wakeupListenerNative();
            try {
                this.mDunListener.join();
            } catch (InterruptedException ex) {
                errorLog("mListener colose error" + ex);
            }
            dunDisableNative();
        }
        printLog("DUN client is not enabled yet");
        return true;
    }

    boolean connectDunDevice(String btaddr) {
        printLog("[API] connectDunDevice (" + btaddr + ")");
        return dunConnectNative(btaddr);
    }

    void disconnectDunDevice() {
        printLog("[API] disconnectDunDevice");
        dunDisconnectNative();
    }

    private void onDunEnableCnf(int cnf_code, int port) {
        sendDunServiceMsg(DUN_DT_ENABLE_CNF, Integer.valueOf(cnf_code));
    }

    private void onDunConnectCnf(int cnf_code) {
        sendDunServiceMsg(DUN_DT_CONNECT_CNF, Integer.valueOf(cnf_code));
    }

    private void onDunSendDataCnf(int port) {
        sendDunServiceMsg(DUN_DT_SEND_DATA_CNF, Integer.valueOf(port));
    }

    private void onDunGetDataCnf(String r_buffer) {
        printLog("+onDunGetDataCnf");
        sendDunServiceMsg(DUN_DT_GET_DATA_CNF, r_buffer);
        printLog("-onDunGetDataCnf");
    }

    private void onDunDisconnectCnf(int cnf_code) {
        sendDunServiceMsg(DUN_DT_DISCONNECT_CNF, Integer.valueOf(cnf_code));
    }

    private void onDunDisconnectInd() {
        sendDunServiceMsg(DUN_DT_DISCONNECT_IND, null);
    }

    private void onDunDisableCnf(int cnf_code) {
        sendDunServiceMsg(DUN_DT_DISABLE_CNF, Integer.valueOf(cnf_code));
    }

    private void printLog(String msg) {
        if (DEBUG) {
            Log.d(TAG, msg);
        }
    }

    private void errorLog(String msg) {
        if (DEBUG) {
            Log.e(TAG, msg);
        }
    }

    private void sendDunServiceMsg(int what, Object arg) {
        printLog("[API] sendDunServiceMsg(" + what + ")");
        if (this.mDunServiceHandler != null) {
            Message msg = this.mDunServiceHandler.obtainMessage(what);
            msg.what = what;
            msg.obj = arg;
            this.mDunServiceHandler.sendMessage(msg);
            return;
        }
        printLog("mDunServiceHandler is null");
    }
}
