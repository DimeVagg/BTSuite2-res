package com.autochips.dvr;

import android.cbm.CBManager;
import android.cbm.CBManager.OnActionListener;
import android.os.Handler;
import android.os.Message;
import android.os.Parcel;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;

public class DVR {
    private static final String TAG = "DVR framework";
    private static CBManager adasManager = new CBManager();
    private static Surface adasSurface = null;
    private static Handler mHandler = null;
    private static Object mLock = new Object();
    private static Object syncObj = new Object();
    private static VideoInfo vi = new VideoInfo();
    private OnActionListener adasActionListener = new C00822();
    private OnActionListener dvrActionListener = new C00811();
    private boolean fgInited = false;
    private boolean fgRawInited = false;
    private String mRecordPath = null;
    private CBManager manager = new CBManager();

    /* renamed from: com.autochips.dvr.DVR$1 */
    class C00811 implements OnActionListener {
        C00811() {
        }

        public int onAction(int command, int appScene, int priority) {
            Log.i(DVR.TAG, "command:" + command + ",Mediaplayer:" + this);
            switch (command) {
                case 4:
                    Log.d(DVR.TAG, "receive cbm CMD_STOP");
                    synchronized (DVR.mLock) {
                        try {
                            Log.d(DVR.TAG, "get the lock, cbm CMD_STOP exit");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    break;
            }
            return 0;
        }
    }

    /* renamed from: com.autochips.dvr.DVR$2 */
    class C00822 implements OnActionListener {
        C00822() {
        }

        public int onAction(int command, int appScene, int priority) {
            Log.i(DVR.TAG, "command:" + command + ",Mediaplayer:" + this);
            switch (command) {
                case 3:
                    Log.d(DVR.TAG, "receive cbm CMD_START adasSurface: " + DVR.adasSurface);
                    try {
                        DVR.this.dvr_RawData_Start(DVR.adasSurface);
                        Log.d(DVR.TAG, "dvr_RawData_Start end");
                        break;
                    } catch (Exception e) {
                        e.printStackTrace();
                        break;
                    }
                case 4:
                    Log.d(DVR.TAG, "receive cbm CMD_STOP");
                    try {
                        DVR.this.dvr_RawData_Stop();
                        Log.d(DVR.TAG, "dvr_RawData_Stop end");
                        break;
                    } catch (Exception e2) {
                        e2.printStackTrace();
                        break;
                    }
            }
            return 0;
        }
    }

    public static class Coordinate {
        private int mLatDeg;
        private int mLatMin;
        private int mLatSec;
        private int mLonDeg;
        private int mLonMin;
        private int mLonSec;

        public void setCoordinate(int LatDeg, int LatMin, int LatSec, int LonDeg, int LonMin, int LonSec) {
            this.mLatDeg = LatDeg;
            this.mLatMin = LatMin;
            this.mLatSec = LatSec;
            this.mLonDeg = LonDeg;
            this.mLonMin = LonMin;
            this.mLonSec = LonSec;
        }
    }

    public static class DVRNativeEvent {
        public static final int DVR_UI_MSG_DEINIT_FAILED = 258;
        public static final int DVR_UI_MSG_FORMAT_INVALID = 270;
        public static final int DVR_UI_MSG_INIT_FAILED = 257;
        public static final int DVR_UI_MSG_NUM = 271;
        public static final int DVR_UI_MSG_PREV_STARTED = 263;
        public static final int DVR_UI_MSG_PREV_STOPED = 264;
        public static final int DVR_UI_MSG_REC_STARTED = 259;
        public static final int DVR_UI_MSG_REC_STOPED = 260;
        public static final int DVR_UI_MSG_S = 256;
        public static final int DVR_UI_MSG_SD_FULL = 268;
        public static final int DVR_UI_MSG_SNAPSHOT_END = 267;
        private static final int DVR_UI_MSG_START = 256;
        public static final int DVR_UI_MSG_START_PREV_FAILED = 265;
        public static final int DVR_UI_MSG_START_REC_FAILED = 261;
        public static final int DVR_UI_MSG_STOP_PREV_FAILED = 266;
        public static final int DVR_UI_MSG_STOP_REC_FAILED = 262;
        public static final int DVR_UI_MSG_URGENT_FILE = 269;
    }

    public static class SinkInfo {
        private long mBottom;
        private long mLeft;
        private long mRight;
        private boolean mShow;
        private SinkType mSinkType;
        private long mTop;

        public void setSinkRect(long left, long top, long right, long bottom) {
            this.mLeft = left;
            this.mTop = top;
            this.mRight = right;
            this.mBottom = bottom;
        }

        public void setSinkShow(boolean show) {
            this.mShow = show;
        }

        public void setSinkType(SinkType type) {
            this.mSinkType = type;
        }
    }

    public enum SinkType {
        NONE,
        FRONT,
        REAR,
        FRONT_REAR
    }

    public static class SysTime {
        private int mDay;
        private int mHour;
        private int mMinute;
        private int mMonth;
        private int mSecond;
        private int mYear;

        public void setTime(int year, int month, int day, int hour, int minute, int second) {
            this.mYear = year;
            this.mMonth = month;
            this.mDay = day;
            this.mHour = hour;
            this.mMinute = minute;
            this.mSecond = second;
        }
    }

    public static class VideoInfo {
        private int mFPS;
        private int mVideoHight;
        private int mVideoWidth;

        public VideoInfo(int w, int h, int fps) {
            this.mVideoWidth = w;
            this.mVideoHight = h;
            this.mFPS = fps;
        }

        public void setVideoWidth(int width) {
            this.mVideoWidth = width;
        }

        public void setVideoHight(int hight) {
            this.mVideoHight = hight;
        }

        public int getFPS() {
            return this.mFPS;
        }

        public void SetFPS(int FPS) {
            this.mFPS = FPS;
        }
    }

    private native boolean dvr_Deinit();

    private native String dvr_GetCamName();

    private native boolean dvr_Init(VideoInfo videoInfo);

    private native void dvr_RawData_Deinit();

    private native boolean dvr_RawData_Init();

    private native boolean dvr_RawData_Start(Surface surface);

    private native boolean dvr_RawData_Stop();

    private native boolean dvr_SetAudioOn(boolean z);

    private native boolean dvr_SetDestination(SinkType sinkType);

    private native void dvr_SetFrontSurface(Surface surface);

    private native boolean dvr_SetGpsCoordinate(Coordinate coordinate);

    private native boolean dvr_SetGpsSpeed(int i);

    private native boolean dvr_SetRecordCapacity(int i, int i2);

    private native boolean dvr_SetRecordDuration(int i);

    private native boolean dvr_SetRecordPath(String str);

    private native boolean dvr_SetSinkInfo(SinkInfo sinkInfo);

    private native boolean dvr_SetTime(SysTime sysTime);

    private native boolean dvr_SetVideoInfo(VideoInfo videoInfo);

    private native boolean dvr_Snapshot(VideoInfo videoInfo, int i);

    private native boolean dvr_StartPreview();

    private native boolean dvr_StartRecord();

    private native boolean dvr_StopPreview();

    private native boolean dvr_StopRecord();

    private native void dvr_StorageMount(boolean z);

    private native boolean dvr_Urgent();

    public void setHandler(Handler handler) {
        synchronized (syncObj) {
            mHandler = handler;
        }
    }

    public boolean rawDataInit() {
        Log.i(TAG, "rawDataInit enter");
        synchronized (syncObj) {
            if (this.fgRawInited) {
                return true;
            }
            if (adasManager != null) {
                adasManager.setOnActionListener(this.adasActionListener);
            }
            this.fgRawInited = true;
            return dvr_RawData_Init();
        }
    }

    public void rawDataDeinit() {
        synchronized (syncObj) {
            if (this.fgRawInited) {
                this.fgRawInited = false;
                dvr_RawData_Deinit();
                return;
            }
        }
    }

    public boolean rawDataStart(SurfaceHolder sh) {
        boolean z = false;
        Log.i(TAG, "rawDataStart enter");
        if (sh != null) {
            adasSurface = sh.getSurface();
            Log.i(TAG, "rawDataStart surface OK adasSurface: " + adasSurface);
            Parcel p2 = Parcel.obtain();
            try {
                Log.i(TAG, "rawDataStart request SRC_DVR!!");
                adasManager.request(16, 1, p2);
                if (p2.readInt() != 0) {
                    Log.i(TAG, "dvr_StartPreview adasSurface: !!" + adasSurface);
                    z = dvr_RawData_Start(adasSurface);
                } else {
                    p2.recycle();
                }
            } finally {
                p2.recycle();
            }
        } else {
            adasSurface = null;
            Log.i(TAG, "rawDataStart adasSurface NULL");
        }
        return z;
    }

    public boolean rawDataStop() {
        Log.i(TAG, "rawDataStop enter");
        try {
            Log.i(TAG, "rawDataStop release SRC_DVR!!");
            adasManager.release();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dvr_RawData_Stop();
    }

    public boolean Init() {
        synchronized (syncObj) {
            if (this.fgInited) {
                return true;
            }
            if (this.manager != null) {
                this.manager.setOnActionListener(this.dvrActionListener);
            }
            this.fgInited = true;
            return dvr_Init(vi);
        }
    }

    public boolean Deinit() {
        synchronized (syncObj) {
            if (this.fgInited) {
                this.fgInited = false;
                return dvr_Deinit();
            }
            return true;
        }
    }

    public boolean StartPreview() {
        Parcel p2 = Parcel.obtain();
        try {
            this.manager.request(16, 1, p2);
            if (p2.readInt() != 0) {
                Log.i(TAG, "dvr_StartPreview!!");
                boolean dvr_StartPreview = this.fgInited ? dvr_StartPreview() : this.fgInited;
                p2.recycle();
                return dvr_StartPreview;
            }
            p2.recycle();
            return false;
        } catch (Throwable th) {
            p2.recycle();
        }
    }

    public boolean StopPreview() {
        try {
            this.manager.release();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.fgInited ? dvr_StopPreview() : this.fgInited;
    }

    public boolean StartRecord() {
        if (this.mRecordPath != null) {
            return this.fgInited ? dvr_StartRecord() : this.fgInited;
        } else {
            Log.i(TAG, "File record root path is NULL!!");
            return false;
        }
    }

    public boolean StopRecord() {
        return this.fgInited ? dvr_StopRecord() : this.fgInited;
    }

    public boolean SetRecordPath(String filePath) {
        this.mRecordPath = filePath;
        return this.fgInited ? dvr_SetRecordPath(filePath) : this.fgInited;
    }

    public boolean SetRecordDuration(int Duration) {
        return this.fgInited ? dvr_SetRecordDuration(Duration) : this.fgInited;
    }

    public boolean SetRecordCapacity(int normalcapacity, int urgentcapacity) {
        return this.fgInited ? dvr_SetRecordCapacity(normalcapacity, urgentcapacity) : this.fgInited;
    }

    public static boolean SetVideoInfo(VideoInfo videoinfo) {
        vi.mVideoHight = videoinfo.mVideoHight;
        vi.mVideoWidth = videoinfo.mVideoWidth;
        vi.mFPS = videoinfo.mFPS;
        return true;
    }

    public String GetCamName() {
        return this.fgInited ? dvr_GetCamName() : null;
    }

    public boolean Snapshot(VideoInfo vidioinfo, int num) {
        synchronized (mLock) {
            Parcel p2 = Parcel.obtain();
            try {
                Log.i(TAG, "Snapshot request SRC_DVR!!");
                adasManager.request(16, 1, p2);
                int ret = p2.readInt();
                Log.i(TAG, "dvr_Snapshot!!" + ret);
                if (ret != 0) {
                    Log.i(TAG, "dvr_Snapshot!!");
                    boolean dvr_Snapshot = dvr_Snapshot(vidioinfo, num);
                    p2.recycle();
                    return dvr_Snapshot;
                }
                p2.recycle();
                return false;
            } catch (Throwable th) {
                p2.recycle();
            }
        }
    }

    public boolean Urgent() {
        return dvr_Urgent();
    }

    public boolean SetDestination(SinkType sinktype) {
        return dvr_SetDestination(sinktype);
    }

    public boolean SetTime(SysTime systime) {
        return this.fgInited ? dvr_SetTime(systime) : this.fgInited;
    }

    public boolean SetGpsCoordinate(Coordinate coordinate) {
        return this.fgInited ? dvr_SetGpsCoordinate(coordinate) : this.fgInited;
    }

    public boolean SetGpsSpeed(int speed) {
        return this.fgInited ? dvr_SetGpsSpeed(speed) : this.fgInited;
    }

    public void SetFrontSurface(SurfaceHolder sh) {
        Surface surface;
        if (sh != null) {
            surface = sh.getSurface();
            Log.i(TAG, "set surface");
        } else {
            surface = null;
            Log.i(TAG, "set surface NULL");
        }
        dvr_SetFrontSurface(surface);
    }

    public void setAudioOn(boolean on) {
        dvr_SetAudioOn(on);
    }

    public void StorageMount(boolean mount) {
        dvr_StorageMount(mount);
    }

    private static int eventNotify(int evt, int arg1, int arg2) {
        synchronized (syncObj) {
            if (mHandler != null) {
                Log.i(TAG, "eventNotify, event:" + evt + " (" + arg1 + ", " + arg2 + ")");
                if (evt == DVRNativeEvent.DVR_UI_MSG_SNAPSHOT_END) {
                    Log.i(TAG, "Snapshot release SRC_DVR!!");
                    adasManager.release();
                }
                mHandler.removeMessages(evt);
                Message msg = mHandler.obtainMessage(evt);
                msg.arg1 = arg1;
                msg.arg2 = arg2;
                mHandler.sendMessage(msg);
            }
        }
        return 0;
    }
}
