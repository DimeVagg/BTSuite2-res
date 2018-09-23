package com.autochips.dvp;

import android.cbm.CBManager;
import android.cbm.CBManager.OnActionListener;
import android.os.Handler;
import android.os.Parcel;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;
import com.autochips.inputsource.HDMI;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Vector;

public class DvdLogicManager extends DvdManagerClient {
    private static final boolean DEBUG_DVP = true;
    private static final int DVP_CMD_ACK = 0;
    private static final int DVP_CMD_ACK_ARG2_FAIL = 0;
    private static final int DVP_CMD_ACK_ARG2_OK = 1;
    private static final int DVP_CMD_ACK_ARG_CREATE_LIST = 32;
    private static final int DVP_CMD_ACK_ARG_DIGEST = 105;
    private static final int DVP_CMD_ACK_ARG_EJECT = 2;
    private static final int DVP_CMD_ACK_ARG_FL_CLICK_ITEM = 34;
    private static final int DVP_CMD_ACK_ARG_FL_UP_LEVEL = 35;
    private static final int DVP_CMD_ACK_ARG_FUNC_MENU = 102;
    private static final int DVP_CMD_ACK_ARG_NEXT = 70;
    private static final int DVP_CMD_ACK_ARG_PBC_PAUSE = 65;
    private static final int DVP_CMD_ACK_ARG_PBC_PLAY = 64;
    private static final int DVP_CMD_ACK_ARG_PBC_SEEK = 71;
    private static final int DVP_CMD_ACK_ARG_PBC_STOP = 66;
    private static final int DVP_CMD_ACK_ARG_PREV = 69;
    private static final int DVP_CMD_ACK_ARG_RIP_STOP = 130;
    private static final int DVP_CMD_ACK_ARG_TP_COORDINATE = 128;
    private static final int DVP_CMD_AUD_SAMPLE_RATE = 164;
    private static final int DVP_CMD_CHECK_PASSWORD = 104;
    private static final int DVP_CMD_DISC_INSERT = 6;
    private static final int DVP_CMD_DISC_INSERT_AGR_HAVE_DISC = 1;
    private static final int DVP_CMD_DISC_TYPE = 4;
    private static final int DVP_CMD_EVT_DVP_SAVE_ITEM_ADDRESS = 113;
    private static final int DVP_CMD_FL_CHG_DIR = 51;
    private static final int DVP_CMD_FL_FILE_PATH = 49;
    private static final int DVP_CMD_FL_FILE_TYPE_COUNT = 56;
    private static final int DVP_CMD_FL_ITEM = 50;
    private static final int DVP_CMD_FL_LIST_INFO = 55;
    private static final int DVP_CMD_FL_MENU = 53;
    private static final int DVP_CMD_FL_TOTAL_COUNT = 48;
    private static final int DVP_CMD_FL_TYPE_COUNT_IN_DISC = 57;
    private static final int DVP_CMD_LMCLICK_ITEM_TYPE = 114;
    private static final int DVP_CMD_MPS_ERROR = 103;
    private static final int DVP_CMD_MPS_ERROR_TYPE_A_CODEC_UNSUP = 1;
    private static final int DVP_CMD_MPS_ERROR_TYPE_DRM_NOT_ALLOWED = 9;
    private static final int DVP_CMD_MPS_ERROR_TYPE_NO_AUDIO = 4;
    private static final int DVP_CMD_MPS_ERROR_TYPE_NO_VIDEO = 5;
    private static final int DVP_CMD_MPS_ERROR_TYPE_PROFILE_UNSUP = 8;
    private static final int DVP_CMD_MPS_ERROR_TYPE_V_CODEC_UNSUP = 2;
    private static final int DVP_CMD_MPS_ERROR_TYPE_V_FPS_UNSUP = 6;
    private static final int DVP_CMD_MPS_ERROR_TYPE_V_GMC_UNSUP = 7;
    private static final int DVP_CMD_MPS_ERROR_TYPE_V_RES_UNSUP = 3;
    private static final int DVP_CMD_PBC_ADO_ID3_PIC = 82;
    private static final int DVP_CMD_PBC_ADO_ID3_TXT = 81;
    private static final int DVP_CMD_PBC_ADO_ID3_TXT_ARG_ALBUM = 1;
    private static final int DVP_CMD_PBC_ADO_ID3_TXT_ARG_ARTIST = 2;
    private static final int DVP_CMD_PBC_ADO_ID3_TXT_ARG_GENRE = 3;
    private static final int DVP_CMD_PBC_ADO_ID3_TXT_ARG_TITLE = 0;
    private static final int DVP_CMD_PBC_ADO_ID3_TXT_ARG_YEAR = 4;
    private static final int DVP_CMD_PBC_ADO_LYRICS = 83;
    private static final int DVP_CMD_PBC_ANGLE = 99;
    private static final int DVP_CMD_PBC_AUDIO = 97;
    private static final int DVP_CMD_PBC_CHANNEL = 102;
    private static final int DVP_CMD_PBC_CUR_TIME = 89;
    private static final int DVP_CMD_PBC_EQ = 84;
    private static final int DVP_CMD_PBC_FILE_PATH = 101;
    private static final int DVP_CMD_PBC_FIRST_THUMBNAIL_IDX = 105;
    private static final int DVP_CMD_PBC_JPG_RESOLUTION = 86;
    private static final int DVP_CMD_PBC_JPG_ROTATE_STATE = 85;
    private static final int DVP_CMD_PBC_PBC = 100;
    private static final int DVP_CMD_PBC_PLAYING_AUDIO_IDX = 115;
    private static final int DVP_CMD_PBC_PLAYING_IDX = 91;
    private static final int DVP_CMD_PBC_PLAY_STATE = 87;
    private static final int DVP_CMD_PBC_REPEAT_MODE = 92;
    private static final int DVP_CMD_PBC_REPEAT_MODE_ARG_REPEAT_ALL = 3;
    private static final int DVP_CMD_PBC_REPEAT_MODE_ARG_REPEAT_CHAPTER = 7;
    private static final int DVP_CMD_PBC_REPEAT_MODE_ARG_REPEAT_FOLDER = 21;
    private static final int DVP_CMD_PBC_REPEAT_MODE_ARG_REPEAT_NONE = 2;
    private static final int DVP_CMD_PBC_REPEAT_MODE_ARG_REPEAT_TITLE = 6;
    private static final int DVP_CMD_PBC_REPEAT_MODE_ARG_REPEAT_TRACK = 4;
    private static final int DVP_CMD_PBC_SHUFFLE_MODE = 93;
    private static final int DVP_CMD_PBC_SHUFFLE_MODE_ARG_SHUFFLE_PLAY = 16;
    private static final int DVP_CMD_PBC_SUBTITLE = 98;
    private static final int DVP_CMD_PBC_TITLE_CHAPTER = 94;
    private static final int DVP_CMD_PBC_TITLE_CHAPTER_NUM = 95;
    private static final int DVP_CMD_PBC_TOTAL_TIME = 90;
    private static final int DVP_CMD_PBC_TRACK_NUM = 88;
    private static final int DVP_CMD_PBC_ZOOM = 106;
    private static final int DVP_CMD_PT2AP_1ST_PIC_START = 193;
    private static final int DVP_CMD_RIP_CUR_TRACK_OK = 163;
    private static final int DVP_CMD_RIP_DATA_READY = 161;
    private static final int DVP_CMD_RIP_ERROR = 165;
    private static final int DVP_CMD_RIP_PROGRESS = 162;
    private static final int DVP_CMD_RIP_TRK_LBA_LEN = 160;
    private static final int DVP_CMD_STATE = 2;
    private static final int DVP_CMD_STATE_AGR_DISC_IDENTIFIED = 6;
    private static final int DVP_CMD_STATE_AGR_DISC_INITED = 7;
    private static final int DVP_CMD_STATE_AGR_LOADING_DISC = 0;
    private static final int DVP_CMD_STATE_AGR_NO_DISC = 4;
    private static final int DVP_CMD_STATE_AGR_TRAY_CLOSING = 2;
    private static final int DVP_CMD_STATE_AGR_TRAY_ERROR = 3;
    private static final int DVP_CMD_STATE_AGR_TRAY_OPENING = 1;
    private static final int DVP_CMD_STATE_AGR_UNKNOWN_DISC = 5;
    private static final int DVP_CMD_TRAY_STATUS = 3;
    private static final int DVP_CMD_TRAY_STATUS_ARG_ERROR = 3;
    private static final int DVP_CMD_TRAY_STATUS_ARG_IN = 1;
    private static final int DVP_CMD_TRAY_STATUS_ARG_OUT = 0;
    private static final int MASK2BYTES = 192;
    private static final int MASK3BYTES = 224;
    private static final int MASKBITS = 63;
    private static final int MASKBYTE = 128;
    private static final String TAG = "DvdLogicManager";
    private static boolean fgCbmPause = false;
    private static boolean fgDvdLoadOK = false;
    private static int iType;
    private static Vector<DVP_CMD> mCmd = new Vector();
    private static DvdLogicManager mLogicManager = new DvdLogicManager();
    private static CBManager manager = null;
    private static boolean needhandlecmd = false;
    private static String sFileName;
    private int[] VcdTrack = new int[]{0, 0};
    private int[] ddplaylist = new int[]{0, 0};
    private Handler dvdPlayHandler = null;
    private int[] dvdangle = new int[]{0, 0};
    private int[] dvdaudio = new int[]{0, 0};
    private int[] dvdsubtilte = new int[]{0, 0};
    private Handler dvpListHandler = null;
    private Handler dvpServicerHandler = null;
    private Handler dvphomeHandler = null;
    private boolean fgExitGetList;
    private boolean mCbmNoLoadOkPause = false;
    private int mChapterCount = 0;
    private int mCurrentChapter = 0;
    private int mCurrentDirIndex = 0;
    private int mCurrentTime = 0;
    private int mCurrentTitle = 0;
    private int mDDPlayType = 0;
    private int mDestination = 0;
    private boolean mDeviceEnable = false;
    private int mDiscType;
    private int mDiscTypeCnt = 0;
    private int mDiscTypeNum = 0;
    private int mFileCnt = 0;
    private boolean mFrontAudioOpen = false;
    private boolean mFrontDisplayOpen = false;
    private String mId3InfoAlbum = BluetoothPbapClientPath.PBAP_ROOT_NAME;
    private String mId3InfoArtist = BluetoothPbapClientPath.PBAP_ROOT_NAME;
    private String mId3InfoGenre = BluetoothPbapClientPath.PBAP_ROOT_NAME;
    private byte[] mId3InfoPicData = null;
    private String mId3InfoTitle = BluetoothPbapClientPath.PBAP_ROOT_NAME;
    private String mId3InfoYear = BluetoothPbapClientPath.PBAP_ROOT_NAME;
    private boolean mInited = false;
    private int mInnerOp = 0;
    private int mLMClickItemType = 0;
    private int mLoadedFlag = 0;
    private OnCBMListener mOnCBMListener = null;
    private int mPicCdPlayState = 0;
    private String mPlayedFileName = BluetoothPbapClientPath.PBAP_ROOT_NAME;
    private int mPreviewPageCount = 0;
    private int mPreviewPageIndex = 0;
    private boolean mRearAudioOpen = false;
    private boolean mRearDisplayOpen = false;
    private int mRepeatMode = 0;
    private String mRestoredPath = "\\";
    private int mRipProgress = 0;
    private int mStopBySrc = 0;
    private Surface mSurface;
    private Object mSyncObj = new Object();
    private int mTitleCnt = 0;
    private int mTotalTime = 0;
    private int mVcdChannel = 0;
    private int mVcdPBC = 1;
    private boolean mWaitSeek = false;
    private int mXResolution = 0;
    private int mYResolution = 0;
    private int selecteditem = 0;

    /* renamed from: com.autochips.dvp.DvdLogicManager$1 */
    class C00801 implements OnActionListener {
        C00801() {
        }

        public int onAction(int command, int appScene, int priority) {
            Log.i(DvdLogicManager.TAG, "[dvp][framework] CBM command" + command + "param1" + appScene + "param2" + priority);
            switch (command) {
                case 3:
                case 6:
                    DvdLogicManager.this.onCbmResume();
                    if (DvdLogicManager.this.mOnCBMListener != null) {
                        DvdLogicManager.this.mOnCBMListener.onAction(2, appScene, priority);
                    }
                    if (DvdLogicManager.this.mStopBySrc == 15) {
                        Log.i(DvdLogicManager.TAG, "[dvp][framework] RDS Stop");
                        DvdLogicManager.this.sendMsgToHandle(DvdLogicManager.this.dvdPlayHandler, 301);
                        DvdLogicManager.this.sendMsgToHandle(DvdLogicManager.this.dvpListHandler, 301);
                        DvdLogicManager.this.mStopBySrc = 0;
                        break;
                    }
                    break;
                case 4:
                case 5:
                    DvdLogicManager.this.onCbmPause();
                    if (DvdLogicManager.this.mOnCBMListener != null) {
                        DvdLogicManager.this.mOnCBMListener.onAction(1, appScene, priority);
                    }
                    if (priority == 15) {
                        Log.i(DvdLogicManager.TAG, "[dvp][framework] RDS Start");
                        DvdLogicManager.this.sendMsgToHandle(DvdLogicManager.this.dvdPlayHandler, 300);
                        DvdLogicManager.this.sendMsgToHandle(DvdLogicManager.this.dvpListHandler, 300);
                        DvdLogicManager.this.mStopBySrc = 15;
                        break;
                    }
                    break;
            }
            return 0;
        }
    }

    private static class DVP_CMD {
        int arg1;
        int arg2;
        int cmd;

        public DVP_CMD(int cmd, int arg1, int arg2) {
            this.cmd = cmd;
            this.arg1 = arg1;
            this.arg2 = arg2;
        }
    }

    public static class FileInfo {
        private String absolutePath;
        private int fileItem;
        private String fileName;
        private int fileType;

        public FileInfo(int dirtype, String string, String string2, int item) {
            this.fileType = dirtype;
            this.absolutePath = string;
            this.fileName = string2;
            this.fileItem = item;
        }

        public int gettype() {
            return this.fileType;
        }

        public String getfilabsolutePath() {
            return this.absolutePath;
        }

        public String getfilename() {
            return this.fileName;
        }

        public int getfileItem() {
            return this.fileItem;
        }
    }

    private class FileItemInfo {
        public String filename;
        public int iFileType;

        public FileItemInfo(int iType, String name) {
            this.iFileType = iType;
            this.filename = name;
        }
    }

    private class HandleDVPCmdThread extends Thread {
        long time;

        private HandleDVPCmdThread() {
            this.time = System.currentTimeMillis();
        }

        public void run() {
            Log.d(DvdLogicManager.TAG, "[dvp][framework] HandleDVPCmdThread tid:" + Thread.currentThread().getId());
            while (DvdLogicManager.needhandlecmd == DvdLogicManager.DEBUG_DVP) {
                try {
                    if (DvdLogicManager.mCmd.size() > 0) {
                        DvdLogicManager.this.notifyActivity(((DVP_CMD) DvdLogicManager.mCmd.get(0)).cmd, ((DVP_CMD) DvdLogicManager.mCmd.get(0)).arg1, ((DVP_CMD) DvdLogicManager.mCmd.get(0)).arg2);
                        DvdLogicManager.mCmd.remove(0);
                    } else {
                        try {
                            sleep(1);
                        } catch (InterruptedException e) {
                        }
                    }
                } catch (Exception e2) {
                    e2.printStackTrace();
                    Log.d(DvdLogicManager.TAG, "[dvp][framework] HandleDVPCmdThread Exception...");
                    DvdLogicManager.needhandlecmd = false;
                }
            }
            Log.d(DvdLogicManager.TAG, "[dvp][framework] HandleDVPCmdThread tid[" + Thread.currentThread().getId() + "] exit!");
        }
    }

    public interface OnCBMListener {
        void onAction(int i, int i2, int i3);
    }

    public static class PlayListInfo {
        private int mCount = 0;
        private int mIndex = 0;

        public PlayListInfo(int curIdx, int count) {
            this.mIndex = curIdx;
            this.mCount = count;
        }

        public int getCurIdx() {
            return this.mIndex;
        }

