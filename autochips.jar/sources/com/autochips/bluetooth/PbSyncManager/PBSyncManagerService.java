package com.autochips.bluetooth.PbSyncManager;

import android.app.Service;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.IBluetoothPbapCall;
import android.bluetooth.IPBCallback;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.PbSyncManager.IPBSyncManager.Stub;
import com.autochips.bluetooth.PbSyncManager.PBSyncStruct.PBMGRPhoneBookInfo_T;
import com.autochips.bluetooth.hf.BluetoothHfAtPhonebook;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;
import com.autochips.bluetooth.spp.SppService;
import com.autochips.bluetooth.spp.SppService.LocalBinder;
import com.autochips.bluetooth.util.BTDBAdapter;
import com.autochips.bluetooth.util.PBSyncParsePclFile;
import com.autochips.bluetooth.util.PBSyncParsePclFile.BT_PHONE_INFO_NODE_T;
import com.autochips.bluetooth.util.PbSyncATGen;
import com.autochips.bluetooth.util.PbSyncATParser;
import com.autochips.bluetooth.util.PbSyncATParser.BT_PB_ADDREC_PARAM_T;
import com.autochips.bluetooth.util.PbSyncATParser.BT_PB_SETLISTINFO_PARAM_T;
import com.autochips.bluetooth.util.PbSyncATParser.PBMGRSPTCHARSET_T;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class PBSyncManagerService extends Service {
    public static final String ACTION_DOWNLOAD_FINISH = "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_finish";
    public static final String ACTION_DOWNLOAD_ONESTEP = "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_onestep";
    public static final String ACTION_DOWNLOAD_STOP = "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_stop";
    public static final String ACTION_STARTDOWNLOAD_POSITION = "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.startdownload_position";
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugPB);
    public static final int ENTIRE_DOWNLOAD_TIMEOUT = 0;
    public static final String EXTRA_PBSYNC_FOLDER = "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_folder";
    public static final String EXTRA_PBSYNC_ONESTEP_COUNT = "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_onestep_count";
    public static final String EXTRA_PBSYNC_START_POSITION = "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_start_position";
    public static final String EXTRA_PBSYNC_SUPPORT_FOLDER = "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_support_folder";
    private static final String PBCONFIGFILEPATH = "/system/atcprotocol.xml";
    public static final int PBMGR_CREATE_CONNECT_RES = 108;
    public static final int PBMGR_DISCONNECT_CNF = 110;
    private static final int PBMGR_GET_FACTORY = 100;
    private static final int PBMGR_GET_INFOLIST_CNF = 103;
    private static final int PBMGR_GET_PHONEBOOK_CNF = 104;
    private static final int PBMGR_GET_SERIAL = 101;
    public static final int PBMGR_GET_VCARDENTRY_CNF = 109;
    public static final int PBMGR_MSGLOOP = 11;
    private static final int PBMGR_SET_PATH = 105;
    private static final int PBMGR_SET_PATH_CNF = 102;
    public static final int PBMGR_STOP_DOWNLOAD = 112;
    public static final int PBMGR_THREAD_QUIT = 10;
    public static final int PBMGR_TIMER_AT_ECHO = 12;
    public static final int PBMGR_TIMER_AT_GET_CUR_CHARSET = 5;
    public static final int PBMGR_TIMER_AT_GET_LISTINFO = 9;
    public static final int PBMGR_TIMER_AT_GET_PATH = 8;
    public static final int PBMGR_TIMER_AT_SET_CUR_CHARSET = 6;
    public static final int PBMGR_TIMER_AT_SET_PATH = 7;
    public static final int PBMGR_TIMER_AT_SPT_CHARSET = 4;
    public static final int PBMGR_TIMER_AT_SPT_PATH = 3;
    public static final int PBMGR_TIMER_DOWNLOAD = 2;
    public static final int PBMGR_TIMER_GETDEVICEINFO = 1;
    private static final String TAG = "PBSyncManagerService";
    public static boolean m_bStopDwLd = false;
    private PbSyncATGen mATGen = new PbSyncATGen();
    private PbSyncATParser mATParser = new PbSyncATParser();
    private String mBTAddrNode = null;
    private boolean mConnectedFlag;
    private int[] mCurDwnCountIdx = new int[8];
    private int[] mCurDwnNumIdx = new int[8];
    private int mCurReqDwnNum = 0;
    private List<DownloadListNode> mDownLoadList = new ArrayList();
    private long mDownloadTimeout = 1200000;
    private Timer mEntireTimer = null;
    private TimerTask mEntireTimerTask = null;
    private HandlerThread mHandlerThread;
    private BluetoothHfAtPhonebook mHfAtPhonebook = null;
    private boolean mIsSyncUsingDun = false;
    private String mJniVcard;
    private int mLastMsgType;
    private final Stub mManager = new Stub() {
        public boolean StopDownload(int path) throws RemoteException {
            PBSyncManagerService.this.mSyncState = 2;
            if (PBSyncManagerService.this.m_eState == 0) {
                PBSyncManagerService.this.printLog("StopDownload() PBMGR_SYNC_STATE_IDLE return");
                PBSyncManagerService.this.mSyncState = 0;
            } else {
                if (path == 8) {
                    PBSyncManagerService.m_bStopDwLd = true;
                    PBSyncManagerService.this.mTryDwnldNextFolder = false;
                    PBSyncManagerService.this.mDownLoadList.clear();
                } else if (path == 6) {
                    PBSyncManagerService.this.mTryDwnldNextFolder = true;
                    PBSyncManagerService.this.printLog("[StopDownload] m_eCompPath = " + PBSyncManagerService.this.m_eCompPath);
                    if (PBSyncManagerService.this.m_eCompPath == path) {
                        PBSyncManagerService.m_bStopDwLd = true;
                    }
                    for (i = 0; i < PBSyncManagerService.this.mDownLoadList.size(); i++) {
                        if (((DownloadListNode) PBSyncManagerService.this.mDownLoadList.get(i)).downloadpath == path) {
                            PBSyncManagerService.this.mDownLoadList.remove(i);
                            PBSyncManagerService.this.printLog("[StopDownload] remove i = " + i);
                            break;
                        }
                    }
                } else if (path == 2) {
                    PBSyncManagerService.this.mTryDwnldNextFolder = true;
                    PBSyncManagerService.this.printLog("[StopDownload] m_eCompPath = " + PBSyncManagerService.this.m_eCompPath);
                    if (PBSyncManagerService.this.m_eCompPath == path) {
                        PBSyncManagerService.m_bStopDwLd = true;
                    }
                    for (i = 0; i < PBSyncManagerService.this.mDownLoadList.size(); i++) {
                        if (((DownloadListNode) PBSyncManagerService.this.mDownLoadList.get(i)).downloadpath == path) {
                            PBSyncManagerService.this.mDownLoadList.remove(i);
                            PBSyncManagerService.this.printLog("[StopDownload] remove i = " + i);
                        }
                    }
                }
                PBSyncManagerService.this.printLog("[StopDownload] m_bStopDwLd = " + PBSyncManagerService.m_bStopDwLd);
            }
            return true;
        }

        public boolean StartDownload(int path, boolean bContinue) throws RemoteException {
            PBSyncManagerService.this.printLog("PBSync StartDownload thread = " + Thread.currentThread().getId() + " name = " + Thread.currentThread().getName());
            DownloadListNode tmpDwnldNode = new DownloadListNode();
            tmpDwnldNode.eMsg = 1;
            tmpDwnldNode.btaddr = PBSyncManagerService.this.mBTAddrNode;
            tmpDwnldNode.downloadpath = path;
            tmpDwnldNode.bContinue = bContinue;
            PBSyncManagerService.this.mDownLoadList.add(tmpDwnldNode);
            PBSyncManagerService.this.sendServiceMsg(11, null);
            return true;
        }

        public boolean SetTimeOutVal(int path, int iTimeOut) throws RemoteException {
            if (path >= 8) {
                return false;
            }
            PBSyncManagerService.this.m_u4TimeOut[path] = iTimeOut;
            return true;
        }

        public boolean SetRemoteDevice(BluetoothDevice remoteDevice, int path) throws RemoteException {
            PBSyncManagerService.this.mSyncState = 1;
            PBSyncManagerService.this.printLog("SetRemoteDevice() mSyncState=" + PBSyncManagerService.this.mSyncState);
            PBSyncManagerService.m_bStopDwLd = false;
            PBSyncManagerService.this.m_remoteDevice = remoteDevice;
            PBSyncManagerService.this.mBTAddrNode = PBSyncManagerService.this.m_remoteDevice.getAddress();
            DownloadListNode tmpDwnldNode = new DownloadListNode();
            tmpDwnldNode.eMsg = 0;
            tmpDwnldNode.btaddr = PBSyncManagerService.this.mBTAddrNode;
            tmpDwnldNode.downloadpath = path;
            PBSyncManagerService.this.mDownLoadList.add(tmpDwnldNode);
            PBSyncManagerService.this.sendServiceMsg(11, null);
            return true;
        }

        public boolean SetRemoteDevInfo(String factory, String serial, String imei) throws RemoteException {
            return false;
        }

        public boolean SetIndStep(int iStep) throws RemoteException {
            PBSyncManagerService.this.m_u4IndStep = iStep;
            return true;
        }

        public boolean SetDownloadMaxCnt(int path, int iMaxCnt) throws RemoteException {
            for (int u4Idx = 0; u4Idx < 8; u4Idx++) {
                if (u4Idx == path) {
                    if (2 == path) {
                        PBSyncManagerService.this.m_u4MaxDownloadCnt[0] = -1;
                        PBSyncManagerService.this.m_u4MaxDownloadCnt[1] = -1;
                    }
                    if (6 == path) {
                        PBSyncManagerService.this.m_u4MaxDownloadCnt[3] = -1;
                        PBSyncManagerService.this.m_u4MaxDownloadCnt[4] = -1;
                        PBSyncManagerService.this.m_u4MaxDownloadCnt[5] = -1;
                    }
                    PBSyncManagerService.this.m_u4MaxDownloadCnt[u4Idx] = iMaxCnt;
                    PBSyncManagerService.this.printLog("[ATCMD]SetDownloadMaxCnt(" + path + "," + iMaxCnt + ")");
                    return true;
                }
            }
            return true;
        }

        public boolean Init() throws RemoteException {
            return PBSyncManagerService.this.ServiceInit();
        }

        public int GetRecCnt(String btaddr, int path) throws RemoteException {
            return PBSyncManagerService.this.ServiceGetRecCnt(btaddr, path);
        }

        public boolean GetRecord(int path, int u4FirstIdx, int u4RecCnt, List<PBRecord> record) {
            return PBSyncManagerService.this.ServiceGetRecord(path, u4FirstIdx, u4RecCnt, record);
        }

        public boolean SearchPhonebook(String btAddr, String search, List<PBRecord> record) {
            String btOldAddr = PBSyncManagerService.this.getSharedPreferences("pause_data", 0).getString("BTADDR", BluetoothPbapClientPath.PBAP_ROOT_NAME);
            PBSyncManagerService.this.printLog("[PauseInfo] old download Addr = " + btOldAddr);
            if (btAddr.equals(btOldAddr)) {
                return PBSyncManagerService.this.m_dbAdapter.SearchPhonebookByString(search, record);
            }
            return false;
        }

        public String GetNameByTelExectly(String btAddr, String tel) throws RemoteException {
            String btOldAddr = PBSyncManagerService.this.getSharedPreferences("pause_data", 0).getString("BTADDR", BluetoothPbapClientPath.PBAP_ROOT_NAME);
            PBSyncManagerService.this.printLog("[PauseInfo] old download Addr = " + btOldAddr);
            if (btAddr.equals(btOldAddr)) {
                return PBSyncManagerService.this.m_dbAdapter.getNamebyTel(tel);
            }
            return BluetoothPbapClientPath.PBAP_ROOT_NAME;
        }

        public void AddCall(int type, String name, String tel, String time) throws RemoteException {
            PBSyncManagerService.this.printLog("[PBSync]AddCall(" + type + "," + name + "," + tel + "," + time + ")");
            readPhonebookandCallhisotyCountfromDatebase();
            PBRecord tmpPBRec;
            int[] access$1700;
            if (type == 0) {
                PBSyncManagerService.this.m_dbAdapter.updateOrderNumber(256);
                tmpPBRec = new PBRecord();
                tmpPBRec.setType(256);
                tmpPBRec.setName(name);
                tmpPBRec.setNumber(tel);
                tmpPBRec.setCalltime(time);
                PBSyncManagerService.this.m_dbAdapter.insertOneRecord(tmpPBRec, 0);
                access$1700 = PBSyncManagerService.this.m_u4PBRecCnt;
                access$1700[8] = access$1700[8] + 1;
                PBSyncManagerService.this.printLog(tmpPBRec.toString());
            } else if (1 == type) {
                PBSyncManagerService.this.m_dbAdapter.updateOrderNumber(64);
                tmpPBRec = new PBRecord();
                tmpPBRec.setType(64);
                tmpPBRec.setName(name);
                tmpPBRec.setNumber(tel);
                tmpPBRec.setCalltime(time);
                PBSyncManagerService.this.m_dbAdapter.insertOneRecord(tmpPBRec, 0);
                access$1700 = PBSyncManagerService.this.m_u4PBRecCnt;
                access$1700[6] = access$1700[6] + 1;
                PBSyncManagerService.this.printLog(tmpPBRec.toString());
            } else if (2 == type) {
                PBSyncManagerService.this.m_dbAdapter.updateOrderNumber(1024);
                tmpPBRec = new PBRecord();
                tmpPBRec.setType(1024);
                tmpPBRec.setName(name);
                tmpPBRec.setNumber(tel);
                tmpPBRec.setCalltime(time);
                PBSyncManagerService.this.m_dbAdapter.insertOneRecord(tmpPBRec, 0);
                access$1700 = PBSyncManagerService.this.m_u4PBRecCnt;
                access$1700[10] = access$1700[10] + 1;
                PBSyncManagerService.this.printLog(tmpPBRec.toString());
            }
            Editor latest_pause_data = PBSyncManagerService.this.getSharedPreferences("pause_data", 0).edit();
            Log.i(PBSyncManagerService.TAG, "[PauseInfo] WritePauseInfo");
            for (int pathIndex = 0; pathIndex < 14; pathIndex++) {
                latest_pause_data.putInt("PBRecCnt" + pathIndex, PBSyncManagerService.this.m_u4PBRecCnt[pathIndex]);
                PBSyncManagerService.this.printLog("[PauseInfo] latest m_u4PBRecCnt[" + pathIndex + "] = " + PBSyncManagerService.this.m_u4PBRecCnt[pathIndex]);
            }
            latest_pause_data.commit();
        }

        private void readPhonebookandCallhisotyCountfromDatebase() {
            for (int idx = 0; idx < 14; idx++) {
                if (PBSyncManagerService.this.m_u4PBRecCnt[idx] == 0) {
                    PBSyncManagerService.this.m_u4PBRecCnt[idx] = PBSyncManagerService.this.m_dbAdapter.getCount(1 << idx);
                }
            }
        }

        public boolean DeInit() throws RemoteException {
            return false;
        }

        public boolean ClearRemoteDevice() throws RemoteException {
            return false;
        }

        public int GetSyncState() {
            return PBSyncManagerService.this.mSyncState;
        }

        public int GetSyncPath() {
            return PBSyncManagerService.this.m_eCompPath;
        }
    };
    private IPBCallback.Stub mPBCallback = new IPBCallback.Stub() {
        public void notifyConnect(boolean result) throws RemoteException {
            PBSyncManagerService.this.sendServiceMsg(PBSyncManagerService.PBMGR_CREATE_CONNECT_RES, Boolean.valueOf(result));
        }

        public void notifyDisConnect(boolean result) throws RemoteException {
            PBSyncManagerService.this.sendServiceMsg(110, Boolean.valueOf(result));
        }

        public void notifySetPath(boolean result) throws RemoteException {
            PBSyncManagerService.this.sendServiceMsg(102, Boolean.valueOf(result));
        }

        public void notifyGetList(int recordnum, int missed, int maxIndex, boolean result) throws RemoteException {
            PBSyncManagerService.this.m_rPBInfo.u4RecordNum = recordnum;
            PBSyncManagerService.this.m_rPBInfo.u4Miss = missed;
            PBSyncManagerService.this.m_rPBInfo.u4MaxIndex = maxIndex;
            PBSyncManagerService.this.m_rPBInfo.u4StartIdx = 0;
            PBSyncManagerService.this.m_rPBInfo.bGetRecNum = true;
            PBSyncManagerService.this.sendServiceMsg(103, Boolean.valueOf(result));
        }

        public void notifyGetPhonebook(boolean result) throws RemoteException {
            PBSyncManagerService.this.sendServiceMsg(104, Boolean.valueOf(result));
        }

        public void notifyGetVcardEntry(boolean result) throws RemoteException {
            PBSyncManagerService.this.sendServiceMsg(PBSyncManagerService.PBMGR_GET_VCARDENTRY_CNF, Boolean.valueOf(result));
        }
    };
    private IBluetoothPbapCall mPbapClient = null;
    private ServiceConnection mPbapClientConn = new ServiceConnection() {
        public void onServiceConnected(ComponentName name, IBinder service) {
            PBSyncManagerService.this.mPbapClient = IBluetoothPbapCall.Stub.asInterface(service);
            try {
                PBSyncManagerService.this.mPbapClient.registerCallback(PBSyncManagerService.this.mPBCallback);
                PBSyncManagerService.this.printLog("[PBAP]pbapGetState()  = " + PBSyncManagerService.this.mPbapClient.pbapGetState());
            } catch (RemoteException e) {
                e.printStackTrace();
            }
            if (PBSyncManagerService.this.mPbapClient != null) {
                PBSyncManagerService.this.printLog("[PBAP]onServiceConnected(), OK");
            } else if (PBSyncManagerService.DEBUG) {
                Log.e(PBSyncManagerService.TAG, "[PBAP]onServiceConnected(), ERROR");
            }
        }

        public void onServiceDisconnected(ComponentName name) {
            PBSyncManagerService.this.printLog("[PBAP]onServiceDisconnected()");
            PBSyncManagerService.this.mPbapClient = null;
        }
    };
    private ServiceHandler mServiceHandler;
    private ServiceConnection mSppConnection = new ServiceConnection() {
        public void onServiceConnected(ComponentName name, IBinder service) {
            PBSyncManagerService.this.mSppService = ((LocalBinder) service).getSppService();
            if (PBSyncManagerService.this.mSppService != null) {
                PBSyncManagerService.this.printLog("[PBSync]SPP Service connected");
                PBSyncManagerService.this.mSppService.setHandler(PBSyncManagerService.this.mServiceHandler);
            } else if (PBSyncManagerService.DEBUG) {
                Log.e(PBSyncManagerService.TAG, "[PBSync]SPP Service connect failed");
            }
        }

        public void onServiceDisconnected(ComponentName name) {
            PBSyncManagerService.this.mSppService = null;
            PBSyncManagerService.this.printLog("[PBSync]SPP Service disconnected");
        }
    };
    private SppService mSppService;
    private int mSyncState = 0;
    private Timer mTimer = null;
    private TimerTask mTimerTask = null;
    private int mTmpDownloadCnt = 0;
    private boolean mTryDwnldNextFolder = false;
    private List<PBRecord> mVcardList = new ArrayList();
    private String m_BTAddr = null;
    private String m_BTOldAddr = null;
    private int[] m_CurDwnIndex = new int[8];
    private int[] m_CurPathStatus = new int[8];
    private int m_CurUsingProfile = 0;
    private boolean m_FlagGetRemoteInfo = false;
    private int m_GetRemoteInfoConnIdx = 0;
    private int[] m_GetRemoteInfoConnProfile = new int[this.m_GetRemoteInfoConnTypeCnt];
    private int m_GetRemoteInfoConnTypeCnt = 2;
    public int m_HFconnected = 2;
    private String m_IMEI = null;
    public int m_PBAPconnected = 2;
    PBSyncParsePclFile m_PclFile = null;
    private boolean m_ResultGetRemoteInfo = false;
    public int m_SPPconnected = 2;
    private int[] m_aeConnProfile = new int[4];
    private int[] m_bSupportFloder = new int[8];
    private BTDBAdapter m_dbAdapter = null;
    private int m_eCompPath = 8;
    private int[] m_eConnType = new int[8];
    private int[] m_eDwnldResult = new int[8];
    private int m_eResultType = 5;
    private int m_eState = 0;
    private String m_manufoctor = null;
    private String m_name = null;
    BT_PHONE_INFO_NODE_T m_protolNd = null;
    private int m_rCurCharSet = 0;
    PBMGRPhoneBookInfo_T m_rPBInfo = new PBMGRPhoneBookInfo_T();
    private int m_rPrevCharSet = 0;
    private PBMGRSPTCHARSET_T m_rSptCharSets = null;
    private int m_rSptPath = 0;
    private BluetoothDevice m_remoteDevice = null;
    private String m_serial = null;
    public boolean m_sppConnectionFailed = false;
    private int m_tryProfileIndex = 0;
    private int m_u4DwnPaths = 0;
    private int m_u4DwnldStep = 5;
    private int m_u4IndStep = 10;
    private int[] m_u4MaxDownloadCnt = new int[8];
    private int[] m_u4PBIndicateCnt = new int[14];
    private int[] m_u4PBRecCnt = new int[14];
    private int[] m_u4TimeOut = new int[8];
    private boolean mbDwnldCPBRAgain = false;
    private boolean[] mbFirstCreate = new boolean[8];
    private boolean mbSppConnectAgain = false;
    private String mlocalVcard = "PBVcard.log";

    /* renamed from: com.autochips.bluetooth.PbSyncManager.PBSyncManagerService$1 */
    class C00071 extends TimerTask {
        C00071() {
        }

        public void run() {
            if (PBSyncManagerService.this.mServiceHandler != null) {
                Message message = new Message();
                message.what = 2;
                PBSyncManagerService.this.mServiceHandler.sendMessage(message);
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.PbSyncManager.PBSyncManagerService$2 */
    class C00082 extends TimerTask {
        C00082() {
        }

        public void run() {
            if (PBSyncManagerService.this.mServiceHandler != null) {
                Message message = new Message();
                message.what = 1;
                PBSyncManagerService.this.mServiceHandler.sendMessage(message);
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.PbSyncManager.PBSyncManagerService$3 */
    class C00093 extends TimerTask {
        C00093() {
        }

        public void run() {
            if (PBSyncManagerService.this.mServiceHandler != null) {
                Message message = new Message();
                message.what = 3;
                PBSyncManagerService.this.mServiceHandler.sendMessage(message);
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.PbSyncManager.PBSyncManagerService$4 */
    class C00104 extends TimerTask {
        C00104() {
        }

        public void run() {
            if (PBSyncManagerService.this.mServiceHandler != null) {
                Message message = new Message();
                message.what = 4;
                PBSyncManagerService.this.mServiceHandler.sendMessage(message);
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.PbSyncManager.PBSyncManagerService$5 */
    class C00115 extends TimerTask {
        C00115() {
        }

        public void run() {
            if (PBSyncManagerService.this.mServiceHandler != null) {
                Message message = new Message();
                message.what = 5;
                PBSyncManagerService.this.mServiceHandler.sendMessage(message);
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.PbSyncManager.PBSyncManagerService$6 */
    class C00126 extends TimerTask {
        C00126() {
        }

        public void run() {
            if (PBSyncManagerService.this.mServiceHandler != null) {
                Message message = new Message();
                message.what = 6;
                PBSyncManagerService.this.mServiceHandler.sendMessage(message);
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.PbSyncManager.PBSyncManagerService$7 */
    class C00137 extends TimerTask {
        C00137() {
        }

        public void run() {
            if (PBSyncManagerService.this.mServiceHandler != null) {
                Message message = new Message();
                message.what = 8;
                PBSyncManagerService.this.mServiceHandler.sendMessage(message);
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.PbSyncManager.PBSyncManagerService$8 */
    class C00148 extends TimerTask {
        C00148() {
        }

        public void run() {
            if (PBSyncManagerService.this.mServiceHandler != null) {
                Message message = new Message();
                message.what = 9;
                PBSyncManagerService.this.mServiceHandler.sendMessage(message);
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.PbSyncManager.PBSyncManagerService$9 */
    class C00159 extends TimerTask {
        C00159() {
        }

        public void run() {
            if (PBSyncManagerService.this.mServiceHandler != null) {
                Message message = new Message();
                message.what = 12;
                PBSyncManagerService.this.mServiceHandler.sendMessage(message);
            }
        }
    }

    private class DownloadListNode {
        public boolean bContinue;
        public String btaddr;
        public int downloadpath;
        public int eMsg;

        private DownloadListNode() {
        }
    }

    private class ServiceHandler extends Handler {
        public ServiceHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message msg) {
            boolean result;
            int i;
            int[] access$1700;
            int i2;
            String sRespond;
            switch (msg.what) {
                case 0:
                    PBSyncManagerService.this.cleanEntireTimerTask();
                    PBSyncManagerService.this.cleanTimerTask();
                    if (PBSyncManagerService.DEBUG) {
                        Log.d(PBSyncManagerService.TAG, "current download timeout");
                    }
                    PBSyncManagerService.this.m_eResultType = 2;
                    PBSyncManagerService.this.mTryDwnldNextFolder = true;
                    PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                    return;
                case 1:
                    PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                    return;
                case 2:
                    PBSyncManagerService.this.cleanTimerTask();
                    if (PBSyncManagerService.m_bStopDwLd) {
                        if (PBSyncManagerService.DEBUG) {
                            Log.e(PBSyncManagerService.TAG, "[Timeout]PBMGR_TIMER_DOWNLOAD");
                        }
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    } else if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "[ATCMD] PBMGR_TIMER_DOWNLOAD, no handle");
                        return;
                    } else {
                        return;
                    }
                case 3:
                    if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "[ATCMD] get support path Timeout!");
                    }
                    PBSyncManagerService.this.m_eResultType = 1;
                    PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                    return;
                case 4:
                    if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "[ATCMD] get support charset Timeout!");
                    }
                    PBSyncManagerService.this.m_eResultType = 1;
                    PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                    return;
                case 5:
                    if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "[ATCMD] get current charset Timeout!");
                    }
                    PBSyncManagerService.this.m_eResultType = 1;
                    PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                    return;
                case 6:
                    if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "[ATCMD] set current charset Timeout!");
                    }
                    PBSyncManagerService.this.m_eResultType = 1;
                    PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                    return;
                case 7:
                    if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "[ATCMD] set path Timeout!");
                    }
                    PBSyncManagerService.this.m_eResultType = 1;
                    PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                    return;
                case 8:
                    if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "[ATCMD] get path Timeout!");
                    }
                    PBSyncManagerService.this.m_eResultType = 1;
                    PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                    return;
                case 9:
                    if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "[ATCMD] get listinfo Timeout!");
                    }
                    PBSyncManagerService.this.m_eResultType = 1;
                    PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                    return;
                case 10:
                    Looper.myLooper().quit();
                    return;
                case 11:
                    PBSyncManagerService.this.MsgLoop();
                    return;
                case 12:
                    if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "[ATCMD] set echo Timeout!! mbSppConnectAgain = " + PBSyncManagerService.this.mbSppConnectAgain);
                    }
                    if (PBSyncManagerService.this.mbSppConnectAgain) {
                        PBSyncManagerService.this.m_eResultType = 1;
                        PBSyncManagerService.this.mbSppConnectAgain = false;
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    }
                    PBSyncManagerService.this.m_eResultType = 1;
                    PBSyncManagerService.this.mbSppConnectAgain = true;
                    PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                    return;
                case 102:
                    PBSyncManagerService.this.cleanTimerTask();
                    if (PBSyncManagerService.m_bStopDwLd) {
                        if (PBSyncManagerService.DEBUG) {
                            Log.e(PBSyncManagerService.TAG, "PBMGR_SET_PATH_CNF");
                        }
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    }
                    result = Boolean.parseBoolean(msg.obj.toString());
                    if (1 != PBSyncManagerService.this.m_CurUsingProfile) {
                        return;
                    }
                    if (result) {
                        PBSyncManagerService.this.GetListInfo(1);
                        return;
                    }
                    if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "[PBAP] SetPath error");
                    }
                    PBSyncManagerService.this.NextProccessAfterDownloadFail();
                    return;
                case 103:
                    PBSyncManagerService.this.cleanTimerTask();
                    if (PBSyncManagerService.m_bStopDwLd) {
                        if (PBSyncManagerService.DEBUG) {
                            Log.e(PBSyncManagerService.TAG, "PBMGR_GET_INFOLIST_CNF");
                        }
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    }
                    result = Boolean.parseBoolean(msg.obj.toString());
                    if (1 != PBSyncManagerService.this.m_CurUsingProfile) {
                        return;
                    }
                    if (result) {
                        if (-1 == PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath]) {
                            PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath] = PBSyncManagerService.this.m_rPBInfo.u4StartIdx;
                        }
                        if (PBSyncManagerService.this.m_rPBInfo.u4RecordNum <= 0) {
                            PBSyncManagerService.this.printLog("[PBAP] List Record number = 0");
                            PBSyncManagerService.this.NextProccessAfterDownloadSuccess();
                            return;
                        } else if (PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath] > PBSyncManagerService.this.m_rPBInfo.u4RecordNum) {
                            PBSyncManagerService.this.printLog("[PBAP]mCurDwnNumIdx[m_eCompPath] > m_rPBInfo.u4RecordNum");
                            PBSyncManagerService.this.NextProccessAfterDownloadSuccess();
                            return;
                        } else if ((PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath] + PBSyncManagerService.this.m_u4DwnldStep) - 1 <= PBSyncManagerService.this.m_rPBInfo.u4RecordNum) {
                            PBSyncManagerService.this.GetVcard(PBSyncManagerService.this.m_CurUsingProfile, PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath], (PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath] + PBSyncManagerService.this.m_u4DwnldStep) - 1);
                            return;
                        } else {
                            PBSyncManagerService.this.GetVcard(PBSyncManagerService.this.m_CurUsingProfile, PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath], PBSyncManagerService.this.m_rPBInfo.u4RecordNum);
                            return;
                        }
                    } else if (PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath] > 0) {
                        PBSyncManagerService.this.NextProccessAfterDownloadSuccess();
                        return;
                    } else {
                        if (PBSyncManagerService.DEBUG) {
                            Log.e(PBSyncManagerService.TAG, "[PBAP] Get InfoList error, folder: " + PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath]);
                        }
                        PBSyncManagerService.this.m_eResultType = 1;
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    }
                case 104:
                    PBSyncManagerService.this.cleanTimerTask();
                    if (PBSyncManagerService.m_bStopDwLd) {
                        if (PBSyncManagerService.DEBUG) {
                            Log.e(PBSyncManagerService.TAG, "PBMGR_GET_PHONEBOOK_CNF");
                        }
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    }
                    result = Boolean.parseBoolean(msg.obj.toString());
                    if (1 != PBSyncManagerService.this.m_CurUsingProfile) {
                        return;
                    }
                    if (!result) {
                        PBSyncManagerService.this.SendOneStepDownloadIntent();
                        if (PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath] < PBSyncManagerService.this.m_rPBInfo.u4RecordNum || PBSyncManagerService.this.m_u4PBRecCnt[PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath]] <= 0) {
                            if (PBSyncManagerService.DEBUG) {
                                Log.e(PBSyncManagerService.TAG, "[PBAP] download phonebook error, need to check profile");
                            }
                            PBSyncManagerService.this.m_eResultType = 1;
                            PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath] = -1;
                            PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                            return;
                        }
                        PBSyncManagerService.this.SendRemainDownloadIntent();
                        PBSyncManagerService.this.printLog("[PBAP] current folder download success");
                        PBSyncManagerService.this.NextProccessAfterDownloadSuccess();
                        return;
                    } else if (PBSyncManagerService.this.parseVcard()) {
                        if (PBSyncManagerService.this.mVcardList.size() == 0) {
                            PBSyncManagerService.this.printLog("[PBAP] get no Records in path");
                        }
                        for (i = 0; i < PBSyncManagerService.this.mVcardList.size(); i++) {
                            ((PBRecord) PBSyncManagerService.this.mVcardList.get(i)).setType(1 << PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath]);
                            if (PBSyncManagerService.this.m_dbAdapter.insertOneRecord((PBRecord) PBSyncManagerService.this.mVcardList.get(i), PBSyncManagerService.this.m_u4PBRecCnt[PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath]]) >= 0) {
                                access$1700 = PBSyncManagerService.this.m_u4PBRecCnt;
                                i2 = PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath];
                                access$1700[i2] = access$1700[i2] + 1;
                                if (PBSyncManagerService.this.IsMoreThanMaxCount()) {
                                    PBSyncManagerService.this.cleanTimerTask();
                                    PBSyncManagerService.this.SendRemainDownloadIntent();
                                    PBSyncManagerService.this.printLog("[PBAP] current folder download enough : " + PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath]);
                                    PBSyncManagerService.this.NextProccessAfterDownloadSuccess();
                                    return;
                                }
                            } else {
                                PBSyncManagerService.this.printLog("exsisted record:");
                            }
                            PBSyncManagerService.this.printLog(((PBRecord) PBSyncManagerService.this.mVcardList.get(i)).toString());
                        }
                        access$1700 = PBSyncManagerService.this.mCurDwnCountIdx;
                        i2 = PBSyncManagerService.this.m_eCompPath;
                        access$1700[i2] = access$1700[i2] + PBSyncManagerService.this.mVcardList.size();
                        access$1700 = PBSyncManagerService.this.mCurDwnNumIdx;
                        i2 = PBSyncManagerService.this.m_eCompPath;
                        access$1700[i2] = access$1700[i2] + PBSyncManagerService.this.mCurReqDwnNum;
                        PBSyncManagerService.this.SendOneStepDownloadIntent();
                        if (PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath] > PBSyncManagerService.this.m_rPBInfo.u4RecordNum) {
                            PBSyncManagerService.this.SendRemainDownloadIntent();
                            PBSyncManagerService.this.printLog("[PBAP] current folder download success");
                            PBSyncManagerService.this.NextProccessAfterDownloadSuccess();
                            return;
                        } else if ((PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath] + PBSyncManagerService.this.m_u4DwnldStep) - 1 <= PBSyncManagerService.this.m_rPBInfo.u4RecordNum) {
                            PBSyncManagerService.this.GetVcard(PBSyncManagerService.this.m_CurUsingProfile, PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath], (PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath] + PBSyncManagerService.this.m_u4DwnldStep) - 1);
                            return;
                        } else {
                            PBSyncManagerService.this.GetVcard(PBSyncManagerService.this.m_CurUsingProfile, PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath], PBSyncManagerService.this.m_rPBInfo.u4RecordNum);
                            return;
                        }
                    } else {
                        if (PBSyncManagerService.DEBUG) {
                            Log.e(PBSyncManagerService.TAG, "[PBAP] parse Vcard failed, need to check parse code!");
                        }
                        PBSyncManagerService.this.m_eResultType = 1;
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    }
                case PBSyncManagerService.PBMGR_SET_PATH /*105*/:
                    if (PBSyncManagerService.m_bStopDwLd) {
                        if (PBSyncManagerService.DEBUG) {
                            Log.e(PBSyncManagerService.TAG, "PBMGR_SET_PATH");
                        }
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    }
                    if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "PBMGR_SET_PATH thread = " + Thread.currentThread().getId() + " name = " + Thread.currentThread().getName());
                    }
                    int iCurPath = 0;
                    if (PBSyncManagerService.DEBUG) {
                        Log.d(PBSyncManagerService.TAG, "m_eCompPath = " + PBSyncManagerService.this.m_eCompPath);
                    }
                    while (PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath] < 14) {
                        iCurPath = 1 << PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath];
                        if (PBSyncManagerService.this.m_eConnType[1] == 4 && iCurPath == 32) {
                            if (PBSyncManagerService.DEBUG) {
                                Log.d(PBSyncManagerService.TAG, "not support sim phonebook. next.");
                            }
                            PBSyncManagerService.this.NextProccessAfterDownloadSuccess();
                            return;
                        } else if ((PBSyncManagerService.this.m_u4DwnPaths & iCurPath) == 0 || (PBSyncManagerService.this.m_rSptPath & iCurPath) == 0) {
                            access$1700 = PBSyncManagerService.this.m_CurDwnIndex;
                            i2 = PBSyncManagerService.this.m_eCompPath;
                            access$1700[i2] = access$1700[i2] + 1;
                        } else if (PBSyncManagerService.this.IsMoreThanMaxCount()) {
                            PBSyncManagerService.this.printLog("[ATCMD] current folder record count enough : " + PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath]);
                            PBSyncManagerService.this.NextProccessAfterDownloadSuccess();
                            return;
                        } else if (PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath] != 14) {
                            if (PBSyncManagerService.DEBUG) {
                                Log.e(PBSyncManagerService.TAG, "all path have been download");
                            }
                            PBSyncManagerService.this.m_eResultType = 0;
                            PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                            return;
                        } else {
                            PBSyncManagerService.this.setPath(PBSyncManagerService.this.m_CurUsingProfile, iCurPath);
                            return;
                        }
                    }
                    if (PBSyncManagerService.this.IsMoreThanMaxCount()) {
                        PBSyncManagerService.this.printLog("[ATCMD] current folder record count enough : " + PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath]);
                        PBSyncManagerService.this.NextProccessAfterDownloadSuccess();
                        return;
                    } else if (PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath] != 14) {
                        PBSyncManagerService.this.setPath(PBSyncManagerService.this.m_CurUsingProfile, iCurPath);
                        return;
                    } else {
                        if (PBSyncManagerService.DEBUG) {
                            Log.e(PBSyncManagerService.TAG, "all path have been download");
                        }
                        PBSyncManagerService.this.m_eResultType = 0;
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    }
                case PBSyncManagerService.PBMGR_CREATE_CONNECT_RES /*108*/:
                    if (PBSyncManagerService.m_bStopDwLd) {
                        if (PBSyncManagerService.DEBUG) {
                            Log.e(PBSyncManagerService.TAG, "PBMGR_CREATE_CONNECT_RES");
                        }
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    } else if (Boolean.parseBoolean(msg.obj.toString())) {
                        PBSyncManagerService.this.SetEcho(PBSyncManagerService.this.m_CurUsingProfile, false);
                        return;
                    } else {
                        if (PBSyncManagerService.DEBUG) {
                            Log.e(PBSyncManagerService.TAG, "connect " + PBSyncManagerService.this.m_CurUsingProfile + " failed");
                        }
                        PBSyncManagerService.this.m_eResultType = 1;
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    }
                case PBSyncManagerService.PBMGR_GET_VCARDENTRY_CNF /*109*/:
                    PBSyncManagerService.this.cleanTimerTask();
                    if (PBSyncManagerService.m_bStopDwLd) {
                        if (PBSyncManagerService.DEBUG) {
                            Log.e(PBSyncManagerService.TAG, "PBMGR_GET_VCARDENTRY_CNF");
                        }
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    }
                    result = Boolean.parseBoolean(msg.obj.toString());
                    if (1 != PBSyncManagerService.this.m_CurUsingProfile) {
                        return;
                    }
                    if (!result) {
                        PBSyncManagerService.this.cleanTimerTask();
                        if (PBSyncManagerService.DEBUG) {
                            Log.e(PBSyncManagerService.TAG, "[getvcardEntry] failed, need to check profile!");
                        }
                        PBSyncManagerService.this.m_eResultType = 1;
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    } else if (PBSyncManagerService.this.parseVcard()) {
                        if (PBSyncManagerService.this.mVcardList.size() == 0) {
                            PBSyncManagerService.this.printLog("get no Records in path");
                        }
                        for (i = 0; i < PBSyncManagerService.this.mVcardList.size(); i++) {
                            ((PBRecord) PBSyncManagerService.this.mVcardList.get(i)).setType(1 << PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath]);
                            if (PBSyncManagerService.this.m_dbAdapter.insertOneRecord((PBRecord) PBSyncManagerService.this.mVcardList.get(i), PBSyncManagerService.this.m_u4PBRecCnt[PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath]]) >= 0) {
                                access$1700 = PBSyncManagerService.this.m_u4PBRecCnt;
                                i2 = PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath];
                                access$1700[i2] = access$1700[i2] + 1;
                                if (PBSyncManagerService.this.IsMoreThanMaxCount()) {
                                    PBSyncManagerService.this.cleanTimerTask();
                                    PBSyncManagerService.this.SendRemainDownloadIntent();
                                    PBSyncManagerService.this.printLog("[PBAP] current folder download enough : " + PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath]);
                                    PBSyncManagerService.this.NextProccessAfterDownloadSuccess();
                                    return;
                                }
                            } else {
                                PBSyncManagerService.this.printLog("exsisted record:");
                            }
                            PBSyncManagerService.this.printLog(((PBRecord) PBSyncManagerService.this.mVcardList.get(i)).toString());
                        }
                        access$1700 = PBSyncManagerService.this.mCurDwnCountIdx;
                        i2 = PBSyncManagerService.this.m_eCompPath;
                        access$1700[i2] = access$1700[i2] + PBSyncManagerService.this.mVcardList.size();
                        PBSyncManagerService.this.cleanTimerTask();
                        PBSyncManagerService.this.SendOneStepDownloadIntent();
                        if (PBSyncManagerService.this.m_rPBInfo.u4RecordNum > PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath]) {
                            PBSyncManagerService.this.printLog("pullVcardEntry(" + PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath] + ") OK");
                            access$1700 = PBSyncManagerService.this.mCurDwnNumIdx;
                            i2 = PBSyncManagerService.this.m_eCompPath;
                            access$1700[i2] = access$1700[i2] + 1;
                            try {
                                PBSyncManagerService.this.SendTimerTask(2);
                                PBSyncManagerService.this.mPbapClient.pbapPullVcardEntry(PBSyncManagerService.this.mJniVcard, PBSyncManagerService.this.mCurDwnNumIdx[PBSyncManagerService.this.m_eCompPath]);
                                return;
                            } catch (RemoteException e) {
                                e.printStackTrace();
                                return;
                            }
                        }
                        PBSyncManagerService.this.cleanTimerTask();
                        PBSyncManagerService.this.SendRemainDownloadIntent();
                        Log.d(PBSyncManagerService.TAG, "[getvcardEntry] subpath finish OK");
                        PBSyncManagerService.this.NextProccessAfterDownloadSuccess();
                        return;
                    } else {
                        PBSyncManagerService.this.cleanTimerTask();
                        if (PBSyncManagerService.DEBUG) {
                            Log.e(PBSyncManagerService.TAG, "[getvcardEntry] parse Vcard failed, need to check code!");
                        }
                        PBSyncManagerService.this.m_eResultType = 1;
                        PBSyncManagerService.this.RemoveConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    }
                case 110:
                    PBSyncManagerService.this.printLog("PBMGR_DISCONNECT_CNF m_bStopDwLd = " + PBSyncManagerService.m_bStopDwLd);
                    PBSyncManagerService.this.printLog("PBMGR_DISCONNECT_CNF m_FlagGetRemoteInfo = " + PBSyncManagerService.this.m_FlagGetRemoteInfo);
                    if (PBSyncManagerService.this.m_CurUsingProfile == 3) {
                        try {
                            Thread.sleep(500);
                        } catch (InterruptedException e2) {
                            e2.printStackTrace();
                        }
                    }
                    if (PBSyncManagerService.m_bStopDwLd) {
                        PBSyncManagerService.this.sendServiceMsg(112, null);
                        return;
                    }
                    result = Boolean.parseBoolean(msg.obj.toString());
                    if (!result && PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "disconnect profile " + PBSyncManagerService.this.m_CurUsingProfile + " error");
                    }
                    if (PBSyncManagerService.this.mbSppConnectAgain) {
                        if (PBSyncManagerService.DEBUG) {
                            Log.d(PBSyncManagerService.TAG, "[PBSync]connect spp try again!");
                        }
                        PBSyncManagerService.this.m_eResultType = 5;
                        PBSyncManagerService.this.CreateConnect(PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    } else if (PBSyncManagerService.this.m_CurUsingProfile == 1 && !result) {
                        PBSyncManagerService.m_bStopDwLd = true;
                        PBSyncManagerService.this.mDownLoadList.clear();
                        return;
                    } else if (PBSyncManagerService.this.m_FlagGetRemoteInfo) {
                        PBSyncManagerService.this.cleanTimerTask();
                        if (PBSyncManagerService.this.m_ResultGetRemoteInfo) {
                            PBSyncManagerService.this.m_FlagGetRemoteInfo = false;
                            PBSyncManagerService.this.m_eState = 0;
                            PBSyncManagerService.this.MsgLoop();
                            return;
                        } else if (PBSyncManagerService.this.m_GetRemoteInfoConnIdx < PBSyncManagerService.this.m_GetRemoteInfoConnTypeCnt - 1) {
                            PBSyncManagerService.this.m_GetRemoteInfoConnIdx = PBSyncManagerService.this.m_GetRemoteInfoConnIdx + 1;
                            PBSyncManagerService.this.m_CurUsingProfile = PBSyncManagerService.this.m_GetRemoteInfoConnProfile[PBSyncManagerService.this.m_GetRemoteInfoConnIdx];
                            PBSyncManagerService.this.SendTimerTask(1);
                            PBSyncManagerService.this.CreateConnect(PBSyncManagerService.this.m_CurUsingProfile);
                            return;
                        } else {
                            PBSyncManagerService.this.m_FlagGetRemoteInfo = false;
                            PBSyncManagerService.this.m_eState = 0;
                            PBSyncManagerService.this.MsgLoop();
                            return;
                        }
                    } else if (PBSyncManagerService.this.m_eResultType == 0 || PBSyncManagerService.this.ServiceGetRecCnt(PBSyncManagerService.this.m_BTAddr, PBSyncManagerService.this.m_eCompPath) > 0) {
                        PBSyncManagerService.this.m_bSupportFloder[PBSyncManagerService.this.m_eCompPath] = 0;
                        PBSyncManagerService.this.TryDownloadNextPath();
                        return;
                    } else if (1 == PBSyncManagerService.this.m_eResultType) {
                        PBSyncManagerService.this.m_tryProfileIndex = PBSyncManagerService.this.m_tryProfileIndex + 1;
                        while (PBSyncManagerService.this.m_tryProfileIndex < 4 && PBSyncManagerService.this.m_aeConnProfile[PBSyncManagerService.this.m_tryProfileIndex] == 0) {
                            PBSyncManagerService.this.m_tryProfileIndex = PBSyncManagerService.this.m_tryProfileIndex + 1;
                        }
                        if (PBSyncManagerService.this.m_tryProfileIndex >= 4) {
                            if (PBSyncManagerService.DEBUG) {
                                Log.e(PBSyncManagerService.TAG, "all profiles have been tryed, sub path " + PBSyncManagerService.this.m_CurDwnIndex[PBSyncManagerService.this.m_eCompPath] + " could not download");
                            }
                            PBSyncManagerService.this.TryDownloadNextPath();
                            return;
                        } else if (PBSyncManagerService.this.m_aeConnProfile[PBSyncManagerService.this.m_tryProfileIndex] != 0) {
                            PBSyncManagerService.this.m_CurUsingProfile = PBSyncManagerService.this.m_aeConnProfile[PBSyncManagerService.this.m_tryProfileIndex];
                            PBSyncManagerService.this.m_eResultType = 5;
                            PBSyncManagerService.this.CreateConnect(PBSyncManagerService.this.m_CurUsingProfile);
                            return;
                        } else {
                            return;
                        }
                    } else {
                        return;
                    }
                case 112:
                    PBSyncManagerService.this.cleanTimerTask();
                    PBSyncManagerService.this.cleanEntireTimerTask();
                    PBSyncManagerService.this.SendStopDownloadIntent();
                    PBSyncManagerService.this.m_eState = 0;
                    if (true == PBSyncManagerService.this.mTryDwnldNextFolder) {
                        PBSyncManagerService.this.m_eState = 0;
                        PBSyncManagerService.this.MsgLoop();
                        return;
                    }
                    PBSyncManagerService.this.mSyncState = 0;
                    if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "PBMGR_STOP_DOWNLOAD mSyncState=" + PBSyncManagerService.this.mSyncState);
                        return;
                    }
                    return;
                case SppService.SPP_STATE_CHANGE /*10000*/:
                    PBSyncManagerService.this.printLog("MESSAGE_STATE_CHANGE: " + msg.arg1);
                    if (PBSyncManagerService.this.m_CurUsingProfile == 3) {
                        switch (msg.arg1) {
                            case 0:
                                PBSyncManagerService.this.printLog("[SPP] SPP state none");
                                PBSyncManagerService.this.m_SPPconnected = 0;
                                PBSyncManagerService.this.sendServiceMsg(110, Boolean.valueOf(true));
                                return;
                            case 1:
                                PBSyncManagerService.this.printLog("[SPP] SPP connecting");
                                PBSyncManagerService.this.m_SPPconnected = 0;
                                return;
                            case 2:
                                PBSyncManagerService.this.m_SPPconnected = 1;
                                PBSyncManagerService.this.printLog("[SPP] SPP connected");
                                PBSyncManagerService.this.sendServiceMsg(PBSyncManagerService.PBMGR_CREATE_CONNECT_RES, Boolean.valueOf(true));
                                return;
                            case 3:
                                PBSyncManagerService.this.printLog("[SPP] SPP connect failed");
                                PBSyncManagerService.this.m_SPPconnected = 0;
                                PBSyncManagerService.this.m_sppConnectionFailed = true;
                                PBSyncManagerService.this.sendServiceMsg(PBSyncManagerService.PBMGR_CREATE_CONNECT_RES, Boolean.valueOf(false));
                                return;
                            case 4:
                                PBSyncManagerService.m_bStopDwLd = true;
                                PBSyncManagerService.this.mDownLoadList.clear();
                                PBSyncManagerService.this.cleanTimerTask();
                                PBSyncManagerService.this.sendServiceMsg(112, null);
                                return;
                            default:
                                return;
                        }
                    } else if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "[SPP] Current Using Profile is not SPP! This is SMS message! m_CurUsingProfile = " + PBSyncManagerService.this.m_CurUsingProfile);
                        return;
                    } else {
                        return;
                    }
                case 10001:
                    if (PBSyncManagerService.this.m_CurUsingProfile == 3) {
                        sRespond = msg.getData().getString("AT_Respond");
                        PBSyncManagerService.this.printLog("[SPP] SPP recieve respond:" + sRespond);
                        PBSyncManagerService.this.mATParser.setRespondString(sRespond);
                        PBSyncManagerService.this.ParseRespond();
                        return;
                    } else if (PBSyncManagerService.DEBUG) {
                        Log.e(PBSyncManagerService.TAG, "[SPP] Current Using Profile is not SPP! This is SMS message!");
                        return;
                    } else {
                        return;
                    }
                case BluetoothHfAtPhonebook.HFP_RECIEVE_RESPOND /*11000*/:
                    sRespond = msg.getData().getString("AT_Respond");
                    PBSyncManagerService.this.printLog("[HFP] HFP recieve respond:" + sRespond);
                    PBSyncManagerService.this.printLog("worker thread " + Thread.currentThread().getId());
                    PBSyncManagerService.this.mATParser.setRespondString(sRespond);
                    PBSyncManagerService.this.ParseRespond();
                    return;
                default:
                    return;
            }
        }
    }

    private void SendTimerTask(int timer_type) {
        printLog("[PBSync]SendTimerTask = " + timer_type + " " + Thread.currentThread().getId());
        if (this.mServiceHandler != null) {
            if (this.mTimer == null) {
                this.mTimer = new Timer();
            }
            if (2 == timer_type) {
                this.mTimerTask = new C00071();
                this.mTimer.schedule(this.mTimerTask, 60000);
            } else if (1 == timer_type) {
                this.mTimerTask = new C00082();
                this.mTimer.schedule(this.mTimerTask, 5000);
            } else if (3 == timer_type) {
                this.mTimerTask = new C00093();
                this.mTimer.schedule(this.mTimerTask, 5000);
            } else if (4 == timer_type) {
                this.mTimerTask = new C00104();
                this.mTimer.schedule(this.mTimerTask, 5000);
            } else if (5 == timer_type) {
                this.mTimerTask = new C00115();
                this.mTimer.schedule(this.mTimerTask, 5000);
            } else if (6 == timer_type) {
                this.mTimerTask = new C00126();
                this.mTimer.schedule(this.mTimerTask, 5000);
            } else if (8 == timer_type) {
                this.mTimerTask = new C00137();
                this.mTimer.schedule(this.mTimerTask, 5000);
            } else if (9 == timer_type) {
                this.mTimerTask = new C00148();
                this.mTimer.schedule(this.mTimerTask, 15000);
            } else if (12 == timer_type) {
                this.mTimerTask = new C00159();
                this.mTimer.schedule(this.mTimerTask, 5000);
            }
        }
    }

    private void cleanTimerTask() {
        if (DEBUG) {
            Log.i(TAG, "cleanTimerTask " + Thread.currentThread().getId());
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

    private void SendEntireTimerTask() {
        if (DEBUG) {
            Log.i(TAG, "SendEntireTimerTask " + Thread.currentThread().getId());
        }
        if (this.mEntireTimer == null) {
            this.mEntireTimer = new Timer();
        }
        this.mEntireTimerTask = new TimerTask() {
            public void run() {
                if (PBSyncManagerService.this.mServiceHandler != null) {
                    Message message = new Message();
                    message.what = 0;
                    PBSyncManagerService.this.mServiceHandler.sendMessage(message);
                    return;
                }
                Log.i(PBSyncManagerService.TAG, "SendEntireTimerTask, mServiceHandler == null");
            }
        };
        this.mEntireTimer.schedule(this.mEntireTimerTask, this.mDownloadTimeout);
    }

    private void cleanEntireTimerTask() {
        if (DEBUG) {
            Log.i(TAG, "cleanEntireTimerTask " + Thread.currentThread().getId());
        }
        if (this.mEntireTimerTask != null) {
            this.mEntireTimerTask.cancel();
            this.mEntireTimerTask = null;
        }
        if (this.mEntireTimer != null) {
            this.mEntireTimer.cancel();
            this.mEntireTimer.purge();
            this.mEntireTimer = null;
        }
    }

    private void TryDownloadNextPath() {
        if (this.m_CurDwnIndex[this.m_eCompPath] < 14) {
            int[] iArr = this.m_CurDwnIndex;
            int i = this.m_eCompPath;
            iArr[i] = iArr[i] + 1;
        }
        while (this.m_CurDwnIndex[this.m_eCompPath] < 14) {
            int iCurPath = 1 << this.m_CurDwnIndex[this.m_eCompPath];
            if ((this.m_u4DwnPaths & iCurPath) != 0 && (this.m_rSptPath & iCurPath) != 0) {
                break;
            }
            iArr = this.m_CurDwnIndex;
            i = this.m_eCompPath;
            iArr[i] = iArr[i] + 1;
        }
        this.mCurDwnNumIdx[this.m_eCompPath] = -1;
        if (this.m_CurDwnIndex[this.m_eCompPath] == 14) {
            printLog("[PbSync] download completed : " + this.m_eCompPath);
            this.m_eDwnldResult[this.m_eCompPath] = 0;
            WritePauseInfo();
            this.m_CurPathStatus[this.m_eCompPath] = 0;
            Editor sharedata = getSharedPreferences("pause_data", 0).edit();
            sharedata.putInt("CurPathStatus" + this.m_eCompPath, this.m_CurPathStatus[this.m_eCompPath]);
            sharedata.commit();
            this.m_dbAdapter.flushPhonebookTable();
            cleanEntireTimerTask();
            Intent finishIntent = new Intent();
            finishIntent.setAction(ACTION_DOWNLOAD_FINISH);
            finishIntent.putExtra(EXTRA_PBSYNC_FOLDER, this.m_eCompPath);
            if (this.m_bSupportFloder[this.m_eCompPath] == 0) {
                finishIntent.putExtra(EXTRA_PBSYNC_SUPPORT_FOLDER, true);
            } else {
                finishIntent.putExtra(EXTRA_PBSYNC_SUPPORT_FOLDER, false);
            }
            sendBroadcast(finishIntent);
            this.m_eState = 0;
            MsgLoop();
            return;
        }
        WritePauseInfo();
        if (this.m_eConnType[this.m_eCompPath] == 0) {
            this.m_CurUsingProfile = GetFirstSelectProfile();
        } else {
            this.m_CurUsingProfile = this.m_eConnType[this.m_eCompPath];
        }
        this.m_aeConnProfile[0] = this.m_CurUsingProfile;
        this.m_aeConnProfile[this.m_CurUsingProfile] = 0;
        this.m_tryProfileIndex = 0;
        this.m_eResultType = 5;
        CreateConnect(this.m_CurUsingProfile);
    }

    private void SendOneStepDownloadIntent() {
        if (this.m_u4PBRecCnt[this.m_CurDwnIndex[this.m_eCompPath]] >= this.m_u4PBIndicateCnt[this.m_CurDwnIndex[this.m_eCompPath]] + this.m_u4IndStep) {
            Intent intent = new Intent();
            intent.setAction(ACTION_DOWNLOAD_ONESTEP);
            intent.putExtra(EXTRA_PBSYNC_FOLDER, this.m_eCompPath);
            intent.putExtra(EXTRA_PBSYNC_ONESTEP_COUNT, this.m_u4IndStep);
            int[] iArr = this.m_u4PBIndicateCnt;
            int i = this.m_CurDwnIndex[this.m_eCompPath];
            iArr[i] = iArr[i] + this.m_u4IndStep;
            sendBroadcast(intent);
        }
        if (m_bStopDwLd && this.m_u4PBRecCnt[this.m_CurDwnIndex[this.m_eCompPath]] > this.m_u4PBIndicateCnt[this.m_CurDwnIndex[this.m_eCompPath]]) {
            cleanTimerTask();
            int iNotIndicationNum = this.m_u4PBRecCnt[this.m_CurDwnIndex[this.m_eCompPath]] - this.m_u4PBIndicateCnt[this.m_CurDwnIndex[this.m_eCompPath]];
            intent = new Intent();
            intent.setAction(ACTION_DOWNLOAD_ONESTEP);
            intent.putExtra(EXTRA_PBSYNC_FOLDER, this.m_eCompPath);
            intent.putExtra(EXTRA_PBSYNC_ONESTEP_COUNT, iNotIndicationNum);
            this.m_u4PBIndicateCnt[this.m_CurDwnIndex[this.m_eCompPath]] = this.m_u4PBRecCnt[this.m_CurDwnIndex[this.m_eCompPath]];
            sendBroadcast(intent);
            printLog("Stop download, Send have download broadcast");
            RemoveConnect(this.m_CurUsingProfile);
        }
    }

    private void SendRemainDownloadIntent() {
        if (this.m_u4PBIndicateCnt[this.m_CurDwnIndex[this.m_eCompPath]] < this.m_u4PBRecCnt[this.m_CurDwnIndex[this.m_eCompPath]]) {
            int iNotIndicationNum = this.m_u4PBRecCnt[this.m_CurDwnIndex[this.m_eCompPath]] - this.m_u4PBIndicateCnt[this.m_CurDwnIndex[this.m_eCompPath]];
            Intent intent = new Intent();
            intent.setAction(ACTION_DOWNLOAD_ONESTEP);
            intent.putExtra(EXTRA_PBSYNC_FOLDER, this.m_eCompPath);
            intent.putExtra(EXTRA_PBSYNC_ONESTEP_COUNT, iNotIndicationNum);
            this.m_u4PBIndicateCnt[this.m_CurDwnIndex[this.m_eCompPath]] = this.m_u4PBRecCnt[this.m_CurDwnIndex[this.m_eCompPath]];
            sendBroadcast(intent);
        }
    }

    private void SendStopDownloadIntent() {
        Intent intent;
        WritePauseInfo();
        this.m_CurPathStatus[this.m_eCompPath] = 0;
        Editor sharedata = getSharedPreferences("pause_data", 0).edit();
        sharedata.putInt("CurPathStatus" + this.m_eCompPath, this.m_CurPathStatus[this.m_eCompPath]);
        sharedata.commit();
        printLog("m_CurPathStatus = " + this.m_CurPathStatus[this.m_eCompPath]);
        if (m_bStopDwLd && this.m_eCompPath < 8 && this.m_CurDwnIndex[this.m_eCompPath] < 14 && this.m_u4PBRecCnt[this.m_CurDwnIndex[this.m_eCompPath]] > this.m_u4PBIndicateCnt[this.m_CurDwnIndex[this.m_eCompPath]]) {
            int iNotIndicationNum = this.m_u4PBRecCnt[this.m_CurDwnIndex[this.m_eCompPath]] - this.m_u4PBIndicateCnt[this.m_CurDwnIndex[this.m_eCompPath]];
            intent = new Intent();
            intent.setAction(ACTION_DOWNLOAD_ONESTEP);
            intent.putExtra(EXTRA_PBSYNC_FOLDER, this.m_eCompPath);
            intent.putExtra(EXTRA_PBSYNC_ONESTEP_COUNT, iNotIndicationNum);
            this.m_u4PBIndicateCnt[this.m_CurDwnIndex[this.m_eCompPath]] = this.m_u4PBRecCnt[this.m_CurDwnIndex[this.m_eCompPath]];
            sendBroadcast(intent);
        }
        intent = new Intent();
        intent.setAction(ACTION_DOWNLOAD_STOP);
        intent.putExtra(EXTRA_PBSYNC_FOLDER, this.m_eCompPath);
        sendBroadcast(intent);
    }

    public boolean ServiceInit() {
        int idx;
        this.m_HFconnected = 2;
        this.m_PBAPconnected = 2;
        this.m_SPPconnected = 2;
        this.m_tryProfileIndex = 0;
        this.m_u4IndStep = 10;
        this.m_u4DwnldStep = 5;
        for (idx = 0; idx < 8; idx++) {
            this.m_eConnType[idx] = 0;
            this.m_u4TimeOut[idx] = -1;
            this.m_eDwnldResult[idx] = 5;
            this.m_bSupportFloder[idx] = 5;
            this.mCurDwnNumIdx[idx] = -1;
            this.mCurDwnCountIdx[idx] = 0;
        }
        for (idx = 0; idx < 14; idx++) {
            this.m_u4PBRecCnt[idx] = 0;
            this.m_u4PBIndicateCnt[idx] = 0;
        }
        this.m_rSptCharSets = null;
        this.m_rCurCharSet = 0;
        this.m_rPrevCharSet = 0;
        this.mCurReqDwnNum = 0;
        this.m_rPBInfo.u4MaxIndex = -1;
        this.m_rPBInfo.u4StartIdx = -1;
        this.m_rPBInfo.u4Miss = -1;
        this.m_rPBInfo.u4RecordNum = -1;
        this.m_rPBInfo.bGetRecNum = false;
        for (int i = 0; i < 4; i++) {
            this.m_aeConnProfile[i] = i;
        }
        this.m_eResultType = 5;
        this.mTryDwnldNextFolder = false;
        if (this.mHfAtPhonebook == null) {
            this.mHfAtPhonebook = BluetoothHfAtPhonebook.getInstance();
            this.mHfAtPhonebook.initializeHfAtPhonebookParser();
            this.mHfAtPhonebook.setHandler(this.mServiceHandler);
        }
        return true;
    }

    private int ServiceGetRecCnt(String btaddr, int path) {
        int u4Paths;
        int u4RecCnt = 0;
        switch (path) {
            case 0:
                u4Paths = 0 | 16;
                break;
            case 1:
                u4Paths = 0 | 32;
                break;
            case 2:
                u4Paths = 0 | 48;
                break;
            case 3:
                u4Paths = 0 | 192;
                break;
            case 4:
                u4Paths = 0 | 768;
                break;
            case 5:
                u4Paths = 0 | 3072;
                break;
            case 6:
                u4Paths = 0 | 4032;
                break;
            case 7:
                u4Paths = 0 | 4080;
                break;
            default:
                errorLog("bad path");
                return 0;
        }
        int idx;
        if (btaddr != null) {
            SharedPreferences sharedata = getSharedPreferences("pause_data", 0);
            String btoldaddr = sharedata.getString("BTADDR", BluetoothPbapClientPath.PBAP_ROOT_NAME);
            int iCurPathStatus = sharedata.getInt("CurPathStatus" + path, 0);
            int i;
            if (!btoldaddr.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME) && !btaddr.equals(btoldaddr)) {
                printLog("BTAddr is not equals!");
                for (i = 0; i < 14; i++) {
                    this.m_dbAdapter.delete(1 << i);
                }
                return 0;
            } else if (this.mbFirstCreate[path] && iCurPathStatus == 1) {
                printLog("Last downloading is stop by power off!");
                for (i = 0; i < 14; i++) {
                    if (((1 << i) & u4Paths) != 0) {
                        this.m_dbAdapter.delete(1 << i);
                        this.m_u4PBRecCnt[i] = 0;
                        printLog("[PbSync] reset subpath " + i);
                    }
                }
                return 0;
            } else {
                for (idx = 0; idx < 14; idx++) {
                    if (this.m_u4PBRecCnt[idx] == 0) {
                        this.m_u4PBRecCnt[idx] = this.m_dbAdapter.getCount(1 << idx);
                    }
                    if (((1 << idx) & u4Paths) != 0) {
                        u4RecCnt += this.m_u4PBRecCnt[idx];
                    }
                }
            }
        } else {
            for (idx = 0; idx < 14; idx++) {
                if (this.m_u4PBRecCnt[idx] == 0) {
                    this.m_u4PBRecCnt[idx] = this.m_dbAdapter.getCount(1 << idx);
                }
                if (((1 << idx) & u4Paths) != 0) {
                    u4RecCnt += this.m_u4PBRecCnt[idx];
                }
            }
        }
        printLog("GetRecCnt(" + path + ") = " + u4RecCnt);
        return u4RecCnt;
    }

    private boolean ServiceGetRecord(int path, int u4FirstIdx, int u4RecCnt, List<PBRecord> record) {
        record.clear();
        int u4RecIdx = 0;
        int iRemander = u4RecCnt;
        if (u4FirstIdx < 0) {
            return false;
        }
        if (u4RecCnt == 0) {
            return true;
        }
        int u4Paths;
        switch (path) {
            case 0:
                u4Paths = 0 | 16;
                break;
            case 1:
                u4Paths = 0 | 32;
                break;
            case 2:
                u4Paths = 0 | 48;
                break;
            case 3:
                u4Paths = 0 | 192;
                break;
            case 4:
                u4Paths = 0 | 768;
                break;
            case 5:
                u4Paths = 0 | 3072;
                break;
            case 6:
                u4Paths = 0 | 4032;
                break;
            case 7:
                u4Paths = 0 | 4080;
                break;
            default:
                return false;
        }
        int iPathFirstIdx = u4FirstIdx;
        int u4Idx = 0;
        while (u4Idx < 14) {
            int u4CurPath = 1 << u4Idx;
            printLog("m_u4PBRecCnt(" + u4CurPath + ") = " + this.m_u4PBRecCnt[u4Idx]);
            if ((u4Paths & u4CurPath) != 0 && this.m_u4PBRecCnt[u4Idx] > 0) {
                if (u4FirstIdx >= this.m_u4PBRecCnt[u4Idx] + u4RecIdx) {
                    u4RecIdx += this.m_u4PBRecCnt[u4Idx];
                } else if (u4FirstIdx + u4RecCnt <= this.m_u4PBRecCnt[u4Idx] + u4RecIdx) {
                    iStartIdx = u4FirstIdx - u4RecIdx;
                    if (iStartIdx < 0) {
                        iStartIdx = 0;
                    }
                    tmpRecord = this.m_dbAdapter.getPbRecords(u4CurPath, iStartIdx, iRemander);
                    for (i = 0; i < tmpRecord.size(); i++) {
                        record.add(tmpRecord.get(i));
                    }
                    if (record.size() == u4RecCnt) {
                        return true;
                    }
                    return false;
                } else {
                    iStartIdx = u4FirstIdx - u4RecIdx;
                    if (iStartIdx < 0) {
                        iStartIdx = 0;
                    }
                    int iNeedCnt = this.m_u4PBRecCnt[u4Idx] - iStartIdx;
                    tmpRecord = this.m_dbAdapter.getPbRecords(u4CurPath, iStartIdx, iNeedCnt);
                    for (i = 0; i < tmpRecord.size(); i++) {
                        record.add(tmpRecord.get(i));
                    }
                    iRemander -= iNeedCnt;
                    u4RecIdx += this.m_u4PBRecCnt[u4Idx];
                }
            }
            u4Idx++;
        }
        return false;
    }

    private boolean setConnType(BT_PHONE_INFO_NODE_T pclInfo) {
        if (pclInfo == null) {
            return false;
        }
        if (pclInfo.rProtocol[0].u1Protocol != 0 && pclInfo.rProtocol[1].u1Protocol != 0) {
            this.m_eConnType[0] = pclInfo.rProtocol[0].u1Protocol;
            this.m_eConnType[1] = pclInfo.rProtocol[1].u1Protocol;
            if (this.m_eConnType[0] == this.m_eConnType[1]) {
                this.m_eConnType[2] = this.m_eConnType[1];
            } else {
                this.m_eConnType[2] = 0;
            }
        } else if (pclInfo.rProtocol[0].u1Protocol != 0) {
            this.m_eConnType[0] = pclInfo.rProtocol[0].u1Protocol;
        } else if (pclInfo.rProtocol[1].u1Protocol != 0) {
            this.m_eConnType[1] = pclInfo.rProtocol[1].u1Protocol;
        }
        if (pclInfo.rProtocol[2].u1Protocol != 0) {
            this.m_eConnType[6] = pclInfo.rProtocol[2].u1Protocol;
            this.m_eConnType[3] = this.m_eConnType[6];
            this.m_eConnType[4] = this.m_eConnType[6];
            this.m_eConnType[5] = this.m_eConnType[6];
        }
        return true;
    }

    private int GetDownloadPath(int path) {
        switch (path) {
            case 0:
                return 0 | 16;
            case 1:
                return 0 | 32;
            case 2:
                return 0 | 48;
            case 3:
                return 0 | 192;
            case 4:
                return 0 | 768;
            case 5:
                return 0 | 3072;
            case 6:
                return 0 | 4032;
            case 7:
                return 0 | 4080;
            default:
                return 0;
        }
    }

    private void WritePauseInfo() {
        int i;
        Editor sharedata = getSharedPreferences("pause_data", 0).edit();
        sharedata.putString("BTADDR", this.m_BTAddr);
        sharedata.putInt("COMPath", this.m_eCompPath);
        printLog("[PauseInfo] WritePauseInfo " + Thread.currentThread().getId());
        printLog("[PauseInfo] m_BTAddr = " + this.m_BTAddr);
        printLog("[PauseInfo] m_eCompPath = " + this.m_eCompPath);
        for (i = 0; i < 14; i++) {
            sharedata.putInt("PBRecCnt" + i, this.m_u4PBRecCnt[i]);
            printLog("[PauseInfo] m_u4PBRecCnt[" + i + "] = " + this.m_u4PBRecCnt[i]);
        }
        for (i = 0; i < 8; i++) {
            sharedata.putInt("DwnldResult" + i, this.m_eDwnldResult[i]);
            sharedata.putInt("SupportFolder" + i, this.m_bSupportFloder[i]);
            sharedata.putInt("CurrentDownloadPathIndex" + i, this.m_CurDwnIndex[i]);
            sharedata.putInt("CurrentDownloadNumIndex" + i, this.mCurDwnNumIdx[i]);
            sharedata.putInt("CurrentDownloadCountIdx" + i, this.mCurDwnCountIdx[i]);
            printLog("[PauseInfo] m_eDwnldResult[" + i + "] = " + this.m_eDwnldResult[i]);
            printLog("[PauseInfo] m_bSupportFloder[" + i + "] = " + this.m_bSupportFloder[i]);
            printLog("[PauseInfo] m_CurDwnIndex[" + i + "] = " + this.m_CurDwnIndex[i]);
            printLog("[PauseInfo] mCurDwnNumIdx[" + i + "] = " + this.mCurDwnNumIdx[i]);
            printLog("[PauseInfo] mCurDwnCountIdx[" + i + "] = " + this.mCurDwnCountIdx[i]);
        }
        sharedata.commit();
    }

    private void ReadPauseInfoWithNoIntent() {
        printLog("[PauseInfo] ReadPauseInfoWithNoIntent " + Thread.currentThread().getId());
        SharedPreferences sharedata = getSharedPreferences("pause_data", 0);
        String btaddr = sharedata.getString("BTADDR", BluetoothPbapClientPath.PBAP_ROOT_NAME);
        printLog("[PauseInfo] old download Path = " + sharedata.getInt("COMPath", 0));
        int i;
        if (btaddr.equals(this.m_BTAddr)) {
            for (i = 0; i < 14; i++) {
                this.m_u4PBRecCnt[i] = sharedata.getInt("PBRecCnt" + i, 0);
                printLog("[PauseInfo] m_u4PBRecCnt[" + i + "] = " + this.m_u4PBRecCnt[i]);
            }
            for (i = 0; i < 8; i++) {
                this.m_eDwnldResult[i] = sharedata.getInt("DwnldResult" + i, 5);
                this.m_bSupportFloder[i] = sharedata.getInt("SupportFolder" + i, 5);
                this.m_CurDwnIndex[i] = sharedata.getInt("CurrentDownloadPathIndex" + i, 0);
                this.mCurDwnNumIdx[i] = sharedata.getInt("CurrentDownloadNumIndex" + i, -1);
                this.mCurDwnCountIdx[i] = sharedata.getInt("CurrentDownloadCountIdx" + i, 0);
                printLog("[PauseInfo] m_eDwnldResult[" + i + "] = " + this.m_eDwnldResult[i]);
                printLog("[PauseInfo] m_bSupportFloder[" + i + "] = " + this.m_bSupportFloder[i]);
                printLog("[PauseInfo] m_CurDwnIndex[" + i + "] = " + this.m_CurDwnIndex[i]);
                printLog("[PauseInfo] mCurDwnNumIdx[" + i + "] = " + this.mCurDwnNumIdx[i]);
                printLog("[PauseInfo] mCurDwnCountIdx[" + i + "] = " + this.mCurDwnCountIdx[i]);
            }
            return;
        }
        for (i = 0; i < 14; i++) {
            this.m_dbAdapter.delete(1 << i);
        }
    }

    private void ReadPauseInfo() {
        Intent intent = new Intent();
        intent.setAction(ACTION_STARTDOWNLOAD_POSITION);
        intent.putExtra(EXTRA_PBSYNC_FOLDER, this.m_eCompPath);
        printLog("[PauseInfo] ReadPauseInfo " + Thread.currentThread().getId());
        SharedPreferences sharedata = getSharedPreferences("pause_data", 0);
        String btaddr = sharedata.getString("BTADDR", BluetoothPbapClientPath.PBAP_ROOT_NAME);
        int path = sharedata.getInt("COMPath", 0);
        this.m_CurPathStatus[this.m_eCompPath] = sharedata.getInt("CurPathStatus" + this.m_eCompPath, 0);
        printLog("[PauseInfo] old download Path = " + path + "m_CurPathStatus = " + this.m_CurPathStatus[this.m_eCompPath]);
        int i;
        if (btaddr.equals(this.m_BTAddr)) {
            for (i = 0; i < 14; i++) {
                this.m_u4PBRecCnt[i] = sharedata.getInt("PBRecCnt" + i, 0);
                printLog("[PauseInfo] m_u4PBRecCnt[" + i + "] = " + this.m_u4PBRecCnt[i]);
            }
            for (i = 0; i < 8; i++) {
                this.m_eDwnldResult[i] = sharedata.getInt("DwnldResult" + i, 5);
                this.m_bSupportFloder[i] = sharedata.getInt("SupportFolder" + i, 5);
                this.m_CurDwnIndex[i] = sharedata.getInt("CurrentDownloadPathIndex" + i, 0);
                this.mCurDwnNumIdx[i] = sharedata.getInt("CurrentDownloadNumIndex" + i, -1);
                this.mCurDwnCountIdx[i] = sharedata.getInt("CurrentDownloadCountIdx" + i, 0);
                printLog("[PauseInfo] m_eDwnldResult[" + i + "] = " + this.m_eDwnldResult[i]);
                printLog("[PauseInfo] m_bSupportFloder[" + i + "] = " + this.m_bSupportFloder[i]);
                printLog("[PauseInfo] m_CurDwnIndex[" + i + "] = " + this.m_CurDwnIndex[i]);
                printLog("[PauseInfo] mCurDwnNumIdx[" + i + "] = " + this.mCurDwnNumIdx[i]);
                printLog("[PauseInfo] mCurDwnCountIdx[" + i + "] = " + this.mCurDwnCountIdx[i]);
            }
            if (this.m_CurDwnIndex[this.m_eCompPath] < 14) {
                this.m_u4PBIndicateCnt[this.m_CurDwnIndex[this.m_eCompPath]] = this.m_u4PBRecCnt[this.m_CurDwnIndex[this.m_eCompPath]];
            }
            if (this.m_CurPathStatus[this.m_eCompPath] == 1) {
                int iDwnPaths = GetDownloadPath(this.m_eCompPath);
                this.m_eDwnldResult[this.m_eCompPath] = 5;
                this.m_bSupportFloder[this.m_eCompPath] = 5;
                this.m_CurDwnIndex[this.m_eCompPath] = 0;
                this.mCurDwnNumIdx[this.m_eCompPath] = -1;
                this.mCurDwnCountIdx[this.m_eCompPath] = 0;
                this.m_u4PBIndicateCnt[this.m_CurDwnIndex[this.m_eCompPath]] = 0;
                for (i = 0; i < 14; i++) {
                    if (((1 << i) & iDwnPaths) != 0) {
                        this.m_dbAdapter.delete(1 << i);
                        this.m_u4PBRecCnt[i] = 0;
                        printLog("[PbSync] reset subpath " + i);
                    }
                }
                intent.putExtra(EXTRA_PBSYNC_START_POSITION, 0);
                sendBroadcast(intent);
                return;
            }
            intent.putExtra(EXTRA_PBSYNC_START_POSITION, ServiceGetRecCnt(this.m_BTAddr, this.m_eCompPath));
            sendBroadcast(intent);
            return;
        }
        for (i = 0; i < 14; i++) {
            this.m_dbAdapter.delete(1 << i);
        }
        intent.putExtra(EXTRA_PBSYNC_START_POSITION, 0);
        sendBroadcast(intent);
    }

    private void GetRemoteDeviceInfo() {
        if (this.m_BTOldAddr != null) {
            printLog("[PBSync] m_BTOldAddr = " + this.m_BTOldAddr);
        }
        if (this.m_BTAddr != null) {
            printLog("[PBSync] m_BTAddr = " + this.m_BTAddr);
        }
        if (this.m_manufoctor != null) {
            printLog("[PBSync] m_manufoctor = " + this.m_manufoctor);
        }
        if (this.m_serial != null) {
            printLog("[PBSync] m_serial = " + this.m_serial);
        }
        this.m_sppConnectionFailed = false;
        this.mbSppConnectAgain = false;
        this.mbDwnldCPBRAgain = false;
        if (this.m_BTOldAddr == null || !this.m_BTAddr.equals(this.m_BTOldAddr) || ((this.m_manufoctor == null || this.m_manufoctor.length() <= 0) && (this.m_serial == null || this.m_serial.length() <= 0))) {
            printLog("[PBSync] Need to Get Remote Device Info! " + Thread.currentThread().getId());
            this.m_manufoctor = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            this.m_serial = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            this.m_eState = 1;
            this.m_GetRemoteInfoConnProfile[0] = 2;
            this.m_GetRemoteInfoConnProfile[1] = 3;
            this.m_GetRemoteInfoConnIdx = 0;
            this.m_FlagGetRemoteInfo = true;
            this.m_ResultGetRemoteInfo = false;
            this.m_CurUsingProfile = this.m_GetRemoteInfoConnProfile[0];
            SendTimerTask(1);
            CreateConnect(this.m_CurUsingProfile);
            return;
        }
        printLog("[PBSync] Remote Device Info is no need Change!");
        this.m_FlagGetRemoteInfo = false;
        this.m_ResultGetRemoteInfo = true;
        MsgLoop();
    }

    private void MsgLoop() {
        if (1 != this.m_eState) {
            if (this.mDownLoadList.size() > 0) {
                printLog("mDownLoadList.size() = " + this.mDownLoadList.size());
                this.m_BTOldAddr = this.m_BTAddr;
                if (this.mDownLoadList.get(0) == null) {
                    printLog("MsgLoop warning! (mDownLoadList.get(0) == null)");
                    this.mDownLoadList.remove(0);
                    MsgLoop();
                    return;
                }
                int msg_type = ((DownloadListNode) this.mDownLoadList.get(0)).eMsg;
                this.m_BTAddr = ((DownloadListNode) this.mDownLoadList.get(0)).btaddr;
                this.m_eCompPath = ((DownloadListNode) this.mDownLoadList.get(0)).downloadpath;
                boolean bContinue = ((DownloadListNode) this.mDownLoadList.get(0)).bContinue;
                printLog("m_eCompPath = " + this.m_eCompPath);
                this.mDownLoadList.remove(0);
                if (msg_type == 0) {
                    this.mLastMsgType = 0;
                    ServiceInit();
                    GetRemoteDeviceInfo();
                    return;
                } else if (1 == msg_type) {
                    this.mLastMsgType = 1;
                    ServiceStartDownload(bContinue);
                    return;
                } else {
                    return;
                }
            }
            this.mSyncState = 0;
            printLog("MsgLoop() mSyncState=" + this.mSyncState);
        }
    }

    private boolean ServiceStartDownload(boolean bContinue) {
        if (this.m_eCompPath >= 8) {
            this.m_eState = 0;
            printLog("[PbSync] bad download path");
            return false;
        } else if (this.mServiceHandler == null) {
            printLog("[PbSync] mServiceHandler = null!");
            return false;
        } else {
            int i;
            ServiceInit();
            this.m_eState = 1;
            SendEntireTimerTask();
            this.m_u4DwnPaths = GetDownloadPath(this.m_eCompPath);
            for (i = 0; i < 8; i++) {
                this.m_CurDwnIndex[i] = 0;
            }
            this.mCurReqDwnNum = 0;
            this.mCurDwnNumIdx[this.m_eCompPath] = -1;
            m_bStopDwLd = false;
            this.m_CurPathStatus[this.m_eCompPath] = 0;
            if (bContinue) {
                ReadPauseInfo();
            } else {
                ReadPauseInfoWithNoIntent();
                this.m_eDwnldResult[this.m_eCompPath] = 5;
                this.m_bSupportFloder[this.m_eCompPath] = 5;
                this.m_CurDwnIndex[this.m_eCompPath] = 0;
                this.mCurDwnNumIdx[this.m_eCompPath] = -1;
                this.mCurDwnCountIdx[this.m_eCompPath] = 0;
                for (i = 0; i < 14; i++) {
                    if ((this.m_u4DwnPaths & (1 << i)) != 0) {
                        this.m_dbAdapter.delete(1 << i);
                        this.m_u4PBRecCnt[i] = 0;
                        printLog("[PbSync] reset subpath " + i);
                    }
                }
            }
            this.mbFirstCreate[this.m_eCompPath] = false;
            if (this.m_eDwnldResult[this.m_eCompPath] == 0) {
                cleanEntireTimerTask();
                Intent finishIntent = new Intent();
                finishIntent.setAction(ACTION_DOWNLOAD_FINISH);
                finishIntent.putExtra(EXTRA_PBSYNC_FOLDER, this.m_eCompPath);
                if (this.m_bSupportFloder[this.m_eCompPath] == 0) {
                    finishIntent.putExtra(EXTRA_PBSYNC_SUPPORT_FOLDER, true);
                } else {
                    finishIntent.putExtra(EXTRA_PBSYNC_SUPPORT_FOLDER, false);
                }
                sendBroadcast(finishIntent);
                this.m_eState = 0;
                if (this.mDownLoadList.size() > 0) {
                    this.mDownLoadList.remove(0);
                    MsgLoop();
                } else {
                    this.mSyncState = 0;
                }
                return true;
            }
            if (this.m_manufoctor == null || this.m_manufoctor.length() <= 0 || this.m_serial == null || this.m_serial.length() <= 0) {
                printLog("[PBSync] m_manufoctor or m_serial not get");
            } else {
                this.m_protolNd = this.m_PclFile.getPclCfgFrmList(this.m_manufoctor, this.m_serial);
            }
            this.m_CurPathStatus[this.m_eCompPath] = 1;
            Editor sharedata = getSharedPreferences("pause_data", 0).edit();
            sharedata.putInt("CurPathStatus" + this.m_eCompPath, this.m_CurPathStatus[this.m_eCompPath]);
            sharedata.putString("BTADDR", this.m_BTAddr);
            sharedata.commit();
            printLog("[ServiceStartDownload]m_CurPathStatus = " + this.m_CurPathStatus[this.m_eCompPath]);
            setConnType(this.m_protolNd);
            if (this.m_eConnType[this.m_eCompPath] == 0) {
                this.m_CurUsingProfile = GetFirstSelectProfile();
            } else {
                this.m_CurUsingProfile = this.m_eConnType[this.m_eCompPath];
            }
            if (this.m_CurUsingProfile < 4) {
                this.m_aeConnProfile[0] = this.m_CurUsingProfile;
                this.m_aeConnProfile[this.m_CurUsingProfile] = 0;
            }
            this.m_tryProfileIndex = 0;
            this.m_eResultType = 5;
            CreateConnect(this.m_CurUsingProfile);
            return true;
        }
    }

    private int GetFirstSelectProfile() {
        return 1;
    }

    private void ParseRespond() {
        BT_PB_SETLISTINFO_PARAM_T tmpList;
        switch (this.mATParser.getCurATCmd()) {
            case 2:
                cleanTimerTask();
                if (m_bStopDwLd) {
                    if (DEBUG) {
                        Log.e(TAG, "[STOP]AT_CMD_SET_ECHO");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                } else if (!this.mATParser.parseATE0()) {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] set echo error!");
                    }
                    this.m_eResultType = 1;
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                } else if (this.m_FlagGetRemoteInfo) {
                    GetFactory(this.m_CurUsingProfile);
                    return;
                } else {
                    GetSptPath(this.m_CurUsingProfile);
                    return;
                }
            case 4:
                if (m_bStopDwLd) {
                    if (DEBUG) {
                        Log.e(TAG, "[STOP]AT_CMD_GET_MANUFACTOR");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
                this.m_manufoctor = this.mATParser.parseCGMI();
                printLog("m_manufoctor = " + this.m_manufoctor);
                if (this.m_manufoctor.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME)) {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] get manufoctor error");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
                GetSerial(this.m_CurUsingProfile);
                return;
            case 5:
                if (m_bStopDwLd) {
                    if (DEBUG) {
                        Log.e(TAG, "[STOP]AT_CMD_GET_SERIAL");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
                this.m_serial = this.mATParser.parseCGMM();
                printLog("m_serial = " + this.m_serial);
                if (this.m_serial.equals("V8")) {
                    this.m_manufoctor = "MOTOROLA";
                }
                if (this.m_serial.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME)) {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] get seiral error");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
                this.m_ResultGetRemoteInfo = true;
                RemoveConnect(this.m_CurUsingProfile);
                return;
            case 7:
                if (m_bStopDwLd) {
                    if (DEBUG) {
                        Log.e(TAG, "[STOP]AT_CMD_GET_IMEI");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
                this.m_IMEI = this.mATParser.parseCGSN();
                if (this.m_IMEI.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME)) {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] get IMEI error");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
                GetFactory(this.m_CurUsingProfile);
                return;
            case 13:
                cleanTimerTask();
                if (m_bStopDwLd) {
                    if (DEBUG) {
                        Log.e(TAG, "[STOP]AT_CMD_GET_SPT_CHARSET");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                } else if (this.mATParser.ParseCSCS()) {
                    this.m_rSptCharSets = this.mATParser.getSptCharSet();
                    printLog("[ATCMD] m_rSptCharSets = " + this.m_rSptCharSets.iCharSet);
                    GetCurCharset(this.m_CurUsingProfile);
                    return;
                } else {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] get support charset error");
                    }
                    this.m_eResultType = 1;
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
            case 14:
                cleanTimerTask();
                if (m_bStopDwLd) {
                    if (DEBUG) {
                        Log.e(TAG, "[STOP]AT_CMD_GET_CUR_CHARSET");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                } else if (this.mATParser.ParseCSCS()) {
                    this.m_rCurCharSet = this.mATParser.getCurCharSet();
                    this.m_rPrevCharSet = this.m_rCurCharSet;
                    printLog("[ATCMD] m_rCurCharSet = " + this.m_rCurCharSet);
                    if (GetPreferCharset()) {
                        SetCharset(this.m_CurUsingProfile);
                        return;
                    }
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] GetPreferCharset() error");
                    }
                    this.m_eResultType = 1;
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                } else {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] get current charset error");
                    }
                    this.m_eResultType = 1;
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
            case 15:
                cleanTimerTask();
                if (m_bStopDwLd) {
                    if (DEBUG) {
                        Log.e(TAG, "[STOP]AT_CMD_SET_CUR_CHARSET");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                } else if (this.mATParser.ParseCSCS()) {
                    sendServiceMsg(PBMGR_SET_PATH, null);
                    return;
                } else {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] set current charset error");
                    }
                    this.m_eResultType = 1;
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
            case 17:
                cleanTimerTask();
                if (m_bStopDwLd) {
                    if (DEBUG) {
                        Log.e(TAG, "[STOP]AT_CMD_SET_PB_CUR_PATH");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                } else if (this.mATParser.parseCPBS()) {
                    GetPath(this.m_CurUsingProfile);
                    return;
                } else {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] get set current path error");
                    }
                    this.m_eResultType = 1;
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
            case 18:
                cleanTimerTask();
                if (m_bStopDwLd) {
                    if (DEBUG) {
                        Log.e(TAG, "[STOP]AT_CMD_GET_PB_SPT_PATH");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                } else if (this.mATParser.parseCPBS()) {
                    this.m_rSptPath = this.mATParser.getParsePath();
                    printLog("[ATCMD] support path = " + this.m_rSptPath);
                    if ((this.m_u4DwnPaths & this.m_rSptPath) != 0) {
                        GetSptCharset(this.m_CurUsingProfile);
                        return;
                    }
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] support download path is not match download path");
                    }
                    this.m_eResultType = 1;
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                } else {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] get support path error!");
                    }
                    this.m_eResultType = 1;
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
            case 19:
                cleanTimerTask();
                if (m_bStopDwLd) {
                    if (DEBUG) {
                        Log.e(TAG, "[STOP]AT_CMD_GET_PB_CUR_PATH");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                } else if (this.mATParser.parseCPBS()) {
                    tmpList = this.mATParser.getCurPath();
                    printLog("[ATCMD] CPBS() current count=" + tmpList.iRecCnt + ", max count=" + tmpList.iMaxCnt);
                    if (tmpList.iMaxCnt > 0) {
                        this.m_rPBInfo.u4MaxIndex = tmpList.iMaxCnt;
                        if (tmpList.iRecCnt == 0) {
                            this.m_rPBInfo.u4RecordNum = GetPBDefaultListSz();
                            this.m_rPBInfo.bGetRecNum = false;
                        } else {
                            this.m_rPBInfo.u4RecordNum = tmpList.iRecCnt;
                            this.m_rPBInfo.bGetRecNum = true;
                        }
                    } else {
                        this.m_rPBInfo.u4MaxIndex = -1;
                        this.m_rPBInfo.u4RecordNum = -1;
                    }
                    if (tmpList.iRecCnt == 0) {
                        this.m_rPBInfo.u4RecordNum = GetPBDefaultListSz();
                        this.m_rPBInfo.bGetRecNum = false;
                    }
                    printLog("[ARCMD] CPBS() m_rPBInfo.u4RecordNum = " + this.m_rPBInfo.u4RecordNum);
                    GetListInfo(this.m_CurUsingProfile);
                    return;
                } else {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] get current path error");
                    }
                    this.m_eResultType = 1;
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
            case 20:
                cleanTimerTask();
                if (m_bStopDwLd) {
                    if (DEBUG) {
                        Log.e(TAG, "[STOP]AT_CMD_GET_PB_LISTSIZE");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                } else if (this.mATParser.parseCPBR()) {
                    tmpList = this.mATParser.getListInfo();
                    printLog("[ATCMD] CPBR() iRecCnt= " + tmpList.iRecCnt);
                    this.m_rPBInfo.u4MaxIndex = tmpList.iMaxCnt;
                    this.m_rPBInfo.u4StartIdx = tmpList.iStartIdx;
                    if (-1 == this.mCurDwnNumIdx[this.m_eCompPath]) {
                        this.mCurDwnNumIdx[this.m_eCompPath] = this.m_rPBInfo.u4StartIdx;
                    }
                    if (this.m_rPBInfo.u4MaxIndex > this.m_rPBInfo.u4RecordNum && !this.m_rPBInfo.bGetRecNum) {
                        this.m_rPBInfo.u4RecordNum = (this.m_rPBInfo.u4MaxIndex - this.m_rPBInfo.u4StartIdx) + 1;
                    }
                    printLog("[ATCMD]Request m_rPBInfo.u4RecordNum = " + this.m_rPBInfo.u4RecordNum + " , m_rPBInfo.u4MaxIndex = " + this.m_rPBInfo.u4MaxIndex);
                    if (this.m_rPBInfo.u4RecordNum <= 0 || this.m_rPBInfo.u4MaxIndex <= 0) {
                        printLog("[ATCMD]has no record: folder = " + this.m_CurDwnIndex[this.m_eCompPath]);
                        NextProccessAfterDownloadSuccess();
                        return;
                    } else if (this.mCurDwnCountIdx[this.m_eCompPath] >= this.m_rPBInfo.u4RecordNum || this.mCurDwnNumIdx[this.m_eCompPath] > this.m_rPBInfo.u4MaxIndex) {
                        printLog("mCurDwnCountIdx[m_eCompPath] >= m_rPBInfo.u4MaxIndex or mCurDwnCountIdx[m_eCompPath] > m_rPBInfo.u4RecordNum");
                        NextProccessAfterDownloadSuccess();
                        return;
                    } else if ((this.mCurDwnNumIdx[this.m_eCompPath] + this.m_u4DwnldStep) - 1 >= this.m_rPBInfo.u4MaxIndex) {
                        GetVcard(this.m_CurUsingProfile, this.mCurDwnNumIdx[this.m_eCompPath], this.m_rPBInfo.u4MaxIndex);
                        return;
                    } else {
                        GetVcard(this.m_CurUsingProfile, this.mCurDwnNumIdx[this.m_eCompPath], (this.mCurDwnNumIdx[this.m_eCompPath] + this.m_u4DwnldStep) - 1);
                        return;
                    }
                } else {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] get pb list size error");
                    }
                    this.m_eResultType = 1;
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
            case 21:
                if (m_bStopDwLd) {
                    if (DEBUG) {
                        Log.e(TAG, "[STOP]AT_CMD_GET_PB_RECORDS");
                    }
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                } else if (this.mATParser.parseCPBR()) {
                    int[] iArr;
                    int i;
                    List<BT_PB_ADDREC_PARAM_T> tmpRecs = this.mATParser.getRecs();
                    this.mTmpDownloadCnt += tmpRecs.size();
                    PBRecord tmpPBRec = new PBRecord();
                    String tmpName = BluetoothPbapClientPath.PBAP_ROOT_NAME;
                    for (int i2 = 0; i2 < tmpRecs.size(); i2++) {
                        tmpName = PbSyncATParser.DecodeCharset(this.m_rCurCharSet, ((BT_PB_ADDREC_PARAM_T) tmpRecs.get(i2)).sName);
                        if (tmpName != null && tmpName.length() >= 2) {
                            String suffix = tmpName.substring(tmpName.length() - 2);
                            if (suffix.equals("/M") || suffix.equals("/W") || suffix.equals("/H") || suffix.equals("/O") || suffix.equals("/0")) {
                                tmpName = tmpName.substring(0, tmpName.length() - 2);
                            }
                            tmpName = tmpName.replace(" ", BluetoothPbapClientPath.PBAP_ROOT_NAME);
                        }
                        tmpPBRec.setType(1 << this.m_CurDwnIndex[this.m_eCompPath]);
                        tmpPBRec.setName(tmpName);
                        tmpPBRec.setNumber(((BT_PB_ADDREC_PARAM_T) tmpRecs.get(i2)).sNumber);
                        if (tmpPBRec.getName().equals(BluetoothPbapClientPath.PBAP_ROOT_NAME) && tmpPBRec.getNumber().equals(BluetoothPbapClientPath.PBAP_ROOT_NAME)) {
                            printLog("[ATCMD] Record name none and number none, ignore!");
                        } else if (this.m_dbAdapter.insertOneRecord(tmpPBRec, this.m_u4PBRecCnt[this.m_CurDwnIndex[this.m_eCompPath]] + 1) >= 0) {
                            iArr = this.m_u4PBRecCnt;
                            i = this.m_CurDwnIndex[this.m_eCompPath];
                            iArr[i] = iArr[i] + 1;
                            if (IsMoreThanMaxCount()) {
                                cleanTimerTask();
                                SendRemainDownloadIntent();
                                printLog("[ATCMD] current folder download enough : " + this.m_CurDwnIndex[this.m_eCompPath]);
                                NextProccessAfterDownloadSuccess();
                                return;
                            }
                        } else {
                            printLog("exsisted record:");
                        }
                        printLog(tmpPBRec.toString());
                    }
                    iArr = this.mCurDwnCountIdx;
                    i = this.m_eCompPath;
                    iArr[i] = iArr[i] + tmpRecs.size();
                    iArr = this.mCurDwnNumIdx;
                    i = this.m_eCompPath;
                    iArr[i] = iArr[i] + this.mCurReqDwnNum;
                    SendOneStepDownloadIntent();
                    printLog("[ATCMD] m_u4PBRecCnt = " + this.m_u4PBRecCnt[this.m_CurDwnIndex[this.m_eCompPath]]);
                    printLog("[ATCMD] mTmpDownloadCnt = " + this.mTmpDownloadCnt + ", mCurReqDwnNum = " + this.mCurReqDwnNum);
                    OneStepDownloadFinish();
                    return;
                } else {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] parser CPBR error, need check!");
                    }
                    this.m_eResultType = 1;
                    RemoveConnect(this.m_CurUsingProfile);
                    return;
                }
            default:
                return;
        }
    }

    private boolean IsMoreThanMaxCount() {
        printLog("IsMoreThanMaxCount :" + this.m_CurDwnIndex[this.m_eCompPath] + "," + this.m_eCompPath + "," + this.m_u4PBRecCnt[4] + "," + this.m_u4PBRecCnt[5] + this.m_u4MaxDownloadCnt[2]);
        switch (this.m_CurDwnIndex[this.m_eCompPath]) {
            case 4:
                if (this.m_eCompPath == 0) {
                    if ((this.m_u4MaxDownloadCnt[0] == -1 || this.m_u4MaxDownloadCnt[0] > this.m_u4PBRecCnt[4]) && this.m_u4MaxDownloadCnt[0] != 0) {
                        return false;
                    }
                    return true;
                } else if (2 != this.m_eCompPath) {
                    return false;
                } else {
                    if (this.m_u4MaxDownloadCnt[2] != -1) {
                        if (this.m_u4MaxDownloadCnt[2] <= this.m_u4PBRecCnt[4] + this.m_u4PBRecCnt[5] || this.m_u4MaxDownloadCnt[2] == 0) {
                            return true;
                        }
                        return false;
                    } else if (this.m_u4MaxDownloadCnt[0] == -1) {
                        return false;
                    } else {
                        if (this.m_u4MaxDownloadCnt[0] <= this.m_u4PBRecCnt[4] || this.m_u4MaxDownloadCnt[0] == 0) {
                            return true;
                        }
                        return false;
                    }
                }
            case 5:
                if (1 == this.m_eCompPath) {
                    if ((this.m_u4MaxDownloadCnt[1] == -1 || this.m_u4MaxDownloadCnt[1] > this.m_u4PBRecCnt[5]) && this.m_u4MaxDownloadCnt[1] != 0) {
                        return false;
                    }
                    return true;
                } else if (2 != this.m_eCompPath) {
                    return false;
                } else {
                    if (this.m_u4MaxDownloadCnt[2] != -1) {
                        if (this.m_u4MaxDownloadCnt[2] <= this.m_u4PBRecCnt[4] + this.m_u4PBRecCnt[5] || this.m_u4MaxDownloadCnt[2] == 0) {
                            return true;
                        }
                        return false;
                    } else if (this.m_u4MaxDownloadCnt[1] == -1) {
                        return false;
                    } else {
                        if (this.m_u4MaxDownloadCnt[1] <= this.m_u4PBRecCnt[5] || this.m_u4MaxDownloadCnt[1] == 0) {
                            return true;
                        }
                        return false;
                    }
                }
            case 6:
            case 7:
                if (3 == this.m_eCompPath) {
                    if ((this.m_u4MaxDownloadCnt[3] == -1 || this.m_u4MaxDownloadCnt[3] > this.m_u4PBRecCnt[6] + this.m_u4PBRecCnt[7]) && this.m_u4MaxDownloadCnt[3] != 0) {
                        return false;
                    }
                    return true;
                } else if (6 != this.m_eCompPath) {
                    return false;
                } else {
                    if (this.m_u4MaxDownloadCnt[6] != -1) {
                        if (this.m_u4MaxDownloadCnt[6] <= ((((this.m_u4PBRecCnt[6] + this.m_u4PBRecCnt[7]) + this.m_u4PBRecCnt[8]) + this.m_u4PBRecCnt[9]) + this.m_u4PBRecCnt[10]) + this.m_u4PBRecCnt[11] || this.m_u4MaxDownloadCnt[6] == 0) {
                            return true;
                        }
                        return false;
                    } else if (this.m_u4MaxDownloadCnt[3] == -1) {
                        return false;
                    } else {
                        if (this.m_u4MaxDownloadCnt[3] <= this.m_u4PBRecCnt[6] + this.m_u4PBRecCnt[7] || this.m_u4MaxDownloadCnt[3] == 0) {
                            return true;
                        }
                        return false;
                    }
                }
            case 8:
            case 9:
                if (4 == this.m_eCompPath) {
                    if ((this.m_u4MaxDownloadCnt[4] == -1 || this.m_u4MaxDownloadCnt[4] > this.m_u4PBRecCnt[8] + this.m_u4PBRecCnt[9]) && this.m_u4MaxDownloadCnt[4] != 0) {
                        return false;
                    }
                    return true;
                } else if (6 != this.m_eCompPath) {
                    return false;
                } else {
                    if (this.m_u4MaxDownloadCnt[6] != -1) {
                        if (this.m_u4MaxDownloadCnt[6] <= ((((this.m_u4PBRecCnt[6] + this.m_u4PBRecCnt[7]) + this.m_u4PBRecCnt[8]) + this.m_u4PBRecCnt[9]) + this.m_u4PBRecCnt[10]) + this.m_u4PBRecCnt[11] || this.m_u4MaxDownloadCnt[6] == 0) {
                            return true;
                        }
                        return false;
                    } else if (this.m_u4MaxDownloadCnt[4] == -1) {
                        return false;
                    } else {
                        if (this.m_u4MaxDownloadCnt[4] <= this.m_u4PBRecCnt[8] + this.m_u4PBRecCnt[9] || this.m_u4MaxDownloadCnt[4] == 0) {
                            return true;
                        }
                        return false;
                    }
                }
            case 10:
            case 11:
                if (5 == this.m_eCompPath) {
                    if ((this.m_u4MaxDownloadCnt[5] == -1 || this.m_u4MaxDownloadCnt[5] > this.m_u4PBRecCnt[10] + this.m_u4PBRecCnt[11]) && this.m_u4MaxDownloadCnt[5] != 0) {
                        return false;
                    }
                    return true;
                } else if (6 != this.m_eCompPath) {
                    return false;
                } else {
                    if (this.m_u4MaxDownloadCnt[6] != -1) {
                        if (this.m_u4MaxDownloadCnt[6] <= ((((this.m_u4PBRecCnt[6] + this.m_u4PBRecCnt[7]) + this.m_u4PBRecCnt[8]) + this.m_u4PBRecCnt[9]) + this.m_u4PBRecCnt[10]) + this.m_u4PBRecCnt[11] || this.m_u4MaxDownloadCnt[6] == 0) {
                            return true;
                        }
                        return false;
                    } else if (this.m_u4MaxDownloadCnt[5] == -1) {
                        return false;
                    } else {
                        if (this.m_u4MaxDownloadCnt[5] <= this.m_u4PBRecCnt[10] + this.m_u4PBRecCnt[11] || this.m_u4MaxDownloadCnt[5] == 0) {
                            return true;
                        }
                        return false;
                    }
                }
            default:
                return false;
        }
    }

    private int GetPBDefaultListSz() {
        switch (this.m_eCompPath) {
            case 0:
            case 1:
            case 2:
                return PBSyncStruct.DEFAULT_PHONEBOOK_SIZE;
            default:
                return 50;
        }
    }

    private boolean GetPreferCharset() {
        if (this.m_rCurCharSet == 0) {
            return false;
        }
        if ((this.m_rSptCharSets.iCharSet & 1) != 0) {
            this.m_rCurCharSet = 1;
            return true;
        } else if ((this.m_rSptCharSets.iCharSet & 2) != 0) {
            this.m_rCurCharSet = 2;
            return true;
        } else if ((this.m_rSptCharSets.iCharSet & 512) != 0) {
            this.m_rCurCharSet = 512;
            return true;
        } else if ((this.m_rSptCharSets.iCharSet & 4) != 0) {
            this.m_rCurCharSet = 4;
            return true;
        } else if ((this.m_rSptCharSets.iCharSet & 8) != 0) {
            this.m_rCurCharSet = 8;
            return true;
        } else if ((this.m_rSptCharSets.iCharSet & 16) != 0) {
            this.m_rCurCharSet = 16;
            return true;
        } else if ((this.m_rSptCharSets.iCharSet & 32) != 0) {
            this.m_rCurCharSet = 32;
            return true;
        } else if ((this.m_rSptCharSets.iCharSet & 64) != 0) {
            this.m_rCurCharSet = 64;
            return true;
        } else if ((this.m_rSptCharSets.iCharSet & 128) == 0) {
            return true;
        } else {
            this.m_rCurCharSet = 128;
            return true;
        }
    }

    private void CreateConnect(int profile) {
        printLog("CreateConnect(" + profile + ")");
        if (m_bStopDwLd) {
            sendServiceMsg(112, null);
            return;
        }
        this.mConnectedFlag = true;
        this.mATGen.SetCurProfile(profile);
        if (3 == profile) {
            if (this.m_sppConnectionFailed) {
                sendServiceMsg(PBMGR_CREATE_CONNECT_RES, Boolean.valueOf(false));
                if (DEBUG) {
                    Log.e(TAG, "[SPP] SPP could not connected!");
                    return;
                }
                return;
            }
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            this.mSppService.connect(this.m_BTAddr, true);
        } else if (1 == profile) {
            if (this.mPbapClient == null) {
                sendServiceMsg(PBMGR_CREATE_CONNECT_RES, Boolean.valueOf(false));
                if (DEBUG) {
                    Log.e(TAG, "[PBAP] mPbapClient is null");
                    return;
                }
                return;
            }
            try {
                this.mPbapClient.connect(this.m_remoteDevice);
            } catch (RemoteException e2) {
                e2.printStackTrace();
            }
        } else if (2 != profile) {
        } else {
            if (this.mHfAtPhonebook.isHfConnected()) {
                sendServiceMsg(PBMGR_CREATE_CONNECT_RES, Boolean.valueOf(true));
                return;
            }
            sendServiceMsg(PBMGR_CREATE_CONNECT_RES, Boolean.valueOf(false));
            if (DEBUG) {
                Log.e(TAG, "[HFP] HF profile is not connected");
            }
        }
    }

    private void SetEcho(int profile, boolean bEcho) {
        printLog("[ATCMD]SetEcho(" + profile + " , " + bEcho + ") " + Thread.currentThread().getId());
        if (3 == profile) {
            SendTimerTask(12);
            String sAT = this.mATGen.GetATSetEcho(false);
            this.mATParser.setCurATCmd(2);
            this.mSppService.write(sAT.getBytes());
        } else if (1 == profile) {
            GetSptPath(profile);
        } else if (2 != profile) {
        } else {
            if (this.m_FlagGetRemoteInfo) {
                GetFactory(profile);
            } else {
                GetSptPath(profile);
            }
        }
    }

    private void GetIMEI(int profile) {
        printLog("[ATCMD]GetIMEI(" + profile + ") " + Thread.currentThread().getId());
        String sAT;
        if (2 == profile) {
            sAT = this.mATGen.GetATGetIMEI();
            this.mATParser.setCurATCmd(7);
            if (!this.mHfAtPhonebook.sendPbAtCommand(sAT)) {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] send imei cmd fail");
                }
                m_bStopDwLd = true;
                RemoveConnect(this.m_CurUsingProfile);
            }
        } else if (3 == profile) {
            sAT = this.mATGen.GetATGetIMEI();
            this.mATParser.setCurATCmd(7);
            this.mSppService.write(sAT.getBytes());
        }
    }

    private void GetFactory(int profile) {
        printLog("[ATCMD]GetFactory(" + profile + ") " + Thread.currentThread().getId());
        String sAT;
        if (2 == profile) {
            sAT = this.mATGen.GetATGetManufactor();
            this.mATParser.setCurATCmd(4);
            this.mHfAtPhonebook.ResetPbAtResponse();
            int result = this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 20);
            try {
                Thread.sleep(200);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if (1 == result) {
                Message msg = this.mServiceHandler.obtainMessage(BluetoothHfAtPhonebook.HFP_RECIEVE_RESPOND);
                Bundle bundle = new Bundle();
                bundle.putString("AT_Respond", this.mHfAtPhonebook.ReadCGMMResponse());
                msg.setData(bundle);
                this.mHfAtPhonebook.ResetPbAtResponse();
                this.mServiceHandler.sendMessage(msg);
            } else if (3 == result) {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] hf send cgmi cmd fail");
                }
                this.m_eResultType = 1;
                m_bStopDwLd = true;
                RemoveConnect(this.m_CurUsingProfile);
            } else {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] hf send cgmi cmd response error");
                }
                this.m_eResultType = 1;
                RemoveConnect(this.m_CurUsingProfile);
            }
        } else if (3 == profile) {
            sAT = this.mATGen.GetATGetManufactor();
            this.mATParser.setCurATCmd(4);
            this.mSppService.write(sAT.getBytes());
        }
    }

    private void GetSerial(int profile) {
        printLog("[ATCMD]GetSerial(" + profile + ") " + Thread.currentThread().getId());
        String sAT;
        if (2 == profile) {
            sAT = this.mATGen.GetATGetSerial();
            this.mATParser.setCurATCmd(5);
            this.mHfAtPhonebook.ResetPbAtResponse();
            int result = this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 20);
            try {
                Thread.sleep(200);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if (1 == result) {
                Message msg = this.mServiceHandler.obtainMessage(BluetoothHfAtPhonebook.HFP_RECIEVE_RESPOND);
                Bundle bundle = new Bundle();
                bundle.putString("AT_Respond", this.mHfAtPhonebook.ReadCGMIResponse());
                msg.setData(bundle);
                this.mHfAtPhonebook.ResetPbAtResponse();
                this.mServiceHandler.sendMessage(msg);
            } else if (3 == result) {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] hf send cgmm cmd fail");
                }
                this.m_eResultType = 1;
                m_bStopDwLd = true;
                RemoveConnect(this.m_CurUsingProfile);
            } else {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] hf send cgmm cmd response error");
                }
                this.m_eResultType = 1;
                RemoveConnect(this.m_CurUsingProfile);
            }
        } else if (3 == profile) {
            sAT = this.mATGen.GetATGetSerial();
            this.mATParser.setCurATCmd(5);
            this.mSppService.write(sAT.getBytes());
        }
    }

    private void GetSptPath(int profile) {
        printLog("[ATCMD]GetSptPath(" + profile + ") " + Thread.currentThread().getId());
        SendTimerTask(3);
        String sAT;
        if (2 == profile) {
            sAT = this.mATGen.GetATPBGetSptPath();
            this.mATParser.setCurATCmd(18);
            this.mHfAtPhonebook.ResetPbAtResponse();
            int result = this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 40);
            if (1 == result) {
                Message msg = this.mServiceHandler.obtainMessage(BluetoothHfAtPhonebook.HFP_RECIEVE_RESPOND);
                Bundle bundle = new Bundle();
                bundle.putString("AT_Respond", this.mHfAtPhonebook.ReadPbAtResponse());
                msg.setData(bundle);
                this.mHfAtPhonebook.ResetPbAtResponse();
                this.mServiceHandler.sendMessage(msg);
            } else if (3 == result) {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] hf send support cmd fail");
                }
                this.m_eResultType = 1;
                m_bStopDwLd = true;
                RemoveConnect(this.m_CurUsingProfile);
            } else {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] hf send support cmd fail");
                }
                this.m_eResultType = 1;
                RemoveConnect(this.m_CurUsingProfile);
            }
        } else if (3 == profile) {
            sAT = this.mATGen.GetATPBGetSptPath();
            this.mATParser.setCurATCmd(18);
            this.mSppService.write(sAT.getBytes());
        } else if (1 == profile) {
            this.m_rSptPath = 0;
            this.m_rSptPath |= 4080;
            cleanTimerTask();
            GetSptCharset(profile);
        }
    }

    private void GetSptCharset(int profile) {
        printLog("[ATCMD]GetSptCharset(" + profile + ") " + Thread.currentThread().getId());
        SendTimerTask(4);
        String sAT;
        if (3 == profile) {
            sAT = this.mATGen.GetATGetSptCharSet();
            this.mATParser.setCurATCmd(13);
            this.mSppService.write(sAT.getBytes());
        } else if (1 == profile) {
            this.m_rSptCharSets = null;
            cleanTimerTask();
            GetCurCharset(profile);
        } else if (2 == profile) {
            sAT = this.mATGen.GetATGetSptCharSet();
            this.mATParser.setCurATCmd(13);
            if (!this.mHfAtPhonebook.sendPbAtCommand(sAT)) {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] send support charset cmd fail");
                }
                m_bStopDwLd = true;
                RemoveConnect(this.m_CurUsingProfile);
            }
        }
    }

    private void GetCurCharset(int profile) {
        printLog("[ATCMD]GetCurCharset(" + profile + ") " + Thread.currentThread().getId());
        SendTimerTask(5);
        String sAT;
        if (3 == profile) {
            sAT = this.mATGen.GetATGetCurCharSet();
            this.mATParser.setCurATCmd(14);
            this.mSppService.write(sAT.getBytes());
        } else if (1 == profile) {
            cleanTimerTask();
            this.m_rCurCharSet = 1;
            SetCharset(profile);
        } else if (2 == profile) {
            sAT = this.mATGen.GetATGetCurCharSet();
            this.mATParser.setCurATCmd(14);
            if (!this.mHfAtPhonebook.sendPbAtCommand(sAT)) {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] send current charset cmd fail");
                }
                m_bStopDwLd = true;
                RemoveConnect(this.m_CurUsingProfile);
            }
        }
    }

    private void SetCharset(int profile) {
        printLog("[ATCMD]SetCharset(" + profile + ") " + Thread.currentThread().getId());
        SendTimerTask(6);
        String sAT;
        if (3 == profile) {
            sAT = this.mATGen.GetATSetCharSet((String) this.m_rSptCharSets.mapCharSet.get(Integer.valueOf(this.m_rCurCharSet)));
            this.mATParser.setCurATCmd(15);
            this.mSppService.write(sAT.getBytes());
        } else if (1 == profile) {
            cleanTimerTask();
            sendServiceMsg(PBMGR_SET_PATH, null);
        } else if (2 == profile) {
            sAT = this.mATGen.GetATSetCharSet((String) this.m_rSptCharSets.mapCharSet.get(Integer.valueOf(this.m_rCurCharSet)));
            this.mATParser.setCurATCmd(15);
            int result = this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 40);
            if (result == 1) {
                sendServiceMsg(PBMGR_SET_PATH, null);
            } else if (3 == result) {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] hf send command current charset fail");
                }
                this.m_eResultType = 1;
                m_bStopDwLd = true;
                RemoveConnect(this.m_CurUsingProfile);
            } else {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] hf set current charset fail");
                }
                this.m_eResultType = 1;
                RemoveConnect(this.m_CurUsingProfile);
            }
        }
    }

    private boolean setPath(int profile, int path) {
        printLog("[ATCMD]setPath(" + profile + " , " + path + ") " + Thread.currentThread().getId());
        SendTimerTask(7);
        if (1 == profile) {
            try {
                this.mPbapClient.pbapSetPath(path);
                return true;
            } catch (RemoteException e) {
                e.printStackTrace();
                return true;
            }
        } else if (3 == profile) {
            sAT = this.mATGen.GetATPBSetPath(path);
            this.mATParser.setCurATCmd(17);
            this.mSppService.write(sAT.getBytes());
            return true;
        } else if (2 != profile) {
            return false;
        } else {
            sAT = this.mATGen.GetATPBSetPath(path);
            this.mATParser.setCurATCmd(17);
            int result = this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 40);
            if (1 == result) {
                GetPath(this.m_CurUsingProfile);
                return true;
            } else if (3 == result) {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] hf send command set current path fail");
                }
                this.m_eResultType = 1;
                m_bStopDwLd = true;
                RemoveConnect(this.m_CurUsingProfile);
                return true;
            } else {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] hf send command set current path fail");
                }
                this.m_eResultType = 1;
                RemoveConnect(this.m_CurUsingProfile);
                return true;
            }
        }
    }

    private void GetPath(int profile) {
        printLog("[ATCMD]GetPath(" + profile + ") " + Thread.currentThread().getId());
        SendTimerTask(8);
        if (1 == profile) {
            cleanTimerTask();
        } else if (3 == profile) {
            sAT = this.mATGen.GetATPBGetListSz();
            this.mATParser.setCurATCmd(19);
            this.mSppService.write(sAT.getBytes());
        } else if (2 == profile) {
            sAT = this.mATGen.GetATPBGetListSz();
            this.mATParser.setCurATCmd(19);
            this.mHfAtPhonebook.ResetPbAtResponse();
            int result = this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 40);
            if (1 == result) {
                Message msg = this.mServiceHandler.obtainMessage(BluetoothHfAtPhonebook.HFP_RECIEVE_RESPOND);
                Bundle bundle = new Bundle();
                bundle.putString("AT_Respond", this.mHfAtPhonebook.ReadPbAtResponse());
                msg.setData(bundle);
                this.mHfAtPhonebook.ResetPbAtResponse();
                this.mServiceHandler.sendMessage(msg);
            } else if (3 == result) {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] hf send command get current path fail");
                }
                this.m_eResultType = 1;
                m_bStopDwLd = true;
                RemoveConnect(this.m_CurUsingProfile);
            } else {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] hf send command get current path fail");
                }
                this.m_eResultType = 1;
                RemoveConnect(this.m_CurUsingProfile);
            }
        }
    }

    private boolean GetListInfo(int profile) {
        printLog("[ATCMD]GetListInfo(" + profile + ") " + Thread.currentThread().getId());
        SendTimerTask(9);
        if (1 == profile) {
            try {
                this.mPbapClient.pbapPullVcardListing();
                return true;
            } catch (RemoteException e) {
                e.printStackTrace();
                return true;
            }
        } else if (3 == profile) {
            sAT = this.mATGen.GetATPBGetListSzByCPBR();
            this.mATParser.setCurATCmd(20);
            this.mSppService.write(sAT.getBytes());
            return true;
        } else if (2 != profile) {
            return false;
        } else {
            sAT = this.mATGen.GetATPBGetListSzByCPBR();
            this.mATParser.setCurATCmd(20);
            if (this.m_serial.equals("IPHONE4,1")) {
                printLog("Iphone4S sleep begin");
                try {
                    Thread.sleep(300);
                } catch (InterruptedException e2) {
                    e2.printStackTrace();
                }
                printLog("Iphone4S sleep end");
            }
            this.mHfAtPhonebook.ResetPbAtResponse();
            if (1 == this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 100)) {
                Message msg = this.mServiceHandler.obtainMessage(BluetoothHfAtPhonebook.HFP_RECIEVE_RESPOND);
                Bundle bundle = new Bundle();
                bundle.putString("AT_Respond", this.mHfAtPhonebook.ReadPbAtResponse());
                msg.setData(bundle);
                this.mHfAtPhonebook.ResetPbAtResponse();
                this.mServiceHandler.sendMessage(msg);
                return true;
            }
            if (DEBUG) {
                Log.e(TAG, "[ATCMD] hf get pb listinfo error");
            }
            this.m_eResultType = 1;
            m_bStopDwLd = true;
            RemoveConnect(this.m_CurUsingProfile);
            return true;
        }
    }

    private boolean GetVcard(int profile, int firstIdx, int endIdx) {
        printLog("[ATCMD]GetVcard(" + profile + ", " + firstIdx + ", " + endIdx + ")");
        if (m_bStopDwLd) {
            if (DEBUG) {
                Log.e(TAG, "[STOP]AT_CMD_GET_PB_RECORDS");
            }
            RemoveConnect(this.m_CurUsingProfile);
            return false;
        }
        this.mCurReqDwnNum = (endIdx - firstIdx) + 1;
        this.mCurDwnNumIdx[this.m_eCompPath] = firstIdx;
        this.mTmpDownloadCnt = 0;
        printLog("[ATCMD]request download firstIdx = " + firstIdx + ", endIdx = " + endIdx);
        if (this.mCurReqDwnNum <= 0) {
            if (DEBUG) {
                Log.e(TAG, "[ATCMD]GetVcard firstIdx > endIdx, should never happen");
            }
            this.m_eResultType = 1;
            RemoveConnect(this.m_CurUsingProfile);
            return true;
        }
        SendTimerTask(2);
        if (1 == profile) {
            CreateSaveFile();
            if (true) {
                try {
                    this.mPbapClient.pbapPullPhonebook(this.mJniVcard, this.mCurReqDwnNum, this.mCurDwnNumIdx[this.m_eCompPath]);
                } catch (RemoteException e) {
                    e.printStackTrace();
                }
            } else {
                this.mPbapClient.pbapPullVcardEntry(this.mJniVcard, this.mCurDwnNumIdx[this.m_eCompPath]);
            }
            return true;
        } else if (3 == profile) {
            sAT = this.mATGen.GetATPBGetRecs(firstIdx, endIdx);
            this.mATParser.setCurATCmd(21);
            this.mATParser.setRespondString(BluetoothPbapClientPath.PBAP_ROOT_NAME);
            this.mSppService.write(sAT.getBytes());
            return true;
        } else if (2 != profile) {
            return false;
        } else {
            sAT = this.mATGen.GetATPBGetRecs(firstIdx, endIdx);
            this.mATParser.setCurATCmd(21);
            if (this.m_serial.equals("IPHONE4,1")) {
                printLog("Iphone4S sleep begin");
                try {
                    Thread.sleep(300);
                } catch (InterruptedException e2) {
                    e2.printStackTrace();
                }
                printLog("Iphone4S sleep end");
            }
            this.mHfAtPhonebook.ResetPbAtResponse();
            if (this.mHfAtPhonebook.sendPbAtCommandWithResult(sAT, 100) == 1) {
                this.mbDwnldCPBRAgain = false;
                Message msg = this.mServiceHandler.obtainMessage(BluetoothHfAtPhonebook.HFP_RECIEVE_RESPOND);
                Bundle bundle = new Bundle();
                bundle.putString("AT_Respond", this.mHfAtPhonebook.ReadPbAtResponse());
                msg.setData(bundle);
                this.mHfAtPhonebook.ResetPbAtResponse();
                this.mServiceHandler.sendMessage(msg);
            } else {
                if (DEBUG) {
                    Log.e(TAG, "[ATCMD] hf get pb records error");
                }
                if (!this.mbDwnldCPBRAgain && (this.mCurDwnNumIdx[this.m_eCompPath] + this.m_u4DwnldStep) - 1 >= this.m_rPBInfo.u4RecordNum && this.mCurDwnNumIdx[this.m_eCompPath] < this.m_rPBInfo.u4RecordNum) {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] try get pb records again! begin=" + this.mCurDwnNumIdx[this.m_eCompPath] + " end= " + this.m_rPBInfo.u4RecordNum);
                    }
                    this.mbDwnldCPBRAgain = true;
                    GetVcard(this.m_CurUsingProfile, this.mCurDwnNumIdx[this.m_eCompPath], this.m_rPBInfo.u4RecordNum);
                } else if (this.mbDwnldCPBRAgain) {
                    this.mbDwnldCPBRAgain = false;
                    this.m_eResultType = 1;
                    m_bStopDwLd = true;
                    RemoveConnect(this.m_CurUsingProfile);
                } else {
                    if (DEBUG) {
                        Log.e(TAG, "[ATCMD] try get pb records again2! begin=" + this.mCurDwnNumIdx[this.m_eCompPath] + " end= " + ((this.mCurDwnNumIdx[this.m_eCompPath] + this.m_u4DwnldStep) - 1));
                    }
                    this.mbDwnldCPBRAgain = true;
                    GetVcard(this.m_CurUsingProfile, this.mCurDwnNumIdx[this.m_eCompPath], (this.mCurDwnNumIdx[this.m_eCompPath] + this.m_u4DwnldStep) - 1);
                }
            }
            return true;
        }
    }

    private void RemoveConnect(int profile) {
        printLog("[ATCMD]RemoveConnect(" + profile + ") " + Thread.currentThread().getId() + "mConnectedFlag = " + this.mConnectedFlag);
        if (this.mConnectedFlag) {
            this.mConnectedFlag = false;
            if (!this.m_FlagGetRemoteInfo) {
                WritePauseInfo();
            }
            if (1 == profile) {
                if (this.mPbapClient == null) {
                    sendServiceMsg(110, Boolean.valueOf(false));
                    if (DEBUG) {
                        Log.e(TAG, "[PBAP] mPbapClient is null");
                        return;
                    }
                    return;
                }
                try {
                    this.mPbapClient.disconnect();
                } catch (RemoteException e) {
                    e.printStackTrace();
                }
            } else if (2 == profile) {
                sendServiceMsg(110, Boolean.valueOf(true));
            } else if (3 == profile) {
                this.mSppService.disconnect();
            }
        }
    }

    private void NextProccessAfterDownloadSuccess() {
        if (m_bStopDwLd) {
            if (DEBUG) {
                Log.e(TAG, "[STOP]NextProccessAfterDownloadSuccess");
            }
            RemoveConnect(this.m_CurUsingProfile);
        } else if (6 == this.m_eCompPath && this.m_CurDwnIndex[this.m_eCompPath] < 14) {
            if (DEBUG) {
                Log.d(TAG, "[ATCMD] downloading callhistory, begin the next path from SetPath() function");
            }
            r0 = this.m_CurDwnIndex;
            r1 = this.m_eCompPath;
            r0[r1] = r0[r1] + 1;
            this.mCurDwnNumIdx[this.m_eCompPath] = -1;
            this.mCurDwnCountIdx[this.m_eCompPath] = 0;
            sendServiceMsg(PBMGR_SET_PATH, null);
        } else if (2 == this.m_eCompPath && this.m_CurDwnIndex[this.m_eCompPath] < 14 && 1 == this.m_CurUsingProfile) {
            if (DEBUG) {
                Log.d(TAG, "[ATCMD] downloading all phonebook, begin the next path from SetPath() function");
            }
            r0 = this.m_CurDwnIndex;
            r1 = this.m_eCompPath;
            r0[r1] = r0[r1] + 1;
            this.mCurDwnNumIdx[this.m_eCompPath] = -1;
            this.mCurDwnCountIdx[this.m_eCompPath] = 0;
            sendServiceMsg(PBMGR_SET_PATH, null);
        } else {
            this.m_eResultType = 0;
            this.mCurDwnCountIdx[this.m_eCompPath] = 0;
            RemoveConnect(this.m_CurUsingProfile);
        }
    }

    private void NextProccessAfterDownloadFail() {
        if (6 != this.m_eCompPath || this.m_CurDwnIndex[this.m_eCompPath] >= 14) {
            this.m_eResultType = 1;
            RemoveConnect(this.m_CurUsingProfile);
            return;
        }
        if (DEBUG) {
            Log.d(TAG, "[PBAP] downloading callhistory, begin the next path from SetPath() function-fail");
        }
        int[] iArr = this.m_CurDwnIndex;
        int i = this.m_eCompPath;
        iArr[i] = iArr[i] + 1;
        this.mCurDwnNumIdx[this.m_eCompPath] = -1;
        sendServiceMsg(PBMGR_SET_PATH, null);
    }

    private void OneStepDownloadFinish() {
        cleanTimerTask();
        if (m_bStopDwLd) {
            if (DEBUG) {
                Log.e(TAG, "[STOP]OneStepDownloadFinish");
            }
            RemoveConnect(this.m_CurUsingProfile);
            return;
        }
        printLog("[ATCMD] mCurDwnNumIdx = " + this.mCurDwnNumIdx[this.m_eCompPath] + " m_rPBInfo.u4RecordNum = " + this.m_rPBInfo.u4RecordNum + " mCurDwnCountIdx = " + this.mCurDwnCountIdx[this.m_eCompPath]);
        if (this.mCurDwnCountIdx[this.m_eCompPath] >= this.m_rPBInfo.u4RecordNum || (this.m_rPBInfo.u4MaxIndex > 0 && this.mCurDwnNumIdx[this.m_eCompPath] > this.m_rPBInfo.u4MaxIndex)) {
            SendRemainDownloadIntent();
            printLog("[ATCMD] current folder download success");
            NextProccessAfterDownloadSuccess();
        } else if ((this.mCurDwnNumIdx[this.m_eCompPath] + this.m_u4DwnldStep) - 1 >= this.m_rPBInfo.u4MaxIndex) {
            GetVcard(this.m_CurUsingProfile, this.mCurDwnNumIdx[this.m_eCompPath], this.m_rPBInfo.u4MaxIndex);
        } else {
            GetVcard(this.m_CurUsingProfile, this.mCurDwnNumIdx[this.m_eCompPath], (this.mCurDwnNumIdx[this.m_eCompPath] + this.m_u4DwnldStep) - 1);
        }
    }

    private boolean parseVcard() {
        PBVcardParser vCardParser = new PBVcardParser(getApplicationContext());
        this.mVcardList.clear();
        return vCardParser.doParseVcard(this.mlocalVcard, this.mVcardList);
    }

    private void CreateSaveFile() {
        try {
            openFileOutput(this.mlocalVcard, 2).close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
    }

    public IBinder onBind(Intent intent) {
        printLog("[PBSync]Enter onBind()");
        if (IPBSyncManager.class.getName().equals(intent.getAction())) {
            return this.mManager;
        }
        return null;
    }

    public void onCreate() {
        printLog("[PBSync]Enter onCreate()");
        super.onCreate();
        this.mJniVcard = getApplicationInfo().dataDir + "/files/" + this.mlocalVcard;
        printLog("mJniVcard = " + this.mJniVcard);
        this.mHandlerThread = new HandlerThread("pbsync_thread");
        this.mHandlerThread.start();
        this.mServiceHandler = new ServiceHandler(this.mHandlerThread.getLooper());
        this.m_dbAdapter = BTDBAdapter.getInstance();
        this.m_dbAdapter.setContext(getApplicationContext());
        this.m_dbAdapter.open();
        this.m_dbAdapter.loadPhonebookTable();
        this.m_PclFile = PBSyncParsePclFile.getInstance();
        this.m_PclFile.setContext(getApplicationContext());
        this.m_PclFile.parserPclFile(PBCONFIGFILEPATH);
        if (!bindService(new Intent(IBluetoothPbapCall.class.getName()), this.mPbapClientConn, 0) && DEBUG) {
            Log.e(TAG, "Failed to bind IBluetoothPbapCall service");
        }
        if (!bindService(new Intent(this, SppService.class), this.mSppConnection, 1) && DEBUG) {
            Log.e(TAG, "Failed to bind SPP service");
        }
        for (int idx = 0; idx < 8; idx++) {
            this.m_u4MaxDownloadCnt[idx] = -1;
            this.mbFirstCreate[idx] = true;
        }
    }

    public void onDestroy() {
        printLog("Enter onDestroy()");
        this.mServiceHandler.getLooper().quit();
        this.mHandlerThread.quit();
        this.mHandlerThread = null;
        this.mServiceHandler = null;
        this.m_dbAdapter.close();
        if (this.mPbapClient != null) {
            try {
                this.mPbapClient.unregisterCallback(this.mPBCallback);
            } catch (RemoteException e) {
                if (DEBUG) {
                    Log.e(TAG, BluetoothPbapClientPath.PBAP_ROOT_NAME + e);
                }
            }
        }
        unbindService(this.mPbapClientConn);
        unbindService(this.mSppConnection);
        super.onDestroy();
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
        printLog("[PBSync] sendServiceMsg(" + what + ")");
        if (this.mServiceHandler != null) {
            Message msg = this.mServiceHandler.obtainMessage(what);
            msg.what = what;
            msg.obj = arg;
            this.mServiceHandler.sendMessage(msg);
            return;
        }
        errorLog("[PBSync]mServiceHandler is null");
    }
}
