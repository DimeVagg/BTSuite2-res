package com.autochips.ipod;

import android.cbm.CBManager;
import android.cbm.CBManager.OnActionListener;
import android.os.Parcel;
import android.util.Log;
import com.autochips.inputsource.HDMI;

public class IPodSDK {
    private static final boolean DEBUG = true;
    public static final int INFO_MAX_STR_LEN = 256;
    public static final int MAX_ARTWORK_FTM_NUM = 8;
    public static final int MAX_ARTWORK_INFO_NUM = 8;
    public static final int MAX_ARTWORK_TIME_NUM = 8;
    private static final String TAG = "IPodSDK";
    private static IPodSDK mSelf = null;
    private CBManager mCBM = null;
    private OnActionListener mCBMAction = new C00851();

    /* renamed from: com.autochips.ipod.IPodSDK$1 */
    class C00851 implements OnActionListener {
        C00851() {
        }

        public int onAction(int cmd, int appScene, int priority) {
            switch (cmd) {
                case 2:
                case 4:
                case 5:
                    try {
                        if (IPodSDK.this.getPlayStatus_Ex().ePbStatus == PLAY_ST_EX_E.PB_ST_EX_PLAY_0X01) {
                            IPodSDK.this.playControl((byte) 1);
                        }
                    } catch (IPodException e) {
                    }
                    IPodSDK.this.stopPlayAudio();
                    break;
                case 3:
                case 6:
                    IPodSDK.this.startPlayAudio();
                    try {
                        if (IPodSDK.this.getPlayStatus_Ex().ePbStatus == PLAY_ST_EX_E.PB_ST_EX_PAUSE_0X02) {
                            IPodSDK.this.playControl((byte) 1);
                            break;
                        }
                    } catch (IPodException e2) {
                        break;
                    }
                    break;
            }
            return 0;
        }
    }

    public static abstract class PlayingTrackInfo {
        public int type;
    }

    public static class ARTWORK_CNT_INFO_T extends PlayingTrackInfo {
        public ARTWORK_CNT_T[] artworkCnt;
        public short infoNum;

        public void set(short arg1, ARTWORK_CNT_T[] arg2) {
            this.infoNum = arg1;
            this.artworkCnt = arg2;
        }
    }

    public static class ARTWORK_CNT_T extends PlayingTrackInfo {
        public short artWorkCnt;
        public short formatID;

        public void set(short arg1, short arg2) {
            this.formatID = arg1;
            this.artWorkCnt = arg2;
        }
    }

    public static class ARTWORK_DATA_T {
        public short botRightX;
        public short botRightY;
        public int dataBufSize;
        public short descritorIndex;
        public byte displayPixFmtCode;
        public short imgHeight;
        public short imgWidth;
        public byte[] pvData;
        public int rowSizeInByte;
        public short topLeftX;
        public short topLeftY;

        public void set(short arg1, byte arg2, short arg3, short arg4, short arg5, short arg6, short arg7, short arg8, int arg9, int arg10, byte[] arg11) {
            this.descritorIndex = arg1;
            this.displayPixFmtCode = arg2;
            this.imgWidth = arg3;
            this.imgHeight = arg4;
            this.topLeftX = arg5;
            this.topLeftY = arg6;
            this.botRightX = arg7;
            this.botRightY = arg8;
            this.rowSizeInByte = arg9;
            this.dataBufSize = arg10;
            this.pvData = arg11;
        }
    }

    public static class ARTWORK_FMTS extends PlayingTrackInfo {
        public short formatID;
        public short imgHeight;
        public short imgWidth;
        public byte pixFormat;

        public void set(short arg1, byte arg2, short arg3, short arg4) {
            this.formatID = arg1;
            this.pixFormat = arg2;
            this.imgWidth = arg3;
            this.imgHeight = arg4;
        }
    }

    public static class ARTWORK_FMTS_INFO_T {
        public int fmtNum;
        public ARTWORK_FMTS[] prArtworkFmt;

