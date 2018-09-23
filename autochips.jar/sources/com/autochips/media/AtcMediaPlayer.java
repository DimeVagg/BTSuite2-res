package com.autochips.media;

import android.media.MediaPlayer;
import android.os.Parcel;
import android.os.SystemProperties;
import android.util.Log;
import android.view.SurfaceHolder;

public class AtcMediaPlayer {
    public static final int AUDIO_BITRATE_UNSUPPORT = 256;
    public static final int AUDIO_CODEC_UNSUPPORT = 1024;
    public static final int AUDIO_PROFILE_LEVEL_UNSUPPORT = 2048;
    public static final int AUDIO_SAMPLERATE_UNSUPPORT = 512;
    public static final int FILE_FF_UNSUPPORT = 2;
    public static final int FILE_RW_UNSUPPORT = 4;
    public static final int FILE_SEEK_UNSUPPORT = 1;
    private static final int INVOKE_ID_DIVXHT31_START = 9;
    private static final int INVOKE_ID_DIVX_DRM_GET_INFO = 8;
    private static final int INVOKE_ID_DIVX_MENU_DO_ACTION = 7;
    private static final int KEY_PARAMETER_DIVX_SERVICE_RESET = 1400;
    private static final int KEY_PARAMETER_GET_CURRENT_AUDIO_TRACK = 2003;
    private static final int KEY_PARAMETER_GET_CURRENT_SUBTITLE_TRACK = 2004;
    private static final int KEY_PARAMETER_GET_LOADING_STATUS = 2100;
    private static final int KEY_PARAMETER_MAXRATE_SUPPORTED = 1600;
    private static final int KEY_PARAMETER_MEDIA_CAPABILITY = 1500;
    private static final int KEY_PARAMETER_PLAYBACK_RATE_PERMILLE = 1300;
    private static final int KEY_PARAMETER_PLAYBACK_RATE_PERMILLE_ASYNC = 1800;
    private static final int KEY_PARAMETER_SET_DYNAMIC_FILE_INFO = 2005;
    private static final int KEY_PARAMETER_SET_VIDEO_VISIABLE = 1900;
    public static final int MEDIA_DEST_FRONT = 1;
    public static final int MEDIA_DEST_FRONT_REAR = 3;
    public static final int MEDIA_DEST_REAR = 2;
    public static final int MEDIA_ERROR_CARD_EJECT = 307;
    public static final int MEDIA_ERROR_DATA = 305;
    public static final int MEDIA_ERROR_DIVXDRM_NEVER_REGISTERED = -2503;
    public static final int MEDIA_ERROR_DIVXDRM_NOT_AUTHORIZED = -2501;
    public static final int MEDIA_ERROR_DIVXDRM_NOT_REGISTERED = -2502;
    public static final int MEDIA_ERROR_DIVXDRM_RENTAL_EXPIRED = -2504;
    public static final int MEDIA_ERROR_INVALID_PARAMETER = 300;
    public static final int MEDIA_ERROR_OUTOFMEMOTY = 301;
    public static final int MEDIA_ERROR_READ_FILE_FAILED = 302;
    public static final int MEDIA_ERROR_UNSUPPORTED_DRM = 304;
    public static final int MEDIA_ERROR_UNSUPPORTED_FILE = 303;
    public static final int MEDIA_INFO_CBM_FORBID = 2005;
    public static final int MEDIA_INFO_CBM_PAUSE = 2003;
    public static final int MEDIA_INFO_CBM_RESUME = 2004;
    public static final int MEDIA_INFO_CBM_START = 2002;
    public static final int MEDIA_INFO_CBM_STOP = 2001;
    public static final int MEDIA_INFO_DIVX = 1003;
    public static final int MEDIA_INFO_DIVXDRM = 1004;
    public static final int MEDIA_INFO_DIVXDRM_ERROR = 1005;
    public static final int MEDIA_INFO_UNSUPPORTED_AUDIO = 1001;
    public static final int MEDIA_INFO_UNSUPPORTED_MENU = 1002;
    public static final int MEDIA_INFO_UNSUPPORTED_VIDEO = 1000;
    public static final int MEDIA_PLAYBACK_FF_16X = 16;
    public static final int MEDIA_PLAYBACK_FF_2X = 2;
    public static final int MEDIA_PLAYBACK_FF_32X = 32;
    public static final int MEDIA_PLAYBACK_FF_4X = 4;
    public static final int MEDIA_PLAYBACK_FF_8X = 8;
    public static final int MEDIA_PLAYBACK_NORMAL = 1;
    public static final int MEDIA_PLAYBACK_RW_16X = -16;
    public static final int MEDIA_PLAYBACK_RW_2X = -2;
    public static final int MEDIA_PLAYBACK_RW_32X = -32;
    public static final int MEDIA_PLAYBACK_RW_4X = -4;
    public static final int MEDIA_PLAYBACK_RW_8X = -8;
    public static final int MEDIA_PLAYER_IDLE = 1;
    public static final int MEDIA_PLAYER_INITIALIZED = 2;
    public static final int MEDIA_PLAYER_PAUSED = 32;
    public static final int MEDIA_PLAYER_PLAYBACK_COMPLETE = 128;
    public static final int MEDIA_PLAYER_PREPARED = 8;
    public static final int MEDIA_PLAYER_PREPARING = 4;
    public static final int MEDIA_PLAYER_STARTED = 16;
    public static final int MEDIA_PLAYER_STATE_ERROR = 0;
    public static final int MEDIA_PLAYER_STOPPED = 64;
    private static final String TAG = "AtcMediaPlayer.java";
    public static final int VIDEO_BITRATE_UNSUPPORT = 16;
    public static final int VIDEO_CODEC_UNSUPPORT = 64;
    public static final int VIDEO_FRAMERATE_UNSUPPORT = 32;
    public static final int VIDEO_PROFILE_LEVEL_UNSUPPORT = 128;
    public static final int VIDEO_RESOLUTION_UNSUPPORT = 8;
    private MediaPlayer mMediaPlayer = null;
    private OnSetRateCompleteListener mOnSetRateCompleteListener;