        public int getCount() {
            return this.mCount;
        }
    }

    public static class PosInfo {
        private int mX = 0;
        private int mY = 0;

        public PosInfo(int x, int y) {
            this.mX = x;
            this.mY = y;
        }

        public int getX() {
            return this.mX;
        }

        public int getY() {
            return this.mY;
        }
    }

    public static class TrackInfo {
        private int mCurTrackIdx = 0;
        private int mTrackCnt = 0;

        public TrackInfo(int curTrackIdx, int trackCnt) {
            this.mCurTrackIdx = curTrackIdx;
            this.mTrackCnt = trackCnt;
        }

        public int getCurTrackIdx() {
            return this.mCurTrackIdx;
        }

        public int getTrackCount() {
            return this.mTrackCnt;
        }
    }

    private static native byte[] native_DVP_AudioInfo_GetSpectrum();

    private static native int native_DVP_AudioInfo_GetSpectrumMaxVal();

    private static native int native_DVP_AudioInfo_SetSpectrumMaxVal(byte b);

    private static native int native_DVP_ChangeCurrentDir(int i);

    private static native void native_DVP_ChangeDevice(byte b);

    private static native int native_DVP_CheckPwdResult(int i);

    private static native int native_DVP_ChooseDigitalNum(int i, int i2);

    private static native int native_DVP_CloseAudOutput(boolean z);

    private static native void native_DVP_Connect();

    private static native int native_DVP_CreateFileDatabase(int i);

    private static native int native_DVP_DVDClickMenuItem(int i);

    private static native void native_DVP_Deinit();

    private static native int native_DVP_Down();

    private static native int native_DVP_Eject();

    private static native int native_DVP_GetAudioChannelCount();

    private static native int native_DVP_GetAudioExeListType();

    private static native int native_DVP_GetAudioPlayingCntByPlayType();

    private static native int native_DVP_GetAudioPlayingDirIndex();

    private static native int native_DVP_GetAudioPlayingDirTotalAudio();

    private static native int native_DVP_GetAudioPlayingIdxByPlayType();

    private static native int native_DVP_GetAudioTrackCount();

    private static native int native_DVP_GetChapterCount();

    private static native int native_DVP_GetCurAudioEncodecode();

    private static native byte[] native_DVP_GetCurAudioId3Txt(byte b);

    private static native int native_DVP_GetCurAudioLanguage();

    private static native int native_DVP_GetCurDirAudioCount();

    private static native int native_DVP_GetCurDirPicCount();

    private static native int native_DVP_GetCurDirVideoCount();

    private static native int native_DVP_GetCurFileCount();

    private static native byte[] native_DVP_GetCurFilePath();

    private static native int native_DVP_GetCurrentAudioChannel();

    private static native int native_DVP_GetCurrentAudioIndex();

    private static native int native_DVP_GetCurrentChapter();

    private static native int native_DVP_GetCurrentDVDMenuState();

    private static native String native_DVP_GetCurrentDir();

    private static native int native_DVP_GetCurrentPBCAngle();

    private static native int native_DVP_GetCurrentSubtitle();

    private static native int native_DVP_GetCurrentTitle();

    private static native int native_DVP_GetCurrentZoomMultiple();

    private static native int native_DVP_GetDiscAudioCount();

    private static native int native_DVP_GetDiscPicCount();

    private static native int native_DVP_GetDiscVideoCount();

    private static native int native_DVP_GetDramFileItemInfo(int i);

    private static native int native_DVP_GetDuration();

    private static native int native_DVP_GetExeListType();

    private static native int native_DVP_GetFLCurDirIndex();

    private static native int native_DVP_GetFLListType();

    private static native int native_DVP_GetFileIdx();

    private static native int native_DVP_GetFileItemInfo(int i);

    private static native byte[] native_DVP_GetFirmwareVer();

    private static native byte[] native_DVP_GetId3Pic();

    private static native int native_DVP_GetJPGResolution();

    private static native int native_DVP_GetPBCAngleCount();

    private static native int native_DVP_GetPBCState();

    private static native int native_DVP_GetPBCUserMode();

    private static native int native_DVP_GetPBState();

    private static native int native_DVP_GetPlayingDirIdx();

    private static native int native_DVP_GetPlayingIdx();

    private static native int native_DVP_GetPlayingIdxByPlayType();

    private static native int native_DVP_GetRepeatMode();

    private static native int native_DVP_GetRipErrType();

    private static native int native_DVP_GetRipTrkLbaLen(int i);

    private static native byte[] native_DVP_GetServoVer();

    private static native int native_DVP_GetShuffleMode();

    private static native int native_DVP_GetSubtitleCount();

    private static native int native_DVP_GetSubtitleLanguage();

    private static native int native_DVP_GetThumbNailFirstIdx();

    private static native int native_DVP_GetTitleCount();

    private static native int native_DVP_GetTotDirCnt();

    private static native int native_DVP_GetTrackCount();

    private static native int native_DVP_GetTrayStatus();

    private static native int native_DVP_GetVCDAudioChannelCnt();

    private static native int native_DVP_GetVCDCurChannel();

    private static native int native_DVP_GotoRootMenu();

    private static native int native_DVP_GotoTitleMenu();

    private static native int native_DVP_GotoUpLevel();

    private static native int native_DVP_Init();

    private static native boolean native_DVP_Is1stPicArrival();

    private static native boolean native_DVP_IsDiscInsert();

    private static native int native_DVP_ItemClick(int i);

    private static native int native_DVP_JpegDgt_GapAndSize(byte b, byte b2, byte b3, byte b4);

    private static native int native_DVP_JpegDgt_NumAndStartPos(byte b, byte b2, byte b3, byte b4);

    private static native void native_DVP_LastMemoryClear();

    private static native void native_DVP_LastMemoryLoad();

    private static native void native_DVP_LastMerofyWrite();

    private static native int native_DVP_Left();

    private static native int native_DVP_Mix2APHWPath(boolean z);

    private static native int native_DVP_Mix2APWrChannel(boolean z);

    private static native int native_DVP_OpenAudOutput(boolean z);

    private static native int native_DVP_Pause();

    private static native int native_DVP_Play();

    private static native int native_DVP_PlayNext();

    private static native int native_DVP_PlayPrev();

    private static native int native_DVP_RearSwitch(boolean z);

    private static native int native_DVP_Right();

    private static native int native_DVP_RotateImage();

    private static native int native_DVP_SeekToTime(int i);

    private static native int native_DVP_SetBaseFileID(int i);

    private static native int native_DVP_SetDvdRegion(byte b);

    private static native int native_DVP_SetImageViewMode(int i);

    private static native int native_DVP_SetPBCState();

    private static native int native_DVP_SetPBCUserMode(byte b);

    private static native int native_DVP_SetPBMode(int i);

    private static native int native_DVP_SetRipPath(String str);

    private static native int native_DVP_SetRipSpeedMode(byte b);

    private static native int native_DVP_StartRip(int i);

    private static native int native_DVP_Stop();

    private static native int native_DVP_StopRip();

    private static native int native_DVP_SwitchAudioChannel(byte b);

    private static native int native_DVP_SwitchPBCAngle(byte b);

    private static native int native_DVP_SwitchSubtitle(int i);

    private static native int native_DVP_Up();

    private static native int native_DVP_ZoomIn();

    private static native int native_DVP_ZoomOut();

    private static native void native_setFrontSurface(Surface surface);

    static {
        System.loadLibrary("dvpjninormal");
        Log.i(TAG, "System.load(\"libdvpjninormal.so\");");
    }

    private DvdLogicManager() {
        Log.e(TAG, "DvdLogicManager()");
    }

    private void initParam() {
        Log.e(TAG, "initParam()");
        this.mDiscType = 5;
        this.mVcdChannel = 0;
        this.mVcdPBC = 1;
        this.mRepeatMode = 0;
        this.mCurrentTitle = 0;
        this.mCurrentChapter = 0;
        this.mTitleCnt = 0;
        this.mChapterCount = 0;
        this.mCurrentTime = 0;
        this.mTotalTime = 0;
        this.mDiscTypeNum = 0;
        this.mDiscTypeCnt = 0;
        this.mId3InfoTitle = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        this.mId3InfoAlbum = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        this.mId3InfoArtist = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        this.mId3InfoGenre = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        this.mId3InfoYear = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        this.mXResolution = 0;
        this.mYResolution = 0;
        this.mRipProgress = 0;
        this.mCurrentDirIndex = 0;
        this.mPicCdPlayState = 0;
        this.mPreviewPageIndex = 0;
        this.mPreviewPageCount = 0;
        this.mLMClickItemType = 0;
        this.mDDPlayType = 0;
        this.mWaitSeek = false;
    }

    protected void finalize() {
        super.finalize();
        Log.e(TAG, "finalize()");
    }