        public void set(int arg1, ARTWORK_FMTS[] arg2) {
            this.fmtNum = arg1;
            this.prArtworkFmt = arg2;
        }
    }

    public static class ARTWORK_TIMES_T {
        public int infoNum;
        public int[] timePos;

        public void set(int arg1, int[] arg2) {
            this.infoNum = arg1;
            this.timePos = arg2;
        }
    }

    public static abstract class NOTIFY_INFO_A {
    }

    public static class AUTH_RESULT_T extends NOTIFY_INFO_A {
        public int authResult;
        public boolean canReTry;
        public byte categoryMode;
        public boolean idpMode;
        public boolean inAuthoring;

        public void set(int arg1, boolean arg2, byte arg3, boolean arg4, boolean arg5) {
            this.authResult = arg1;
            this.idpMode = arg2;
            this.categoryMode = arg3;
            this.inAuthoring = arg4;
            this.canReTry = arg5;
        }
    }

    public static class CHAPTER_INFO_T {
        public int chapterCnt;
        public int chapterIndex;

        public void set(int arg1, int arg2) {
            this.chapterCnt = arg1;
            this.chapterIndex = arg2;
        }
    }

    public enum DB_CATEGORY_TYPE_E {
        DB_TYPE_TOP_LEVEL(0),
        DB_TYPE_PLAYLIST(1),
        DB_TYPE_ARTIST(2),
        DB_TYPE_ALBUM(3),
        DB_TYPE_GENRE(4),
        DB_TYPE_TRACK(5),
        DB_TYPE_COMPOSER(6),
        DB_TYPE_AUDIOBOOK(7),
        DB_TYPE_PODCAST(8),
        DB_TYPE_NESTED_PLAYLIST(9),
        DB_TYPE_GENIUS_MIXES(10);
        
        int value;

        private DB_CATEGORY_TYPE_E(int size) {
            this.value = size;
        }

        public static DB_CATEGORY_TYPE_E valueOf(int value) {
            switch (value) {
                case 1:
                    return DB_TYPE_PLAYLIST;
                case 2:
                    return DB_TYPE_ARTIST;
                case 3:
                    return DB_TYPE_ALBUM;
                case 4:
                    return DB_TYPE_GENRE;
                case 5:
                    return DB_TYPE_TRACK;
                case 6:
                    return DB_TYPE_COMPOSER;
                case 7:
                    return DB_TYPE_AUDIOBOOK;
                case 8:
                    return DB_TYPE_PODCAST;
                case 9:
                    return DB_TYPE_NESTED_PLAYLIST;
                case 10:
                    return DB_TYPE_GENIUS_MIXES;
                default:
                    return DB_TYPE_TOP_LEVEL;
            }
        }

        public DB_CATEGORY_TYPE_E next() {
            return valueOf(this.value + 1);
        }
    }

    public static class DB_RECITEM_T {
        public int recIdx;
        public byte[] szRecInfo;

        public void set(int arg1, byte[] arg2) {
            this.recIdx = arg1;
            this.szRecInfo = arg2;
        }
    }

    public static class DIGITALAUDIO_CONFIGUE_T extends NOTIFY_INFO_A {
        public short sampleRateSupportFromIpod;

        public void set(short arg1) {
            this.sampleRateSupportFromIpod = arg1;
        }
    }

    public enum E_IPOD_AUTHENTICATION_STATUS {
        IPOD_AUTHENTICATION_PASS(0),
        IPOD_AUTHENTICATION_NONE(1),
        IPOD_AUTHENTICATION_FAIL(2);
        
        int value;

        private E_IPOD_AUTHENTICATION_STATUS(int size) {
            this.value = size;
        }

        public static E_IPOD_AUTHENTICATION_STATUS valueOf(int value) {
            switch (value) {
                case 0:
                    return IPOD_AUTHENTICATION_PASS;
                case 1:
                    return IPOD_AUTHENTICATION_NONE;
                default:
                    return IPOD_AUTHENTICATION_FAIL;
            }
        }

