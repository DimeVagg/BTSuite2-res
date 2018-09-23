package com.autochips.inputsource;

import android.cbm.CBManager;
import android.os.RemoteException;
import android.util.Log;

public class DIGIN extends InputSourceClient {
    public static final int DIG_FMT_601_I_480 = 2;
    public static final int DIG_FMT_601_I_576 = 3;
    public static final int DIG_FMT_601_P_480 = 0;
    public static final int DIG_FMT_601_P_576 = 1;
    public static final int DIG_FMT_656_I_480 = 6;
    public static final int DIG_FMT_656_I_576 = 7;
    public static final int DIG_FMT_656_P_480 = 4;
    public static final int DIG_FMT_656_P_576 = 5;
    private static final String TAG = "DIGIN.JAVA";

    public DIGIN() {
        try {
            mService = InputSourceClient.getService();
            if (mService != null) {
                this.mSource = mService.create(this);
                Log.e(TAG, "mSource:" + this.mSource);
            } else {
                Log.e(TAG, "construct mService get null");
            }
            this.mCBM = new CBManager();
        } catch (RemoteException e) {
            Log.d(TAG, "source create fail");
        }
    }

    public void release() {
        try {
            if (this.mSource == null) {
                Log.e(TAG, "release mSource null");
                return;
            }
            this.mSource.release();
            this.mCBM.release();
            this.mSource = null;
            super.release();
        } catch (RemoteException e) {
            Log.e(TAG, "source release fail");
        }
    }

    public int setSource(int inputSrcType, int portV, int portA) {
        Log.d(TAG, "setSource portV:" + portV + ",portA:" + portA + ",inputSrcType:" + inputSrcType);
        int errors = 0;
        try {
            if (this.mSource == null) {
                Log.e(TAG, "setSource mSource null");
                return InputSource.ERR_FAILED;
            }
            this.mSrcType = 11;
            errors = this.mSource.setSource(inputSrcType, portV, portA);
            return errors;
        } catch (RemoteException e) {
            Log.d(TAG, "setsource fail!");
        }
    }

    public int play() {
        Log.d(TAG, "digital in play(): Enter");
        return super.play();
    }

    public int stop() {
        Log.d(TAG, "digital in stop(): Enter");
        return super.stop();
    }
}
