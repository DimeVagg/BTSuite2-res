package com.autochips.bluetooth.pbapclient;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothProfileManager.Profile;
import android.bluetooth.IBluetoothPbapCall;
import android.bluetooth.IBluetoothPbapCall.Stub;
import android.bluetooth.IBluetoothPbapClient;
import android.bluetooth.IPBCallback;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.RemoteCallbackList;
import android.os.RemoteException;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.LocalBluetoothProfileManager;
import com.autochips.bluetooth.LocalBluetoothProfileManager.BTProfile;
import com.autochips.bluetooth.util.NotificationFactory;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class BluetoothPbapClientService extends Service {
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugPB);
    public static final String PBAP_AUTHENTICATE_CANCEL_ACTION = "com.android.bluetooth.pbap.authenticate.cancel";
    public static final String PBAP_AUTHENTICATE_RETURN_ACTION = "com.android.bluetooth.pbap.authenticate.return";
    public static final int PBAP_AUTHENTICATE_TIMEOUT = 30000;
    public static final int PBAP_AUTH_CHALL_IND = 10011;
    public static final int PBAP_AUTH_TIMEOUT_IND = 1001;
    public static final int PBAP_CLIENT_ABORT_CNF = 10010;
    public static final int PBAP_CLIENT_CONNECT_CNF = 10003;
    public static final int PBAP_CLIENT_DISCONNECT_CNF = 10004;
    public static final int PBAP_CLIENT_DISCONNECT_IND = 10005;
    public static final int PBAP_CLIENT_ENABLE_CNF = 10001;
    public static final int PBAP_CLIENT_PULLPHONEBOOK_CNF = 10009;
    public static final int PBAP_CLIENT_PULLVCARDENTRY_CNF = 10008;
    public static final int PBAP_CLIENT_PULLVCARDLISTING_CNF = 10007;
    public static final int PBAP_CLIENT_SETPATH_CNF = 10006;
    public static final int PBAP_NOTIFICATION_AUTH_CHALL = 1;
    public static final int PB_STATUS_FAILED = 1;
    public static final int PB_STATUS_SUCCESS = 0;
    private static final String TAG = "BluetoothPbapClientService";
    private static final long mDefaultVcardFilter = 268435588;
    BluetoothAdapter mAdapter = null;
    private RemoteCallbackList mCallbacks = new RemoteCallbackList();
    BluetoothPbapClientPath mClientPath = new BluetoothPbapClientPath();
    private final IntentFilter mIntentFilter = null;
    private boolean mIsGetVcardEntry = false;
    private String mJniListInfo;
    private String mJniVcard = null;
    private PbapSocketListener mListener;
    private NotificationManager mNM = null;
    private int mNativeData;
    private int mPbClientState = 0;
    private final Stub mPbapClientCall = new C00794();
    private final IBluetoothPbapClient.Stub mPbapClientCtrl = new C00783();
    private int mPid = -1;
    private BroadcastReceiver mReceiver = new C00761();
    BluetoothDevice mRemoteDevice = null;
    private Handler mServiceHandler = new C00772();
    private int mVcardEntryObjectIndex;
    private String mVcardEntryObjectName;
    private List<String> mVcardHandleName = new ArrayList();
    private int mVcardListCount = 0;
    private int m_curDownloadPath = 0;
    private String mlocalListInfo = "PBListInfo.log";
    private String mlocalVcard = null;

    /* renamed from: com.autochips.bluetooth.pbapclient.BluetoothPbapClientService$1 */
    class C00761 extends BroadcastReceiver {
        C00761() {
        }

        public void onReceive(Context context, Intent intent) {
            String userid = null;
            BluetoothPbapClientService.this.printLog("onReceive(" + intent.getAction() + ")");
            if (intent.getAction().equals(BluetoothPbapClientService.PBAP_AUTHENTICATE_RETURN_ACTION)) {
                long res = (long) intent.getIntExtra(BluetoothAuthenticating.AUTHENTICATE_RESULT, 5);
                BluetoothPbapClientService.this.printLog("PBAP_AUTHENTICATE_RETURN_ACTION : result == " + res);
                if (res == 1) {
                    BluetoothAdapter adapter = BluetoothAdapter.getDefaultAdapter();
                    String passcode = intent.getStringExtra(BluetoothAuthenticating.AUTHETICATE_CODE);
                    if (adapter != null) {
                        userid = adapter.getName();
                    }
                    BluetoothPbapClientService.this.authChallRsp(false, passcode, userid);
                    return;
                }
                BluetoothPbapClientService.this.authChallRsp(true, null, null);
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.pbapclient.BluetoothPbapClientService$2 */
    class C00772 extends Handler {
        C00772() {
        }

        public void handleMessage(Message msg) {
            BluetoothPbapClientService.this.printLog("[MSG] handleMessage(" + msg.what + ")");
            switch (msg.what) {
                case 1001:
                    if (BluetoothPbapClientService.this.mPid == NotificationFactory.getProfileNotificationId(12, 1)) {
                        BluetoothPbapClientService.this.authChallRsp(true, null, null);
                    }
                    BluetoothPbapClientService.this.cancelServerNotification();
                    return;
                case 10001:
                    if (Integer.parseInt(msg.obj.toString()) == 0) {
                        BluetoothPbapClientService.this.broadcastPbapState(11);
                        BluetoothPbapClientService.this.printLog("pbap enable() OK");
                        return;
                    }
                    BluetoothPbapClientService.this.errorLog("[ERR] Pbap Client enable failed");
                    BluetoothPbapClientService.this.mAdapter = null;
                    BluetoothPbapClientService.this.stopSelf();
                    BluetoothPbapClientService.this.broadcastPbapState(14);
                    return;
                case 10003:
                    if (Integer.parseInt(msg.obj.toString()) == 0) {
                        BluetoothPbapClientService.this.notifyConnect(true);
                        BluetoothPbapClientService.this.printLog("pbap client connect success");
                        BluetoothPbapClientService.this.broadcastPbapState(1);
                        return;
                    }
                    BluetoothPbapClientService.this.notifyConnect(false);
                    BluetoothPbapClientService.this.printLog("pbap client connect failed");
                    BluetoothPbapClientService.this.broadcastPbapState(2);
                    return;
                case BluetoothPbapClientService.PBAP_CLIENT_DISCONNECT_CNF /*10004*/:
                    if (Integer.parseInt(msg.obj.toString()) == 0) {
                        BluetoothPbapClientService.this.notifyDisConnect(true);
                        BluetoothPbapClientService.this.printLog("pbap client disconnect succuss");
                        BluetoothPbapClientService.this.broadcastPbapState(2);
                    } else {
                        BluetoothPbapClientService.this.notifyDisConnect(true);
                        BluetoothPbapClientService.this.printLog("pbap client disconnect failed");
                    }
                    BluetoothPbapClientService.this.cancelServerNotification();
                    return;
                case BluetoothPbapClientService.PBAP_CLIENT_DISCONNECT_IND /*10005*/:
                    BluetoothPbapClientService.this.printLog("pbap client disconnect indication");
                    BluetoothPbapClientService.this.notifyDisConnect(false);
                    BluetoothPbapClientService.this.cancelServerNotification();
                    BluetoothPbapClientService.this.broadcastPbapState(2);
                    return;
                case BluetoothPbapClientService.PBAP_CLIENT_SETPATH_CNF /*10006*/:
                    if (Integer.parseInt(msg.obj.toString()) != 0) {
                        BluetoothPbapClientService.this.errorLog("PBAP set path fail");
                        BluetoothPbapClientService.this.notifySetPath(false);
                        return;
                    } else if (BluetoothPbapClientService.this.mClientPath.getCurIndex() < BluetoothPbapClientService.this.mClientPath.getPathLevel(BluetoothPbapClientService.this.mIsGetVcardEntry)) {
                        BluetoothPbapClientService.this.setPath(0, BluetoothPbapClientService.this.mClientPath.getIndexPath(BluetoothPbapClientService.this.mClientPath.getCurIndex()));
                        BluetoothPbapClientService.this.mClientPath.increaseIndex();
                        return;
                    } else if (BluetoothPbapClientService.this.mClientPath.getCurIndex() == BluetoothPbapClientService.this.mClientPath.getPathLevel(BluetoothPbapClientService.this.mIsGetVcardEntry)) {
                        BluetoothPbapClientService.this.printLog("PBAP set path OK");
                        if (BluetoothPbapClientService.this.mIsGetVcardEntry) {
                            BluetoothPbapClientService.this.printLog("first index = " + BluetoothPbapClientService.this.mVcardEntryObjectIndex);
                            BluetoothPbapClientService.this.pullVcardEntry(BluetoothPbapClientService.this.mVcardEntryObjectName, (String) BluetoothPbapClientService.this.mVcardHandleName.get(BluetoothPbapClientService.this.mVcardEntryObjectIndex - 1), BluetoothPbapClientService.mDefaultVcardFilter, '\u0000');
                            return;
                        }
                        BluetoothPbapClientService.this.notifySetPath(true);
                        return;
                    } else {
                        return;
                    }
                case BluetoothPbapClientService.PBAP_CLIENT_PULLVCARDLISTING_CNF /*10007*/:
                    PulldataResult result = msg.obj;
                    if (result.cnf_code == 0) {
                        BluetoothPbapClientService.this.mVcardListCount = result.phonebookSize;
                        BluetoothPbapClientService.this.printLog("PBAP pull vcard listing OK.size = " + result.phonebookSize);
                        BluetoothPbapClientService.this.notifyGetList(BluetoothPbapClientService.this.mVcardListCount, 0, BluetoothPbapClientService.this.mVcardListCount, true);
                        return;
                    }
                    BluetoothPbapClientService.this.errorLog("pull vcard listing fail");
                    BluetoothPbapClientService.this.notifyGetList(0, 0, 0, false);
                    return;
                case BluetoothPbapClientService.PBAP_CLIENT_PULLVCARDENTRY_CNF /*10008*/:
                    if (Integer.parseInt(msg.obj.toString()) == 0) {
                        BluetoothPbapClientService.this.printLog("PBAP pull vcardentry OK");
                        BluetoothPbapClientService.this.notifyGetVcardEntry(true);
                        return;
                    }
                    BluetoothPbapClientService.this.errorLog("PBAP pull vcardentry fail");
                    BluetoothPbapClientService.this.notifyGetVcardEntry(false);
                    return;
                case BluetoothPbapClientService.PBAP_CLIENT_PULLPHONEBOOK_CNF /*10009*/:
                    if (((PulldataResult) msg.obj).cnf_code == 0) {
                        BluetoothPbapClientService.this.printLog("PBAP pull phonebook OK");
                        BluetoothPbapClientService.this.notifyGetPhonebook(true);
                        return;
                    }
                    BluetoothPbapClientService.this.errorLog("PBAP pull phonebook fail");
                    BluetoothPbapClientService.this.notifyGetPhonebook(false);
                    return;
                case BluetoothPbapClientService.PBAP_CLIENT_ABORT_CNF /*10010*/:
                    if (Integer.parseInt(msg.obj.toString()) == 0) {
                        BluetoothPbapClientService.this.printLog("PBAP Abort OK");
                        return;
                    } else {
                        BluetoothPbapClientService.this.printLog("PBAP Abort fail");
                        return;
                    }
                case BluetoothPbapClientService.PBAP_AUTH_CHALL_IND /*10011*/:
                    BluetoothPbapClientService.this.printLog("[PBAP] need PBAP_AUTH_CHALL_IND");
                    BluetoothPbapClientService.this.setServerNotification(1);
                    return;
                default:
                    BluetoothPbapClientService.this.errorLog("Unsupported indication");
                    return;
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.pbapclient.BluetoothPbapClientService$3 */
    class C00783 extends IBluetoothPbapClient.Stub {
        C00783() {
        }

        public BluetoothDevice getServer() {
            if (BluetoothPbapClientService.this.mPbClientState == 1) {
                return BluetoothPbapClientService.this.mRemoteDevice;
            }
            return null;
        }

        public int getState() {
            return BluetoothPbapClientService.this.mPbClientState;
        }

        public BluetoothDevice getConnectedDevice() {
            if (BluetoothPbapClientService.this.mPbClientState == 1) {
                return BluetoothPbapClientService.this.mRemoteDevice;
            }
            return null;
        }

        public void connect(BluetoothDevice device) {
            BluetoothPbapClientService.this.printLog("connect to " + device.getAddress());
            BluetoothPbapClientService.this.mRemoteDevice = device;
            String BT_Addr = device.getAddress();
            BluetoothPbapClientService.this.broadcastPbapState(3);
            BluetoothPbapClientService.this.connectPB(BT_Addr);
        }

        public void disconnect() {
            BluetoothPbapClientService.this.printLog("disconnect");
            BluetoothPbapClientService.this.disconnectPB();
        }

        public boolean isConnected(BluetoothDevice device) {
            if (BluetoothPbapClientService.this.mRemoteDevice == device) {
                return true;
            }
            return false;
        }
    }

    /* renamed from: com.autochips.bluetooth.pbapclient.BluetoothPbapClientService$4 */
    class C00794 extends Stub {
        C00794() {
        }

        public void registerCallback(IPBCallback cb) throws RemoteException {
            if (cb != null) {
                BluetoothPbapClientService.this.mCallbacks.register(cb);
            }
        }

        public void unregisterCallback(IPBCallback cb) throws RemoteException {
            if (cb != null) {
                BluetoothPbapClientService.this.mCallbacks.unregister(cb);
            }
        }

        public void connect(BluetoothDevice device) throws RemoteException {
            BluetoothPbapClientService.this.printLog("connect to " + device.getAddress());
            BluetoothPbapClientService.this.mRemoteDevice = device;
            BluetoothPbapClientService.this.connectPB(device.getAddress());
        }

        public void disconnect() throws RemoteException {
            BluetoothPbapClientService.this.printLog("disconnect");
            BluetoothPbapClientService.this.disconnectPB();
        }

        public boolean pbapIsConnected() throws RemoteException {
            if (2 == BluetoothPbapClientService.this.mPbClientState) {
                return true;
            }
            return false;
        }

        public void pbapSetPath(int folder_type) throws RemoteException {
            BluetoothPbapClientService.this.setDownloadPath(folder_type);
        }

        public boolean pbapPullVcardListing() throws RemoteException {
            String filename = BluetoothPbapClientService.this.mJniListInfo;
            try {
                BluetoothPbapClientService.this.openFileOutput(BluetoothPbapClientService.this.mlocalListInfo, 2).close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
            String objectname = BluetoothPbapClientService.this.mClientPath.getFolderName();
            if (objectname == null) {
                return false;
            }
            return BluetoothPbapClientService.this.pullVcardListing(filename, objectname, 0, null, '\u0000', (short) 0, (short) 0);
        }

        public boolean pbapPullVcardEntry(String filename, int objectIdx) throws RemoteException {
            BluetoothPbapClientService.this.mVcardEntryObjectName = filename;
            BluetoothPbapClientService.this.mVcardEntryObjectIndex = objectIdx;
            BluetoothPbapClientService.this.printLog("pbapPullVcardEntry index = " + BluetoothPbapClientService.this.mVcardEntryObjectIndex);
            if (BluetoothPbapClientService.this.mIsGetVcardEntry) {
                return BluetoothPbapClientService.this.pullVcardEntry(BluetoothPbapClientService.this.mVcardEntryObjectName, (String) BluetoothPbapClientService.this.mVcardHandleName.get(BluetoothPbapClientService.this.mVcardEntryObjectIndex - 1), BluetoothPbapClientService.mDefaultVcardFilter, '\u0000');
            }
            BluetoothPbapClientService.this.mIsGetVcardEntry = true;
            boolean result = BluetoothPbapClientService.this.setPath(0, BluetoothPbapClientService.this.mClientPath.getIndexPath(BluetoothPbapClientService.this.mClientPath.getCurIndex()));
            BluetoothPbapClientService.this.mClientPath.increaseIndex();
            return result;
        }

        public boolean pbapPullPhonebook(String filename, int maxListCount, int listStartOffset) throws RemoteException {
            return BluetoothPbapClientService.this.pullPhonebook(filename, BluetoothPbapClientService.this.mClientPath.getAbsolutePath(BluetoothPbapClientService.this.m_curDownloadPath), BluetoothPbapClientService.mDefaultVcardFilter, '\u0000', (short) maxListCount, (short) listStartOffset);
        }

        public int pbapGetState() throws RemoteException {
            return BluetoothPbapClientService.this.mPbClientState;
        }

        public boolean pbapAbortReq() throws RemoteException {
            return BluetoothPbapClientService.this.abortReq();
        }
    }

    private class PbapSocketListener extends Thread {
        public boolean mStopListen;

        private PbapSocketListener() {
        }

        public void run() {
            BluetoothPbapClientService.this.printLog("Start listening");
            while (!this.mStopListen) {
                if (!BluetoothPbapClientService.this.listenIndicationNative(false)) {
                    BluetoothPbapClientService.this.errorLog("listen failed");
                    this.mStopListen = true;
                }
            }
            BluetoothPbapClientService.this.printLog("SocketListener stopped.");
        }
    }

    class PulldataResult {
        public int cnf_code;
        public short newMissedCalls;
        public short phonebookSize;

        PulldataResult() {
        }
    }

    private native boolean abortReqNative();

    private native boolean authChallengeRspNative(boolean z, String str, String str2);

    private static native void classInitNative();

    private native void cleanupNativeDataNative();

    private native boolean connectNative(String str);

    private native void disableNative();

    private native void disconnectNative();

    private native boolean enableNative();

    private native void initializeNativeDataNative();

    private native boolean listenIndicationNative(boolean z);

    private native boolean pullPhonebookNative(String str, String str2, long j, char c, short s, short s2);

    private native boolean pullVcardEntryNative(String str, String str2, long j, char c);

    private native boolean pullVcardListingNative(String str, String str2, int i, String str3, char c, short s, short s2);

    private native boolean setPathNative(int i, String str);

    private native void wakeupListenerNative();

    static {
        System.loadLibrary("extpbapclient_jni");
        classInitNative();
    }

    private boolean parseVcardList() {
        String sCardHandle = "card handle";
        try {
            FileInputStream fis = openFileInput(this.mlocalListInfo);
            DataInputStream dataIn = new DataInputStream(fis);
            while (true) {
                try {
                    String strLine = dataIn.readLine();
                    if (strLine == null) {
                        break;
                    }
                    int iend = -1;
                    while (true) {
                        int istart = strLine.indexOf(sCardHandle, iend + 1);
                        if (istart < 0) {
                            break;
                        }
                        int iSubStart = strLine.indexOf("\"", istart);
                        if (-1 == iSubStart) {
                            break;
                        }
                        int iSubEnd = strLine.indexOf("\"", iSubStart + 1);
                        if (-1 == iSubEnd) {
                            break;
                        }
                        String sHandle = strLine.substring(iSubStart + 1, iSubEnd);
                        iend = istart + sCardHandle.length();
                        if (!sHandle.equals("0.vcf")) {
                            this.mVcardHandleName.add(sHandle);
                            this.mVcardListCount++;
                        }
                    }
                } catch (IOException e) {
                    Log.e(TAG, "PBListInfo.log read exception");
                    e.printStackTrace();
                }
            }
            dataIn.close();
            fis.close();
            printLog("pbap vcardlist " + this.mVcardHandleName.toString());
            printLog("pbap vcardlist count = " + this.mVcardListCount);
            return true;
        } catch (FileNotFoundException e2) {
            Log.e(TAG, "PBListInfo.log not found");
            e2.printStackTrace();
            return false;
        }
    }

    public void setDownloadPath(int folder_type) {
        this.mIsGetVcardEntry = false;
        this.m_curDownloadPath = folder_type;
        this.mClientPath.setPath(folder_type);
        if (this.mClientPath.getPathLevel(this.mIsGetVcardEntry) < 0) {
            errorLog("Unsupported folder_type");
            return;
        }
        setPath(2, this.mClientPath.getIndexPath(this.mClientPath.getCurIndex()));
        this.mClientPath.increaseIndex();
    }

    private void notifyConnect(boolean result) {
        int N = this.mCallbacks.beginBroadcast();
        int i = 0;
        while (i < N) {
            try {
                ((IPBCallback) this.mCallbacks.getBroadcastItem(i)).notifyConnect(result);
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
                ((IPBCallback) this.mCallbacks.getBroadcastItem(i)).notifyDisConnect(result);
                i++;
            } catch (RemoteException e) {
                Log.e(TAG, BluetoothPbapClientPath.PBAP_ROOT_NAME + e);
            }
        }
        this.mCallbacks.finishBroadcast();
    }

    private void notifySetPath(boolean result) {
        int N = this.mCallbacks.beginBroadcast();
        int i = 0;
        while (i < N) {
            try {
                ((IPBCallback) this.mCallbacks.getBroadcastItem(i)).notifySetPath(result);
                i++;
            } catch (RemoteException e) {
                Log.e(TAG, BluetoothPbapClientPath.PBAP_ROOT_NAME + e);
            }
        }
        this.mCallbacks.finishBroadcast();
    }

    private void notifyGetList(int recordnum, int missed, int maxIndex, boolean result) {
        int N = this.mCallbacks.beginBroadcast();
        int i = 0;
        while (i < N) {
            try {
                ((IPBCallback) this.mCallbacks.getBroadcastItem(i)).notifyGetList(recordnum, missed, maxIndex, result);
                i++;
            } catch (RemoteException e) {
                Log.e(TAG, BluetoothPbapClientPath.PBAP_ROOT_NAME + e);
            }
        }
        this.mCallbacks.finishBroadcast();
    }

    private void notifyGetPhonebook(boolean result) {
        int N = this.mCallbacks.beginBroadcast();
        int i = 0;
        while (i < N) {
            try {
                ((IPBCallback) this.mCallbacks.getBroadcastItem(i)).notifyGetPhonebook(result);
                i++;
            } catch (RemoteException e) {
                Log.e(TAG, BluetoothPbapClientPath.PBAP_ROOT_NAME + e);
            }
        }
        this.mCallbacks.finishBroadcast();
    }

    private void notifyGetVcardEntry(boolean result) {
        int N = this.mCallbacks.beginBroadcast();
        int i = 0;
        while (i < N) {
            try {
                ((IPBCallback) this.mCallbacks.getBroadcastItem(i)).notifyGetVcardEntry(result);
                i++;
            } catch (RemoteException e) {
                Log.e(TAG, BluetoothPbapClientPath.PBAP_ROOT_NAME + e);
            }
        }
        this.mCallbacks.finishBroadcast();
    }

    public IBinder onBind(Intent intent) {
        String action = intent.getAction();
        printLog("Enter onBind() action = " + action);
        if (IBluetoothPbapClient.class.getName().equals(action)) {
            return this.mPbapClientCtrl;
        }
        if (IBluetoothPbapCall.class.getName().equals(action)) {
            return this.mPbapClientCall;
        }
        return null;
    }

    private void broadcastPbapState(int state) {
        this.mPbClientState = state;
        Intent intent = new Intent(LocalBluetoothProfileManager.ACTION_PROFILE_STATE_UPDATE);
        Profile profile = Profile.Bluetooth_PBAP_Client;
        intent.putExtra("android.bluetooth.profilemanager.extra.PROFILE", profile);
        intent.putExtra(LocalBluetoothProfileManager.EXTRA_PROFILE, BTProfile.values()[profile.ordinal()]);
        intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, state);
        sendBroadcast(intent, "android.permission.BLUETOOTH");
        BluetoothAdapter btAdapter = BluetoothAdapter.getDefaultAdapter();
        if (state == 1) {
            btAdapter.updateConnectionState(this.mRemoteDevice, 6, 2, 1);
        } else if (state == 2) {
            btAdapter.updateConnectionState(this.mRemoteDevice, 6, 0, 3);
        }
    }

    public void onCreate() {
        printLog("Enter onCreate()");
        this.mJniListInfo = getApplicationInfo().dataDir + "/files/" + this.mlocalListInfo;
        printLog("mJniListInfo = " + this.mJniListInfo);
        this.mNM = (NotificationManager) getSystemService("notification");
        if (this.mNM == null) {
            Log.e(TAG, "Get Notification-Manager failed, stop PBAP Client service.");
            stopSelf();
            broadcastPbapState(14);
        }
        broadcastPbapState(10);
        this.mAdapter = BluetoothAdapter.getDefaultAdapter();
        initializeNativeDataNative();
        if (!enable()) {
            errorLog("[ERR] Pbap Client enable failed");
            this.mAdapter = null;
            stopSelf();
            broadcastPbapState(14);
        }
    }

    public void onDestroy() {
        printLog("onDestroy()");
        broadcastPbapState(12);
        disable();
        cleanupNativeDataNative();
        broadcastPbapState(13);
    }

    public void onTaskRemoved(Intent rootIntent) {
        printLog("onTaskRemoved ");
        super.onTaskRemoved(rootIntent);
        stopSelf();
    }

    public boolean enable() {
        printLog("[API] enable");
        this.mListener = new PbapSocketListener();
        if (enableNative()) {
            this.mListener.mStopListen = false;
            this.mListener.start();
            return true;
        }
        errorLog("enableNative send failed");
        this.mListener = null;
        return false;
    }

    public void disable() {
        printLog("[API] disable");
        if (this.mListener != null) {
            this.mListener.mStopListen = true;
            wakeupListenerNative();
            try {
                this.mListener.join(5000);
            } catch (InterruptedException ex) {
                errorLog("mListener colose error" + ex);
            }
            disableNative();
        }
        printLog("Pbap client is not enabled yet");
    }

    boolean connectPB(String btaddr) {
        printLog("[API] connectPB(" + btaddr + ")");
        return connectNative(btaddr);
    }

    void disconnectPB() {
        printLog("[API] disconnectPB");
        disconnectNative();
    }

    boolean setPath(int type, String path) {
        printLog("[API] setPath(" + String.valueOf(type) + ", " + path + ")");
        return setPathNative(type, path);
    }

    boolean pullVcardEntry(String filename, String objectname, long filter, char format) {
        printLog("[API] pullVcardEntry(" + filename + "," + objectname + "," + String.valueOf(filter) + "," + String.valueOf(format) + ")");
        return pullVcardEntryNative(filename, objectname, filter, format);
    }

    boolean pullPhonebook(String filename, String objectname, long filter, char format, short maxListCount, short listStartOffset) {
        printLog("[API] pullPhonebook(" + filename + "," + objectname + "," + String.valueOf(filter) + "," + String.valueOf(format) + "," + String.valueOf(maxListCount) + "," + String.valueOf(listStartOffset) + ")");
        return pullPhonebookNative(filename, objectname, filter, format, maxListCount, listStartOffset);
    }

    boolean pullVcardListing(String filename, String objectname, int searchAttrib, String searchValue, char order, short maxListCount, short listStartOffset) {
        printLog("[API]pullVcardListing(" + filename + "," + objectname + "," + String.valueOf(searchAttrib) + "," + String.valueOf(searchValue) + "," + String.valueOf(order) + "," + String.valueOf(maxListCount) + "," + String.valueOf(listStartOffset) + ")");
        return pullVcardListingNative(filename, objectname, searchAttrib, searchValue, order, maxListCount, listStartOffset);
    }

    boolean abortReq() {
        printLog("[API] abortReq()");
        return abortReqNative();
    }

    boolean authChallRsp(boolean cancel, String password, String userID) {
        printLog("[API] authChallRsp(" + String.valueOf(cancel) + "," + password + "," + userID + ")");
        return authChallengeRspNative(cancel, password, userID);
    }

    private void onEnableCnf(int result) {
        if (result != 0) {
            errorLog("enableNative failed");
            if (this.mListener != null) {
                this.mListener.mStopListen = true;
                wakeupListenerNative();
                try {
                    this.mListener.join();
                } catch (InterruptedException ex) {
                    errorLog("mListener close error" + ex);
                }
            }
            this.mListener = null;
        }
        sendServiceMsg(10001, Integer.valueOf(result));
    }

    private void onConnectCnf(int cnf_code) {
        sendServiceMsg(10003, Integer.valueOf(cnf_code));
    }

    private void onDisconnectCnf(int cnf_code) {
        sendServiceMsg(PBAP_CLIENT_DISCONNECT_CNF, Integer.valueOf(cnf_code));
    }

    private void onDisconnectInd() {
        sendServiceMsg(PBAP_CLIENT_DISCONNECT_IND, null);
    }

    private void onAuthChallInd(String name, boolean isUserIdRequired, boolean isFullAccess) {
        printLog("onAuthChallInd: name=" + name + ", isUserIdRequired=" + String.valueOf(isUserIdRequired) + ", isFullAccess=" + String.valueOf(isFullAccess) + ")");
        sendServiceMsg(PBAP_AUTH_CHALL_IND, null);
    }

    private void onSetPathCnf(int cnf_code) {
        sendServiceMsg(PBAP_CLIENT_SETPATH_CNF, Integer.valueOf(cnf_code));
    }

    private void onPullVcardEntryCnf(int cnf_code) {
        sendServiceMsg(PBAP_CLIENT_PULLVCARDENTRY_CNF, Integer.valueOf(cnf_code));
    }

    private void onPullPhonebookCnf(int cnf_code, short phoneBookSize, short newMissedCalls) {
        PulldataResult result = new PulldataResult();
        result.cnf_code = cnf_code;
        result.phonebookSize = phoneBookSize;
        result.newMissedCalls = newMissedCalls;
        sendServiceMsg(PBAP_CLIENT_PULLPHONEBOOK_CNF, result);
    }

    private void onPullVcardListingCnf(int cnf_code, short phoneBookSize, short newMissedCalls) {
        PulldataResult result = new PulldataResult();
        result.cnf_code = cnf_code;
        result.phonebookSize = phoneBookSize;
        result.newMissedCalls = newMissedCalls;
        sendServiceMsg(PBAP_CLIENT_PULLVCARDLISTING_CNF, result);
    }

    private void onAbortCnf(int cnf_code) {
        sendServiceMsg(PBAP_CLIENT_ABORT_CNF, Integer.valueOf(cnf_code));
    }

    private void onAbortInd(int reason) {
    }

    private void printLog(String msg) {
        if (DEBUG) {
            Log.d(TAG, msg);
        }
    }

    private void errorLog(String msg) {
        Log.e(TAG, msg);
    }

    private void sendServiceMsg(int what, Object arg) {
        printLog("[API] sendServiceMsg(" + what + ")");
        if (this.mServiceHandler != null) {
            Message msg = this.mServiceHandler.obtainMessage(what);
            msg.what = what;
            msg.obj = arg;
            this.mServiceHandler.sendMessage(msg);
            return;
        }
        printLog("mServiceHandler is null");
    }

    private void setServerNotification(int mode) {
        printLog("setServerNotification(" + mode + ")");
        Context context = getApplicationContext();
        Intent intent = new Intent();
        if (mode == 1) {
            Notification noti = new Notification(17301632, "Bluetooth PBAP authentication request", System.currentTimeMillis());
            intent.setClassName(getPackageName(), BluetoothAuthenticating.class.getName()).setFlags(268435456);
            intent.putExtra(BluetoothAuthenticating.DEVICE_NAME, this.mRemoteDevice.getName()).putExtra(BluetoothAuthenticating.ACTION_CANCEL, PBAP_AUTHENTICATE_CANCEL_ACTION).putExtra(BluetoothAuthenticating.ACTION_RETURN, PBAP_AUTHENTICATE_RETURN_ACTION);
            String returnAction = PBAP_AUTHENTICATE_RETURN_ACTION;
            noti.setLatestEventInfo(context, "Bluetooth PBAP authentication request", "PBAP authentication request from " + this.mRemoteDevice.getName(), PendingIntent.getActivity(this, 0, intent, 0));
            noti.vibrate = new long[]{0, 100, 200, 300};
            noti.defaults |= 2;
            noti.defaults |= 1;
            noti.flags |= 32;
            this.mPid = NotificationFactory.getProfileNotificationId(12, mode);
            this.mNM.notify(this.mPid, noti);
            IntentFilter returnFilter = new IntentFilter(returnAction);
            printLog("registerReceiver");
            registerReceiver(this.mReceiver, returnFilter);
            if (30000 > null) {
                this.mServiceHandler.sendMessageDelayed(this.mServiceHandler.obtainMessage(1001), (long) 30000);
                return;
            }
            return;
        }
        errorLog("[ERR] unsupported mode");
    }

    private void cancelServerNotification() {
        this.mServiceHandler.removeMessages(1001);
        if (this.mPid > 0) {
            printLog("unregisterReceiver");
            unregisterReceiver(this.mReceiver);
            if (this.mPid == NotificationFactory.getProfileNotificationId(12, 1)) {
                printLog("Send authenticate cancel intent");
                sendBroadcast(new Intent(PBAP_AUTHENTICATE_CANCEL_ACTION));
            } else {
                errorLog("[ERR] invalid pid : " + this.mPid);
            }
            this.mNM.cancel(this.mPid);
            this.mPid = -1;
        }
    }
}