        public E_IPOD_AUTHENTICATION_STATUS next() {
            return valueOf(this.value + 1);
        }
    }

    public interface EventCallback {
        void onEvent(NOTIFY_INFO_T notify_info_t);
    }

    public static class IPodException extends Exception {
        private static final String ERRCODE_END_TAG = "@";
        private static final String ERRCODE_TAG = "@ERRCODE=";
        private static final int ERRCODE_TAG_LEN = ERRCODE_TAG.length();
        public static final int INIT_ER = 258;
        public static final int INTR_ER = 256;
        public static final int LOAD_ER = 257;
        private int errcode = 256;

        public IPodException(String message) {
            super(message);
            this.errcode = parseErrCode(message);
        }

        public IPodException(String message, Throwable cause) {
            super(message, cause);
            this.errcode = parseErrCode(message);
        }

        public IPodException(Throwable cause) {
            super(cause);
            this.errcode = parseErrCode(cause.getMessage());
        }

        public int getErrCode() {
            return this.errcode;
        }

        private static int parseErrCode(String message) {
            if (message == null) {
                return 256;
            }
            int idx = message.indexOf(ERRCODE_TAG);
            if (idx == -1) {
                return 256;
            }
            idx += ERRCODE_TAG_LEN;
            int idxe = message.indexOf(ERRCODE_END_TAG, idx);
            if (idxe == -1 || idxe == idx) {
                return 256;
            }
            return Integer.parseInt(message.substring(idx, idxe));
        }
    }

    public enum NOTIFY_INFO_E {
        AUTH_STATE(0),
        PB_STATUS(1),
        DIGITALAUIDO_CFG(2),
        STATUS_NOTIFY(3),
        BAD_NOTIFY(4);
        
        int value;

        private NOTIFY_INFO_E(int size) {
            this.value = size;
        }

        public static NOTIFY_INFO_E valueOf(int value) {
            switch (value) {
                case 0:
                    return AUTH_STATE;
                case 1:
                    return PB_STATUS;
                case 2:
                    return DIGITALAUIDO_CFG;
                case 3:
                    return STATUS_NOTIFY;
                default:
                    return BAD_NOTIFY;
            }
        }
    }

    public static class NOTIFY_INFO_T {
        public NOTIFY_INFO_E eNotifyType;
        public NOTIFY_INFO_A rNotify;

        public void set(int arg1, NOTIFY_INFO_A arg2) {
            this.eNotifyType = NOTIFY_INFO_E.valueOf(arg1);
            this.rNotify = arg2;
        }
    }

    public static class PB_NOTIFY_STATUS_INF_T extends NOTIFY_INFO_A {
        public int chapsetMsOffset;
        public boolean chaptMsOffsetValid;
        public int chaptSecOffset;
        public boolean chaptSecOffsetValid;
        public int chapterIndex;
        public boolean chapterIndexValid;
        public PLAY_ST_EX_E eStatus;
        public boolean lyricInfoValid;
        public boolean lyricReady;
        public byte pbStatuValid;
        public int repeatState;
        public boolean repeatStateValid;
        public int shuffleState;
        public boolean shuffleStateValid;
        public boolean trackCapa;
        public int trackCapaBits;
        public int trackIndex;
        public boolean trackIndexValid;
        public int trackMsOffset;
        public boolean trackMsOffsetValid;
        public byte trackPlayMode;
        public boolean trackPlayModeValid;
        public int trackSecOffset;
        public boolean trackSecOffsetValid;
        public long trackUID;
        public boolean trackUIDValid;