    public static DvdLogicManager getInstance() {
        if (mLogicManager == null) {
            Log.e(TAG, "[dvp][framework] getInstance failed");
        }
        return mLogicManager;
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean init(android.os.Handler r6) {
        /*
        r5 = this;
        r4 = 0;
        r1 = 1;
        r0 = 0;
        r2 = "DvdLogicManager";
        r3 = "[dvp][framework]dvp init";
        android.util.Log.i(r2, r3);
        monitor-enter(r5);
        r2 = r5.mInited;	 Catch:{ all -> 0x0048 }
        if (r2 == 0) goto L_0x0018;
    L_0x000f:
        r1 = "DvdLogicManager";
        r2 = "[dvp][framework] dvd has been inited, so fail!";
        android.util.Log.e(r1, r2);	 Catch:{ all -> 0x0048 }
        monitor-exit(r5);	 Catch:{ all -> 0x0048 }
    L_0x0017:
        return r0;
    L_0x0018:
        r2 = 1;
        r5.mInited = r2;	 Catch:{ all -> 0x0048 }
        monitor-exit(r5);	 Catch:{ all -> 0x0048 }
        fgCbmPause = r0;
        r5.mCbmNoLoadOkPause = r0;
        r5.mSurface = r4;
        r5.dvpServicerHandler = r6;
        r2 = mCmd;
        r2.clear();
        needhandlecmd = r1;
        r2 = new com.autochips.dvp.DvdLogicManager$HandleDVPCmdThread;
        r2.<init>();
        r2.start();
        r2 = -1;
        r5.selecteditem = r2;
        r5.fgExitGetList = r0;
        r2 = native_DVP_Init();
        if (r2 == 0) goto L_0x004b;
    L_0x003e:
        r1 = "DvdLogicManager";
        r2 = "[dvp][framework]dvp init fail!";
        android.util.Log.e(r1, r2);
        r5.mInited = r0;
        goto L_0x0017;
    L_0x0048:
        r0 = move-exception;
        monitor-exit(r5);	 Catch:{ all -> 0x0048 }
        throw r0;
    L_0x004b:
        native_DVP_Connect();
        r0 = "DvdLogicManager";
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r3 = "[dvp][framework] dvp init ok, FirmwareVer:";
        r2 = r2.append(r3);
        r3 = r5.getFirmwareVer();
        r2 = r2.append(r3);
        r2 = r2.toString();
        android.util.Log.i(r0, r2);
        r0 = r1;
        goto L_0x0017;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.autochips.dvp.DvdLogicManager.init(android.os.Handler):boolean");
    }

    public boolean initHomeHandle(Handler homeHandler) {
        this.dvphomeHandler = homeHandler;
        return DEBUG_DVP;
    }

    public void lastMemoryLoad() {
        Log.i(TAG, "[dvp][framework][last mem] lastMemoryLoad");
        native_DVP_LastMemoryLoad();
    }

    public void lastMerofyWrite() {
        Log.i(TAG, "[dvp][framework][last mem] lastMerofyWrite");
        native_DVP_LastMerofyWrite();
    }

    public void lastMemoryClear() {
        Log.i(TAG, "[dvp][framework][last mem] lastMemoryClear");
        native_DVP_LastMemoryClear();
    }

    public boolean enableDevice() {
        if (!request()) {
            return false;
        }
        this.mCbmNoLoadOkPause = false;
        this.mLoadedFlag = 0;
        openAudOutput(DEBUG_DVP);
        lastMemoryLoad();
        initParam();
        native_DVP_Connect();
        native_DVP_ChangeDevice((byte) 0);
        this.mDeviceEnable = DEBUG_DVP;
        return DEBUG_DVP;
    }

    public boolean disableDevice() {
        if (manager != null) {
            fgCbmPause = false;
            Log.e(TAG, "[dvp][framework] disableDevice, release cbmlistener");
            manager.release();
            manager = null;
            this.mDestination = 0;
        }
        this.mCbmNoLoadOkPause = false;
        closeAudOutput(DEBUG_DVP);
        lastMerofyWrite();
        native_DVP_ChangeDevice((byte) -1);
        this.mDeviceEnable = false;
        return DEBUG_DVP;
    }

    public void initListHandle(Handler mlisthandler) {
        this.fgExitGetList = false;
        this.dvpListHandler = mlisthandler;
    }

    public void initDvdplayhandle(Handler mDvdHandler) {
        this.dvdPlayHandler = mDvdHandler;
    }

    public void deinit() {
        synchronized (this) {
            if (this.mInited) {
                this.mInited = false;
                Log.i(TAG, "[dvp][framework] deinit");
                this.mLoadedFlag = 0;
                native_DVP_Deinit();
                this.mFrontAudioOpen = false;
                this.mFrontDisplayOpen = false;
                fgCbmPause = false;
                needhandlecmd = false;
                this.mOnCBMListener = null;
                fgDvdLoadOK = false;
                this.mCbmNoLoadOkPause = false;
                return;
            }
            Log.e(TAG, "[dvp][framework] dvd not be init, so deinit fail!");
        }
    }

    public void eject() {
        Log.i(TAG, "[dvp][framework] eject");
        int ret = native_DVP_Eject();
        if (ret != 0) {
            Log.e(TAG, "[dvp][framework] native_DVP_Eject return: " + ret);
        }
        this.selecteditem = -1;
        fgDvdLoadOK = false;
    }

    public void setFrontDisplay(SurfaceHolder sh) {
        synchronized (this.mSyncObj) {
            Surface surface;
            Log.i(TAG, "[dvp][framework] +++++++++++ setFrontDisplay");
            if (sh != null) {
                surface = sh.getSurface();
            } else {
                surface = null;
            }
            this.mSurface = surface;
            if (!fgCbmPause || this.mSurface == null) {
                Log.i(TAG, "[dvp][framework] setFrontSurface ++++++ " + surface);
                native_setFrontSurface(surface);
                return;
            }
            Log.i(TAG, "[dvp][framework] ++++++++++ fgCbmPause is true forbid to open front display");
        }
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int openFrontDisplay(boolean r8) {
        /*
        r7 = this;
        r2 = -1;
        r1 = 0;
        r3 = "DvdLogicManager";
        r4 = new java.lang.StringBuilder;
        r4.<init>();
        r5 = "[dvp][framework]  ========== openFrontDisplay(+";
        r4 = r4.append(r5);
        r4 = r4.append(r8);
        r5 = "+) =========";
        r4 = r4.append(r5);
        r4 = r4.toString();
        android.util.Log.i(r3, r4);
        r3 = r7.mSyncObj;
        monitor-enter(r3);
        r4 = r7.mFrontDisplayOpen;	 Catch:{ all -> 0x0041 }
        if (r4 == 0) goto L_0x0032;
    L_0x0027:
        if (r8 == 0) goto L_0x0032;
    L_0x0029:
        r2 = "DvdLogicManager";
        r4 = "[dvp][framework]  ========== openFrontDisplay( on before ) =========";
        android.util.Log.i(r2, r4);	 Catch:{ all -> 0x0041 }
        monitor-exit(r3);	 Catch:{ all -> 0x0041 }
    L_0x0031:
        return r1;
    L_0x0032:
        r4 = r7.mFrontDisplayOpen;	 Catch:{ all -> 0x0041 }
        if (r4 != 0) goto L_0x0044;
    L_0x0036:
        if (r8 != 0) goto L_0x0044;
    L_0x0038:
        r2 = "DvdLogicManager";
        r4 = "[dvp][framework]  ========== openFrontDisplay( close before ) =========";
        android.util.Log.i(r2, r4);	 Catch:{ all -> 0x0041 }
        monitor-exit(r3);	 Catch:{ all -> 0x0041 }
        goto L_0x0031;
    L_0x0041:
        r1 = move-exception;
        monitor-exit(r3);	 Catch:{ all -> 0x0041 }
        throw r1;
    L_0x0044:
        r7.mFrontDisplayOpen = r8;	 Catch:{ all -> 0x0041 }
        r4 = fgCbmPause;	 Catch:{ all -> 0x0041 }
        if (r4 == 0) goto L_0x0053;
    L_0x004a:
        r2 = "DvdLogicManager";
        r4 = "[dvp][framework] fgCbmPause is true forbid to open front display";
        android.util.Log.i(r2, r4);	 Catch:{ all -> 0x0041 }
        monitor-exit(r3);	 Catch:{ all -> 0x0041 }
        goto L_0x0031;
    L_0x0053:
        r4 = 1;
        r4 = r7.requestSwitch(r4, r8);	 Catch:{ all -> 0x0041 }
        if (r4 != 0) goto L_0x0064;
    L_0x005a:
        r1 = "DvdLogicManager";
        r4 = "[dvp][framework]  ========== switch fail =========";
        android.util.Log.i(r1, r4);	 Catch:{ all -> 0x0041 }
        monitor-exit(r3);	 Catch:{ all -> 0x0041 }
        r1 = r2;
        goto L_0x0031;
    L_0x0064:
        r4 = "DvdLogicManager";
        r5 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0041 }
        r5.<init>();	 Catch:{ all -> 0x0041 }
        r6 = "[dvp][framework] openFrontDisplay, on:";
        r5 = r5.append(r6);	 Catch:{ all -> 0x0041 }
        r5 = r5.append(r8);	 Catch:{ all -> 0x0041 }
        r5 = r5.toString();	 Catch:{ all -> 0x0041 }
        android.util.Log.i(r4, r5);	 Catch:{ all -> 0x0041 }
        r0 = native_DVP_Mix2APWrChannel(r8);	 Catch:{ all -> 0x0041 }
        if (r0 != 0) goto L_0x0086;
    L_0x0082:
        r0 = super.openFrontDisplay(r8);	 Catch:{ all -> 0x0041 }
    L_0x0086:
        if (r0 != 0) goto L_0x008a;
    L_0x0088:
        monitor-exit(r3);	 Catch:{ all -> 0x0041 }
        goto L_0x0031;
    L_0x008a:
        r1 = r2;
        goto L_0x0088;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.autochips.dvp.DvdLogicManager.openFrontDisplay(boolean):int");
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int openRearVideo(boolean r8) {
        /*
        r7 = this;
        r2 = -1;
        r1 = 0;
        r3 = r7.mSyncObj;
        monitor-enter(r3);
        r4 = r7.mRearDisplayOpen;	 Catch:{ all -> 0x0015 }
        if (r4 == 0) goto L_0x000d;
    L_0x0009:
        if (r8 == 0) goto L_0x000d;
    L_0x000b:
        monitor-exit(r3);	 Catch:{ all -> 0x0015 }
    L_0x000c:
        return r1;
    L_0x000d:
        r4 = r7.mRearDisplayOpen;	 Catch:{ all -> 0x0015 }
        if (r4 != 0) goto L_0x0018;
    L_0x0011:
        if (r8 != 0) goto L_0x0018;
    L_0x0013:
        monitor-exit(r3);	 Catch:{ all -> 0x0015 }
        goto L_0x000c;
    L_0x0015:
        r1 = move-exception;
        monitor-exit(r3);	 Catch:{ all -> 0x0015 }
        throw r1;
    L_0x0018:
        r7.mRearDisplayOpen = r8;	 Catch:{ all -> 0x0015 }
        r4 = fgCbmPause;	 Catch:{ all -> 0x0015 }
        if (r4 == 0) goto L_0x0027;
    L_0x001e:
        r2 = "DvdLogicManager";
        r4 = "[dvp][framework] fgCbmPause is true forbid to open front display";
        android.util.Log.i(r2, r4);	 Catch:{ all -> 0x0015 }
        monitor-exit(r3);	 Catch:{ all -> 0x0015 }
        goto L_0x000c;
    L_0x0027:
        r4 = 0;
        r4 = r7.requestSwitch(r4, r8);	 Catch:{ all -> 0x0015 }
        if (r4 != 0) goto L_0x0031;
    L_0x002e:
        monitor-exit(r3);	 Catch:{ all -> 0x0015 }
        r1 = r2;
        goto L_0x000c;
    L_0x0031:
        r4 = "DvdLogicManager";
        r5 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0015 }
        r5.<init>();	 Catch:{ all -> 0x0015 }
        r6 = "[dvp][framework] openRearVideo on/off:";
        r5 = r5.append(r6);	 Catch:{ all -> 0x0015 }
        r5 = r5.append(r8);	 Catch:{ all -> 0x0015 }
        r5 = r5.toString();	 Catch:{ all -> 0x0015 }
        android.util.Log.i(r4, r5);	 Catch:{ all -> 0x0015 }
        r0 = native_DVP_RearSwitch(r8);	 Catch:{ all -> 0x0015 }
        if (r0 != 0) goto L_0x0053;
    L_0x004f:
        r0 = super.openRearDisplay(r8);	 Catch:{ all -> 0x0015 }
    L_0x0053:
        if (r0 != 0) goto L_0x0057;
    L_0x0055:
        monitor-exit(r3);	 Catch:{ all -> 0x0015 }
        goto L_0x000c;
    L_0x0057:
        r1 = r2;
        goto L_0x0055;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.autochips.dvp.DvdLogicManager.openRearVideo(boolean):int");
    }

    public int play() {
        int ret = native_DVP_Play();
        Log.i(TAG, "[dvp][framework] play, ret" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int pause() {
        int ret = native_DVP_Pause();
        Log.i(TAG, "[dvp][framework] pause, ret: " + ret);
        return ret == 0 ? 0 : -1;
    }

    public int stop() {
        int ret = native_DVP_Stop();
        Log.i(TAG, "[dvp][framework] stop, ret: " + ret);
        return ret == 0 ? 0 : -1;
    }

    public int playPrev() {
        int ret = native_DVP_PlayPrev();
        Log.i(TAG, "[dvp][framework] playPrev, ret: " + ret);
        return ret == 0 ? 0 : -1;
    }

    public int playNext() {
        int ret = native_DVP_PlayNext();
        Log.i(TAG, "[dvp][framework] playNext, ret: " + ret);
        return ret == 0 ? 0 : -1;
    }

    public int seek(int iTime) {
        int ret = native_DVP_SeekToTime(iTime);
        Log.i(TAG, "[dvp][framework] seek, time:" + iTime + ", ret: " + ret);
        if (ret == 0) {
            this.mWaitSeek = DEBUG_DVP;
        }
        return ret == 0 ? 0 : -1;
    }

    public int itemClick(int i2Item) {
        int ret = native_DVP_ItemClick(i2Item);
        Log.i(TAG, "[dvp][framework] itemClick, item: " + i2Item + " ret: " + ret);
        return ret == 0 ? 0 : -1;
    }

    public int gotoUpLevel() {
        int ret = native_DVP_GotoUpLevel();
        Log.i(TAG, "[dvp][framework] gotoUpLevel, ret: " + ret);
        return ret == 0 ? 0 : -1;
    }

    private void onAutoPlay() {
        Log.i(TAG, "[dvp][framework] onAutoPlay, mDiscType:%d" + this.mDiscType);
        if (11 == this.mDiscType) {
            Log.i(TAG, "[dvp][framework] onAutoPlay send cmd play");
            play();
            if (this.dvpListHandler == null) {
                sendMsgToHandle(this.dvpServicerHandler, 95);
            } else {
                sendMsgToHandle(this.dvpListHandler, 95);
            }
        }
    }

    public boolean isDVP1stPicArrival() {
        boolean ret = native_DVP_Is1stPicArrival();
        Log.i(TAG, "[dvp][framework] isDVP1stPicArrival, ret: " + ret);
        return ret;
    }

    public int getPlaystate() {
        int ret = native_DVP_GetPBState();
        Log.i(TAG, "[dvp][framework] getPlaystate, ret: " + ret);
        return ret;
    }

    public int getPlayStateNew() {
        int state = -1;
        int code = getPlaystate();
        switch (code) {
            case 1:
            case 13:
            case 21:
            case 24:
                state = 0;
                break;
            case 2:
            case 11:
            case 22:
            case 23:
                state = 1;
                break;
            case 7:
                state = 2;
                break;
        }
        Log.i(TAG, "[dvp][framework] getPlayStateNew ret: " + code);
        return state;
    }

    public int setPBMode(int iPBMode) {
        int ret = native_DVP_SetPBMode(iPBMode);
        Log.i(TAG, "[dvp][framework] setPBMode, mode: " + iPBMode + " ret: " + ret);
        return ret == 0 ? 0 : -1;
    }

    public int switchAudioChannel(byte bChannelId) {
        int ret = native_DVP_SwitchAudioChannel(bChannelId);
        Log.i(TAG, "[dvp][framework] switchAudioChannel, bChannelId: " + bChannelId + " ret: " + ret);
        return ret == 0 ? 0 : -1;
    }

    public int switchPBCAngle(byte bAngle) {
        int ret = native_DVP_SwitchPBCAngle(bAngle);
        Log.i(TAG, "[dvp][framework] switchPBCAngle, bAngle:" + bAngle + " ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int createFileDatabase(int filterType) {
        int type;
        switch (filterType) {
            case 1:
                type = 2;
                break;
            case 2:
                type = 3;
                break;
            case 3:
                type = 1;
                break;
            case 6:
                type = 0;
                break;
            default:
                type = 0;
                break;
        }
        int ret = native_DVP_CreateFileDatabase(type);
        Log.i(TAG, "[dvp][framework] createFileDatabase, type: " + type + " ret:" + ret);
        if (ret == 0) {
            return 0;
        }
        return -1;
    }

    public int changeCurrentDir(int index) {
        int ret = native_DVP_ChangeCurrentDir(index);
        Log.i(TAG, "[dvp][framework] changeCurrentDir, index:" + index + " ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int getCurrentTime() {
        return this.mCurrentTime;
    }

    public String getFirmwareVer() {
        byte[] ver = native_DVP_GetFirmwareVer();
        String verStr = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        for (byte toHexString : ver) {
            String hex = Integer.toHexString(toHexString);
            if (hex.length() == 0) {
                hex = "00";
            } else if (hex.length() == 1) {
                hex = "0" + hex;
            } else if (hex.length() > 2) {
                hex = hex.substring(hex.length() - 2);
            }
            verStr = verStr + hex;
        }
        return verStr;
    }

    public String getServoVer() {
        byte[] ver = native_DVP_GetServoVer();
        String verStr = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        for (byte toHexString : ver) {
            String hex = Integer.toHexString(toHexString);
            if (hex.length() == 0) {
                hex = "00";
            } else if (hex.length() == 1) {
                hex = "0" + hex;
            } else if (hex.length() > 2) {
                hex = hex.substring(hex.length() - 2);
            }
            verStr = verStr + hex;
        }
        return verStr;
    }

    public int getCurFileCount() {
        return this.mFileCnt;
    }

    public int getThumbNailFirstIdx() {
        int ret = native_DVP_GetThumbNailFirstIdx();
        Log.i(TAG, "[dvp][framework] getThumbNailFirstIdx, ret:" + ret);
        return ret;
    }

    public String getCurrentFileName() {
        return this.mPlayedFileName;
    }

    private String navGetCurFilePath() {
        Log.i(TAG, "[dvp][framework] getCurFilePath");
        try {
            return new String(native_DVP_GetCurFilePath(), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public PlayListInfo getPlayListInfo() {
        return new PlayListInfo(this.ddplaylist[0], this.ddplaylist[1]);
    }

    public TrackInfo getAngleTrackInfo() {
        return new TrackInfo(this.dvdangle[0], this.dvdangle[1]);
    }

    public TrackInfo getAudioTrackInfo() {
        return new TrackInfo(this.dvdaudio[0], this.dvdaudio[1]);
    }

    public TrackInfo getSubtitleTrackInfo() {
        return new TrackInfo(this.dvdsubtilte[0], this.dvdsubtilte[1]);
    }

    public int getPreviewPageIndex() {
        return this.mPreviewPageIndex;
    }

    public int getPreviewPageCount() {
        return this.mPreviewPageCount;
    }

    public int getLMClickItemType() {
        return this.mLMClickItemType;
    }

    public PosInfo getResolutionPostion() {
        return new PosInfo(this.mXResolution, this.mYResolution);
    }

    public int getRipProgress() {
        return this.mRipProgress;
    }

    public int getCurrentDirIndex() {
        return this.mCurrentDirIndex;
    }

    public int getPicCdPlayState() {
        return this.mPicCdPlayState;
    }

    public int getDiscType() {
        return this.mDiscTypeNum;
    }

    public int getCurAudioLanguage() {
        int ret = native_DVP_GetCurAudioLanguage();
        Log.i(TAG, "[dvp][framework] getCurAudioLanguage, ret:" + ret);
        return ret;
    }

    private int getCurAudioEncodecode() {
        int ret = native_DVP_GetCurAudioEncodecode();
        Log.i(TAG, "[dvp][framework] getCurAudioEncodecode, ret:" + ret);
        return ret;
    }

    public int getVCDAudioChannelCount() {
        int ret = native_DVP_GetVCDAudioChannelCnt();
        Log.i(TAG, "[dvp][framework] getVCDAudioChannelCount, ret:" + ret);
        return ret;
    }

    public int getVCDCurrentAudioChannel() {
        int channel = native_DVP_GetVCDCurChannel();
        Log.i(TAG, "[dvp][framework] getVCDCurrentAudioChannel, ret:" + channel);
        return channel;
    }

    public int getAudioChannelCount() {
        int ret = native_DVP_GetAudioChannelCount();
        Log.i(TAG, "[dvp][framework] getAudioChannelCount, ret:" + ret);
        return ret;
    }

    public int getCurrentAudioChannel() {
        return this.mVcdChannel;
    }

    public int getSubtitleCount() {
        int ret = native_DVP_GetSubtitleCount();
        Log.i(TAG, "[dvp][framework] getSubtitleCount, ret:" + ret);
        return ret;
    }

    public int getCurrentSubtitle() {
        int ret = native_DVP_GetCurrentSubtitle();
        Log.i(TAG, "[dvp][framework] getCurrentSubtitle, ret:" + ret);
        return ret;
    }

    public int getSubtitleLanguage() {
        int ret = native_DVP_GetSubtitleLanguage();
        Log.i(TAG, "[dvp][framework] getSubtitleLanguage, ret:" + ret);
        return ret;
    }

    public int switchSubtitle(int index) {
        int ret = native_DVP_SwitchSubtitle(index);
        Log.i(TAG, "[dvp][framework] switchSubtitle, index:" + index + " ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int clickDVDMenuItem(int coordinate) {
        int ret = native_DVP_DVDClickMenuItem(coordinate);
        Log.i(TAG, "[dvp][framework] clickDVDMenuItem, coordinate:" + coordinate + " ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int gotoTitleMenu() {
        int ret = native_DVP_GotoTitleMenu();
        Log.i(TAG, "[dvp][framework] gotoTitleMenu, ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int getCurrentDVDMenuState() {
        int ret = native_DVP_GetCurrentDVDMenuState();
        Log.i(TAG, "[dvp][framework] getCurrentDVDMenuState, ret:" + ret);
        return ret;
    }

    public int getPlayingIdx() {
        int ret = native_DVP_GetPlayingIdx();
        Log.i(TAG, "[dvp][framework] getPlayingIdx, ret:" + ret);
        return ret;
    }

    public int getFileIdx() {
        int ret = native_DVP_GetFileIdx();
        Log.i(TAG, "[dvp][framework] getFileIdx, ret:" + ret);
        return ret;
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int openAudOutput(boolean r8) {
        /*
        r7 = this;
        r2 = -1;
        r1 = 0;
        r3 = r7.mSyncObj;
        monitor-enter(r3);
        if (r8 == 0) goto L_0x000b;
    L_0x0007:
        r4 = r7.mFrontAudioOpen;	 Catch:{ all -> 0x002a }
        if (r4 != 0) goto L_0x0011;
    L_0x000b:
        if (r8 != 0) goto L_0x0013;
    L_0x000d:
        r4 = r7.mRearAudioOpen;	 Catch:{ all -> 0x002a }
        if (r4 == 0) goto L_0x0013;
    L_0x0011:
        monitor-exit(r3);	 Catch:{ all -> 0x002a }
    L_0x0012:
        return r1;
    L_0x0013:
        if (r8 == 0) goto L_0x0018;
    L_0x0015:
        r4 = 1;
        r7.mFrontAudioOpen = r4;	 Catch:{ all -> 0x002a }
    L_0x0018:
        if (r8 != 0) goto L_0x001d;
    L_0x001a:
        r4 = 1;
        r7.mRearAudioOpen = r4;	 Catch:{ all -> 0x002a }
    L_0x001d:
        r4 = fgCbmPause;	 Catch:{ all -> 0x002a }
        if (r4 == 0) goto L_0x002d;
    L_0x0021:
        r2 = "DvdLogicManager";
        r4 = "[dvp][framework] fgCbmPause is true forbid openAudOutput";
        android.util.Log.i(r2, r4);	 Catch:{ all -> 0x002a }
        monitor-exit(r3);	 Catch:{ all -> 0x002a }
        goto L_0x0012;
    L_0x002a:
        r1 = move-exception;
        monitor-exit(r3);	 Catch:{ all -> 0x002a }
        throw r1;
    L_0x002d:
        r4 = 1;
        r4 = r7.requestSwitch(r8, r4);	 Catch:{ all -> 0x002a }
        if (r4 != 0) goto L_0x0037;
    L_0x0034:
        monitor-exit(r3);	 Catch:{ all -> 0x002a }
        r1 = r2;
        goto L_0x0012;
    L_0x0037:
        r0 = native_DVP_OpenAudOutput(r8);	 Catch:{ all -> 0x002a }
        if (r0 != 0) goto L_0x0041;
    L_0x003d:
        r0 = super.openAudOutput(r8);	 Catch:{ all -> 0x002a }
    L_0x0041:
        r4 = "DvdLogicManager";
        r5 = new java.lang.StringBuilder;	 Catch:{ all -> 0x002a }
        r5.<init>();	 Catch:{ all -> 0x002a }
        r6 = "[dvp][framework] openAudOutput, front:";
        r5 = r5.append(r6);	 Catch:{ all -> 0x002a }
        r5 = r5.append(r8);	 Catch:{ all -> 0x002a }
        r6 = " ret:";
        r5 = r5.append(r6);	 Catch:{ all -> 0x002a }
        r5 = r5.append(r0);	 Catch:{ all -> 0x002a }
        r5 = r5.toString();	 Catch:{ all -> 0x002a }
        android.util.Log.i(r4, r5);	 Catch:{ all -> 0x002a }
        if (r0 != 0) goto L_0x0067;
    L_0x0065:
        monitor-exit(r3);	 Catch:{ all -> 0x002a }
        goto L_0x0012;
    L_0x0067:
        r1 = r2;
        goto L_0x0065;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.autochips.dvp.DvdLogicManager.openAudOutput(boolean):int");
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int closeAudOutput(boolean r8) {
        /*
        r7 = this;
        r2 = -1;
        r1 = 0;
        r3 = r7.mSyncObj;
        monitor-enter(r3);
        if (r8 == 0) goto L_0x000b;
    L_0x0007:
        r4 = r7.mFrontAudioOpen;	 Catch:{ all -> 0x002a }
        if (r4 == 0) goto L_0x0011;
    L_0x000b:
        if (r8 != 0) goto L_0x0013;
    L_0x000d:
        r4 = r7.mRearAudioOpen;	 Catch:{ all -> 0x002a }
        if (r4 != 0) goto L_0x0013;
    L_0x0011:
        monitor-exit(r3);	 Catch:{ all -> 0x002a }
    L_0x0012:
        return r1;
    L_0x0013:
        if (r8 == 0) goto L_0x0018;
    L_0x0015:
        r4 = 0;
        r7.mFrontAudioOpen = r4;	 Catch:{ all -> 0x002a }
    L_0x0018:
        if (r8 != 0) goto L_0x001d;
    L_0x001a:
        r4 = 0;
        r7.mRearAudioOpen = r4;	 Catch:{ all -> 0x002a }
    L_0x001d:
        r4 = fgCbmPause;	 Catch:{ all -> 0x002a }
        if (r4 == 0) goto L_0x002d;
    L_0x0021:
        r2 = "DvdLogicManager";
        r4 = "[dvp][framework] fgCbmPause is true forbid to close AudOutput";
        android.util.Log.i(r2, r4);	 Catch:{ all -> 0x002a }
        monitor-exit(r3);	 Catch:{ all -> 0x002a }
        goto L_0x0012;
    L_0x002a:
        r1 = move-exception;
        monitor-exit(r3);	 Catch:{ all -> 0x002a }
        throw r1;
    L_0x002d:
        r4 = 0;
        r4 = r7.requestSwitch(r8, r4);	 Catch:{ all -> 0x002a }
        if (r4 != 0) goto L_0x0037;
    L_0x0034:
        monitor-exit(r3);	 Catch:{ all -> 0x002a }
        r1 = r2;
        goto L_0x0012;
    L_0x0037:
        r0 = native_DVP_CloseAudOutput(r8);	 Catch:{ all -> 0x002a }
        if (r0 != 0) goto L_0x0041;
    L_0x003d:
        r0 = super.closeAudOutput(r8);	 Catch:{ all -> 0x002a }
    L_0x0041:
        r4 = "DvdLogicManager";
        r5 = new java.lang.StringBuilder;	 Catch:{ all -> 0x002a }
        r5.<init>();	 Catch:{ all -> 0x002a }
        r6 = "[dvp][framework] closeAudOutput, front:";
        r5 = r5.append(r6);	 Catch:{ all -> 0x002a }
        r5 = r5.append(r8);	 Catch:{ all -> 0x002a }
        r6 = " ret:";
        r5 = r5.append(r6);	 Catch:{ all -> 0x002a }
        r5 = r5.append(r0);	 Catch:{ all -> 0x002a }
        r5 = r5.toString();	 Catch:{ all -> 0x002a }
        android.util.Log.i(r4, r5);	 Catch:{ all -> 0x002a }
        if (r0 != 0) goto L_0x0067;
    L_0x0065:
        monitor-exit(r3);	 Catch:{ all -> 0x002a }
        goto L_0x0012;
    L_0x0067:
        r1 = r2;
        goto L_0x0065;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.autochips.dvp.DvdLogicManager.closeAudOutput(boolean):int");
    }

    public byte[] getSpectrum() {
        return native_DVP_AudioInfo_GetSpectrum();
    }

    public int setSpectrumMaxVal(byte maxvalue) {
        int ret = native_DVP_AudioInfo_SetSpectrumMaxVal(maxvalue);
        Log.i(TAG, "[dvp][framework] setSpectrumMaxVal, max:" + maxvalue + " ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    private String getID3Info(int type) {
        byte[] b = native_DVP_GetCurAudioId3Txt((byte) type);
        String str = null;
        if (b == null) {
            return BluetoothPbapClientPath.PBAP_ROOT_NAME;
        }
        try {
            str = new String(b, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return str;
    }

    public String getId3Title() {
        if (10 == this.mDiscTypeNum) {
            return getID3Info(0);
        }
        return this.mId3InfoTitle;
    }

    public String getId3Album() {
        if (10 == this.mDiscTypeNum) {
            return getID3Info(1);
        }
        return this.mId3InfoAlbum;
    }

    public String getId3Artist() {
        if (10 == this.mDiscTypeNum) {
            return getID3Info(2);
        }
        return this.mId3InfoArtist;
    }

    public String getId3Genre() {
        if (10 == this.mDiscTypeNum) {
            return getID3Info(3);
        }
        return this.mId3InfoGenre;
    }

    public String getId3Year() {
        if (10 == this.mDiscTypeNum) {
            return getID3Info(4);
        }
        return this.mId3InfoYear;
    }

    public byte[] getId3Pic() {
        return this.mId3InfoPicData;
    }

    private byte[] navGetId3Pic() {
        Log.i(TAG, "[dvp][framework] navGetId3Pic");
        byte[] bData = native_DVP_GetId3Pic();
        if (bData == null) {
            Log.e(TAG, "[dvp][framework] get pic data = null");
        }
        return bData;
    }

    public String getCurrentDir() {
        return this.mRestoredPath;
    }

    private String navGetCurrentDir() {
        Log.i(TAG, "[dvp][framework] navGetCurrentDir");
        byte[] b = new byte[1];
        try {
            b = native_DVP_GetCurrentDir().getBytes("UTF-16LE");
        } catch (UnsupportedEncodingException e) {
        }
        return new String(b);
    }

    public int setPBCState() {
        int ret = native_DVP_SetPBCState();
        Log.i(TAG, "[dvp][framework] setPBCState, ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int getPBCState() {
        return this.mVcdPBC;
    }

    public int gotoRootMenu() {
        int ret = native_DVP_GotoRootMenu();
        Log.i(TAG, "[dvp][framework] native_DVP_GotoRootMenu, ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int rotateImage() {
        int ret = native_DVP_RotateImage();
        Log.i(TAG, "[dvp][framework] rotateImage, ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int setImageViewMode(int mode) {
        int ret = native_DVP_SetImageViewMode(mode);
        Log.i(TAG, "[dvp][framework] setImageViewMode, mode:" + mode + " ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int getJPGResolution() {
        int ret = native_DVP_GetJPGResolution();
        Log.i(TAG, "[dvp][framework] getJPGResolution, ret:" + ret);
        return ret;
    }

    public int setRipPath(String ripfilepath) {
        int ret = native_DVP_SetRipPath(ripfilepath);
        Log.i(TAG, "[dvp][framework] setRipPath, ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int startRip(int track) {
        int ret = native_DVP_StartRip(track);
        Log.i(TAG, "[dvp][framework] startRip, track:" + track + " ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int stopRip() {
        int ret = native_DVP_StopRip();
        Log.i(TAG, "[dvp][framework] stopRip, ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int getRipTrkLen(int track) {
        int trackLabLen = native_DVP_GetRipTrkLbaLen(track);
        Log.i(TAG, "[dvp][framework] getRipTrkLen, track:" + track + " len:" + trackLabLen);
        return trackLabLen;
    }

    public int getTrayState() {
        int rt;
        if (native_DVP_GetTrayStatus() == 0) {
            rt = 20;
        } else {
            rt = 21;
        }
        Log.i(TAG, "[dvp][framework] getTrayState, state:" + rt);
        return rt;
    }

    public int getSuffleMode() {
        int ret = native_DVP_GetShuffleMode();
        Log.i(TAG, "[dvp][framework] getSuffleMode, ret:" + ret);
        return ret;
    }

    public int getPBCUserMode() {
        int ret = native_DVP_GetPBCUserMode();
        Log.i(TAG, "[dvp][framework] getPBCUserMode, ret:" + ret);
        return ret;
    }

    public int setPBCUserMode(byte mode) {
        int ret = native_DVP_SetPBCUserMode(mode);
        Log.i(TAG, "[dvp][framework] getPBCUserMode, mode:" + mode + " ret:" + ret);
        return ret;
    }

    public int getRepeatMode() {
        return this.mRepeatMode;
    }

    public int setBaseFileID(int index) {
        int ret = native_DVP_SetBaseFileID(index);
        Log.i(TAG, "[dvp][framework] setBaseFileID, index:" + index + " ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int checkPwdResult(int iPwdResult) {
        int ret = native_DVP_CheckPwdResult(iPwdResult);
        Log.i(TAG, "[dvp][framework] checkPwdResult, iPwdResult:" + iPwdResult + " ret:" + ret);
        return ret == 0 ? 0 : -1;
    }

    public int getAudioPlayingDirIndex() {
        int ret = native_DVP_GetAudioPlayingDirIndex();
        Log.i(TAG, "[dvp][framework] checkPwdResult, ret:" + ret);
        return ret;
    }

    public int getSelectedItem() {
        Log.i(TAG, "[dvp][framework] getSelectedItem, ret:" + this.selecteditem);
        return this.selecteditem;
    }

    public void setSelectedItem(int item) {
        Log.i(TAG, "[dvp][framework] setSelectedItem, item:" + item);
        this.selecteditem = item;
    }

    public ArrayList<FileInfo> getFilelist(int startindex, int leftcnt) {
        String path = navGetCurrentDir();
        String name = "unknown";
        ArrayList<FileInfo> testList = new ArrayList();
        int cnt = startindex;
        int num = startindex + leftcnt;
        Log.i(TAG, "[dvp][framework] getFilelist, startindex:" + startindex);
        Log.i(TAG, "[dvp][framework] getFilelist, startindex IS " + startindex);
        Log.i(TAG, "[dvp][framework] getFilelist, leftcnt count IS -- " + leftcnt);
        Log.i(TAG, "[dvp][framework] getFilelist, cnt IS -- " + cnt);
        Log.i(TAG, "[dvp][framework] getFilelist, num num IS -- " + num);
        while (cnt < num && !this.fgExitGetList) {
            FileItemInfo fileItem = getDramFileItemInfo(cnt);
            if (fileItem == null) {
                Log.i(TAG, "[dvp][framework] getFilelist, get the item[" + cnt + "] failed, get again...");
                break;
            }
            int type;
            Log.i(TAG, "[dvp][framework] getFilelist, get the item[" + cnt + "] ok, get next...");
            if (fileItem.iFileType == HDMI.RCP_KEY_INVAILD) {
                type = 5;
                name = fileItem.filename;
            } else if ((fileItem.iFileType >= 0 && fileItem.iFileType <= 3) || fileItem.iFileType == 7 || fileItem.iFileType == 12 || fileItem.iFileType == 17 || fileItem.iFileType == 29 || fileItem.iFileType == 31) {
                type = 3;
                name = fileItem.filename;
            } else if (fileItem.iFileType == 5) {
                type = 2;
                name = fileItem.filename;
            } else if (fileItem.iFileType >= 8 && fileItem.iFileType <= 30 && fileItem.iFileType != 16 && fileItem.iFileType != 19 && fileItem.iFileType != 22 && fileItem.iFileType != 25 && fileItem.iFileType != 12 && fileItem.iFileType != 17 && fileItem.iFileType != 29) {
                type = 1;
                name = fileItem.filename;
            } else if (fileItem.iFileType == 16) {
                type = 0;
                name = fileItem.filename;
            } else {
                type = 5;
                name = fileItem.filename;
            }
            testList.add(new FileInfo(type, path, name, cnt));
            cnt++;
        }
        Log.d(TAG, "[dvp][framework] getFilelist -- end, List size -- " + testList.size());
        return testList;
    }

    private ArrayList<FileInfo> getTypeFilelist(int startindex, int leftcnt, int filetype) {
        String path = "/DATA_DISC";
        String name = "unknown";
        ArrayList<FileInfo> testList = new ArrayList();
        int cnt = startindex;
        int num = startindex + leftcnt;
        Log.d(TAG, "[dvp][framework] getTypeFilelist, startindex IS -- " + startindex);
        Log.d(TAG, "[dvp][framework] getTypeFilelist, leftcnt count IS -- " + leftcnt);
        Log.d(TAG, "[dvp][framework] getTypeFilelist, cnt IS -- " + cnt);
        Log.d(TAG, "[dvp][framework] getTypeFilelist, num num IS -- " + num);
        while (cnt < num && !this.fgExitGetList) {
            FileItemInfo fileItem = getDramFileItemInfo(cnt);
            if (fileItem == null) {
                Log.d(TAG, "[dvp][framework] getTypeFilelist, get the item[" + cnt + "] failed, get again...");
            } else {
                Log.d(TAG, "[dvp][framework] getTypeFilelist, get the item[" + cnt + "] ok, get next...");
                if (filetype == 1) {
                    if ((fileItem.iFileType >= 0 && fileItem.iFileType <= 3) || fileItem.iFileType == 7 || fileItem.iFileType == 12 || fileItem.iFileType == 17 || fileItem.iFileType == 29 || fileItem.iFileType == 31) {
                        testList.add(new FileInfo(3, "/DATA_DISC", fileItem.filename, cnt));
                    }
                } else if (filetype == 2) {
                    if (!(fileItem.iFileType < 8 || fileItem.iFileType > 30 || fileItem.iFileType == 16 || fileItem.iFileType == 19 || fileItem.iFileType == 22 || fileItem.iFileType == 25 || fileItem.iFileType == 12 || fileItem.iFileType == 17 || fileItem.iFileType == 29)) {
                        testList.add(new FileInfo(1, "/DATA_DISC", fileItem.filename, cnt));
                    }
                } else if (filetype == 3 && fileItem.iFileType == 5) {
                    testList.add(new FileInfo(2, "/DATA_DISC", fileItem.filename, cnt));
                }
                cnt++;
            }
        }
        Log.d(TAG, "[dvp][framework] getTypeFilelist -- end, testList SIZE -- " + testList.size());
        return testList;
    }

    public String castTmStr(long Time) {
        if (Time <= 0) {
            return "00:00:00";
        }
        return (((String.format("%02d", new Object[]{Long.valueOf(((Time / 1000) / 60) / 60)}) + ":") + String.format("%02d", new Object[]{Long.valueOf(((Time / 1000) / 60) % 60)})) + ":") + String.format("%02d", new Object[]{Long.valueOf((Time / 1000) % 60)});
    }

    public boolean requestResourse() {
        Log.e(TAG, "[dvp][framework] not to use the interface");
        switch (queryCBMCurrentSrc()) {
            case 1:
            case 2:
                Log.e(TAG, "[dvp][framework] WARN:No permission, high priority source playing ");
                return false;
            default:
                return DEBUG_DVP;
        }
    }

    private int queryCBMCurrentSrc() {
        Parcel reply = Parcel.obtain();
        int srcType = 0;
        if (manager == null) {
            manager = new CBManager();
        }
        try {
            int cbmRet = manager.query(reply);
            reply.setDataPosition(0);
            if (reply.readInt() > 0) {
                srcType = reply.readInt();
            }
            reply.recycle();
            return srcType;
        } catch (Throwable th) {
            reply.recycle();
        }
    }

    private boolean request() {
        int retRequest = 0;
        if (manager == null) {
            manager = new CBManager();
        }
        if (manager != null) {
            Log.e(TAG, "[dvp][framework] requestResourse, send cbm request");
            Parcel p2 = Parcel.obtain();
            try {
                manager.request(7, 1, p2);
                retRequest = p2.readInt();
                Log.d(TAG, "[dvp][framework] requestResourse, request ret:" + retRequest);
            } finally {
                p2.recycle();
            }
        }
        if (retRequest == 0) {
            Log.e(TAG, "[dvp][framework] requestResourse, cbm forbiden play dvd");
            return false;
        }
        this.mDestination = 1;
        manager.setOnActionListener(new C00801());
        return DEBUG_DVP;
    }

    public int getCBMCurrentSource() {
        return this.mStopBySrc;
    }

    private boolean requestSwitch(boolean front, boolean on) {
        if (manager == null) {
            return DEBUG_DVP;
        }
        Parcel reply;
        int newDestion;
        if (front) {
            if (on) {
                if (this.mDestination == 1 || this.mDestination == 3) {
                    return DEBUG_DVP;
                }
                reply = Parcel.obtain();
                newDestion = this.mDestination;
                if (this.mDestination == 2) {
                    newDestion = 3;
                } else {
                    newDestion = 1;
                }
                try {
                    manager.swiRequest(7, newDestion, reply);
                    if (reply.readInt() == 0) {
                        Log.i(TAG, "[dvp][framework] open cbm forbid to open dvd front!");
                        return false;
                    }
                    this.mDestination = newDestion;
                    reply.recycle();
                    return DEBUG_DVP;
                } finally {
                    reply.recycle();
                }
            } else if (this.mDestination != 1 && this.mDestination != 3) {
                return DEBUG_DVP;
            } else {
                reply = Parcel.obtain();
                newDestion = this.mDestination;
                if (this.mDestination == 3) {
                    newDestion = 2;
                } else {
                    newDestion = 0;
                }
                if (newDestion != 0) {
                    try {
                        manager.swiRequest(7, newDestion, reply);
                        if (reply.readInt() == 0) {
                            Log.i(TAG, "[dvp][framework] open cbm forbid to close dvd front!");
                            return false;
                        }
                        reply.recycle();
                    } finally {
                        reply.recycle();
                    }
                }
                this.mDestination = newDestion;
                return DEBUG_DVP;
            }
        } else if (on) {
            if (this.mDestination == 2 || this.mDestination == 3) {
                return DEBUG_DVP;
            }
            reply = Parcel.obtain();
            newDestion = this.mDestination;
            if (this.mDestination == 1) {
                newDestion = 3;
            } else {
                newDestion = 2;
            }
            try {
                manager.swiRequest(7, newDestion, reply);
                if (reply.readInt() == 0) {
                    Log.i(TAG, "[dvp][framework] open cbm forbid to open dvd rear!");
                    return false;
                }
                this.mDestination = newDestion;
                reply.recycle();
                return DEBUG_DVP;
            } finally {
                reply.recycle();
            }
        } else if (this.mDestination != 2 && this.mDestination != 3) {
            return DEBUG_DVP;
        } else {
            reply = Parcel.obtain();
            newDestion = this.mDestination;
            if (this.mDestination == 3) {
                newDestion = 1;
            } else {
                newDestion = 0;
            }
            if (newDestion != 0) {
                try {
                    manager.swiRequest(7, newDestion, reply);
                    if (reply.readInt() == 0) {
                        Log.i(TAG, "[dvp][framework] open cbm forbid to close dvd front!");
                        return false;
                    }
                    reply.recycle();
                } finally {
                    reply.recycle();
                }
            }
            this.mDestination = newDestion;
            return DEBUG_DVP;
        }
    }

    public void setCBMListener(OnCBMListener cbmListener) {
        this.mOnCBMListener = cbmListener;
    }

    public void CBMConfig(boolean isAppResume) {
        Log.d(TAG, "CBMConfig(): enter controled by CBM play later " + manager + ", isAppResume" + isAppResume);
        if (manager == null) {
            manager = new CBManager();
        }
        if (manager != null) {
            manager.config(isAppResume);
        }
    }

    public int CBMResume() {
        Log.d(TAG, "CBMConfig(): enter controled by CBM play later" + manager);
        if (manager != null) {
            int retCbm = manager.appResume();
            if (retCbm == 0) {
                return 0;
            }
            Log.i(TAG, "CBMConfig(): retCbm is" + retCbm);
            return -1;
        }
        Log.i(TAG, "CBMConfig(): mCBM is null");
        return -1;
    }

    @Deprecated
    public void cbmPause() {
        Log.e(TAG, "[dvp][framework] not to use the interface");
    }

    private void stopLoadDVP() {
        Log.e(TAG, "[dvp][framework] stopLoadDVP");
        if (!fgDvdLoadOK) {
            native_DVP_ChangeDevice((byte) -1);
            lastMerofyWrite();
            this.mDeviceEnable = false;
            this.mCbmNoLoadOkPause = DEBUG_DVP;
        }
        if (this.mFrontDisplayOpen) {
            native_DVP_Mix2APWrChannel(false);
            super.openFrontDisplay(false);
        }
        if (this.mRearDisplayOpen) {
            native_DVP_RearSwitch(false);
            super.openRearDisplay(false);
        }
        if (this.mFrontAudioOpen) {
            native_DVP_CloseAudOutput(DEBUG_DVP);
            super.closeAudOutput(DEBUG_DVP);
        }
        if (this.mRearAudioOpen) {
            native_DVP_CloseAudOutput(false);
            super.closeAudOutput(false);
        }
    }

    private void onCbmPause() {
        synchronized (this.mSyncObj) {
            if (fgCbmPause) {
                Log.e(TAG, "[dvp][framework] CBM STOP DVP");
                return;
            }
            Log.e(TAG, "[dvp][framework] requestResourse, CBM STOP DVP");
            if (!fgDvdLoadOK) {
                native_DVP_ChangeDevice((byte) -1);
                lastMerofyWrite();
                this.mDeviceEnable = false;
                this.mCbmNoLoadOkPause = DEBUG_DVP;
            }
            if (this.mFrontDisplayOpen) {
                native_DVP_Mix2APWrChannel(false);
                super.openFrontDisplay(false);
            }
            if (this.mRearDisplayOpen) {
                native_DVP_RearSwitch(false);
                super.openRearDisplay(false);
            }
            if (this.mFrontAudioOpen) {
                native_DVP_CloseAudOutput(DEBUG_DVP);
                super.closeAudOutput(DEBUG_DVP);
            }
            if (this.mRearAudioOpen) {
                native_DVP_CloseAudOutput(false);
                super.closeAudOutput(false);
            }
            pause();
            fgCbmPause = DEBUG_DVP;
        }
    }

    @Deprecated
    public void cbmResume() {
        Log.e(TAG, "[dvp][framework] not to use the interface");
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void onCbmResume() {
        /*
        r3 = this;
        r1 = r3.mSyncObj;
        monitor-enter(r1);
        r0 = fgCbmPause;	 Catch:{ all -> 0x0074 }
        if (r0 != 0) goto L_0x0009;
    L_0x0007:
        monitor-exit(r1);	 Catch:{ all -> 0x0074 }
    L_0x0008:
        return;
    L_0x0009:
        r0 = "DvdLogicManager";
        r2 = "[dvp][framework] requestResourse, CBM Resume DVP";
        android.util.Log.e(r0, r2);	 Catch:{ all -> 0x0074 }
        r0 = 0;
        fgCbmPause = r0;	 Catch:{ all -> 0x0074 }
        r0 = 0;
        r3.mCbmNoLoadOkPause = r0;	 Catch:{ all -> 0x0074 }
        r0 = r3.mDeviceEnable;	 Catch:{ all -> 0x0074 }
        if (r0 != 0) goto L_0x0027;
    L_0x001a:
        r0 = 0;
        r3.mLoadedFlag = r0;	 Catch:{ all -> 0x0074 }
        native_DVP_Connect();	 Catch:{ all -> 0x0074 }
        r0 = 0;
        native_DVP_ChangeDevice(r0);	 Catch:{ all -> 0x0074 }
        r0 = 1;
        r3.mDeviceEnable = r0;	 Catch:{ all -> 0x0074 }
    L_0x0027:
        r0 = r3.mSurface;	 Catch:{ all -> 0x0074 }
        if (r0 == 0) goto L_0x0030;
    L_0x002b:
        r0 = r3.mSurface;	 Catch:{ all -> 0x0074 }
        native_setFrontSurface(r0);	 Catch:{ all -> 0x0074 }
    L_0x0030:
        r0 = r3.mFrontDisplayOpen;	 Catch:{ all -> 0x0074 }
        if (r0 == 0) goto L_0x003c;
    L_0x0034:
        r0 = 1;
        native_DVP_Mix2APWrChannel(r0);	 Catch:{ all -> 0x0074 }
        r0 = 1;
        super.openFrontDisplay(r0);	 Catch:{ all -> 0x0074 }
    L_0x003c:
        r0 = r3.mRearDisplayOpen;	 Catch:{ all -> 0x0074 }
        if (r0 == 0) goto L_0x0048;
    L_0x0040:
        r0 = 1;
        native_DVP_RearSwitch(r0);	 Catch:{ all -> 0x0074 }
        r0 = 1;
        super.openRearDisplay(r0);	 Catch:{ all -> 0x0074 }
    L_0x0048:
        r0 = fgDvdLoadOK;	 Catch:{ all -> 0x0074 }
        if (r0 == 0) goto L_0x005a;
    L_0x004c:
        r0 = 64;
        r3.mInnerOp = r0;	 Catch:{ all -> 0x0074 }
        r3.play();	 Catch:{ all -> 0x0074 }
        r0 = "DvdLogicManager";
        r2 = "[dvp][framework] requestResourse, when last cmd_stop/cmd_pause coming";
        android.util.Log.e(r0, r2);	 Catch:{ all -> 0x0074 }
    L_0x005a:
        r0 = r3.mFrontAudioOpen;	 Catch:{ all -> 0x0074 }
        if (r0 == 0) goto L_0x0066;
    L_0x005e:
        r0 = 1;
        native_DVP_OpenAudOutput(r0);	 Catch:{ all -> 0x0074 }
        r0 = 1;
        super.openAudOutput(r0);	 Catch:{ all -> 0x0074 }
    L_0x0066:
        r0 = r3.mRearAudioOpen;	 Catch:{ all -> 0x0074 }
        if (r0 == 0) goto L_0x0072;
    L_0x006a:
        r0 = 0;
        native_DVP_OpenAudOutput(r0);	 Catch:{ all -> 0x0074 }
        r0 = 0;
        super.openAudOutput(r0);	 Catch:{ all -> 0x0074 }
    L_0x0072:
        monitor-exit(r1);	 Catch:{ all -> 0x0074 }
        goto L_0x0008;
    L_0x0074:
        r0 = move-exception;
        monitor-exit(r1);	 Catch:{ all -> 0x0074 }
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.autochips.dvp.DvdLogicManager.onCbmResume():void");
    }

    private void notifyActivity(int cmd, int arg1, int arg2) {
        handleDvpCmd(cmd, arg1, arg2);
    }

    private int getTrackCount() {
        Log.i(TAG, "[dvp][framework] getTrackCount");
        return native_DVP_GetTrackCount();
    }

    private int getSpectrumMaxVal() {
        Log.i(TAG, "[dvp][framework] getSpectrumMaxVal");
        return native_DVP_AudioInfo_GetSpectrumMaxVal();
    }

    private static int addToMsgQ(int cmd, int arg1, int arg2) {
        mCmd.add(new DVP_CMD(cmd, arg1, arg2));
        return 0;
    }

    private static int setFileItemInfo(short i2Type, String FileName) {
        iType = i2Type;
        sFileName = FileName;
        Log.i(TAG, "[dvp][framework] setFileItemInfo type " + iType + " name " + sFileName);
        return 0;
    }

    private int getRipErrType() {
        Log.i(TAG, "[dvp][framework] getRipErrType");
        return native_DVP_GetRipErrType();
    }

    public int getDuration() {
        return this.mTotalTime;
    }

    public int chooseDigitalNum(int type, int num) {
        int ret = native_DVP_ChooseDigitalNum(type, num);
        Log.i(TAG, "[dvp][framework] DVP_ChooseDigitalNum");
        return ret == 0 ? 0 : -1;
    }

    @Deprecated
    public int DVP_ChooseDigitalNum(int type, int num) {
        int ret = native_DVP_ChooseDigitalNum(type, num);
        Log.i(TAG, "[dvp][framework] DVP_ChooseDigitalNum");
        return ret == 0 ? 0 : -1;
    }

    private int getCurrentAudioIndex() {
        Log.i(TAG, "[dvp][framework] getCurrentAudioIndex");
        return native_DVP_GetCurrentAudioIndex();
    }

    public int getCurrentTitle() {
        return this.mCurrentTitle;
    }

    public int getTitleCount() {
        return this.mTitleCnt;
    }

    public int getCurrentChapter() {
        return this.mCurrentChapter;
    }

    public int getChapterCount() {
        return this.mChapterCount;
    }

    private int getPBCAngleCount() {
        Log.i(TAG, "[dvp][framework] getPBCAngleCount");
        return native_DVP_GetPBCAngleCount();
    }

    public int getCurrentZoomMultiple() {
        Log.i(TAG, "[dvp][framework] getCurrentZoomMultiple");
        return native_DVP_GetCurrentZoomMultiple();
    }

    public int getDiscVideoCount() {
        Log.i(TAG, "[dvp][framework] getDiscVideoCount");
        return native_DVP_GetDiscVideoCount();
    }

    public int getDiscAudioCount() {
        Log.i(TAG, "[dvp][framework] getDiscAudioCount");
        return native_DVP_GetDiscAudioCount();
    }

    public int getDiscPicCount() {
        Log.i(TAG, "[dvp][framework] getDiscPicCount");
        return native_DVP_GetDiscPicCount();
    }

    private int getCurrentPBCAngle() {
        Log.i(TAG, "[dvp][framework] getCurrentPBCAngle");
        return native_DVP_GetCurrentPBCAngle();
    }

    public int zoomIn() {
        int ret = native_DVP_ZoomIn();
        Log.i(TAG, "[dvp][framework] zoomIn");
        return ret == 0 ? 0 : -1;
    }

    public int zoomOut() {
        int ret = native_DVP_ZoomOut();
        Log.i(TAG, "[dvp][framework] zoomOut");
        return ret == 0 ? 0 : -1;
    }

    public int KeyUp() {
        int ret = native_DVP_Up();
        Log.i(TAG, "[dvp][framework] Up");
        return ret == 0 ? 0 : -1;
    }

    public int KeyDown() {
        int ret = native_DVP_Down();
        Log.i(TAG, "[dvp][framework] down");
        return ret == 0 ? 0 : -1;
    }

    public int KeyLeft() {
        int ret = native_DVP_Left();
        Log.i(TAG, "[dvp][framework] Left");
        return ret == 0 ? 0 : -1;
    }

    public int KeyRight() {
        int ret = native_DVP_Right();
        Log.i(TAG, "[dvp][framework] Right");
        return ret == 0 ? 0 : -1;
    }

    public int JpegDgt_GapAndSize(byte uHorizontalGap, byte uVerticalGap, byte uWidth, byte uHeight) {
        int ret = native_DVP_JpegDgt_GapAndSize(uHorizontalGap, uVerticalGap, uWidth, uHeight);
        Log.i(TAG, "[dvp][framework] JpegDgt_GapAndSize");
        return ret == 0 ? 0 : -1;
    }

    public int JpegDgt_NumAndStartPos(byte uHorizontalGap, byte uVerticalGap, byte uWidth, byte uHeight) {
        int ret = native_DVP_JpegDgt_GapAndSize(uHorizontalGap, uVerticalGap, uWidth, uHeight);
        Log.i(TAG, "[dvp][framework] JpegDgt_GapAndSize");
        return ret == 0 ? 0 : -1;
    }

    public int SetRipSpeedMode(byte uSpeedMode) {
        int ret = native_DVP_SetRipSpeedMode(uSpeedMode);
        Log.i(TAG, "[dvp][framework] native_DVP_SetRipSpeedMode" + uSpeedMode);
        return ret == 0 ? 0 : -1;
    }

    public int SetDvdRegion(byte uDvdRegionNum) {
        int ret = native_DVP_SetDvdRegion(uDvdRegionNum);
        Log.i(TAG, "[dvp][framework] SetDvdRegion" + uDvdRegionNum);
        return ret == 0 ? 0 : -1;
    }

    public boolean IsDiscInsert() {
        Log.i(TAG, "[dvp][framework] IsDiscInsert");
        return native_DVP_IsDiscInsert();
    }

    public int GetPlayingDirIdx() {
        Log.i(TAG, "[dvp][framework] GetPlayingDirIdx");
        return native_DVP_GetPlayingDirIdx();
    }

    public int GetExeListType() {
        Log.i(TAG, "[dvp][framework] GetExeListType");
        return native_DVP_GetExeListType();
    }

    public int GetPlayingIdxByPlayType() {
        Log.i(TAG, "[dvp][framework] GetPlayingIdxByPlayType");
        return native_DVP_GetPlayingIdxByPlayType();
    }

    public int GetAudioTrackCount() {
        Log.i(TAG, "[dvp][framework] GetAudioTrackCount");
        return native_DVP_GetAudioTrackCount();
    }

    public int GetAudioExeListType() {
        Log.i(TAG, "[dvp][framework] GetAudioExeListType");
        return native_DVP_GetAudioExeListType();
    }

    public int GetAudioPlayingDirTotalAudio() {
        Log.i(TAG, "[dvp][framework] GetAudioPlayingDirTotalAudio");
        return native_DVP_GetAudioPlayingDirTotalAudio();
    }

    public int GetAudioPlayingCntByPlayType() {
        Log.i(TAG, "[dvp][framework] GetAudioPlayingDirTotalAudio");
        return native_DVP_GetAudioPlayingCntByPlayType();
    }

    public int GetAudioPlayingIdxByPlayType() {
        Log.i(TAG, "[dvp][framework] GetAudioPlayingIdxByPlayType");
        return native_DVP_GetAudioPlayingIdxByPlayType();
    }

    public int GetTotDirCnt() {
        Log.i(TAG, "[dvp][framework] GetTotDirCnt");
        return native_DVP_GetTotDirCnt();
    }

    public int GetFLListType() {
        Log.i(TAG, "[dvp][framework] GetFLListType");
        return native_DVP_GetFLListType();
    }

    public int GetFLCurDirIndex() {
        Log.i(TAG, "[dvp][framework] GetFLCurDirIndex");
        return native_DVP_GetFLCurDirIndex();
    }

    public int GetCurDirVideoCount() {
        Log.i(TAG, "[dvp][framework] GetCurDirVideoCount");
        return native_DVP_GetCurDirVideoCount();
    }

    public int GetCurDirAudioCount() {
        Log.i(TAG, "[dvp][framework] GetCurDirAudioCount");
        return native_DVP_GetCurDirAudioCount();
    }

    public int GetCurDirPicCount() {
        Log.i(TAG, "[dvp][framework] GetCurDirPicCount");
        return native_DVP_GetCurDirPicCount();
    }

    private FileItemInfo getDramFileItemInfo(int index) {
        if (native_DVP_GetDramFileItemInfo(index) == 0) {
            byte[] c = new byte[1];
            try {
                c = sFileName.getBytes("UTF-16LE");
            } catch (UnsupportedEncodingException e) {
            }
            String str = new String(c);
            Log.i(TAG, "[dvp][framework] getDramFileItemInfo str: " + str + ", len: " + str.length());
            return new FileItemInfo(iType, str);
        }
        Log.d(TAG, "[dvp][framework] Service does not save this file info!");
        return null;
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void handleDvpCmd(int r15, int r16, int r17) {
        /*
        r14 = this;
        switch(r15) {
            case 0: goto L_0x0004;
            case 2: goto L_0x01c2;
            case 3: goto L_0x028b;
            case 4: goto L_0x02e5;
            case 6: goto L_0x0b9b;
            case 48: goto L_0x0451;
            case 49: goto L_0x047b;
            case 50: goto L_0x04b6;
            case 51: goto L_0x04bf;
            case 53: goto L_0x04c8;
            case 55: goto L_0x04d8;
            case 56: goto L_0x050b;
            case 57: goto L_0x0bea;
            case 81: goto L_0x0532;
            case 82: goto L_0x05fc;
            case 83: goto L_0x063d;
            case 84: goto L_0x064d;
            case 85: goto L_0x065d;
            case 86: goto L_0x066d;
            case 87: goto L_0x0685;
            case 88: goto L_0x06c5;
            case 89: goto L_0x06df;
            case 90: goto L_0x0726;
            case 91: goto L_0x0761;
            case 92: goto L_0x07a1;
            case 93: goto L_0x07e9;
            case 94: goto L_0x0806;
            case 95: goto L_0x0843;
            case 97: goto L_0x0880;
            case 98: goto L_0x08c5;
            case 99: goto L_0x0904;
            case 100: goto L_0x0943;
            case 101: goto L_0x096a;
            case 102: goto L_0x09a2;
            case 103: goto L_0x09db;
            case 104: goto L_0x0a70;
            case 105: goto L_0x0a80;
            case 106: goto L_0x0c08;
            case 113: goto L_0x0aac;
            case 114: goto L_0x0abc;
            case 115: goto L_0x0ad4;
            case 160: goto L_0x0b14;
            case 161: goto L_0x0b24;
            case 162: goto L_0x0b34;
            case 163: goto L_0x0b5b;
            case 164: goto L_0x0b6b;
            case 165: goto L_0x0b7b;
            case 193: goto L_0x0b8b;
            default: goto L_0x0003;
        };
    L_0x0003:
        return;
    L_0x0004:
        r1 = 0;
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, cmd ";
        r11 = r11.append(r12);
        r0 = r16;
        r11 = r11.append(r0);
        r12 = " val:";
        r11 = r11.append(r12);
        r0 = r17;
        r11 = r11.append(r0);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        switch(r16) {
            case 2: goto L_0x0156;
            case 32: goto L_0x005e;
            case 34: goto L_0x008e;
            case 35: goto L_0x00ba;
            case 64: goto L_0x0070;
            case 65: goto L_0x007b;
            case 66: goto L_0x00e0;
            case 69: goto L_0x00f5;
            case 70: goto L_0x00f5;
            case 71: goto L_0x01a3;
            case 102: goto L_0x018e;
            case 105: goto L_0x0105;
            case 128: goto L_0x0143;
            case 130: goto L_0x011a;
            default: goto L_0x002e;
        };
    L_0x002e:
        if (r1 != 0) goto L_0x0003;
    L_0x0030:
        if (r17 != 0) goto L_0x0003;
    L_0x0032:
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] DVP Response - DVP_CMD_ACK, cmd(";
        r11 = r11.append(r12);
        r0 = r16;
        r11 = r11.append(r0);
        r12 = ") fail!";
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.e(r10, r11);
        r10 = fgCbmPause;
        if (r10 != 0) goto L_0x0003;
    L_0x0056:
        r10 = r14.dvdPlayHandler;
        r11 = 90;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x005e:
        if (r17 != 0) goto L_0x006e;
    L_0x0060:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, create list fail";
        android.util.Log.e(r10, r11);
        r10 = r14.dvpListHandler;
        r11 = 102; // 0x66 float:1.43E-43 double:5.04E-322;
        r14.sendMsgToHandle(r10, r11);
    L_0x006e:
        r1 = 1;
        goto L_0x002e;
    L_0x0070:
        r10 = r14.mInnerOp;
        r11 = 64;
        if (r10 != r11) goto L_0x002e;
    L_0x0076:
        r10 = 0;
        r14.mInnerOp = r10;
        r1 = 1;
        goto L_0x002e;
    L_0x007b:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, DVP_CMD_ACK_ARG_PBC_PAUSE fail";
        android.util.Log.d(r10, r11);
        if (r17 != 0) goto L_0x002e;
    L_0x0084:
        r10 = fgCbmPause;
        if (r10 == 0) goto L_0x002e;
    L_0x0088:
        r10 = r14.mPicCdPlayState;
        r11 = 2;
        if (r10 != r11) goto L_0x002e;
    L_0x008d:
        goto L_0x002e;
    L_0x008e:
        r10 = 1;
        r0 = r17;
        if (r0 != r10) goto L_0x002e;
    L_0x0093:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, FL_CLICK_ITEM";
        android.util.Log.d(r10, r11);
        r10 = r14.dvpListHandler;
        r11 = 96;
        r14.sendMsgToHandle(r10, r11);
        r10 = r14.mDiscType;
        r11 = 16;
        if (r10 == r11) goto L_0x00ad;
    L_0x00a7:
        r10 = r14.mDiscType;
        r11 = 12;
        if (r10 != r11) goto L_0x002e;
    L_0x00ad:
        r10 = "";
        r14.mPlayedFileName = r10;
        r10 = r14.dvdPlayHandler;
        r11 = 96;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x002e;
    L_0x00ba:
        r10 = 1;
        r0 = r17;
        if (r0 != r10) goto L_0x00cf;
    L_0x00bf:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, AP_FL_UP_LEVEL_OK...";
        android.util.Log.d(r10, r11);
        r10 = r14.dvpListHandler;
        r11 = 100;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x002e;
    L_0x00cf:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, AP_FL_UP_LEVEL_FAIL --- fail!!!";
        android.util.Log.e(r10, r11);
        r10 = r14.dvpListHandler;
        r11 = 101; // 0x65 float:1.42E-43 double:5.0E-322;
        r14.sendMsgToHandle(r10, r11);
        r1 = 1;
        goto L_0x002e;
    L_0x00e0:
        r10 = 1;
        r0 = r17;
        if (r0 != r10) goto L_0x002e;
    L_0x00e5:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, AP_CMD_PBC_STOP...OK";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 98;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x002e;
    L_0x00f5:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, dvp prev or next";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 91;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x002e;
    L_0x0105:
        r10 = 1;
        r0 = r17;
        if (r0 != r10) goto L_0x002e;
    L_0x010a:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, AP_FUNC_DIGEST...OK";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 99;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x002e;
    L_0x011a:
        r5 = 0;
        r10 = 1;
        r0 = r17;
        if (r0 != r10) goto L_0x0131;
    L_0x0120:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, stop ripping ACK -- OK...";
        android.util.Log.d(r10, r11);
        r5 = 1;
        r10 = r14.dvdPlayHandler;
        r11 = 73;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x002e;
    L_0x0131:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, NORIP2PLAY";
        android.util.Log.d(r10, r11);
        r5 = 0;
        r10 = r14.dvdPlayHandler;
        r11 = 74;
        r14.sendMsgToHandle(r10, r11);
        r1 = 1;
        goto L_0x002e;
    L_0x0143:
        if (r17 != 0) goto L_0x002e;
    L_0x0145:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, AP_CMD_TP_COORDINATE_ERROR -- error!";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 121; // 0x79 float:1.7E-43 double:6.0E-322;
        r14.sendMsgToHandle(r10, r11);
        r1 = 1;
        goto L_0x002e;
    L_0x0156:
        r1 = 1;
        r10 = 1;
        r0 = r17;
        if (r0 != r10) goto L_0x0177;
    L_0x015c:
        r10 = "";
        r14.mPlayedFileName = r10;
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, AP_CMD_TP_SUCCESS_STOP_DISC";
        android.util.Log.i(r10, r11);
        r10 = r14.dvpServicerHandler;
        r11 = 124; // 0x7c float:1.74E-43 double:6.13E-322;
        r14.sendMsgToHandle(r10, r11);
        r10 = r14.dvphomeHandler;
        r11 = 124; // 0x7c float:1.74E-43 double:6.13E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x002e;
    L_0x0177:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DVP_CMD_ACK, DVP_CMD_ACK_ARG_EJECT -- error!";
        android.util.Log.e(r10, r11);
        r10 = r14.dvpServicerHandler;
        r11 = 125; // 0x7d float:1.75E-43 double:6.2E-322;
        r14.sendMsgToHandle(r10, r11);
        r10 = r14.dvphomeHandler;
        r11 = 125; // 0x7d float:1.75E-43 double:6.2E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x002e;
    L_0x018e:
        r10 = 1;
        r0 = r17;
        if (r0 != r10) goto L_0x002e;
    L_0x0193:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] DVP Response -- DDVP_CMD_ACK_ARG_FUNC_MENU ok ...";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 97;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x002e;
    L_0x01a3:
        r10 = 0;
        r14.mWaitSeek = r10;
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] DVP Response -- DDVP_CMD_ACK_ARG_FUNC_MENU ...";
        r11 = r11.append(r12);
        r0 = r17;
        r11 = r11.append(r0);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        goto L_0x002e;
    L_0x01c2:
        r11 = r14.mSyncObj;
        monitor-enter(r11);
        switch(r16) {
            case 0: goto L_0x01ce;
            case 1: goto L_0x01f1;
            case 2: goto L_0x021b;
            case 3: goto L_0x0234;
            case 4: goto L_0x024e;
            case 5: goto L_0x0268;
            case 6: goto L_0x0282;
            case 7: goto L_0x01ce;
            default: goto L_0x01c8;
        };
    L_0x01c8:
        monitor-exit(r11);	 Catch:{ all -> 0x01cb }
        goto L_0x0003;
    L_0x01cb:
        r10 = move-exception;
        monitor-exit(r11);	 Catch:{ all -> 0x01cb }
        throw r10;
    L_0x01ce:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, DVD LOADING...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x01cb }
        r12 = 8;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x01cb }
        r12 = 8;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = 0;
        r14.mFileCnt = r10;	 Catch:{ all -> 0x01cb }
        r10 = 0;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x01cb }
        r10 = fgCbmPause;	 Catch:{ all -> 0x01cb }
        if (r10 == 0) goto L_0x01c8;
    L_0x01ed:
        r14.stopLoadDVP();	 Catch:{ all -> 0x01cb }
        goto L_0x01c8;
    L_0x01f1:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, TRAY OPEN...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = 0;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x01cb }
        r10 = 0;
        r14.mLoadedFlag = r10;	 Catch:{ all -> 0x01cb }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x01cb }
        r12 = 20;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x01cb }
        r12 = 20;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = r14.dvdPlayHandler;	 Catch:{ all -> 0x01cb }
        r12 = 20;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = r14.dvpListHandler;	 Catch:{ all -> 0x01cb }
        r12 = 20;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        goto L_0x01c8;
    L_0x021b:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, TRAY CLOSE...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = 0;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x01cb }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x01cb }
        r12 = 21;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x01cb }
        r12 = 21;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        goto L_0x01c8;
    L_0x0234:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, TRAY ERROR...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = 0;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x01cb }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x01cb }
        r12 = 22;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x01cb }
        r12 = 22;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        goto L_0x01c8;
    L_0x024e:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, NODISC...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = 0;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x01cb }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x01cb }
        r12 = 13;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x01cb }
        r12 = 13;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        goto L_0x01c8;
    L_0x0268:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, UNKOWN DISC...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = 0;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x01cb }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x01cb }
        r12 = 14;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x01cb }
        r12 = 14;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x01cb }
        goto L_0x01c8;
    L_0x0282:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, DISC IDENTIFIED ...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x01cb }
        goto L_0x01c8;
    L_0x028b:
        r11 = r14.mSyncObj;
        monitor-enter(r11);
        switch(r16) {
            case 0: goto L_0x0297;
            case 1: goto L_0x02b3;
            case 2: goto L_0x0291;
            case 3: goto L_0x02cc;
            default: goto L_0x0291;
        };
    L_0x0291:
        monitor-exit(r11);	 Catch:{ all -> 0x0294 }
        goto L_0x0003;
    L_0x0294:
        r10 = move-exception;
        monitor-exit(r11);	 Catch:{ all -> 0x0294 }
        throw r10;
    L_0x0297:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, TRAY OPEN...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x0294 }
        r10 = 0;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x0294 }
        r10 = 0;
        r14.mLoadedFlag = r10;	 Catch:{ all -> 0x0294 }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x0294 }
        r12 = 20;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x0294 }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x0294 }
        r12 = 20;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x0294 }
        goto L_0x0291;
    L_0x02b3:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, TRAY CLOSE...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x0294 }
        r10 = 0;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x0294 }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x0294 }
        r12 = 21;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x0294 }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x0294 }
        r12 = 21;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x0294 }
        goto L_0x0291;
    L_0x02cc:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, TRAY ERROR...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x0294 }
        r10 = 0;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x0294 }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x0294 }
        r12 = 22;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x0294 }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x0294 }
        r12 = 22;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x0294 }
        goto L_0x0291;
    L_0x02e5:
        r11 = r14.mSyncObj;
        monitor-enter(r11);
        r10 = "DvdLogicManager";
        r12 = new java.lang.StringBuilder;	 Catch:{ all -> 0x033b }
        r12.<init>();	 Catch:{ all -> 0x033b }
        r13 = "[dvp][framework] Dvp Response, mLoadedFlag is -- ";
        r12 = r12.append(r13);	 Catch:{ all -> 0x033b }
        r13 = r14.mLoadedFlag;	 Catch:{ all -> 0x033b }
        r12 = r12.append(r13);	 Catch:{ all -> 0x033b }
        r13 = "  arg1 is -- ";
        r12 = r12.append(r13);	 Catch:{ all -> 0x033b }
        r0 = r16;
        r12 = r12.append(r0);	 Catch:{ all -> 0x033b }
        r12 = r12.toString();	 Catch:{ all -> 0x033b }
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x033b }
        r10 = "DvdLogicManager";
        r12 = new java.lang.StringBuilder;	 Catch:{ all -> 0x033b }
        r12.<init>();	 Catch:{ all -> 0x033b }
        r13 = "[dvp][framework] Dvp Response, Disc type is: ";
        r12 = r12.append(r13);	 Catch:{ all -> 0x033b }
        r0 = r16;
        r12 = r12.append(r0);	 Catch:{ all -> 0x033b }
        r12 = r12.toString();	 Catch:{ all -> 0x033b }
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x033b }
        r0 = r16;
        r14.mDiscTypeNum = r0;	 Catch:{ all -> 0x033b }
        r10 = r14.mLoadedFlag;	 Catch:{ all -> 0x033b }
        r12 = 1;
        if (r10 != r12) goto L_0x033e;
    L_0x0331:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, mLoadedFlag is 1 do nothing!";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x033b }
    L_0x0338:
        monitor-exit(r11);	 Catch:{ all -> 0x033b }
        goto L_0x0003;
    L_0x033b:
        r10 = move-exception;
        monitor-exit(r11);	 Catch:{ all -> 0x033b }
        throw r10;
    L_0x033e:
        if (r16 < 0) goto L_0x0365;
    L_0x0340:
        r10 = 2;
        r0 = r16;
        if (r0 > r10) goto L_0x0365;
    L_0x0345:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, DVD LOAD OK...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x033b }
        r10 = 1;
        r14.mLoadedFlag = r10;	 Catch:{ all -> 0x033b }
        r10 = 9;
        r14.mDiscType = r10;	 Catch:{ all -> 0x033b }
        r10 = 1;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x033b }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x033b }
        r12 = r14.mDiscType;	 Catch:{ all -> 0x033b }
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x033b }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x033b }
        r12 = r14.mDiscType;	 Catch:{ all -> 0x033b }
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x033b }
        goto L_0x0338;
    L_0x0365:
        r10 = 3;
        r0 = r16;
        if (r0 < r10) goto L_0x0394;
    L_0x036a:
        r10 = 9;
        r0 = r16;
        if (r0 > r10) goto L_0x0394;
    L_0x0370:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, VCD LOAD OK...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x033b }
        r10 = 1;
        r14.mLoadedFlag = r10;	 Catch:{ all -> 0x033b }
        r0 = r16;
        r14.mDiscTypeNum = r0;	 Catch:{ all -> 0x033b }
        r10 = 10;
        r14.mDiscType = r10;	 Catch:{ all -> 0x033b }
        r10 = 1;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x033b }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x033b }
        r12 = r14.mDiscType;	 Catch:{ all -> 0x033b }
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x033b }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x033b }
        r12 = r14.mDiscType;	 Catch:{ all -> 0x033b }
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x033b }
        goto L_0x0338;
    L_0x0394:
        r10 = 14;
        r0 = r16;
        if (r0 == r10) goto L_0x03d3;
    L_0x039a:
        r10 = 10;
        r0 = r16;
        if (r0 < r10) goto L_0x03a6;
    L_0x03a0:
        r10 = 12;
        r0 = r16;
        if (r0 <= r10) goto L_0x03b2;
    L_0x03a6:
        r10 = 14;
        r0 = r16;
        if (r0 == r10) goto L_0x03b2;
    L_0x03ac:
        r10 = 18;
        r0 = r16;
        if (r0 != r10) goto L_0x03d3;
    L_0x03b2:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, CD LOAD OK...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x033b }
        r10 = 1;
        r14.mLoadedFlag = r10;	 Catch:{ all -> 0x033b }
        r10 = 11;
        r14.mDiscType = r10;	 Catch:{ all -> 0x033b }
        r10 = 1;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x033b }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x033b }
        r12 = 11;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x033b }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x033b }
        r12 = 11;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x033b }
        goto L_0x0338;
    L_0x03d3:
        r10 = 16;
        r0 = r16;
        if (r0 != r10) goto L_0x03fa;
    L_0x03d9:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, DATA DISC LOAD OK...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x033b }
        r10 = 1;
        r14.mLoadedFlag = r10;	 Catch:{ all -> 0x033b }
        r10 = 12;
        r14.mDiscType = r10;	 Catch:{ all -> 0x033b }
        r10 = 1;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x033b }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x033b }
        r12 = r14.mDiscType;	 Catch:{ all -> 0x033b }
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x033b }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x033b }
        r12 = r14.mDiscType;	 Catch:{ all -> 0x033b }
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x033b }
        goto L_0x0338;
    L_0x03fa:
        r10 = 14;
        r0 = r16;
        if (r0 != r10) goto L_0x0421;
    L_0x0400:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, PICTURE DISC LOAD OK...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x033b }
        r10 = 1;
        r14.mLoadedFlag = r10;	 Catch:{ all -> 0x033b }
        r10 = 16;
        r14.mDiscType = r10;	 Catch:{ all -> 0x033b }
        r10 = 1;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x033b }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x033b }
        r12 = 16;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x033b }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x033b }
        r12 = 16;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x033b }
        goto L_0x0338;
    L_0x0421:
        r10 = 13;
        r0 = r16;
        if (r0 != r10) goto L_0x0448;
    L_0x0427:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, CDG DISC LOAD OK...";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x033b }
        r10 = 1;
        r14.mLoadedFlag = r10;	 Catch:{ all -> 0x033b }
        r10 = 17;
        r14.mDiscType = r10;	 Catch:{ all -> 0x033b }
        r10 = 1;
        fgDvdLoadOK = r10;	 Catch:{ all -> 0x033b }
        r10 = r14.dvpServicerHandler;	 Catch:{ all -> 0x033b }
        r12 = 17;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x033b }
        r10 = r14.dvphomeHandler;	 Catch:{ all -> 0x033b }
        r12 = 17;
        r14.sendMsgToHandle(r10, r12);	 Catch:{ all -> 0x033b }
        goto L_0x0338;
    L_0x0448:
        r10 = "DvdLogicManager";
        r12 = "[dvp][framework] Dvp Response, UNKNOWN DISC";
        android.util.Log.d(r10, r12);	 Catch:{ all -> 0x033b }
        goto L_0x0338;
    L_0x0451:
        r0 = r16;
        r14.mFileCnt = r0;
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, FILE TOTAL COUNT:";
        r11 = r11.append(r12);
        r12 = r14.mFileCnt;
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r10 = r14.dvpListHandler;
        r11 = 23;
        r14.sendMsgToHandle(r10, r11);
        r14.onAutoPlay();
        goto L_0x0003;
    L_0x047b:
        r4 = r14.navGetCurrentDir();
        if (r4 != 0) goto L_0x048a;
    L_0x0481:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, FILE CURRENT PATH is null !!!";
        android.util.Log.e(r10, r11);
        goto L_0x0003;
    L_0x048a:
        r14.mRestoredPath = r4;
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, FILE CURRENT PATH: ";
        r11 = r11.append(r12);
        r12 = r14.mRestoredPath;
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.i(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 15;
        r14.sendMsgToHandle(r10, r11);
        r10 = r14.dvpListHandler;
        r11 = 15;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x04b6:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, FILE ITEM...";
        android.util.Log.d(r10, r11);
        goto L_0x0003;
    L_0x04bf:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, CHANGE DIR...";
        android.util.Log.d(r10, r11);
        goto L_0x0003;
    L_0x04c8:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, DVP_FL_MENU ...";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 97;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x04d8:
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, MSG_FL_LIST_INFO arg1:";
        r11 = r11.append(r12);
        r0 = r16;
        r11 = r11.append(r0);
        r12 = " arg2:";
        r11 = r11.append(r12);
        r0 = r17;
        r11 = r11.append(r0);
        r11 = r11.toString();
        android.util.Log.e(r10, r11);
        r0 = r17;
        r14.mCurrentDirIndex = r0;
        r10 = r14.dvpListHandler;
        r11 = 123; // 0x7b float:1.72E-43 double:6.1E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x050b:
        r0 = r16;
        r14.mDiscTypeCnt = r0;
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, LISTTYPECNT -- mDiscTypeCnt:";
        r11 = r11.append(r12);
        r12 = r14.mDiscTypeCnt;
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r10 = r14.dvpListHandler;
        r11 = 27;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0532:
        r2 = 0;
        switch(r16) {
            case 0: goto L_0x0538;
            case 1: goto L_0x055c;
            case 2: goto L_0x0580;
            case 3: goto L_0x05a4;
            case 4: goto L_0x05c8;
            case 255: goto L_0x05ec;
            default: goto L_0x0536;
        };
    L_0x0536:
        goto L_0x0003;
    L_0x0538:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, ID3_TITLE...";
        android.util.Log.d(r10, r11);
        r2 = 0;
        r10 = r14.getID3Info(r2);
        r14.mId3InfoTitle = r10;
        r10 = r14.mId3InfoTitle;
        if (r10 != 0) goto L_0x0553;
    L_0x054a:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, TITLE IS null";
        android.util.Log.e(r10, r11);
        goto L_0x0003;
    L_0x0553:
        r10 = r14.dvdPlayHandler;
        r11 = 50;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x055c:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, ID3_ALBUM...";
        android.util.Log.d(r10, r11);
        r2 = 1;
        r10 = r14.getID3Info(r2);
        r14.mId3InfoAlbum = r10;
        r10 = r14.mId3InfoAlbum;
        if (r10 != 0) goto L_0x0577;
    L_0x056e:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, ID3_ALBUM IS null";
        android.util.Log.e(r10, r11);
        goto L_0x0003;
    L_0x0577:
        r10 = r14.dvdPlayHandler;
        r11 = 51;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0580:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, ID3_ARTIST...";
        android.util.Log.d(r10, r11);
        r2 = 2;
        r10 = r14.getID3Info(r2);
        r14.mId3InfoArtist = r10;
        r10 = r14.mId3InfoArtist;
        if (r10 != 0) goto L_0x059b;
    L_0x0592:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, mId3InfoArtist IS null";
        android.util.Log.e(r10, r11);
        goto L_0x0003;
    L_0x059b:
        r10 = r14.dvdPlayHandler;
        r11 = 52;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x05a4:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, ID3_GENRE...";
        android.util.Log.d(r10, r11);
        r2 = 3;
        r10 = r14.getID3Info(r2);
        r14.mId3InfoGenre = r10;
        r10 = r14.mId3InfoGenre;
        if (r10 != 0) goto L_0x05bf;
    L_0x05b6:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, mId3InfoGenre IS null";
        android.util.Log.e(r10, r11);
        goto L_0x0003;
    L_0x05bf:
        r10 = r14.dvdPlayHandler;
        r11 = 53;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x05c8:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, Dvp Response--ID3_YEAR...";
        android.util.Log.d(r10, r11);
        r2 = 4;
        r10 = r14.getID3Info(r2);
        r14.mId3InfoYear = r10;
        r10 = r14.mId3InfoYear;
        if (r10 != 0) goto L_0x05e3;
    L_0x05da:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, mId3InfoYear IS null";
        android.util.Log.e(r10, r11);
        goto L_0x0003;
    L_0x05e3:
        r10 = r14.dvdPlayHandler;
        r11 = 54;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x05ec:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, ID3_MAX...";
        android.util.Log.i(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 55;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x05fc:
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, DVP_CMD_PBC_ADO_ID3_PIC p1 = ";
        r11 = r11.append(r12);
        r12 = java.lang.Integer.toHexString(r16);
        r11 = r11.append(r12);
        r12 = " p2=";
        r11 = r11.append(r12);
        r12 = java.lang.Integer.toHexString(r17);
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r3 = r16;
        if (r3 != 0) goto L_0x0636;
    L_0x062a:
        r10 = 0;
        r14.mId3InfoPicData = r10;
    L_0x062d:
        r10 = r14.dvdPlayHandler;
        r11 = 56;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0636:
        r10 = r14.navGetId3Pic();
        r14.mId3InfoPicData = r10;
        goto L_0x062d;
    L_0x063d:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, DVP_CMD_PBC_ADO_LYRICS...";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 57;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x064d:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, DVP_CMD_PBC_ADO_EQ...";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 58;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x065d:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, DVP_CMD_PBC_JPG_ROTATE_STATE...";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 68;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x066d:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, DVP_CMD_PBC_JPG_RESOLUTION...";
        android.util.Log.d(r10, r11);
        r0 = r16;
        r14.mXResolution = r0;
        r0 = r17;
        r14.mYResolution = r0;
        r10 = r14.dvdPlayHandler;
        r11 = 67;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0685:
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, play state:";
        r11 = r11.append(r12);
        r0 = r16;
        r11 = r11.append(r0);
        r12 = "(stop:01, play:02 pause:07)";
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.i(r10, r11);
        r10 = fgCbmPause;
        if (r10 == 0) goto L_0x06b1;
    L_0x06a9:
        r10 = 2;
        r0 = r16;
        if (r0 != r10) goto L_0x06b1;
    L_0x06ae:
        r14.pause();
    L_0x06b1:
        r0 = r16;
        r14.mPicCdPlayState = r0;
        r10 = r14.dvdPlayHandler;
        r11 = 47;
        r14.sendMsgToHandle(r10, r11);
        r10 = r14.dvpListHandler;
        r11 = 47;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x06c5:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, VCD TRACK...";
        android.util.Log.d(r10, r11);
        r10 = r14.VcdTrack;
        r11 = 0;
        r10[r11] = r16;
        r10 = r14.VcdTrack;
        r11 = 1;
        r10[r11] = r17;
        r10 = r14.dvdPlayHandler;
        r11 = 36;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x06df:
        r0 = r16;
        r14.mCurrentTime = r0;
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, DVD CURRENT TIME: ";
        r11 = r11.append(r12);
        r0 = r16;
        r11 = r11.append(r0);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r10 = r14.mWaitSeek;
        if (r10 == 0) goto L_0x071d;
    L_0x0701:
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] wait seek ack, DVD CURRENT TIME: ";
        r11 = r11.append(r12);
        r0 = r16;
        r11 = r11.append(r0);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        goto L_0x0003;
    L_0x071d:
        r10 = r14.dvdPlayHandler;
        r11 = 30;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0726:
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, DVD TOTAL TIME: ";
        r11 = r11.append(r12);
        r0 = r16;
        r11 = r11.append(r0);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r0 = r16;
        r14.mTotalTime = r0;
        r10 = r14.dvdPlayHandler;
        r11 = 31;
        r14.sendMsgToHandle(r10, r11);
        r10 = "<unknown>";
        r14.mId3InfoTitle = r10;
        r10 = "<unknown>";
        r14.mId3InfoAlbum = r10;
        r10 = "<unknown>";
        r14.mId3InfoArtist = r10;
        r10 = "<unknown>";
        r14.mId3InfoGenre = r10;
        r10 = "<unknown>";
        r14.mId3InfoYear = r10;
        goto L_0x0003;
    L_0x0761:
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, DATA DISC PLAYING_IDX ...";
        r11 = r11.append(r12);
        r0 = r16;
        r11 = r11.append(r0);
        r12 = "...";
        r11 = r11.append(r12);
        r0 = r17;
        r11 = r11.append(r0);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r10 = r14.ddplaylist;
        r11 = 0;
        r10[r11] = r16;
        r10 = r14.ddplaylist;
        r11 = 1;
        r10[r11] = r17;
        r10 = r14.dvpListHandler;
        r11 = 42;
        r14.sendMsgToHandle(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 42;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x07a1:
        switch(r16) {
            case 2: goto L_0x07d1;
            case 3: goto L_0x07d5;
            case 4: goto L_0x07e1;
            case 6: goto L_0x07d9;
            case 7: goto L_0x07dd;
            case 21: goto L_0x07e5;
            default: goto L_0x07a4;
        };
    L_0x07a4:
        r10 = 3;
        r14.mRepeatMode = r10;
    L_0x07a7:
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, current repeat mode:";
        r11 = r11.append(r12);
        r12 = r14.mRepeatMode;
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 38;
        r14.sendMsgToHandle(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 49;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x07d1:
        r10 = 0;
        r14.mRepeatMode = r10;
        goto L_0x07a7;
    L_0x07d5:
        r10 = 3;
        r14.mRepeatMode = r10;
        goto L_0x07a7;
    L_0x07d9:
        r10 = 2;
        r14.mRepeatMode = r10;
        goto L_0x07a7;
    L_0x07dd:
        r10 = 1;
        r14.mRepeatMode = r10;
        goto L_0x07a7;
    L_0x07e1:
        r10 = 4;
        r14.mRepeatMode = r10;
        goto L_0x07a7;
    L_0x07e5:
        r10 = 5;
        r14.mRepeatMode = r10;
        goto L_0x07a7;
    L_0x07e9:
        r10 = 16;
        r0 = r16;
        if (r0 != r10) goto L_0x07fd;
    L_0x07ef:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, CD SHUFFLE MODE";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 59;
        r14.sendMsgToHandle(r10, r11);
    L_0x07fd:
        r10 = r14.dvdPlayHandler;
        r11 = 49;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0806:
        r0 = r16;
        r14.mCurrentTitle = r0;
        r0 = r17;
        r14.mCurrentChapter = r0;
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, DVD current title(";
        r11 = r11.append(r12);
        r12 = r14.mCurrentTitle;
        r11 = r11.append(r12);
        r12 = ") AND chapter(";
        r11 = r11.append(r12);
        r12 = r14.mCurrentChapter;
        r11 = r11.append(r12);
        r12 = ")";
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 32;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0843:
        r0 = r16;
        r14.mTitleCnt = r0;
        r0 = r17;
        r14.mChapterCount = r0;
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, DVD TOTAL TITLE(";
        r11 = r11.append(r12);
        r12 = r14.mTitleCnt;
        r11 = r11.append(r12);
        r12 = ") AND CHAPTER(";
        r11 = r11.append(r12);
        r12 = r14.mChapterCount;
        r11 = r11.append(r12);
        r12 = ")";
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 33;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0880:
        r10 = r14.dvdaudio;
        r11 = 0;
        r10[r11] = r16;
        r10 = r14.dvdaudio;
        r11 = 1;
        r10[r11] = r17;
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, DVD AUDIO total(";
        r11 = r11.append(r12);
        r12 = r14.dvdaudio;
        r13 = 1;
        r12 = r12[r13];
        r11 = r11.append(r12);
        r12 = ") and current(";
        r11 = r11.append(r12);
        r12 = r14.dvdaudio;
        r13 = 0;
        r12 = r12[r13];
        r11 = r11.append(r12);
        r12 = ")";
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 46;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x08c5:
        r10 = r14.dvdsubtilte;
        r11 = 0;
        r10[r11] = r16;
        r10 = r14.dvdsubtilte;
        r11 = 1;
        r10[r11] = r17;
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, CURRENT DVD SUBTITLE is--";
        r11 = r11.append(r12);
        r12 = r14.dvdsubtilte;
        r13 = 0;
        r12 = r12[r13];
        r11 = r11.append(r12);
        r12 = "/";
        r11 = r11.append(r12);
        r12 = r14.dvdsubtilte;
        r13 = 1;
        r12 = r12[r13];
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 44;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0904:
        r10 = r14.dvdangle;
        r11 = 0;
        r10[r11] = r17;
        r10 = r14.dvdangle;
        r11 = 1;
        r10[r11] = r16;
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, CURRENT DVD ANGLE is--";
        r11 = r11.append(r12);
        r12 = r14.dvdangle;
        r13 = 0;
        r12 = r12[r13];
        r11 = r11.append(r12);
        r12 = "/";
        r11 = r11.append(r12);
        r12 = r14.dvdangle;
        r13 = 1;
        r12 = r12[r13];
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 45;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0943:
        r0 = r16;
        r14.mVcdPBC = r0;
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, PBC MODE:";
        r11 = r11.append(r12);
        r12 = r14.mVcdPBC;
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 40;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x096a:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, DATA DISC CURRENT FILE NAME...";
        android.util.Log.d(r10, r11);
        r10 = r14.mDiscType;
        r11 = 12;
        if (r10 == r11) goto L_0x0986;
    L_0x0977:
        r10 = r14.mDiscType;
        r11 = 16;
        if (r10 == r11) goto L_0x0986;
    L_0x097d:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, DATA DISC CURRENT FILE NAME...do nothing......";
        android.util.Log.d(r10, r11);
        goto L_0x0003;
    L_0x0986:
        r10 = r14.navGetCurFilePath();
        r14.mPlayedFileName = r10;
        r10 = r14.mPlayedFileName;
        if (r10 != 0) goto L_0x0999;
    L_0x0990:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, DATA DISC CURRENT FILE NAME...null";
        android.util.Log.e(r10, r11);
        goto L_0x0003;
    L_0x0999:
        r10 = r14.dvdPlayHandler;
        r11 = 43;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x09a2:
        switch(r16) {
            case 0: goto L_0x09cb;
            case 11: goto L_0x09cf;
            case 12: goto L_0x09d3;
            case 13: goto L_0x09d7;
            default: goto L_0x09a5;
        };
    L_0x09a5:
        r10 = 0;
        r14.mVcdChannel = r10;
    L_0x09a8:
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, VCD CHANNEL:";
        r11 = r11.append(r12);
        r12 = r14.mVcdChannel;
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 41;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x09cb:
        r10 = 0;
        r14.mVcdChannel = r10;
        goto L_0x09a8;
    L_0x09cf:
        r10 = 1;
        r14.mVcdChannel = r10;
        goto L_0x09a8;
    L_0x09d3:
        r10 = 2;
        r14.mVcdChannel = r10;
        goto L_0x09a8;
    L_0x09d7:
        r10 = 3;
        r14.mVcdChannel = r10;
        goto L_0x09a8;
    L_0x09db:
        switch(r16) {
            case 1: goto L_0x09e0;
            case 2: goto L_0x09f0;
            case 3: goto L_0x0a00;
            case 4: goto L_0x0a10;
            case 5: goto L_0x0a20;
            case 6: goto L_0x0a30;
            case 7: goto L_0x0a40;
            case 8: goto L_0x0a50;
            case 9: goto L_0x0a60;
            default: goto L_0x09de;
        };
    L_0x09de:
        goto L_0x0003;
    L_0x09e0:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, audio codec unsupport";
        android.util.Log.i(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 111; // 0x6f float:1.56E-43 double:5.5E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x09f0:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, video codec unsupport";
        android.util.Log.i(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 112; // 0x70 float:1.57E-43 double:5.53E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0a00:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, video res unsupport";
        android.util.Log.i(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 113; // 0x71 float:1.58E-43 double:5.6E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0a10:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, no audio";
        android.util.Log.i(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 114; // 0x72 float:1.6E-43 double:5.63E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0a20:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, no video";
        android.util.Log.i(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 115; // 0x73 float:1.61E-43 double:5.7E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0a30:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, FPS unsupport";
        android.util.Log.i(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 116; // 0x74 float:1.63E-43 double:5.73E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0a40:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, GMC unsupport";
        android.util.Log.i(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 117; // 0x75 float:1.64E-43 double:5.8E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0a50:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, profile unsupport";
        android.util.Log.i(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 118; // 0x76 float:1.65E-43 double:5.83E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0a60:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, drm unsupport";
        android.util.Log.i(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 119; // 0x77 float:1.67E-43 double:5.9E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0a70:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, DVP_LEVEL_PWD";
        android.util.Log.i(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 122; // 0x7a float:1.71E-43 double:6.03E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0a80:
        r7 = r14.getCurFileCount();
        r6 = r14.getThumbNailFirstIdx();
        r9 = 0;
        r8 = 0;
        if (r7 <= 0) goto L_0x0a98;
    L_0x0a8c:
        r9 = r7 / 12;
        r10 = r7 % 12;
        if (r10 == 0) goto L_0x0a94;
    L_0x0a92:
        r9 = r9 + 1;
    L_0x0a94:
        r10 = r6 / 12;
        r8 = r10 + 1;
    L_0x0a98:
        r14.mPreviewPageIndex = r8;
        r14.mPreviewPageCount = r9;
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, IMAGE_PREVIEW_OK";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 92;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0aac:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, FILEPREPARE";
        android.util.Log.d(r10, r11);
        r10 = r14.dvpListHandler;
        r11 = 28;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0abc:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, LMCLICK_ITEM_TYPE";
        android.util.Log.d(r10, r11);
        r0 = r16;
        r14.mLMClickItemType = r0;
        r0 = r17;
        r14.mDDPlayType = r0;
        r10 = r14.dvpListHandler;
        r11 = 95;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0ad4:
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, audio play index update: ";
        r11 = r11.append(r12);
        r0 = r16;
        r11 = r11.append(r0);
        r12 = "/";
        r11 = r11.append(r12);
        r0 = r17;
        r11 = r11.append(r0);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r10 = r14.ddplaylist;
        r11 = 0;
        r10[r11] = r16;
        r10 = r14.ddplaylist;
        r11 = 1;
        r10[r11] = r17;
        r10 = r14.dvdPlayHandler;
        r11 = 42;
        r14.sendMsgToHandle(r10, r11);
        r10 = r14.dvpListHandler;
        r11 = 42;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0b14:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, CD, track number, track lba length";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 60;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0b24:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, +++++++++++++ ripping data ready, AP can get and write to device ++++++++++++";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 61;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0b34:
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework] Dvp Response, ripping track progress..., arg1: ";
        r11 = r11.append(r12);
        r0 = r16;
        r11 = r11.append(r0);
        r11 = r11.toString();
        android.util.Log.d(r10, r11);
        r0 = r16;
        r14.mRipProgress = r0;
        r10 = r14.dvdPlayHandler;
        r11 = 62;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0b5b:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, finish ripping current track...";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 63;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0b6b:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, audio driver control...";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 64;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0b7b:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, ripping error state...";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 65;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0b8b:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework] Dvp Response, frist pic ready";
        android.util.Log.d(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 48;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0b9b:
        r10 = "DvdLogicManager";
        r11 = new java.lang.StringBuilder;
        r11.<init>();
        r12 = "[dvp][framework]iii ++++++++++++++++++ DVP_CMD_DISC_INSERT(";
        r11 = r11.append(r12);
        r0 = r16;
        r11 = r11.append(r0);
        r12 = ", ";
        r11 = r11.append(r12);
        r0 = r17;
        r11 = r11.append(r0);
        r12 = ") ++++++++++++++++++";
        r11 = r11.append(r12);
        r11 = r11.toString();
        android.util.Log.i(r10, r11);
        r10 = 1;
        r0 = r16;
        if (r10 == r0) goto L_0x0bdc;
    L_0x0bcc:
        r10 = r14.dvpServicerHandler;
        r11 = 13;
        r14.sendMsgToHandle(r10, r11);
        r10 = r14.dvphomeHandler;
        r11 = 13;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0bdc:
        r10 = 1;
        r0 = r16;
        if (r10 != r0) goto L_0x0003;
    L_0x0be1:
        r10 = r14.dvpServicerHandler;
        r11 = 1281; // 0x501 float:1.795E-42 double:6.33E-321;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0bea:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework]DVP_CMD_FL_TYPE_COUNT_IN_DISC ++++++++++++++++++";
        android.util.Log.i(r10, r11);
        r10 = r14.dvpListHandler;
        r11 = 126; // 0x7e float:1.77E-43 double:6.23E-322;
        r14.sendMsgToHandle(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 126; // 0x7e float:1.77E-43 double:6.23E-322;
        r14.sendMsgToHandle(r10, r11);
        r10 = r14.dvphomeHandler;
        r11 = 126; // 0x7e float:1.77E-43 double:6.23E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
    L_0x0c08:
        r10 = "DvdLogicManager";
        r11 = "[dvp][framework]DVP_CMD_PBC_ZOOM debug++++++++++++++++++";
        android.util.Log.i(r10, r11);
        r10 = r14.dvdPlayHandler;
        r11 = 127; // 0x7f float:1.78E-43 double:6.27E-322;
        r14.sendMsgToHandle(r10, r11);
        goto L_0x0003;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.autochips.dvp.DvdLogicManager.handleDvpCmd(int, int, int):void");
    }

    public void sendMsgToDvpPlayerHandle(int msgwhat) {
        sendMsgToHandle(this.dvdPlayHandler, msgwhat);
    }

    private void sendMsgToHandle(Handler mHandler, int msgwhat) {
        if (this.mCbmNoLoadOkPause && mHandler == this.dvphomeHandler) {
            Log.e(TAG, "[dvp][framework] ++++++++++++ mCbmNoLoadOkPause no send msg to home handle ++++++++++++");
        } else if (mHandler != null) {
            mHandler.removeMessages(msgwhat);
            mHandler.sendMessage(mHandler.obtainMessage(msgwhat));
        }
    }
}