    /* renamed from: com.autochips.media.AtcMediaPlayer$1 */
    class C00861 implements android.media.MediaPlayer.OnSetRateCompleteListener {
        C00861() {
        }

        public void onSetRateComplete(MediaPlayer mp) {
            if (AtcMediaPlayer.this.mOnSetRateCompleteListener != null) {
                AtcMediaPlayer.this.mOnSetRateCompleteListener.onSetRateComplete(mp);
            }
        }
    }

    public class DivxDrmInfo {
        public int acptb;
        public int cgmsa;
        public int digitalProtection;
        public int lict;
        public int maxplayCount;
        public int remainPlayCount;
    }

    public interface OnSetRateCompleteListener {
        void onSetRateComplete(MediaPlayer mediaPlayer);
    }

    public AtcMediaPlayer(MediaPlayer player) {
        this.mMediaPlayer = player;
    }

    public boolean setMediaPlayer(MediaPlayer player) {
        if (player == null) {
            return false;
        }
        this.mMediaPlayer = player;
        return true;
    }

    public void setOnSetRateCompleteListener(OnSetRateCompleteListener listener) {
        this.mOnSetRateCompleteListener = listener;
        this.mMediaPlayer.setOnSetRateCompleteListener(new C00861());
    }

    public void setRearDisplay(SurfaceHolder sh) {
        Log.i(TAG, "setRearDisplay SurfaceHolder:" + sh + " entry");
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "setRearDisplay invalid player");
        } else {
            this.mMediaPlayer.setRearDisplay(sh);
        }
    }

    public boolean openAudioOutput(int destination) {
        Log.i(TAG, "openAudioOutput entry destination:" + destination);
        if (this.mMediaPlayer != null) {
            return this.mMediaPlayer.openAudioOutput(destination);
        }
        Log.e(TAG, "openAudioOutput invalid player");
        return false;
    }

    public boolean closeAudioOutput(int destination) {
        Log.i(TAG, "closeAudioOutput entry destination:" + destination);
        if (this.mMediaPlayer != null) {
            return this.mMediaPlayer.closeAudioOutput(destination);
        }
        Log.e(TAG, "openAudioOutput invalid player");
        return false;
    }

    private boolean checkRateValid(int rate) {
        switch (rate) {
            case MEDIA_PLAYBACK_RW_32X /*-32*/:
            case MEDIA_PLAYBACK_RW_16X /*-16*/:
            case MEDIA_PLAYBACK_RW_8X /*-8*/:
            case MEDIA_PLAYBACK_RW_4X /*-4*/:
            case MEDIA_PLAYBACK_RW_2X /*-2*/:
            case 1:
            case 2:
            case 4:
            case 8:
            case 16:
            case 32:
                return true;
            default:
                return false;
        }
    }

    public boolean setPlaybackRate(int rate) {
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "setPlaybackRate invalid player");
            return false;
        }
        if (!checkRateValid(rate)) {
            Log.e(TAG, "setPlaybackRate invalid rate:" + rate);
        }
        Log.i(TAG, "setPlaybackRate rate:" + rate);
        return this.mMediaPlayer.setParameter(KEY_PARAMETER_PLAYBACK_RATE_PERMILLE, rate);
    }

    public boolean setPlaybackRateAsync(int rate) {
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "setPlaybackRateAsync invalid player");
            return false;
        }
        if (!checkRateValid(rate)) {
            Log.e(TAG, "setPlaybackRate invalid rate:" + rate);
        }
        Log.i(TAG, "setPlaybackRateAsync rate:" + rate);
        return this.mMediaPlayer.setParameter(KEY_PARAMETER_PLAYBACK_RATE_PERMILLE_ASYNC, rate);
    }

    public int getFFMaxRate() throws IllegalStateException {
        Log.i(TAG, "getFFMaxRate: enter");
        if (this.mMediaPlayer == null) {
            Log.i(TAG, "getFFMaxRate invalid player");
            return -1;
        }
        int maxRate = 1;
        Parcel reply = null;
        try {
            reply = this.mMediaPlayer.getParcelParameter(KEY_PARAMETER_MAXRATE_SUPPORTED);
            if (reply != null) {
                maxRate = reply.readInt();
            }
            if (reply != null) {
                reply.recycle();
            }
            Log.i(TAG, "getFFMaxRate: maxRate: " + maxRate);
            return maxRate;
        } catch (Throwable th) {
            if (reply != null) {
                reply.recycle();
            }
        }
    }

    public int getRWMaxRate() throws IllegalStateException {
        Log.i(TAG, "getFFMaxRate: enter");
        int maxRate = 1;
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "getRWMaxRate invalid player ");
            return -1;
        }
        Parcel reply = null;
        try {
            reply = this.mMediaPlayer.getParcelParameter(KEY_PARAMETER_MAXRATE_SUPPORTED);
            if (reply != null) {
                maxRate = reply.readInt();
                maxRate = reply.readInt();
            }
            if (reply != null) {
                reply.recycle();
            }
            Log.i(TAG, "getFFMaxRate: maxRate: " + maxRate);
            return maxRate;
        } catch (Throwable th) {
            if (reply != null) {
                reply.recycle();
            }
        }
    }

    public int getCurrentAudioTrack() throws IllegalStateException {
        Log.i(TAG, "getCurrentAudioTrack enter");
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "getCurrentAudioTrack invalid player");
            return -1;
        }
        Parcel reply = null;
        int currentAud = -1;
        try {
            reply = this.mMediaPlayer.getParcelParameter(2003);
            if (reply != null) {
                currentAud = reply.readInt();
            }
            if (reply != null) {
                reply.recycle();
            }
            Log.i(TAG, "getCurrentAudioTrack current audio:" + currentAud);
            return currentAud;
        } catch (Throwable th) {
            if (reply != null) {
                reply.recycle();
            }
        }
    }

    public int getCurrentSubtitleTrack() throws IllegalStateException {
        Log.i(TAG, "getCurrentSubtitleTrack enter");
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "getCurrentSubtitleTrack invalid player");
            return -1;
        }
        Parcel reply = null;
        int currentSub = -1;
        try {
            reply = this.mMediaPlayer.getParcelParameter(2004);
            if (reply != null) {
                currentSub = reply.readInt();
            }
            if (reply != null) {
                reply.recycle();
            }
            Log.i(TAG, "getCurrentSubtitleTrack current subtitle:" + currentSub);
            return currentSub;
        } catch (Throwable th) {
            if (reply != null) {
                reply.recycle();
            }
        }
    }

    public boolean SetVideoVisibile(boolean fgVisible) throws IllegalStateException {
        Log.e(TAG, "SetVideoVisibile fgVisible:" + fgVisible);
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "getCurrentAudioTrack player invalid");
            return false;
        }
        int visible;
        if (fgVisible) {
            visible = 1;
        } else {
            visible = 0;
        }
        return this.mMediaPlayer.setParameter(KEY_PARAMETER_SET_VIDEO_VISIABLE, visible);
    }

    public int getMediaCapability() throws IllegalStateException {
        Log.e(TAG, "getMediaCapability: enter");
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "getMediaCapability player invalid");
            return 0;
        }
        Parcel reply = Parcel.obtain();
        int capability = 1073741823;
        try {
            reply = this.mMediaPlayer.getParcelParameter(KEY_PARAMETER_MEDIA_CAPABILITY);
            if (reply != null) {
                capability = reply.readInt();
            }
            if (reply != null) {
                reply.recycle();
            }
            Log.i(TAG, "getMediaCapability: capability" + capability);
            return capability;
        } catch (Throwable th) {
            if (reply != null) {
                reply.recycle();
            }
        }
    }

    public void selectMenu(int x, int y) throws IllegalStateException {
        Log.i(TAG, "selectMenu x:" + x + "y:" + y);
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "selectMenu player invalid");
            return;
        }
        Parcel request = this.mMediaPlayer.newRequest();
        Parcel reply = Parcel.obtain();
        request.writeInt(7);
        request.writeInt(x);
        request.writeInt(y);
        try {
            this.mMediaPlayer.invoke(request, reply);
        } finally {
            request.recycle();
            reply.recycle();
        }
    }

    public void clearDivxService() throws IllegalStateException {
        Log.i(TAG, "clearDivxService: enter");
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "clearDivxService player invalid");
            return;
        }
        try {
            this.mMediaPlayer.setParameter(KEY_PARAMETER_DIVX_SERVICE_RESET, 0);
        } catch (Exception e) {
            Log.e(TAG, "clearDivxService setParameter error");
            e.printStackTrace();
        }
    }

    public DivxDrmInfo getDivxDrmInfo() throws IllegalStateException {
        Log.i(TAG, "getDivxDrmInfo");
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "getDivxDrmInfo invalid player");
            return null;
        }
        DivxDrmInfo drmInfo = new DivxDrmInfo();
        Parcel request = this.mMediaPlayer.newRequest();
        Parcel reply = Parcel.obtain();
        request.writeInt(8);
        try {
            this.mMediaPlayer.invoke(request, reply);
            drmInfo.maxplayCount = reply.readInt();
            drmInfo.remainPlayCount = reply.readInt();
            drmInfo.cgmsa = reply.readInt();
            drmInfo.acptb = reply.readInt();
            drmInfo.digitalProtection = reply.readInt();
            drmInfo.lict = reply.readInt();
            return drmInfo;
        } finally {
            request.recycle();
            reply.recycle();
        }
    }

    public int getLoadingPercentage() throws IllegalStateException {
        Log.i(TAG, "getLoadingPercentage enter");
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "getLoadingPercentage invalid player");
            return -1;
        }
        Parcel reply = null;
        int percent = 0;
        try {
            reply = this.mMediaPlayer.getParcelParameter(KEY_PARAMETER_GET_LOADING_STATUS);
            if (reply != null) {
                percent = reply.readInt();
            }
            if (reply != null) {
                reply.recycle();
            }
            Log.i(TAG, "getLoadingPercentage percent:" + percent);
            return percent;
        } catch (Throwable th) {
            if (reply != null) {
                reply.recycle();
            }
        }
    }

    public int getLoadingRemainTime() throws IllegalStateException {
        Log.i(TAG, "getLoadingRemainTime enter");
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "getLoadingRemainTime invalid player");
            return -1;
        }
        Parcel reply = null;
        int remainTime = 0;
        try {
            reply = this.mMediaPlayer.getParcelParameter(KEY_PARAMETER_GET_LOADING_STATUS);
            if (reply != null) {
                reply.readInt();
                remainTime = reply.readInt();
            }
            if (reply != null) {
                reply.recycle();
            }
            Log.i(TAG, "getLoadingRemainTime remainTime:" + remainTime);
            return remainTime;
        } catch (Throwable th) {
            if (reply != null) {
                reply.recycle();
            }
        }
    }

    public static boolean isSupportDivxHT31() {
        String divxsupportprotery = SystemProperties.get("ro.atc.supportdivxht31", "0");
        Log.e(TAG, "getDivxSupportProperty : " + divxsupportprotery);
        if (divxsupportprotery != null && divxsupportprotery.equals("1")) {
            return true;
        }
        return false;
    }

    public void showDivxHT31Video() throws IllegalStateException {
        Log.i(TAG, "showDivxHT31Video enter");
        if (this.mMediaPlayer == null) {
            Log.e(TAG, "showDivxHT31Video invalid player");
            return;
        }
        Parcel request = this.mMediaPlayer.newRequest();
        Parcel reply = Parcel.obtain();
        request.writeInt(9);
        try {
            this.mMediaPlayer.invoke(request, reply);
        } finally {
            request.recycle();
            reply.recycle();
        }
    }

    public void config(boolean appResume) {
        if (this.mMediaPlayer != null) {
            this.mMediaPlayer.config(appResume);
        }
    }

    public void appResume() {
        if (this.mMediaPlayer != null) {
            this.mMediaPlayer.appResume();
        }
    }

    public int getRealCurrentState() {
        if (this.mMediaPlayer == null) {
            return 0;
        }
        int state = this.mMediaPlayer.getRealCurrentState();
        Log.i(TAG, "getRealCurrentState state:" + state);
        return state;
    }

    public boolean setDynamicInfo(long fileSize, long validDataSize) {
        if (this.mMediaPlayer != null) {
            try {
                Parcel p = Parcel.obtain();
                p.writeLong(fileSize);
                p.writeLong(validDataSize);
                boolean ret = this.mMediaPlayer.setParameter(2005, p);
                p.recycle();
                return ret;
            } catch (IllegalStateException e) {
                Log.i(TAG, "setDynamicInfo failed!!");
            }
        }
        return false;
    }
}