        public void set(byte arg1, int arg2, boolean arg3, int arg4, boolean arg5, int arg6, boolean arg7, int arg8, boolean arg9, int arg10, boolean arg11, int arg12, boolean arg13, int arg14, boolean arg15, long arg16, boolean arg17, byte arg18, boolean arg19, boolean arg20, boolean arg21, int arg22, boolean arg23, int arg24, boolean arg25, int arg26) {
            this.pbStatuValid = arg1;
            this.eStatus = PLAY_ST_EX_E.valueOf(arg2);
            this.trackIndexValid = arg3;
            this.trackIndex = arg4;
            this.trackMsOffsetValid = arg5;
            this.trackMsOffset = arg6;
            this.chapterIndexValid = arg7;
            this.chapterIndex = arg8;
            this.trackSecOffsetValid = arg9;
            this.trackSecOffset = arg10;
            this.chaptMsOffsetValid = arg11;
            this.chapsetMsOffset = arg12;
            this.chaptSecOffsetValid = arg13;
            this.chaptSecOffset = arg14;
            this.trackUIDValid = arg15;
            this.trackUID = arg16;
            this.trackPlayModeValid = arg17;
            this.trackPlayMode = arg18;
            this.lyricInfoValid = arg19;
            this.lyricReady = arg20;
            this.trackCapa = arg21;
            this.trackCapaBits = arg22;
            this.shuffleStateValid = arg23;
            this.shuffleState = arg24;
            this.repeatStateValid = arg25;
            this.repeatState = arg26;
        }
    }

    public enum PLAY_ST_EX_E {
        PB_ST_EX_STOP_0X00(0),
        PB_ST_EX_PLAY_0X01(1),
        PB_ST_EX_PAUSE_0X02(2),
        PB_ST_EX_PF_0X03(3),
        PB_ST_EX_FR_0X04(4),
        PB_ST_EX_REWIND_0X05(5),
        PB_ST_EX_FFW_SEEK_STOP(6),
        PB_ST_EX_REW_SEEK_STOP(7),
        PB_ST_EX_FFW_SEEK_START(8),
        PB_ST_EX_REW_SEEK_START(9),
        PB_ST_EX_ERR_0XFF(HDMI.RCP_KEY_INVAILD);
        
        int value;

        private PLAY_ST_EX_E(int size) {
            this.value = size;
        }

        public static PLAY_ST_EX_E valueOf(int value) {
            switch (value) {
                case 0:
                    return PB_ST_EX_STOP_0X00;
                case 1:
                    return PB_ST_EX_PLAY_0X01;
                case 2:
                    return PB_ST_EX_PAUSE_0X02;
                case 3:
                    return PB_ST_EX_PF_0X03;
                case 4:
                    return PB_ST_EX_FR_0X04;
                case 5:
                    return PB_ST_EX_REWIND_0X05;
                case 6:
                    return PB_ST_EX_FFW_SEEK_STOP;
                case 7:
                    return PB_ST_EX_REW_SEEK_STOP;
                case 8:
                    return PB_ST_EX_FFW_SEEK_START;
                case 9:
                    return PB_ST_EX_REW_SEEK_START;
                default:
                    return PB_ST_EX_ERR_0XFF;
            }
        }

        public PLAY_ST_EX_E next() {
            return valueOf(this.value + 1);
        }
    }

    public static class PLAY_ST_INFO_EX_T {
        public PLAY_ST_EX_E ePbStatus;
        public int trackLen;
        public int trackPos;

        public void set(int arg1, int arg2, int arg3) {
            this.trackLen = arg1;
            this.trackPos = arg2;
            this.ePbStatus = PLAY_ST_EX_E.valueOf(arg3);
        }
    }

    public static class PLAY_ST_INFO_T {
        public PLAY_ST_EX_E ePbStatus;
        public int trackIdx;
        public int trackLen;
        public int trackPos;

        public void set(int arg1, int arg2, int arg3, int arg4) {
            this.trackIdx = arg1;
            this.trackLen = arg2;
            this.trackPos = arg3;
            this.ePbStatus = PLAY_ST_EX_E.valueOf(arg4);
        }
    }

    public static class PREFERENCES_T {
        public byte preferenceClassID;
        public byte preferenceSettingID;

