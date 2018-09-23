package com.autochips.inputsource;

import android.cbm.CBManager;
import android.os.RemoteException;
import android.util.Log;

public class DIGAUD extends InputSourceClient {
    public static final int PINMUX_I2SIN_DEFAULT = 0;
    public static final int PINMUX_I2SIN_GROUP1 = 1;
    public static final int PINMUX_I2SIN_GROUP2 = 2;
    public static final int PINMUX_I2SIN_GROUP3 = 3;
    public static final int PINMUX_I2SIN_GROUP4 = 4;
    public static final int PINMUX_I2SIN_GROUP5 = 5;
    public static final int PINMUX_I2SIN_GROUP6 = 6;
    public static final int PINMUX_I2SIN_GROUP7 = 7;
    private static final String TAG = "DIGAUD.JAVA";

    public DIGAUD() {
        try {
            mService = InputSourceClient.getService();
            if (mService != null) {
                this.mSource = mService.create(this);
                Log.e(TAG, "DIGAUD(): construct mSource: " + this.mSource);
            } else {
                Log.e(TAG, "DIGAUD(): construct mService get null");
            }
            this.mCBM = new CBManager();
            Log.e(TAG, "DIGAUD(): CBManager client " + this.mCBM);
        } catch (RemoteException e) {
            Log.d(TAG, "DIGAUD(): source create fail");
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
            super.release();
        } catch (RemoteException e) {
            Log.e(TAG, "release(): source release fail");
        }
    }

    public int setSource(int inputSrcType, int audPinMuxI2sGrp) {
        Log.d(TAG, "setSource audPinMuxI2sGrp:" + audPinMuxI2sGrp + ",inputSrcType:" + inputSrcType);
        int errors = 0;
        CBManager cBManager = this.mCBM;
        this.mSrcType = 9;
        try {
            if (this.mSource == null) {
                Log.e(TAG, "setSource mSource null");
                return InputSource.ERR_FAILED;
            }
            errors = this.mSource.setSource(inputSrcType, audPinMuxI2sGrp, 0);
            return errors;
        } catch (RemoteException e) {
            Log.d(TAG, "setsource fail!");
        }
    }

    public int play() {
        Log.d(TAG, "play(): Enter");
        return super.play();
    }

    public int stop() {
        Log.d(TAG, "stop(): Enter");
        return super.stop();
    }
}
