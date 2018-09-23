package com.autochips.inputsource;

import android.cbm.CBManager;
import android.media.AudioTrack;
import android.os.RemoteException;
import android.util.Log;

public class AVIN extends InputSourceClient {
    private static final int GET_AUDIO_SPECTRUM = 3;
    public static final int PORT1 = 1;
    public static final int PORT2 = 2;
    public static final int PORT3 = 3;
    public static final int PORT4 = 4;
    public static final int PORT5 = 5;
    public static final int PORT_NONE = 0;
    public static final int PRIORITY_IN_CBM_LEVEL1 = 1;
    public static final int PRIORITY_IN_CBM_LEVEL2 = 2;
    public static final int PRIORITY_IN_CBM_LEVEL3 = 3;
    public static final int PRIORITY_IN_CBM_LEVEL4 = 4;
    public static final int PRIORITY_IN_CBM_LEVEL5 = 5;
    public static final int PRIORITY_IN_CBM_LEVEL_DEFAULT = 0;
    public static final int SIGNAL_CHANGE = 2;
    public static final int SIGNAL_LOST = 1;
    public static final int SIGNAL_READY = 0;
    private static final String TAG = "AVIN.JAVA";
    public static final int VIDEO_FLIP_H = 1;
    public static final int VIDEO_FLIP_HnV = 3;
    public static final int VIDEO_FLIP_NONE = 0;
    public static final int VIDEO_FLIP_V = 2;
    private static AudioTrack mAudioTrack = null;

    public AVIN() {
        try {
            mService = InputSourceClient.getService();
            if (mService != null) {
                this.mSource = mService.create(this);
                Log.e(TAG, "AVIN(): construct mSource: " + this.mSource);
            } else {
                Log.e(TAG, "AVIN(): construct mService get null");
            }
            this.mCBM = new CBManager();
            Log.e(TAG, "AVIN(): CBManager client " + this.mCBM);
        } catch (RemoteException e) {
            Log.d(TAG, "AVIN(): source create fail");
        }
    }

    public void release() {
        Log.d(TAG, "release()");
        try {
            if (this.mSource == null) {
                Log.e(TAG, "release(): mSource null");
                return;
            }
            this.mSource.release();
            Log.e(TAG, "release(): CBManager client " + this.mCBM);
            this.mCBM.release();
            this.mSource = null;
            if (this.mSrcType == 15 && mAudioTrack != null) {
                Log.d(TAG, "stop(): call audio track stop");
                mAudioTrack.release();
                mAudioTrack = null;
            }
            super.release();
        } catch (RemoteException e) {
            Log.e(TAG, "release(): source release fail");
        }
    }

    public int setSource(int inputSrcType, int portV, int portA, int Priority) {
        Log.d(TAG, "setSource portV:" + portV + ",portA:" + portA + ",inputSrcType:" + inputSrcType + ",Priority:" + Priority);
        int errors = 0;
        if (portV < 0 || portV > 5 || portA < 0 || portA > 5) {
            Log.e(TAG, "setSource FAIL Invalid port number");
            return InputSource.ERR_INVALID_PORT;
        } else if (portA == 0 && portV == 0) {
            Log.e(TAG, "setSource FAIL Audio Video both null");
            return InputSource.ERR_INVALID_PORT;
        } else {
            if (portV == 0) {
                if (inputSrcType == 7) {
                    Log.e(TAG, "setSource enter SOURCE_TYPE_RDS_AUD new audio track");
                    this.mSrcType = 15;
                    mAudioTrack = new AudioTrack(13, 44100, 4, 2, AudioTrack.getMinBufferSize(44100, 4, 2), 1);
                    if (mAudioTrack != null) {
                        Log.d(TAG, "setSource mAudioTrack setAudioTrackDataSource: " + mAudioTrack);
                        mAudioTrack.setAudioTrackDataSource(13);
                    }
                } else {
                    if (mAudioTrack != null) {
                        Log.d(TAG, "setSource From RDS to AVIN(STREAM_MUSIC)AudioTrack: " + mAudioTrack);
                        mAudioTrack.setAudioTrackDataSource(3);
                        mAudioTrack.release();
                        mAudioTrack = null;
                    }
                    this.mSrcType = 9;
                }
                this.mCBM.setFMType(this.mSrcType);
            } else if (portA == 0) {
                this.mSrcType = 8;
            } else {
                this.mSrcType = 10;
            }
            this.mInputSourceCBMPriority = Priority;
            try {
                if (this.mSource == null) {
                    Log.e(TAG, "setSource mSource null");
                    return InputSource.ERR_FAILED;
                }
                errors = this.mSource.setSource(inputSrcType, portV, portA);
                return errors;
            } catch (RemoteException e) {
                Log.d(TAG, "setsource fail!");
            }
        }
    }

    public int play() {
        Log.d(TAG, "play(): Enter");
        if (this.mSrcType != 15 || mAudioTrack == null) {
            Log.d(TAG, "play(): mSrcType: " + this.mSrcType + "mAudioTrack: " + mAudioTrack);
        } else {
            Log.d(TAG, "play(): call audio track play");
            mAudioTrack.play();
        }
        return super.play();
    }

    public int stop() {
        Log.d(TAG, "stop(): Enter");
        int ret = super.stop();
        if (this.mSrcType == 15 && mAudioTrack != null) {
            Log.d(TAG, "stop(): call audio track stop");
            mAudioTrack.stop();
        }
        return ret;
    }

    public int getSpectrum(int[] spectrum) {
        Log.d(TAG, "getSpectrum ");
        try {
            return this.mSource.getParam(3, spectrum);
        } catch (RemoteException e) {
            Log.e(TAG, "getSpectrum fail");
            return InputSource.ERR_OK;
        }
    }

    public int setHue(int hue) {
        int errors = 0;
        Log.d(TAG, "setHue hue:" + hue);
        try {
            if (this.mSource == null) {
                Log.e(TAG, "setHue fail mSource null");
                return InputSource.ERR_FAILED;
            }
            errors = this.mSource.setHue(hue);
            return errors;
        } catch (RemoteException e) {
            Log.d(TAG, "setHue fail");
        }
    }

    public int setBrightness(int brightness) {
        int errors = 0;
        Log.d(TAG, "setBrightness brightness:" + brightness);
        try {
            if (this.mSource == null) {
                Log.e(TAG, "setMirror fail mSource null");
                return InputSource.ERR_FAILED;
            }
            errors = this.mSource.setBrightness(brightness);
            return errors;
        } catch (RemoteException e) {
            Log.e(TAG, "setBrightness fail");
        }
    }

    public int setSaturation(int saturation) {
        int errors = 0;
        Log.d(TAG, "setSaturation saturation:" + saturation);
        try {
            if (this.mSource == null) {
                Log.e(TAG, "setSaturation fail mSource null");
                return InputSource.ERR_FAILED;
            }
            errors = this.mSource.setSaturation(saturation);
            return errors;
        } catch (RemoteException e) {
            Log.e(TAG, "setSaturation fail");
        }
    }

    public int setMirror(int mirror) {
        int errors = 0;
        if (mirror < 0 || mirror > 3) {
            Log.e(TAG, "setMirror mirror is Invalid :" + mirror);
            return InputSource.ERR_INVALID_ARG;
        }
        Log.d(TAG, "setMirror mirror:" + mirror);
        try {
            if (this.mSource == null) {
                Log.e(TAG, "setMirror fail mSource null");
                return InputSource.ERR_FAILED;
            }
            errors = this.mSource.setMirror(mirror);
            return errors;
        } catch (RemoteException e) {
            Log.e(TAG, "setMirror fail");
        }
    }
}