        public void set(byte arg1, byte arg2) {
            this.preferenceClassID = arg1;
            this.preferenceSettingID = arg2;
        }
    }

    public enum STATUS_E {
        PLUG_IN(0),
        PLUG_OUT(1),
        BAD_STATUS(2);
        
        int value;

        private STATUS_E(int size) {
            this.value = size;
        }

        public static STATUS_E valueOf(int value) {
            switch (value) {
                case 0:
                    return PLUG_IN;
                case 1:
                    return PLUG_OUT;
                default:
                    return BAD_STATUS;
            }
        }
    }

    public static class STATUS_T extends NOTIFY_INFO_A {
        public STATUS_E iPodStatus;

        public void set(int arg1) {
            this.iPodStatus = STATUS_E.valueOf(arg1);
        }
    }

    public enum SWI_SINK_TYPE_T {
        SWI_SINK_TYPE_NONE(0),
        SWI_SINK_TYPE_FRONT(1),
        SWI_SINK_TYPE_REAR(2),
        SWI_SINK_TYPE_FRONT_REAR(3);
        
        int value;

        private SWI_SINK_TYPE_T(int size) {
            this.value = size;
        }

        public static SWI_SINK_TYPE_T valueOf(int value) {
            switch (value) {
                case 1:
                    return SWI_SINK_TYPE_FRONT;
                case 2:
                    return SWI_SINK_TYPE_REAR;
                case 3:
                    return SWI_SINK_TYPE_FRONT_REAR;
                default:
                    return SWI_SINK_TYPE_NONE;
            }
        }

        public SWI_SINK_TYPE_T next() {
            return valueOf(this.value + 1);
        }
    }

    public static class TRACK_CAP_INF_T extends PlayingTrackInfo {
        public short chapterCount;
        public boolean containVideo;
        public boolean hasAlbumArtWork;
        public boolean hasChapter;
        public boolean hasDescription;
        public boolean hasLocalCasting;
        public boolean hasLyrics;
        public boolean hasReleaseDate;
        public boolean isAudioBook;
        public boolean queue2PlayVideo;
        public int timeLen;

        public void set(boolean arg1, boolean arg2, boolean arg3, boolean arg4, boolean arg5, boolean arg6, boolean arg7, boolean arg8, boolean arg9, int arg10, short arg11) {
            this.queue2PlayVideo = arg1;
            this.containVideo = arg2;
            this.hasDescription = arg3;
            this.hasReleaseDate = arg4;
            this.hasLocalCasting = arg5;
            this.hasLyrics = arg6;
            this.hasAlbumArtWork = arg7;
            this.hasChapter = arg8;
            this.isAudioBook = arg9;
            this.timeLen = arg10;
            this.chapterCount = arg11;
        }
    }

    public static class TRACK_GENRE_INFO_T extends PlayingTrackInfo {
        public byte[] title;

        public void set(byte[] arg1) {
            this.title = arg1;
        }
    }

    public enum TRACK_INF_TYPE_E {
        TRACK_CAP_INF(0),
        TRACK_LOCALCOASTING_NAME(1),
        TRACK_DATE_INFOTYPE_CODE(2),
        TRACK_DESCRIPTION(3),
        TRACK_SONG_LYRICS(4),
        TRACK_GENRE(5),
        TRACK_COMPOSER(6),
        TRACK_ARTWORK_CNT(7),
        TRACK_INF_NONE(8);
        
        int value;

        private TRACK_INF_TYPE_E(int size) {
            this.value = size;
        }

        public static TRACK_INF_TYPE_E valueOf(int value) {
            switch (value) {
                case 0:
                    return TRACK_CAP_INF;
                case 1:
                    return TRACK_LOCALCOASTING_NAME;
                case 2:
                    return TRACK_DATE_INFOTYPE_CODE;
                case 3:
                    return TRACK_DESCRIPTION;
                case 4:
                    return TRACK_SONG_LYRICS;
                case 5:
                    return TRACK_GENRE;
                case 6:
                    return TRACK_COMPOSER;
                case 7:
                    return TRACK_ARTWORK_CNT;
                default:
                    return TRACK_INF_NONE;
            }
        }

