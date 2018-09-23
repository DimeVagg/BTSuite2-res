package com.autochips.inputsource;

import android.cbm.CBManager;
import android.os.RemoteException;
import android.util.Log;

public class YBRVGA extends InputSourceClient {
    private static final int IS_CMD_ID_SET_AUTO = 2;
    public static final int SIGNAL_LOST = 1;
    public static final int SIGNAL_NOT_SUPPORT = 2;
    public static final int SIGNAL_READY = 0;
    private static final String TAG = "YBRVGA.JAVA";

    public YBRVGA() {
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
            this.mSrcType = 12;
            errors = this.mSource.setSource(inputSrcType, portV, portA);
            return errors;
        } catch (RemoteException e) {
            Log.d(TAG, "setsource fail!");
        }
    }

    public int play() {
        Log.d(TAG, "YBR_VGA play(): Enter");
        return super.play();
    }

    public int stop() {
        Log.d(TAG, "YBR_VGA stop(): Enter");
        return super.stop();
    }

    public int setAuto() {
        int errors = 0;
        Log.d(TAG, "setAuto");
        try {
            if (this.mSource == null) {
                Log.e(TAG, "setAuto fail mSource null");
                return InputSource.ERR_FAILED;
            }
            errors = this.mSource.setCmd(2, 0);
            return errors;
        } catch (RemoteException e) {
            Log.e(TAG, "setAuto fail");
        }
    }
}
