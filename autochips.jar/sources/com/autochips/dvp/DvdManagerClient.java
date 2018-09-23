package com.autochips.dvp;

import android.dvp.IDvdManagerBase;
import android.dvp.IDvdManagerClient.Stub;
import android.dvp.IDvdManagerService;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.util.Log;

public abstract class DvdManagerClient extends Stub {
    private static final String TAG = "DvdManagerClient";
    protected static IDvdManagerService mService;
    protected IDvdManagerBase mDvdBase = null;

    public DvdManagerClient() {
        Log.d(TAG, "DvdManagerClient() construct");
        try {
            if (mService == null) {
                IBinder b = ServiceManager.getService("DvdManagerService");
                if (b != null) {
                    mService = IDvdManagerService.Stub.asInterface(b);
                }
            }
            Log.d(TAG, "getService(): mService " + mService);
            if (mService != null) {
                this.mDvdBase = mService.create(this);
                Log.e(TAG, "DvdLogicManager(): construct client: mDvdBase");
                return;
            }
            Log.e(TAG, "DvdLogicManager(): construct mService get null");
        } catch (RemoteException e) {
            Log.d(TAG, "DvdLogicManager(): client create fail, e=" + e);
        }
    }

    protected void finalize() {
        release();
    }

    private void release() {
        Log.d(TAG, "release()");
        try {
            if (this.mDvdBase != null) {
                this.mDvdBase.release();
            }
        } catch (RemoteException e) {
            Log.d(TAG, "release(): call DvdManagerBase.release fail, e=" + e);
        }
        this.mDvdBase = null;
        mService = null;
    }

    public int closeAudOutput(boolean front) {
        int ret = 0;
        if (this.mDvdBase == null) {
            Log.e(TAG, "closeAudOutput " + front + " fail for mDvdBase == null");
            return -1;
        }
        try {
            ret = this.mDvdBase.closeAudOutput(front);
        } catch (RemoteException e) {
            Log.d(TAG, "closeAudOutput " + front + " fail, e=" + e);
        }
        return ret;
    }

    public int openAudOutput(boolean front) {
        int ret = 0;
        if (this.mDvdBase == null) {
            Log.e(TAG, "openAudOutput " + front + " fail for mDvdBase == null");
            return -1;
        }
        try {
            ret = this.mDvdBase.openAudOutput(front);
        } catch (RemoteException e) {
            Log.d(TAG, "openAudOutput " + front + " fail, e=" + e);
        }
        return ret;
    }

    public int openFrontDisplay(boolean on) {
        int ret = 0;
        if (this.mDvdBase == null) {
            Log.e(TAG, "openFrontDisplay " + on + " fail for mDvdBase == null");
            return -1;
        }
        try {
            ret = this.mDvdBase.openFrontDisplay(on);
        } catch (RemoteException e) {
            Log.d(TAG, "openFrontDisplay " + on + " fail, e=" + e);
        }
        return ret;
    }

    public int openRearDisplay(boolean on) {
        int ret = 0;
        if (this.mDvdBase == null) {
            Log.e(TAG, "openRearDisplay " + on + " fail for mDvdBase == null");
            return -1;
        }
        try {
            ret = this.mDvdBase.openRearDisplay(on);
        } catch (RemoteException e) {
            Log.d(TAG, "openRearDisplay " + on + " fail, e=" + e);
        }
        return ret;
    }
}