        public TRACK_INF_TYPE_E next() {
            return valueOf(this.value + 1);
        }
    }

    public static class TRACK_RELEASE_DATE_T extends PlayingTrackInfo {
        public byte day;
        public byte hour;
        public byte minute;
        public byte month;
        public byte second;
        public byte weekDay;
        public short year;

        public void set(byte arg1, byte arg2, byte arg3, byte arg4, byte arg5, byte arg6, short arg7) {
            this.second = arg1;
            this.minute = arg2;
            this.hour = arg3;
            this.day = arg4;
            this.month = arg5;
            this.weekDay = arg6;
            this.year = arg7;
        }
    }

    private native boolean native_deinit();

    private native void native_enterRemoteUIMode();

    private native void native_exitRemoteUIMode();

    private native void native_getArtWorkFormats(ARTWORK_FMTS_INFO_T artwork_fmts_info_t);

    private native boolean native_getAudioDSP();

    private native AUTH_RESULT_T native_getAuthStatus();

    private native int native_getCurEQProfileIndex();

    private native CHAPTER_INFO_T native_getCurPlayingTrackChapterInfo();

    private native int native_getCurPlayingTrackIdx();

    private native int native_getDbTrackInfo(int i, int i2, byte b);

    private native String native_getIndexedPlayingTrackAlbum(int i);

    private native String native_getIndexedPlayingTrackArtist(int i);

    private native PlayingTrackInfo native_getIndexedPlayingTrackInfo(int i, int i2, int i3);

    private native String native_getIndexedPlayingTrackTitle(int i);

    private native int native_getNumEQProfile();

    private native int native_getNumPlayingTracks();

    private native int native_getNumberCategorizedDBRecords(byte b);

    private native PLAY_ST_INFO_T native_getPlayStatus();

    private native PLAY_ST_INFO_EX_T native_getPlayStatus_Ex();

    private native byte native_getRepeatSetting();

    private native byte native_getShuffleSetting();

    private native void native_getTrackArtWorkData(int i, short s, int i2, ARTWORK_DATA_T artwork_data_t);

    private native void native_getTrackArtWorkTimes(int i, short s, short s2, short s3, ARTWORK_TIMES_T artwork_times_t);

    private native int native_getVolume();

    private native long native_getiPodOptions();

    private native long native_getiPodOptionsForLingo(byte b);

    private native PREFERENCES_T native_getiPodPreferences(byte b);

    private native boolean native_init();

    private native void native_playControl(byte b);

    private native void native_playCurrentSelection(int i);

    private native boolean native_releaseAudioDSP();

    private native int native_requestLingoProtocolVersion(byte b);

    private native void native_resetDBSelection();

    private native void native_resetDBSelectionHierarchy(byte b);

    private native DB_RECITEM_T native_retrieveCategorizedDBRecords(byte b, int i, int i2);

    private native void native_seek(int i);

    private native void native_selectDBRecord(byte b, int i);

    private native void native_selectSortDBRecord(byte b, int i, byte b2);

    private native boolean native_setADecSinkInfo(int i);

    private native void native_setCurrentPlayingTrack(int i);

    private native void native_setEventCallback(EventCallback eventCallback);

    private native void native_setPlayStatusChangeNotification(int i, int i2);

    private native void native_setRemoteEvent(int i);

    private native void native_setRepeatMode(byte b, boolean z);

    private native void native_setShuffleMode(byte b, boolean z);

    private native void native_setVideoDelay(int i);

    private native void native_setVolume(int i);

    private native void native_setiPodPreferences(byte b, byte b2);

    private native void native_start();

    private native boolean native_startPlayAudio();

    private native void native_stop();

    private native boolean native_stopPlayAudio();

