package com.autochips.bluetooth.dundt;

import android.app.Service;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.IBluetoothDunDt;
import android.bluetooth.IBluetoothDunDt.Stub;
import android.bluetooth.IDunCallback;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.hf.BluetoothHfAtPhonebook;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;
import com.autochips.bluetooth.spp.SppService;
import com.autochips.bluetooth.spp.SppService.LocalBinder;
import com.autochips.bluetooth.util.BTDBAdapter;
import com.autochips.bluetooth.util.PbSyncATGen;
import com.autochips.bluetooth.util.PbSyncATParser;
import com.autochips.bluetooth.util.PbSyncATParser.BT_SMS_REC_PARAM_T;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class SmsSyncManagerService extends Service {
    public static final String ACTION_DOWNLOAD_FINISH = "com.autochips.bluetooth.dundt.SmsSyncManagerService.action.download_finish";
    public static final String ACTION_NOT_SUPPORT_DOWNLOAD_SMS = "com.autochips.bluetooth.dundt.SmsSyncManagerService.action.not_support_download_sms";
    public static final String ACTION_SMS_COUNT_ZERO = "com.autochips.bluetooth.dundt.SmsSyncManagerService.action.sms_count_zero";
    public static final String ACTION_STEP_DOWNLOAD = "com.autochips.bluetooth.dundt.SmsSyncManagerService.action.step_download";
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugSMS);
    private static final int DUN_RECIEVE_RESPOND_SMS = 902;
    public static final String EXTRA_SMS_COUNT = "com.autochips.bluetooth.dundt.SmsSyncManagerService.extra.sms_count";
    private static final int MSG_SMS_CREATE_CONNECT_RES = 900;
    private static final int MSG_SMS_DISCONNECT_CNF = 901;
    private static final int MSG_SMS_STOP_DOWNLOAD = 903;
    private static final int MSG_TIMEOUT_GET_FACTORY = 0;
    private static final int MSG_TIMEOUT_GET_SERIAL = 1;
    private static final int MSG_TIMEOUT_GET_SMS_COUNT = 3;
    private static final int MSG_TIMEOUT_GET_SMS_RECORD = 2;
    private static final int MSG_TIMEOUT_SET_ECHO = 4;
    private static final String TAG = "SmsSyncManagerService";
    private boolean bMMGLFlag = false;
    private boolean bSppConnectAngain = false;
    private boolean bStopDownload;
    private int cur;
    private PbSyncATGen mATGen = new PbSyncATGen();
    private PbSyncATParser mATParser = new PbSyncATParser();
    private ServiceConnection mDunConnection = new ServiceConnection() {
        public void onServiceConnected(ComponentName name, IBinder service) {
            SmsSyncManagerService.this.mDunService = Stub.asInterface(service);
            try {
                SmsSyncManagerService.this.mDunService.registerCallback(SmsSyncManagerService.this.mSMSCallback);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }

        public void onServiceDisconnected(ComponentName name) {
            SmsSyncManagerService.this.mDunService = null;
            SmsSyncManagerService.this.printLog("[SMSSync]Dun Service disconnected");
        }
    };
    private IBluetoothDunDt mDunService;
    private int mGetSmsCount = -1;
    private BluetoothHfAtPhonebook mHfAtPhonebook = null;
    private ArrayList<Integer> mIndexArray;
    private boolean mIsSmsSyncFinish;
    private boolean mIsSyncingSms = false;
    private final ISMSSyncManager.Stub mManager = new C00408();
    private long mMaxSmsIndex = 4095;
    private IDunCallback.Stub mSMSCallback = new IDunCallback.Stub() {
        public void notifyConnect(boolean result) throws RemoteException {
            if (SmsSyncManagerService.this.mIsSyncingSms) {
                SmsSyncManagerService.this.sendServiceMsg(SmsSyncManagerService.MSG_SMS_CREATE_CONNECT_RES, Boolean.valueOf(result));
            }
        }

        public void notifyDisConnect(boolean result) throws RemoteException {
            if (SmsSyncManagerService.this.mIsSyncingSms) {
                SmsSyncManagerService.this.sendServiceMsg(SmsSyncManagerService.MSG_SMS_DISCONNECT_CNF, Boolean.valueOf(result));
            }
        }

        public void notifyGetData(String resStr) throws RemoteException {
            if (SmsSyncManagerService.this.mIsSyncingSms) {
                SmsSyncManagerService.this.sendServiceMsg(SmsSyncManagerService.DUN_RECIEVE_RESPOND_SMS, resStr);
            }
        }
    };
    private Handler mServiceHandler = new C00397();
    private int mSmsCount = -1;
    private ServiceConnection mSppConnection = new C00419();
    private SppService mSppService;
    private int mStepCount = 10;
    private int mStepIndex = 0;
    private int mSyncState = 0;
    private int mTemStepIndex = 0;
    private Timer mTimer = null;
    private Handler mTimerHandler = new C00331();
    private TimerTask mTimerTask = null;
    private int mTryCommandCount = 1;
    private int mTryConnectCount = 1;
    private String m_BTAddr = null;
    private int m_CurUsingProfile = 0;
    private BTDBAdapter m_dbAdapter = null;
    private String m_manufoctor = null;
    private BluetoothDevice m_remoteDevice = null;
    private String m_serial = null;

    /* renamed from: com.autochips.bluetooth.dundt.SmsSyncManagerService$1 */
    class C00331 extends Handler {
        C00331() {
        }

        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 0:
                    SmsSyncManagerService.this.cleanTimerTask();
                    if (SmsSyncManagerService.DEBUG) {
                        Log.e(SmsSyncManagerService.TAG, "[Timeout]MSG_TIMEOUT_GET_FACTORY");
                    }
                    SmsSyncManagerService.this.CreateConnect(SmsSyncManagerService.this.m_CurUsingProfile);
                    return;
                case 1:
                    SmsSyncManagerService.this.cleanTimerTask();
                    if (SmsSyncManagerService.DEBUG) {
                        Log.e(SmsSyncManagerService.TAG, "[Timeout]MSG_TIMEOUT_GET_SERIAL");
                    }
                    SmsSyncManagerService.this.CreateConnect(SmsSyncManagerService.this.m_CurUsingProfile);
                    return;
                case 2:
                    SmsSyncManagerService.this.cleanTimerTask();
                    if (SmsSyncManagerService.DEBUG) {
                        Log.e(SmsSyncManagerService.TAG, "[Timeout]MSG_TIMEOUT_GET_SMS_RECORD");
                    }
                    if (SmsSyncManagerService.this.mGetSmsCount == 0) {
                        SmsSyncManagerService.this.RemoveConnect(SmsSyncManagerService.this.m_CurUsingProfile);
                        return;
                    } else if (SmsSyncManagerService.this.mTryCommandCount > 0) {
                        if (SmsSyncManagerService.DEBUG) {
                            Log.i(SmsSyncManagerService.TAG, "Get SMS record timeout,try once again");
                        }
                        SmsSyncManagerService.this.mTryCommandCount = SmsSyncManagerService.this.mTryCommandCount - 1;
                        SmsSyncManagerService.this.mStepIndex = SmsSyncManagerService.this.mStepIndex - 1;
                        SmsSyncManagerService.this.GetSmsRecord(SmsSyncManagerService.this.m_CurUsingProfile);
                        SmsSyncManagerService.this.mTemStepIndex = SmsSyncManagerService.this.mStepIndex - 1;
                        return;
                    } else {
                        if (SmsSyncManagerService.DEBUG) {
                            Log.i(SmsSyncManagerService.TAG, "Still not response,continue next index");
                        }
                        SmsSyncManagerService.this.GetSmsRecord(SmsSyncManagerService.this.m_CurUsingProfile);
                        SmsSyncManagerService.this.mTryCommandCount = 1;
                        SmsSyncManagerService.this.mTemStepIndex = SmsSyncManagerService.this.mStepIndex - 1;
                        return;
                    }
                case 3:
                    SmsSyncManagerService.this.cleanTimerTask();
                    if (SmsSyncManagerService.DEBUG) {
                        Log.e(SmsSyncManagerService.TAG, "[Timeout]MSG_TIMEOUT_GET_SMS_COUNT");
                    }
                    SmsSyncManagerService.this.RemoveConnect(SmsSyncManagerService.this.m_CurUsingProfile);
                    return;
                case 4:
                    SmsSyncManagerService.this.cleanTimerTask();
                    if (SmsSyncManagerService.DEBUG) {
                        Log.e(SmsSyncManagerService.TAG, "[Timeout]MSG_TIMEOUT_SET_ECHO");
                    }
                    if (SmsSyncManagerService.this.mTryConnectCount > 0) {
                        SmsSyncManagerService.this.mTryConnectCount = SmsSyncManagerService.this.mTryConnectCount - 1;
                        SmsSyncManagerService.this.bSppConnectAngain = true;
                    }
                    SmsSyncManagerService.this.RemoveConnect(SmsSyncManagerService.this.m_CurUsingProfile);
                    return;
                default:
                    return;
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.dundt.SmsSyncManagerService$2 */
    class C00342 extends TimerTask {
        C00342() {
        }

        public void run() {
            Message message = new Message();
            message.what = 2;
            SmsSyncManagerService.this.mTimerHandler.sendMessage(message);
        }
    }

    /* renamed from: com.autochips.bluetooth.dundt.SmsSyncManagerService$3 */
    class C00353 extends TimerTask {
        C00353() {
        }

        public void run() {
            Message message = new Message();
            message.what = 3;
            SmsSyncManagerService.this.mTimerHandler.sendMessage(message);
        }
    }

    /* renamed from: com.autochips.bluetooth.dundt.SmsSyncManagerService$4 */
    class C00364 extends TimerTask {
        C00364() {
        }

        public void run() {
            Message message = new Message();
            message.what = 0;
            SmsSyncManagerService.this.mTimerHandler.sendMessage(message);
        }
    }

    /* renamed from: com.autochips.bluetooth.dundt.SmsSyncManagerService$5 */
    class C00375 extends TimerTask {
        C00375() {
        }

        public void run() {
            Message message = new Message();
            message.what = 1;
            SmsSyncManagerService.this.mTimerHandler.sendMessage(message);
        }
    }

    /* renamed from: com.autochips.bluetooth.dundt.SmsSyncManagerService$6 */
    class C00386 extends TimerTask {
        C00386() {
        }

        public void run() {
            Message message = new Message();
            message.what = 4;
            SmsSyncManagerService.this.mTimerHandler.sendMessage(message);
        }
    }

    /* renamed from: com.autochips.bluetooth.dundt.SmsSyncManagerService$7 */
    class C00397 extends Handler {
        C00397() {
        }

        public void handleMessage(Message msg) {
            SmsSyncManagerService.this.printLog("[MSG] handleMessage (" + msg.what + ")");
            String sRespond;
            switch (msg.what) {
                case SmsSyncManagerService.MSG_SMS_CREATE_CONNECT_RES /*900*/:
                    if (SmsSyncManagerService.this.bStopDownload) {
                        SmsSyncManagerService.this.GetSmsRecord(SmsSyncManagerService.this.m_CurUsingProfile);
                        return;
                    } else if (Boolean.parseBoolean(msg.obj.toString())) {
                        if (SmsSyncManagerService.this.m_CurUsingProfile != 1) {
                            SmsSyncManagerService.this.SendTimerTask(4);
                        }
                        SmsSyncManagerService.this.SetEcho(SmsSyncManagerService.this.m_CurUsingProfile, false);
                        return;
                    } else {
                        SmsSyncManagerService.this.errorLog("connect " + SmsSyncManagerService.this.m_CurUsingProfile + " failed");
                        SmsSyncManagerService.this.RemoveConnect(SmsSyncManagerService.this.m_CurUsingProfile);
                        return;
                    }
                case SmsSyncManagerService.MSG_SMS_DISCONNECT_CNF /*901*/:
                    if (SmsSyncManagerService.this.m_CurUsingProfile == 2) {
                        try {
                            Thread.sleep(500);
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                    if (SmsSyncManagerService.this.bStopDownload) {
                        SmsSyncManagerService.this.mSyncState = 0;
                        if (SmsSyncManagerService.DEBUG) {
                            Log.d(SmsSyncManagerService.TAG, "pause or download finish,no-need to switch with another profile");
                            return;
                        }
                        return;
                    }
                    if (!Boolean.parseBoolean(msg.obj.toString()) && SmsSyncManagerService.DEBUG) {
                        Log.e(SmsSyncManagerService.TAG, "disconnect profile " + SmsSyncManagerService.this.m_CurUsingProfile + " error");
                    }
                    if (SmsSyncManagerService.this.bSppConnectAngain) {
                        if (SmsSyncManagerService.DEBUG) {
                            Log.i(SmsSyncManagerService.TAG, "Echo not response,try again");
                        }
                        SmsSyncManagerService.this.bSppConnectAngain = false;
                        SmsSyncManagerService.this.CreateConnect(SmsSyncManagerService.this.m_CurUsingProfile);
                        return;
                    }
                    SmsSyncManagerService.this.m_CurUsingProfile = SmsSyncManagerService.this.m_CurUsingProfile + 1;
                    if (SmsSyncManagerService.this.m_CurUsingProfile > 3) {
                        SmsSyncManagerService.this.mIsSmsSyncFinish = true;
                        SmsSyncManagerService.this.mSyncState = 0;
                        Intent supportIntent = new Intent();
                        supportIntent.setAction(SmsSyncManagerService.ACTION_NOT_SUPPORT_DOWNLOAD_SMS);
                        SmsSyncManagerService.this.sendBroadcast(supportIntent);
                        return;
                    }
                    SmsSyncManagerService.this.mStepIndex = 1;
                    SmsSyncManagerService.this.mGetSmsCount = 0;
                    SmsSyncManagerService.this.mSmsCount = 0;
                    SmsSyncManagerService.this.CreateConnect(SmsSyncManagerService.this.m_CurUsingProfile);
                    return;
                case SmsSyncManagerService.DUN_RECIEVE_RESPOND_SMS /*902*/:
                    sRespond = msg.obj.toString();
                    SmsSyncManagerService.this.printLog("[DUN] DUN receive respond: " + sRespond);
                    SmsSyncManagerService.this.cleanTimerTask();
                    if (SmsSyncManagerService.this.mSmsCount > 0) {
                        SmsSyncManagerService.this.GetSmsRecord(SmsSyncManagerService.this.m_CurUsingProfile);
                        SmsSyncManagerService.this.mTemStepIndex = SmsSyncManagerService.this.mStepIndex - 1;
                    } else {
                        SmsSyncManagerService.this.mTemStepIndex = SmsSyncManagerService.this.mStepIndex;
                    }
                    SmsSyncManagerService.this.printLog("before ParseRespond");
                    SmsSyncManagerService.this.mATParser.setCurIndex(SmsSyncManagerService.this.mTemStepIndex);
                    SmsSyncManagerService.this.mATParser.setRespondString(sRespond);
                    SmsSyncManagerService.this.ParseRespond();
                    return;
                case SmsSyncManagerService.MSG_SMS_STOP_DOWNLOAD /*903*/:
                    SmsSyncManagerService.this.printLog("pause download,index is: " + SmsSyncManagerService.this.mStepIndex);
                    SmsSyncManagerService.this.RemoveConnect(SmsSyncManagerService.this.m_CurUsingProfile);
                    return;
                case SppService.SPP_STATE_CHANGE_SMS /*10002*/:
                    SmsSyncManagerService.this.printLog("MESSAGE_STATE_CHANGE: " + msg.arg1);
                    switch (msg.arg1) {
                        case 0:
                            SmsSyncManagerService.this.mIsSyncingSms = false;
                            SmsSyncManagerService.this.mSppService.setSyncObject(SmsSyncManagerService.this.mIsSyncingSms);
                            SmsSyncManagerService.this.sendServiceMsg(SmsSyncManagerService.MSG_SMS_DISCONNECT_CNF, Boolean.valueOf(true));
                            SmsSyncManagerService.this.printLog("[SPP] SPP state none");
                            return;
                        case 1:
                            SmsSyncManagerService.this.printLog("[SPP] SPP connecting");
                            return;
                        case 2:
                            SmsSyncManagerService.this.printLog("[SPP] SPP connected");
                            SmsSyncManagerService.this.sendServiceMsg(SmsSyncManagerService.MSG_SMS_CREATE_CONNECT_RES, Boolean.valueOf(true));
                            return;
                        case 3:
                            SmsSyncManagerService.this.printLog("[SPP] SPP connect failed");
                            SmsSyncManagerService.this.sendServiceMsg(SmsSyncManagerService.MSG_SMS_CREATE_CONNECT_RES, Boolean.valueOf(false));
                            return;
                        case 4:
                            SmsSyncManagerService.this.printLog("[SPP] SPP disconnected");
                            return;
                        default:
                            return;
                    }
                case 10003:
                    sRespond = msg.getData().getString("AT_Respond");
                    SmsSyncManagerService.this.printLog("[SPP] SPP recieve respond:" + sRespond);
                    SmsSyncManagerService.this.cleanTimerTask();
                    if (SmsSyncManagerService.this.mSmsCount > 0) {
                        SmsSyncManagerService.this.GetSmsRecord(SmsSyncManagerService.this.m_CurUsingProfile);
                        SmsSyncManagerService.this.mTemStepIndex = SmsSyncManagerService.this.mStepIndex - 1;
                    } else {
                        SmsSyncManagerService.this.mTemStepIndex = SmsSyncManagerService.this.mStepIndex;
                    }
                    SmsSyncManagerService.this.mATParser.setCurIndex(SmsSyncManagerService.this.mTemStepIndex - 1);
                    SmsSyncManagerService.this.mATParser.setRespondString(sRespond);
                    SmsSyncManagerService.this.ParseRespond();
                    return;
                case BluetoothHfAtPhonebook.HFP_RECIEVE_RESPOND_SMS /*11001*/:
                    sRespond = msg.getData().getString("AT_Respond");
                    SmsSyncManagerService.this.printLog("[HFP] HFP receive respond:" + sRespond);
                    SmsSyncManagerService.this.cleanTimerTask();
                    if (SmsSyncManagerService.this.m_CurUsingProfile == 1) {
                        if (SmsSyncManagerService.this.mSmsCount <= 0 || !SmsSyncManagerService.this.bMMGLFlag) {
                            SmsSyncManagerService.this.mTemStepIndex = SmsSyncManagerService.this.mStepIndex;
                        } else {
                            SmsSyncManagerService.this.GetSmsRecord(SmsSyncManagerService.this.m_CurUsingProfile);
                            SmsSyncManagerService.this.mTemStepIndex = SmsSyncManagerService.this.mStepIndex - 1;
                        }
                        SmsSyncManagerService.this.printLog("before ParseRespond");
                        SmsSyncManagerService.this.mATParser.setCurIndex(SmsSyncManagerService.this.mTemStepIndex);
                        SmsSyncManagerService.this.mATParser.setRespondString(sRespond);
                        SmsSyncManagerService.this.ParseRespond();
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.dundt.SmsSyncManagerService$8 */
    class C00408 extends ISMSSyncManager.Stub {
        C00408() {
        }

        public boolean StartDownload(int pause, boolean bContinue) throws RemoteException {
            SmsSyncManagerService.this.mSyncState = 1;
            if (pause == 0 && !bContinue) {
                SmsSyncManagerService.this.m_CurUsingProfile = 1;
                SmsSyncManagerService.this.m_dbAdapter.deleteOneSms(4);
                SmsSyncManagerService.this.cur = 0;
                SmsSyncManagerService.this.mGetSmsCount = 0;
                SmsSyncManagerService.this.mSmsCount = 0;
                SmsSyncManagerService.this.mStepIndex = 1;
                SmsSyncManagerService.this.mTemStepIndex = SmsSyncManagerService.this.mStepIndex;
                SmsSyncManagerService.this.mIsSmsSyncFinish = false;
                SmsSyncManagerService.this.bStopDownload = false;
                SmsSyncManagerService.this.mIsSyncingSms = true;
                SmsSyncManagerService.this.mTryConnectCount = 1;
                SmsSyncManagerService.this.mTryCommandCount = 1;
                SmsSyncManagerService.this.mIndexArray = new ArrayList();
                SmsSyncManagerService.this.mHfAtPhonebook.setSyncObject(SmsSyncManagerService.this.mIsSyncingSms);
                SmsSyncManagerService.this.SendTimerTask(0);
                SmsSyncManagerService.this.GetFactory(SmsSyncManagerService.this.m_CurUsingProfile);
            } else if (pause == 0 && bContinue) {
                SmsSyncManagerService.this.bStopDownload = false;
                if (SmsSyncManagerService.this.mIsSmsSyncFinish) {
                    SmsSyncManagerService.this.printLog("re-sync to startload");
                    SmsSyncManagerService.this.mIsSmsSyncFinish = false;
                    SmsSyncManagerService.this.mGetSmsCount = 0;
                    SmsSyncManagerService.this.mSmsCount = 0;
                    SmsSyncManagerService.this.cur = 0;
                    SmsSyncManagerService.this.mStepIndex = 1;
                    SmsSyncManagerService.this.mTemStepIndex = SmsSyncManagerService.this.mStepIndex;
                    SmsSyncManagerService.this.m_dbAdapter.deleteOneSms(4);
                    SmsSyncManagerService.this.CreateConnect(SmsSyncManagerService.this.m_CurUsingProfile);
                } else {
                    SmsSyncManagerService.this.mStepIndex = SmsSyncManagerService.this.mTemStepIndex;
                    SmsSyncManagerService.this.CreateConnect(SmsSyncManagerService.this.m_CurUsingProfile);
                }
            } else if (pause == 1 && bContinue) {
                if (SmsSyncManagerService.this.mIsSmsSyncFinish) {
                    SmsSyncManagerService.this.printLog("No need to sync,download finish");
                } else {
                    SmsSyncManagerService.this.bStopDownload = false;
                    SmsSyncManagerService.this.mStepIndex = SmsSyncManagerService.this.mTemStepIndex;
                    SmsSyncManagerService.this.CreateConnect(SmsSyncManagerService.this.m_CurUsingProfile);
                }
            }
            return true;
        }

        public boolean SetRemoteDevice(BluetoothDevice remoteDevice) throws RemoteException {
            if (SmsSyncManagerService.this.mHfAtPhonebook == null) {
                SmsSyncManagerService.this.mHfAtPhonebook = BluetoothHfAtPhonebook.getInstance();
                SmsSyncManagerService.this.mHfAtPhonebook.initializeHfAtPhonebookParser();
                SmsSyncManagerService.this.mHfAtPhonebook.setSmsHandler(SmsSyncManagerService.this.mServiceHandler);
            }
            SmsSyncManagerService.this.m_remoteDevice = remoteDevice;
            SmsSyncManagerService.this.m_BTAddr = SmsSyncManagerService.this.m_remoteDevice.getAddress();
            return true;
        }

        public boolean SetRemoteDevInfo(String factory, String serial, String imei) throws RemoteException {
            return false;
        }

        public int GetSyncState() {
            return SmsSyncManagerService.this.mSyncState;
        }

        public int GetRecCnt(int path) throws RemoteException {
            return SmsSyncManagerService.this.ServiceGetRecCnt(path);
        }

        public boolean GetRecord(int path, int iFirstIdx, int iRecCnt, List<SMSRecord> record) {
            return SmsSyncManagerService.this.ServiceGetRecord(path, iFirstIdx, iRecCnt, record);
        }

        public boolean StopDownload() throws RemoteException {
            if (SmsSyncManagerService.this.mSyncState != 0) {
                SmsSyncManagerService.this.bStopDownload = true;
                SmsSyncManagerService.this.mSyncState = 2;
                SmsSyncManagerService.this.sendServiceMsg(SmsSyncManagerService.MSG_SMS_STOP_DOWNLOAD, Boolean.valueOf(true));
            }
            return true;
        }
    }

    /* renamed from: com.autochips.bluetooth.dundt.SmsSyncManagerService$9 */
    class C00419 implements ServiceConnection {
        C00419() {
        }

        public void onServiceConnected(ComponentName name, IBinder service) {
            SmsSyncManagerService.this.mSppService = ((LocalBinder) service).getSppService();
            if (SmsSyncManagerService.this.mSppService != null) {
                SmsSyncManagerService.this.printLog("[SMSSync]SPP Service connected");
                SmsSyncManagerService.this.mSppService.setSppHandler(SmsSyncManagerService.this.mServiceHandler);
                return;
            }
            SmsSyncManagerService.this.printLog("[SMSSync]SPP Service connect failed");
        }

        public void onServiceDisconnected(ComponentName name) {
            SmsSyncManagerService.this.mSppService = null;
            SmsSyncManagerService.this.printLog("[SMSSync]SPP Service disconnected");
        }
    }

    private void SendTimerTask(int timer_type) {
        if (DEBUG) {
            Log.i(TAG, "[SMS]SendTimerTask = " + timer_type);
        }
        if (this.mTimer == null) {
            this.mTimer = new Timer();
        }
        if (2 == timer_type) {
            this.mTimerTask = new C00342();
            this.mTimer.schedule(this.mTimerTask, 10000);
        } else if (3 == timer_type) {
            this.mTimerTask = new C00353();
            this.mTimer.schedule(this.mTimerTask, 30000);
        } else if (timer_type == 0) {
            this.mTimerTask = new C00364();
            this.mTimer.schedule(this.mTimerTask, 5000);
        } else if (1 == timer_type) {
            this.mTimerTask = new C00375();
            this.mTimer.schedule(this.mTimerTask, 5000);
        } else if (4 == timer_type) {
            this.mTimerTask = new C00386();
            this.mTimer.schedule(this.mTimerTask, 5000);
        }
    }

    private void cleanTimerTask() {
        if (DEBUG) {
            Log.i(TAG, "cleanTimerTask");
        }
        if (this.mTimerTask != null) {
            this.mTimerTask.cancel();
            this.mTimerTask = null;
        }
        if (this.mTimer != null) {
            this.mTimer.cancel();
            this.mTimer.purge();
            this.mTimer = null;
        }
    }

    private int ServiceGetRecCnt(int type) {
        return this.m_dbAdapter.getSmsNo(type);
    }

    private boolean ServiceGetRecord(int type, int iFirstIdx, int iRecCnt, List<SMSRecord> record) {
        List<SMSRecord> tmpRecords = new ArrayList();
        tmpRecords = this.m_dbAdapter.getSmsRecords(type, iFirstIdx, iRecCnt);
        printLog("iRecCnt is:" + iRecCnt + ", list record size is:" + tmpRecords.size());
        for (int i = 0; i < iRecCnt; i++) {
            record.add(tmpRecords.get(i));
        }
        if (iRecCnt == record.size()) {
            return true;
        }
        return false;
    }

    public void onCreate() {
        printLog("onCreate");
        super.onCreate();
        this.m_dbAdapter = BTDBAdapter.getInstance();
        this.m_dbAdapter.setContext(getApplicationContext());
        this.m_dbAdapter.open();
        if (!bindService(new Intent(this, SppService.class), this.mSppConnection, 1)) {
            errorLog("Failed to bind SPP service");
        }
        if (!bindService(new Intent(IBluetoothDunDt.class.getName()), this.mDunConnection, 0)) {
            errorLog("Failed to bind IBluetoothDunDt service");
        }
    }

    public void onDestroy() {
        printLog("onDestroy");
        this.m_dbAdapter.close();
        this.mServiceHandler = null;
        if (this.mDunService != null) {
            try {
                this.mDunService.unregisterCallback(this.mSMSCallback);
            } catch (RemoteException e) {
                Log.e(TAG, BluetoothPbapClientPath.PBAP_ROOT_NAME + e);
            }
        }
        unbindService(this.mSppConnection);
        unbindService(this.mDunConnection);
        super.onDestroy();
    }

    private void CreateConnect(int profile) {
        this.mATGen.SetCurProfile(profile);
        if (!this.bStopDownload) {
            this.mIsSyncingSms = true;
            if (1 == profile) {
                if (this.mHfAtPhonebook.isHfConnected()) {
                    errorLog("Connect to HF profile");
                    this.mHfAtPhonebook.setSyncObject(this.mIsSyncingSms);
                    sendServiceMsg(MSG_SMS_CREATE_CONNECT_RES, Boolean.valueOf(true));
                    return;
                }
                errorLog("[HFP] HF profile is not connected");
                sendServiceMsg(MSG_SMS_CREATE_CONNECT_RES, Boolean.valueOf(false));
            } else if (2 == profile) {
                this.mSppService.setSyncObject(this.mIsSyncingSms);
                printLog("Connect to SPP profile");
                try {
                    Thread.sleep(500);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                this.mSppService.connect(this.m_BTAddr, true);
            } else if (3 == profile) {
                try {
                    if (this.mDunService != null) {
                        this.mDunService.connect(this.m_remoteDevice);
                    } else {
                        printLog("please enable DUN first");
                    }
                } catch (RemoteException e2) {
                    e2.printStackTrace();
                }
            } else {
                Intent supportIntent = new Intent();
                supportIntent.setAction(ACTION_NOT_SUPPORT_DOWNLOAD_SMS);
                sendBroadcast(supportIntent);
            }
        }
    }

    private void SetEcho(int profile, boolean bEcho) {
        printLog("[ATCMD]SetEcho(" + profile + " , " + bEcho + ")");
        if (!this.bStopDownload) {
            String sAT;
            if (2 == profile) {
                printLog("Set Echo to SPP profile");
                sAT = this.mATGen.GetATSetEcho(false);
                printLog("AT CMD is:" + sAT);
                this.mATParser.setCurATCmd(2);
                printLog("Set Cur AT Cmd is" + sAT);
                this.mSppService.write(sAT.getBytes());
            } else if (1 == profile) {
                printLog("[SetEcho] HF");
                SendTimerTask(3);
                GetMemoryStorage(this.m_CurUsingProfile);
            } else if (3 == profile) {
                printLog("Set Echo to DUN profile");
                sAT = this.mATGen.GetATSetEcho(false);
                printLog("AT CMD is:" + sAT);
                this.mATParser.setCurATCmd(2);
                printLog("Set Cur AT Cmd is" + sAT);
                try {
                    this.mDunService.write(sAT.getBytes());
                } catch (RemoteException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void GetFactory(int profile) {
        printLog("[ATCMD]GetFactory(" + profile + ")");
        if (!this.bStopDownload) {
            this.mATGen.SetCurProfile(profile);
            if (1 == profile) {
                String sAT = this.mATGen.GetATGetManufactor();
                this.mATParser.setCurATCmd(4);
                this.mHfAtPhonebook.ResetPbAtResponse();
                if (1 == this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 20)) {
                    Message msg = this.mServiceHandler.obtainMessage(BluetoothHfAtPhonebook.HFP_RECIEVE_RESPOND_SMS);
                    Bundle bundle = new Bundle();
                    bundle.putString("AT_Respond", this.mHfAtPhonebook.ReadPbAtResponse());
                    msg.setData(bundle);
                    this.mHfAtPhonebook.ResetPbAtResponse();
                    this.mServiceHandler.sendMessage(msg);
                    return;
                }
                cleanTimerTask();
                errorLog("[AT+CGMI] get factory cmd fail");
                GetSerial(this.m_CurUsingProfile);
            }
        }
    }

    private void GetSerial(int profile) {
        printLog("[ATCMD]GetSerial(" + profile + ")");
        if (!this.bStopDownload) {
            this.mATGen.SetCurProfile(profile);
            if (1 == profile) {
                String sAT = this.mATGen.GetATGetSerial();
                this.mATParser.setCurATCmd(5);
                this.mHfAtPhonebook.ResetPbAtResponse();
                if (1 == this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 20)) {
                    Message msg = this.mServiceHandler.obtainMessage(BluetoothHfAtPhonebook.HFP_RECIEVE_RESPOND_SMS);
                    Bundle bundle = new Bundle();
                    bundle.putString("AT_Respond", this.mHfAtPhonebook.ReadPbAtResponse());
                    msg.setData(bundle);
                    this.mHfAtPhonebook.ResetPbAtResponse();
                    this.mServiceHandler.sendMessage(msg);
                    return;
                }
                cleanTimerTask();
                errorLog("[AT+CGMM] get serial cmd fail");
                CreateConnect(this.m_CurUsingProfile);
            }
        }
    }

    private void GetMemoryStorage(int profile) {
        printLog("[ATCMD]GetMemoryStorage with: " + profile);
        if (!this.bStopDownload) {
            String sAT;
            if (2 == profile) {
                printLog("GetMemoryStorage with SPP profile");
                sAT = this.mATGen.GetATGetSMSCurPos();
                printLog("AT CMD is:" + sAT);
                this.mATParser.setCurATCmd(30);
                printLog("Set Cur AT Cmd is" + sAT);
                this.mSppService.write(sAT.getBytes());
            } else if (1 == profile) {
                if (this.m_manufoctor == null || (this.m_manufoctor.indexOf("MTK") < 0 && this.m_manufoctor.indexOf("SAMSUNG") < 0)) {
                    sAT = this.mATGen.GetATGetSMSCurPos();
                    this.mATParser.setCurATCmd(30);
                    int result = this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 30);
                    if (result == 0) {
                        Log.e(TAG, "[AT+CPMS] get momory storage cmd fail");
                        RemoveConnect(this.m_CurUsingProfile);
                        return;
                    } else if (result == 2) {
                        errorLog("[AT+CPMS] no respond,wait......");
                        return;
                    } else {
                        return;
                    }
                }
                RemoveConnect(this.m_CurUsingProfile);
            } else if (3 == profile) {
                printLog("GetMemoryStorage with DUN profile");
                sAT = this.mATGen.GetATGetSMSCurPos();
                printLog("AT CMD is:" + sAT);
                this.mATParser.setCurATCmd(30);
                printLog("Set Cur AT Cmd is" + sAT);
                try {
                    this.mDunService.write(sAT.getBytes());
                } catch (RemoteException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void GetSmsRecord(int profile) {
        printLog("to get sms record");
        if (!this.bStopDownload) {
            if (((long) this.mStepIndex) >= this.mMaxSmsIndex || this.mGetSmsCount >= this.mSmsCount) {
                printLog("download finish");
                if (this.mGetSmsCount > 0) {
                    this.mIsSmsSyncFinish = true;
                    Intent finishIntent = new Intent();
                    finishIntent.setAction(ACTION_DOWNLOAD_FINISH);
                    sendBroadcast(finishIntent);
                    this.bStopDownload = true;
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
                return;
            }
            printLog("mGetSmsCount is: " + this.mGetSmsCount + ",mSmsCount is: " + this.mSmsCount);
            SendTimerTask(2);
            int i = this.mStepIndex;
            this.mStepIndex = i + 1;
            GetSms(profile, i);
        }
    }

    private boolean GetSmsList(int profile, int type) {
        printLog("[ATCMD]GetSMSList(" + profile + ", " + type + ")");
        String sAT;
        if (2 == profile) {
            sAT = this.mATGen.GetATGetSMSRecByType(type);
            this.mATParser.setCurATCmd(34);
            this.mATParser.setRespondString(BluetoothPbapClientPath.PBAP_ROOT_NAME);
            this.mSppService.write(sAT.getBytes());
            return true;
        } else if (1 == profile) {
            sAT = this.mATGen.GetATGetSMSRecByType(type);
            this.mATParser.setCurATCmd(34);
            int result = this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 5);
            if (result == 1) {
                printLog("sendPbAtCommandWithResult: " + sAT + " OK");
                return true;
            } else if (3 == result) {
                errorLog("[ATCMD] hf send command get sms record  fail");
                RemoveConnect(this.m_CurUsingProfile);
                return true;
            } else {
                errorLog("[ATCMD] hf get sms list fail");
                RemoveConnect(this.m_CurUsingProfile);
                return true;
            }
        } else if (3 != profile) {
            return false;
        } else {
            sAT = this.mATGen.GetATGetSMSRecByType(type);
            this.mATParser.setCurATCmd(34);
            this.mATParser.setRespondString(BluetoothPbapClientPath.PBAP_ROOT_NAME);
            printLog("Set Cur AT Cmd is" + sAT);
            try {
                this.mDunService.write(sAT.getBytes());
                return true;
            } catch (RemoteException e) {
                e.printStackTrace();
                return true;
            }
        }
    }

    private boolean GetSmsListByMMGL(int profile, int type) {
        printLog("[ATCMD]GetSMSList(" + profile + ", " + type + ")");
        if (this.bStopDownload) {
            return false;
        }
        String sAT;
        if (2 == profile) {
            sAT = this.mATGen.GetATSetSMSRecLstByMMGL(type);
            this.mATParser.setCurATCmd(33);
            this.mATParser.setRespondString(BluetoothPbapClientPath.PBAP_ROOT_NAME);
            this.mSppService.write(sAT.getBytes());
            return true;
        } else if (1 == profile) {
            sAT = this.mATGen.GetATSetSMSRecLstByMMGL(type);
            this.mATParser.setCurATCmd(33);
            int result = this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 40);
            if (result == 1) {
                printLog("sendPbAtCommandWithResult: " + sAT + " OK");
            } else if (3 == result) {
                errorLog("[AT+MMGL] hf send command get sms record  fail");
                RemoveConnect(this.m_CurUsingProfile);
            } else if (result == 0) {
                RemoveConnect(this.m_CurUsingProfile);
            } else {
                errorLog("[ATCMD] hf get index list no respond,wait.....");
            }
            return true;
        } else if (3 != profile) {
            return false;
        } else {
            sAT = this.mATGen.GetATSetSMSRecLstByMMGL(type);
            this.mATParser.setCurATCmd(33);
            this.mATParser.setRespondString(BluetoothPbapClientPath.PBAP_ROOT_NAME);
            printLog("Set Cur AT Cmd is" + sAT);
            try {
                this.mDunService.write(sAT.getBytes());
            } catch (RemoteException e) {
                e.printStackTrace();
            }
            return true;
        }
    }

    private boolean GetSms(int profile, int index) {
        printLog("[ATCMD]GetSMS(" + profile + ", " + index + ")");
        if (this.bStopDownload) {
            return false;
        }
        if (this.m_manufoctor != null && ((this.m_manufoctor.indexOf("Motorola") >= 0 || this.m_manufoctor.indexOf("motorola") >= 0 || this.m_manufoctor.indexOf("MOTOROLA") >= 0) && this.cur < this.mIndexArray.size())) {
            index = ((Integer) this.mIndexArray.get(this.cur)).intValue();
            this.mStepIndex = index + 1;
            printLog("index is: " + index + "Array is: " + this.mIndexArray.get(this.cur));
            this.cur++;
        }
        String sAT;
        if (2 == profile) {
            sAT = this.mATGen.GetATGetSMSRec(index);
            this.mATParser.setCurATCmd(36);
            this.mATParser.setRespondString(BluetoothPbapClientPath.PBAP_ROOT_NAME);
            this.mSppService.write(sAT.getBytes());
            return true;
        } else if (1 == profile) {
            sAT = this.mATGen.GetATGetSMSRec(index);
            this.mATParser.setCurATCmd(36);
            if (this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 2) == 0) {
                cleanTimerTask();
                GetSmsRecord(this.m_CurUsingProfile);
                this.mTemStepIndex = this.mStepIndex - 1;
            }
            return true;
        } else if (3 != profile) {
            return false;
        } else {
            sAT = this.mATGen.GetATGetSMSRec(index);
            this.mATParser.setCurATCmd(36);
            this.mATParser.setRespondString(BluetoothPbapClientPath.PBAP_ROOT_NAME);
            printLog("Set Cur AT Cmd is" + sAT);
            try {
                this.mDunService.write(sAT.getBytes());
            } catch (RemoteException e) {
                e.printStackTrace();
            }
            return true;
        }
    }

    private void RemoveConnect(int profile) {
        printLog("[ATCMD]RemoveConnect(" + profile + ")");
        if (1 == profile) {
            printLog("disconnect HF!");
            this.mIsSyncingSms = false;
            this.mHfAtPhonebook.setSyncObject(this.mIsSyncingSms);
            sendServiceMsg(MSG_SMS_DISCONNECT_CNF, Boolean.valueOf(true));
        } else if (2 == profile) {
            this.mSppService.disconnect();
        } else if (3 == profile) {
            try {
                if (this.mDunService != null) {
                    this.mDunService.disconnect();
                } else {
                    printLog("please enable DUN first");
                }
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    public IBinder onBind(Intent intent) {
        if (DEBUG) {
            Log.i(TAG, "[SMSSync]Enter onBind()");
        }
        if (ISMSSyncManager.class.getName().equals(intent.getAction())) {
            return this.mManager;
        }
        return null;
    }

    private void ParseRespond() {
        printLog("+ParseRespond");
        Intent finishIntent;
        SMSRecord tmpSmsRec;
        switch (this.mATParser.getCurATCmd()) {
            case 2:
                if (this.mATParser.parseATE0()) {
                    SendTimerTask(3);
                    GetMemoryStorage(this.m_CurUsingProfile);
                    return;
                }
                errorLog("Echo parer fail");
                RemoveConnect(this.m_CurUsingProfile);
                return;
            case 4:
                this.bMMGLFlag = false;
                this.m_manufoctor = this.mATParser.parseCGMI();
                if (DEBUG) {
                    Log.i(TAG, "m_manufoctor = " + this.m_manufoctor);
                }
                GetSerial(this.m_CurUsingProfile);
                return;
            case 5:
                this.m_serial = this.mATParser.parseCGMM();
                if (DEBUG) {
                    Log.i(TAG, "m_serial = " + this.m_serial);
                }
                if (this.m_serial.indexOf("MB526") >= 0) {
                    Intent supportIntent = new Intent();
                    supportIntent.setAction(ACTION_NOT_SUPPORT_DOWNLOAD_SMS);
                    sendBroadcast(supportIntent);
                    return;
                }
                if (this.m_serial.equals("V8")) {
                    this.m_manufoctor = "MOTOROLA";
                }
                CreateConnect(this.m_CurUsingProfile);
                return;
            case 30:
                if (this.mATParser.parseCPMS()) {
                    this.mSmsCount = this.mATParser.getSmsCount();
                    if (this.mSmsCount > 0) {
                        if (this.m_manufoctor == null || (this.m_manufoctor.indexOf("Motorola") < 0 && this.m_manufoctor.indexOf("motorola") < 0 && this.m_manufoctor.indexOf("MOTOROLA") < 0)) {
                            this.bMMGLFlag = true;
                            if (this.mSmsCount > 50) {
                                this.mMaxSmsIndex = (long) (this.mSmsCount * 4);
                            } else {
                                this.mMaxSmsIndex = 200;
                            }
                            GetSmsRecord(this.m_CurUsingProfile);
                            return;
                        }
                        this.bMMGLFlag = false;
                        this.mMaxSmsIndex = 50000;
                        printLog("It is Motorola series phone,first execute AT+MMGL command");
                        GetSmsListByMMGL(this.m_CurUsingProfile, 5);
                        return;
                    } else if (this.mSmsCount == 0) {
                        this.mIsSmsSyncFinish = true;
                        finishIntent = new Intent();
                        finishIntent.setAction(ACTION_SMS_COUNT_ZERO);
                        sendBroadcast(finishIntent);
                        this.bStopDownload = true;
                        RemoveConnect(this.m_CurUsingProfile);
                        return;
                    } else {
                        return;
                    }
                }
                errorLog("parse CPMS error,break;");
                RemoveConnect(this.m_CurUsingProfile);
                return;
            case 33:
                printLog("++ParseMMGL");
                if (this.mATParser.ParseMMGL()) {
                    this.mIndexArray = this.mATParser.getSmsIndexList();
                    if (this.mIndexArray.size() > 0) {
                        this.bMMGLFlag = true;
                        GetSmsRecord(this.m_CurUsingProfile);
                        return;
                    }
                    return;
                }
                errorLog("parse MMGL error,break;");
                RemoveConnect(this.m_CurUsingProfile);
                return;
            case 34:
                if (this.mATParser.ParseCMGL()) {
                    List<BT_SMS_REC_PARAM_T> tmpRecs = this.mATParser.getSmsRecsList();
                    tmpSmsRec = new SMSRecord();
                    printLog("SMS Record count is:" + tmpRecs.size());
                    for (int i = 0; i < tmpRecs.size(); i++) {
                        tmpSmsRec.setIndex(((BT_SMS_REC_PARAM_T) tmpRecs.get(i)).iIndex);
                        tmpSmsRec.setType(Integer.parseInt(((BT_SMS_REC_PARAM_T) tmpRecs.get(i)).sType));
                        tmpSmsRec.setPhoneNum(((BT_SMS_REC_PARAM_T) tmpRecs.get(i)).sTelNum);
                        tmpSmsRec.setTime(this.mATParser.getFormatDate(((BT_SMS_REC_PARAM_T) tmpRecs.get(i)).lTimeMillis));
                        tmpSmsRec.setBody(((BT_SMS_REC_PARAM_T) tmpRecs.get(i)).sContent);
                        printLog(tmpSmsRec.toString());
                        if (this.m_dbAdapter.insertOneSmsRecord(tmpSmsRec) < 0) {
                            errorLog("Record duplicate");
                        }
                    }
                    this.mIsSmsSyncFinish = true;
                    finishIntent = new Intent();
                    finishIntent.setAction(ACTION_DOWNLOAD_FINISH);
                    sendBroadcast(finishIntent);
                    this.bStopDownload = true;
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
                errorLog("parse CMGL error,break;");
                RemoveConnect(this.m_CurUsingProfile);
                return;
            case 36:
                printLog("++ParseCMGR");
                if (this.mATParser.ParseCMGR()) {
                    BT_SMS_REC_PARAM_T oneRec = this.mATParser.getOneSmsRec();
                    if (oneRec != null) {
                        tmpSmsRec = new SMSRecord();
                        tmpSmsRec.setIndex(oneRec.iIndex);
                        tmpSmsRec.setType(Integer.parseInt(oneRec.sType));
                        tmpSmsRec.setPhoneNum(oneRec.sTelNum);
                        tmpSmsRec.setTime(this.mATParser.getFormatDate(oneRec.lTimeMillis));
                        tmpSmsRec.setBody(oneRec.sContent);
                        printLog(tmpSmsRec.toString());
                        if (this.m_dbAdapter.insertOneSmsRecord(tmpSmsRec) < 0) {
                            errorLog("Record duplicate");
                        }
                        this.mGetSmsCount++;
                        printLog("mGetSmsCount is: " + this.mGetSmsCount);
                    }
                    if (this.mGetSmsCount % this.mStepCount == 0) {
                        Intent stepIntent = new Intent();
                        stepIntent.setAction(ACTION_STEP_DOWNLOAD);
                        stepIntent.putExtra(EXTRA_SMS_COUNT, this.mStepCount);
                        sendBroadcast(stepIntent);
                        return;
                    } else if (this.mGetSmsCount == this.mIndexArray.size() || this.mGetSmsCount == this.mSmsCount) {
                        this.mIsSmsSyncFinish = true;
                        finishIntent = new Intent();
                        finishIntent.setAction(ACTION_DOWNLOAD_FINISH);
                        sendBroadcast(finishIntent);
                        this.bStopDownload = true;
                        RemoveConnect(this.m_CurUsingProfile);
                        return;
                    } else {
                        return;
                    }
                }
                errorLog("parse CMGR error,break;");
                return;
            default:
                return;
        }
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

    private void sendServiceMsg(int what, Object arg) {
        printLog("[SMSSync] sendServiceMsg(" + what + ")");
        if (this.mServiceHandler != null) {
            Message msg = this.mServiceHandler.obtainMessage(what);
            msg.what = what;
            msg.obj = arg;
            this.mServiceHandler.sendMessage(msg);
            return;
        }
        errorLog("[SMSSync]mServiceHandler is null");
    }
}