    private boolean initCBM() {
        if (this.mCBM == null) {
            this.mCBM = new CBManager();
        }
        this.mCBM.setOnActionListener(this.mCBMAction);
        Parcel reply = Parcel.obtain();
        if (this.mCBM.request(14, 1, reply) != 0 || reply.readInt() == 0) {
            return false;
        }
        return DEBUG;
    }

    private boolean releaseCBM() {
        if (this.mCBM != null) {
            this.mCBM.setOnActionListener(null);
            this.mCBM.release();
            this.mCBM = null;
        }
        return DEBUG;
    }

    static {
        System.loadLibrary("ipodsdk_jni");
    }

    public static IPodSDK getInstance() {
        if (mSelf == null) {
            mSelf = new IPodSDK();
        }
        return mSelf;
    }

    private IPodSDK() {
    }

    private static void Log_IF(String msg) {
        Log.v(TAG, msg);
    }

    public boolean init() {
        if (initCBM()) {
            return native_init();
        }
        return false;
    }

    public boolean deinit() {
        if (releaseCBM()) {
            return native_deinit();
        }
        return false;
    }

    public boolean startPlayAudio() {
        return native_startPlayAudio();
    }

    public boolean stopPlayAudio() {
        return native_stopPlayAudio();
    }

    public boolean getAudioDSP() {
        return native_getAudioDSP();
    }

    public boolean releaseAudioDSP() {
        return native_releaseAudioDSP();
    }

    public boolean setADecSinkInfo(SWI_SINK_TYPE_T eSink) throws IPodException {
        return native_setADecSinkInfo(eSink.value);
    }

    public void setVolume(int volume) throws IPodException {
        native_setVolume(volume);
    }

    public int getVolume() throws IPodException {
        return native_getVolume();
    }

    public void seek(int ms) throws IPodException {
        native_seek(ms);
    }

    public void enterRemoteUIMode() throws IPodException {
        native_enterRemoteUIMode();
    }

    public void exitRemoteUIMode() throws IPodException {
        native_exitRemoteUIMode();
    }

    public void resetDBSelection() throws IPodException {
        native_resetDBSelection();
    }

    public void setRepeatMode(byte repeatMode, boolean fgRestore) throws IPodException {
        native_setRepeatMode(repeatMode, fgRestore);
    }

    public int getNumEQProfile() throws IPodException {
        return native_getNumEQProfile();
    }

    public int getCurEQProfileIndex() throws IPodException {
        return native_getCurEQProfileIndex();
    }

    public void setShuffleMode(byte shuffleMode, boolean fgRestore) throws IPodException {
        native_setShuffleMode(shuffleMode, fgRestore);
    }

    public void playCurrentSelection(int selectTrackRecIndex) throws IPodException {
        native_playCurrentSelection(selectTrackRecIndex);
    }

    public void setCurrentPlayingTrack(int curPlayingTrackIndex) throws IPodException {
        native_setCurrentPlayingTrack(curPlayingTrackIndex);
    }

    public void selectDBRecord(byte dbCategaroy, int recIndex) throws IPodException {
        native_selectDBRecord(dbCategaroy, recIndex);
    }

    public void selectSortDBRecord(byte dbCategaroy, int recIndex, byte sortOrder) throws IPodException {
        native_selectSortDBRecord(dbCategaroy, recIndex, sortOrder);
    }

    public int getNumberCategorizedDBRecords(byte dbCategory) throws IPodException {
        return native_getNumberCategorizedDBRecords(dbCategory);
    }

    public DB_RECITEM_T retrieveCategorizedDBRecords(byte dbCategory, int startRecIdx, int recCnt) throws IPodException {
        return native_retrieveCategorizedDBRecords(dbCategory, startRecIdx, recCnt);
    }

    public byte getShuffleSetting() throws IPodException {
        return native_getShuffleSetting();
    }

    public byte getRepeatSetting() throws IPodException {
        return native_getRepeatSetting();
    }

    public int getCurPlayingTrackIdx() throws IPodException {
        return native_getCurPlayingTrackIdx();
    }

    public PlayingTrackInfo getIndexedPlayingTrackInfo(int playbackTrackIndex, int chapIndex, TRACK_INF_TYPE_E eTrackInfoType) throws IPodException {
        return native_getIndexedPlayingTrackInfo(playbackTrackIndex, chapIndex, eTrackInfoType.value);
    }

    public String getIndexedPlayingTrackTitle(int playbackTrackIndex) throws IPodException {
        return native_getIndexedPlayingTrackTitle(playbackTrackIndex);
    }

    public String getIndexedPlayingTrackArtist(int playbackTrackIndex) throws IPodException {
        return native_getIndexedPlayingTrackArtist(playbackTrackIndex);
    }

    public String getIndexedPlayingTrackAlbum(int playbackTrackIndex) throws IPodException {
        return native_getIndexedPlayingTrackAlbum(playbackTrackIndex);
    }

    public int requestLingoProtocolVersion(byte lingoID) throws IPodException {
        return native_requestLingoProtocolVersion(lingoID);
    }

    public CHAPTER_INFO_T getCurPlayingTrackChapterInfo() throws IPodException {
        return native_getCurPlayingTrackChapterInfo();
    }

    public int getDbTrackInfo(int trackDbStarIndex, int trackCount, byte trackInfoBit) throws IPodException {
        return native_getDbTrackInfo(trackDbStarIndex, trackCount, trackInfoBit);
    }

    public PLAY_ST_INFO_T getPlayStatus() throws IPodException {
        return native_getPlayStatus();
    }

    public PLAY_ST_INFO_EX_T getPlayStatus_Ex() throws IPodException {
        return native_getPlayStatus_Ex();
    }

    public void getTrackArtWorkData(int trackIndex, short fmtID, int msTime, ARTWORK_DATA_T data) throws IPodException {
        native_getTrackArtWorkData(trackIndex, fmtID, msTime, data);
    }

    public void getArtWorkFormats(ARTWORK_FMTS_INFO_T info) throws IPodException {
        native_getArtWorkFormats(info);
    }

    public AUTH_RESULT_T getAuthStatus() throws IPodException {
        return native_getAuthStatus();
    }

    public void playControl(byte ctrlCode) throws IPodException {
        native_playControl(ctrlCode);
    }

    public PREFERENCES_T getiPodPreferences(byte classID) throws IPodException {
        return native_getiPodPreferences(classID);
    }

    public void setiPodPreferences(byte classID, byte settingID) throws IPodException {
        native_setiPodPreferences(classID, settingID);
    }

    public void setRemoteEvent(int eventMask) throws IPodException {
        native_setRemoteEvent(eventMask);
    }

    public void setPlayStatusChangeNotification(int notificationType, int notificationMask) throws IPodException {
        native_setPlayStatusChangeNotification(notificationType, notificationMask);
    }

    public void getTrackArtWorkTimes(int trackIndex, short fmtID, short artWorkIndex, short artWorkCount, ARTWORK_TIMES_T times) throws IPodException {
        native_getTrackArtWorkTimes(trackIndex, fmtID, artWorkIndex, artWorkCount, times);
    }

    public int getNumPlayingTracks() throws IPodException {
        return native_getNumPlayingTracks();
    }

    public void resetDBSelectionHierarchy(byte hierarchy) throws IPodException {
        native_resetDBSelectionHierarchy(hierarchy);
    }

    public void setVideoDelay(int videoDelayMs) throws IPodException {
        native_setVideoDelay(videoDelayMs);
    }

    public long getiPodOptionsForLingo(byte lingoID) throws IPodException {
        return native_getiPodOptionsForLingo(lingoID);
    }

    public long getiPodOptions() throws IPodException {
        return native_getiPodOptions();
    }

    public void setEventCallback(EventCallback callback) throws IPodException {
        native_setEventCallback(callback);
    }
}
