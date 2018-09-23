package com.autochips.inputsource;

import android.cbm.CBManager;
import android.cbm.CBManager.OnActionListener;
import android.inputsource.IInputSourceBase;
import android.inputsource.IInputSourceClient.Stub;
import android.inputsource.IInputSourceService;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;

public abstract class InputSourceClient extends Stub {
    protected static final int INPUTSOURCE_CBM_AUD_CMD = 5;
    protected static final int INPUTSOURCE_CBM_CMD = 4;
    public static final int INPUTSOURCE_CBM_PAUSE = 2;
    public static final int INPUTSOURCE_CBM_RESUME = 3;
    public static final int INPUTSOURCE_CBM_START = 1;
    public static final int INPUTSOURCE_CBM_STOP = 0;
    protected static final int INPUTSOURCE_CBM_VDO_CMD = 6;
    public static final int INPUTSOURCE_HANDLE_CBM = 1;
    private static final int INPUTSOURCE_SIGNAL = 3;
    private static final int INPUTSOURCE_SIGNAL_CHANGE = 2;
    private static final int INPUTSOURCE_SIGNAL_LOST = 1;
    private static final int INPUTSOURCE_SIGNAL_READY = 0;
    private static final String TAG = "InputSourceClient";
    protected static IInputSourceService mService;
    protected CBManager mCBM = null;
    private OnActionListener mCBMActionListener = new C00841();
    protected int mCbmCtlStatus = 0;
    protected int mCurrentStatus = 0;
    protected int mDestType = 0;
    private EventHandler mEventHandler;
    protected int mInputSourceCBMPriority = 0;
    protected boolean mIsPermittedByCBM = false;
    private OnCbmCmdListener mOnCbmCmdListener;
    private OnSignalListener mOnSignalListener;
    protected int mRealState = 0;
    private SurfaceHolder mRearSurfaceHolder;
    protected IInputSourceBase mSource = null;
    protected int mSrcType = 0;
    private SurfaceHolder mSurfaceHolder;

    /* renamed from: com.autochips.inputsource.InputSourceClient$1 */
    class C00841 implements OnActionListener {
        C00841() {
        }

        /* JADX WARNING: inconsistent code. */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public int onAction(int r11, int r12, int r13) {
            /*
            r10 = this;
            r9 = 9;
            r8 = 4;
            r7 = 3;
            r6 = 1;
            r5 = 0;
            r2 = "InputSourceClient";
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "mCBMActionListener onAction Start command: ";
            r3 = r3.append(r4);
            r3 = r3.append(r11);
            r4 = " cmdAttr: ";
            r3 = r3.append(r4);
            r3 = r3.append(r12);
            r4 = " priority: ";
            r3 = r3.append(r4);
            r3 = r3.append(r13);
            r3 = r3.toString();
            android.util.Log.i(r2, r3);
            r1 = 1;
            switch(r12) {
                case 1: goto L_0x005d;
                case 2: goto L_0x005f;
                case 3: goto L_0x0061;
                default: goto L_0x0036;
            };
        L_0x0036:
            r2 = "InputSourceClient";
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "mCBMActionListener onAction cmdAttr invalid :!!!";
            r3 = r3.append(r4);
            r3 = r3.append(r12);
            r3 = r3.toString();
            android.util.Log.e(r2, r3);
        L_0x004e:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r0 = r2.mDestType;
            switch(r11) {
                case 3: goto L_0x01e5;
                case 4: goto L_0x0063;
                case 5: goto L_0x0063;
                case 6: goto L_0x01e5;
                default: goto L_0x0055;
            };
        L_0x0055:
            r2 = "InputSourceClient";
            r3 = "mCBMActionListener Unknown CMD!";
            android.util.Log.i(r2, r3);
        L_0x005c:
            return r5;
        L_0x005d:
            r1 = 1;
            goto L_0x004e;
        L_0x005f:
            r1 = 2;
            goto L_0x004e;
        L_0x0061:
            r1 = 3;
            goto L_0x004e;
        L_0x0063:
            r2 = "InputSourceClient";
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "mCBMActionListener: CBM_STOP!";
            r3 = r3.append(r4);
            r4 = com.autochips.inputsource.InputSourceClient.this;
            r4 = r4.mSrcType;
            r3 = r3.append(r4);
            r4 = ", mDestType:";
            r3 = r3.append(r4);
            r4 = com.autochips.inputsource.InputSourceClient.this;
            r4 = r4.mDestType;
            r3 = r3.append(r4);
            r3 = r3.toString();
            android.util.Log.i(r2, r3);
            r2 = r1 ^ -1;
            r0 = r0 & r2;
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mDestType;
            if (r2 == 0) goto L_0x00a8;
        L_0x0096:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mDestType;
            if (r0 != r2) goto L_0x00a8;
        L_0x009c:
            r2 = "InputSourceClient";
            r3 = "mCBMActionListener: CBM_STOP, do nothing mDestType == destDir!";
            android.util.Log.i(r2, r3);
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.mCbmCtlStatus = r6;
            goto L_0x005c;
        L_0x00a8:
            if (r0 != 0) goto L_0x00f7;
        L_0x00aa:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mCbmCtlStatus;
            if (r2 != r6) goto L_0x00cd;
        L_0x00b0:
            r2 = "InputSourceClient";
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "mCBMActionListener CBM_STOP Already Stoped mDestType:";
            r3 = r3.append(r4);
            r4 = com.autochips.inputsource.InputSourceClient.this;
            r4 = r4.mDestType;
            r3 = r3.append(r4);
            r3 = r3.toString();
            android.util.Log.i(r2, r3);
            goto L_0x005c;
        L_0x00cd:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mCurrentStatus;
            if (r2 != r6) goto L_0x00e0;
        L_0x00d3:
            r2 = "InputSourceClient";
            r3 = "mCBMActionListener CBM_STOP Already been stoped because there is other activity in front";
            android.util.Log.i(r2, r3);
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.mCbmCtlStatus = r6;
            goto L_0x005c;
        L_0x00e0:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2._stop();
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.mCbmCtlStatus = r6;
        L_0x00e9:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.notifymsg(r8, r5, r1);
        L_0x00ee:
            r2 = "InputSourceClient";
            r3 = "mCBMActionListener onAction End!!!";
            android.util.Log.d(r2, r3);
            goto L_0x005c;
        L_0x00f7:
            if (r6 != r1) goto L_0x016e;
        L_0x00f9:
            r2 = "InputSourceClient";
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "mCBMActionListener CBM_STOP All mDestType:";
            r3 = r3.append(r4);
            r4 = com.autochips.inputsource.InputSourceClient.this;
            r4 = r4.mDestType;
            r3 = r3.append(r4);
            r3 = r3.toString();
            android.util.Log.i(r2, r3);
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mCbmCtlStatus;
            if (r2 != r7) goto L_0x0139;
        L_0x011b:
            r2 = "InputSourceClient";
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "mCBMActionListener  Already STOP_FRONT mDestType:";
            r3 = r3.append(r4);
            r4 = com.autochips.inputsource.InputSourceClient.this;
            r4 = r4.mDestType;
            r3 = r3.append(r4);
            r3 = r3.toString();
            android.util.Log.i(r2, r3);
            goto L_0x005c;
        L_0x0139:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mSrcType;
            r3 = com.autochips.inputsource.InputSourceClient.this;
            r3 = r3.mCBM;
            if (r2 != r9) goto L_0x014e;
        L_0x0143:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r3 = 2;
            r2.setDestination(r3);
        L_0x0149:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.mCbmCtlStatus = r7;
            goto L_0x00e9;
        L_0x014e:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mSrcType;
            r3 = com.autochips.inputsource.InputSourceClient.this;
            r3 = r3.mCBM;
            r3 = 10;
            if (r2 != r3) goto L_0x0167;
        L_0x015a:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r3 = 2;
            r2.setDestination(r3);
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r3 = 0;
            r2.setDisplay(r3);
            goto L_0x0149;
        L_0x0167:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r3 = 0;
            r2.setDisplay(r3);
            goto L_0x0149;
        L_0x016e:
            r2 = 2;
            if (r2 != r1) goto L_0x00e9;
        L_0x0171:
            r2 = "InputSourceClient";
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "mCBMActionListener CBM_STOP All mDestType:";
            r3 = r3.append(r4);
            r4 = com.autochips.inputsource.InputSourceClient.this;
            r4 = r4.mDestType;
            r3 = r3.append(r4);
            r3 = r3.toString();
            android.util.Log.i(r2, r3);
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mCbmCtlStatus;
            if (r2 != r8) goto L_0x01b1;
        L_0x0193:
            r2 = "InputSourceClient";
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "mCBMActionListener  Already STOP_REAR mDestType:";
            r3 = r3.append(r4);
            r4 = com.autochips.inputsource.InputSourceClient.this;
            r4 = r4.mDestType;
            r3 = r3.append(r4);
            r3 = r3.toString();
            android.util.Log.i(r2, r3);
            goto L_0x005c;
        L_0x01b1:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mSrcType;
            r3 = com.autochips.inputsource.InputSourceClient.this;
            r3 = r3.mCBM;
            if (r2 != r9) goto L_0x01c6;
        L_0x01bb:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.setDestination(r6);
        L_0x01c0:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.mCbmCtlStatus = r8;
            goto L_0x00e9;
        L_0x01c6:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mSrcType;
            r3 = com.autochips.inputsource.InputSourceClient.this;
            r3 = r3.mCBM;
            r3 = 10;
            if (r2 != r3) goto L_0x01de;
        L_0x01d2:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.setDestination(r6);
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r3 = 0;
            r2.setRearDisplay(r3);
            goto L_0x01c0;
        L_0x01de:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r3 = 0;
            r2.setRearDisplay(r3);
            goto L_0x01c0;
        L_0x01e5:
            r2 = "InputSourceClient";
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "mCBMActionListener CBM_START mSrcType is !";
            r3 = r3.append(r4);
            r4 = com.autochips.inputsource.InputSourceClient.this;
            r4 = r4.mSrcType;
            r3 = r3.append(r4);
            r3 = r3.toString();
            android.util.Log.i(r2, r3);
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mCbmCtlStatus;
            if (r2 != 0) goto L_0x0225;
        L_0x0207:
            r2 = "InputSourceClient";
            r3 = new java.lang.StringBuilder;
            r3.<init>();
            r4 = "mCBMActionListener  Already Started mDestType:";
            r3 = r3.append(r4);
            r4 = com.autochips.inputsource.InputSourceClient.this;
            r4 = r4.mDestType;
            r3 = r3.append(r4);
            r3 = r3.toString();
            android.util.Log.i(r2, r3);
            goto L_0x005c;
        L_0x0225:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mCurrentStatus;
            if (r2 != r6) goto L_0x0238;
        L_0x022b:
            r2 = "InputSourceClient";
            r3 = "mCBMActionListener CBM_START been stoped by other activity in front just return resource";
            android.util.Log.i(r2, r3);
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.mCbmCtlStatus = r5;
            goto L_0x005c;
        L_0x0238:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mCbmCtlStatus;
            if (r2 != r6) goto L_0x024e;
        L_0x023e:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2._play();
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.mCbmCtlStatus = r5;
        L_0x0247:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.notifymsg(r8, r6, r1);
            goto L_0x00ee;
        L_0x024e:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mCbmCtlStatus;
            if (r2 != r7) goto L_0x0274;
        L_0x0254:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mSrcType;
            r3 = com.autochips.inputsource.InputSourceClient.this;
            r3 = r3.mCBM;
            if (r2 == r9) goto L_0x026a;
        L_0x025e:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mSrcType;
            r3 = com.autochips.inputsource.InputSourceClient.this;
            r3 = r3.mCBM;
            r3 = 10;
            if (r2 != r3) goto L_0x026f;
        L_0x026a:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.setDestination(r7);
        L_0x026f:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.mCbmCtlStatus = r5;
            goto L_0x0247;
        L_0x0274:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mCbmCtlStatus;
            if (r2 != r8) goto L_0x0247;
        L_0x027a:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mSrcType;
            r3 = com.autochips.inputsource.InputSourceClient.this;
            r3 = r3.mCBM;
            if (r2 == r9) goto L_0x0290;
        L_0x0284:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2 = r2.mSrcType;
            r3 = com.autochips.inputsource.InputSourceClient.this;
            r3 = r3.mCBM;
            r3 = 10;
            if (r2 != r3) goto L_0x0295;
        L_0x0290:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.setDestination(r7);
        L_0x0295:
            r2 = com.autochips.inputsource.InputSourceClient.this;
            r2.mCbmCtlStatus = r5;
            goto L_0x0247;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.autochips.inputsource.InputSourceClient.1.onAction(int, int, int):int");
        }
    }

    private class EventHandler extends Handler {
        private InputSourceClient InputSourceClient;

        public EventHandler(InputSourceClient source, Looper looper) {
            super(looper);
            this.InputSourceClient = source;
        }

        public void handleMessage(Message msg) {
            Log.i(InputSourceClient.TAG, "InputSourceClient.java handleMessage msg:" + msg.what + ";param1:" + msg.arg1 + ";param2:" + msg.arg2);
            switch (msg.what) {
                case 0:
                case 1:
                case 2:
                    if (InputSourceClient.this.mOnSignalListener != null) {
                        Log.i(InputSourceClient.TAG, "InputSourceClient.java handleMessage msg: onSignal");
                        InputSourceClient.this.mOnSignalListener.onSignal(msg.what, msg.arg1, msg.arg2);
                        return;
                    }
                    Log.i(InputSourceClient.TAG, "InputSourceClient.java handleMessage mOnSignalListener not set so do not notify");
                    return;
                case 4:
                    if (InputSourceClient.this.mOnCbmCmdListener != null) {
                        Log.i(InputSourceClient.TAG, "InputSourceClient.java handleMessage msg: onCmd");
                        InputSourceClient.this.mOnCbmCmdListener.onCmd(msg.arg1, msg.arg2);
                    } else {
                        Log.i(InputSourceClient.TAG, "InputSourceClient.java handleMessage mOnCbmCmdListener not set so do not notify");
                    }
                    Log.i(InputSourceClient.TAG, "InputSourceClient.java handleMessage mOnCbmCmdListener onCmd end");
                    return;
                default:
                    return;
            }
        }
    }

    public interface OnCbmCmdListener {
        void onCmd(int i, int i2);
    }

    public interface OnSignalListener {
        void onSignal(int i, int i2, int i3);
    }

    public InputSourceClient() {
        Log.d(TAG, "InputSourceClient() construct");
        Looper looper = Looper.myLooper();
        if (looper != null) {
            this.mEventHandler = new EventHandler(this, looper);
            return;
        }
        looper = Looper.getMainLooper();
        if (looper != null) {
            this.mEventHandler = new EventHandler(this, looper);
        } else {
            this.mEventHandler = null;
        }
    }

    public void release() {
        Log.d(TAG, "release()");
        mService = null;
        this.mEventHandler = null;
    }

    public static IInputSourceService getService() {
        if (mService == null) {
            mService = IInputSourceService.Stub.asInterface(ServiceManager.getService("inputsource"));
        }
        Log.d(TAG, "getService(): mService " + mService);
        return mService;
    }

    public void setOnSignalListener(OnSignalListener listener) {
        this.mOnSignalListener = listener;
    }

    public void setOnCbmCmdListener(OnCbmCmdListener listener) {
        this.mOnCbmCmdListener = listener;
        Log.i(TAG, "InputSourceClient.java setOnCbmCmdListener");
    }

    public int notifymsg(int msg, int param1, int param2) {
        Log.i(TAG, "InputSourceClient.java notify msg:" + msg + ";param1:" + param1 + ";param2:" + param2 + ";mOnCbmCmdListener:" + this.mOnCbmCmdListener);
        if (this.mEventHandler != null) {
            this.mEventHandler.sendMessage(this.mEventHandler.obtainMessage(msg, param1, param2, Integer.valueOf(0)));
        }
        return 1;
    }

    public int setSource(int inputSrcType) {
        int errors = 0;
        try {
            if (this.mSource == null) {
                Log.e(TAG, "setSource(): mSource null");
                return InputSource.ERR_FAILED;
            }
            errors = this.mSource.setSource(inputSrcType, 0, 0);
            return errors;
        } catch (RemoteException e) {
            Log.d(TAG, "setSource(): fail!");
        }
    }

    public void CBMConfig(boolean isAppResume) {
        Log.d(TAG, "CBMConfig(): enter controled by CBM play later" + this.mCBM + ", isAppResume" + isAppResume);
        if (this.mCBM != null) {
            this.mCBM.config(isAppResume);
        }
    }

    public int CBMResume() {
        Log.d(TAG, "CBMConfig(): enter controled by CBM play later" + this.mCBM);
        if (this.mCBM != null) {
            int retCbm = this.mCBM.appResume();
            if (retCbm == 0) {
                return InputSource.ERR_OK;
            }
            Log.d(TAG, "CBMConfig(): retCbm is" + retCbm);
            return InputSource.ERR_FAILED;
        }
        Log.d(TAG, "CBMConfig(): mCBM is null");
        return InputSource.ERR_FAILED;
    }

    public int play() {
        Log.d(TAG, "play(): enter mSrcType: " + this.mSrcType + ",mIsPermittedByCBM: " + this.mIsPermittedByCBM);
        if (this.mCbmCtlStatus != 0) {
            Log.d(TAG, "play(): enter controled by CBM play later");
            this.mCurrentStatus = 2;
            return InputSource.ERR_OK;
        }
        int errors = _play();
        this.mCurrentStatus = 2;
        return errors;
    }

    public int stop() {
        Log.d(TAG, "stop() enter");
        int errors = _stop();
        this.mCurrentStatus = 1;
        return errors;
    }

    private int _play() {
        Log.d(TAG, "_play(): enter mSrcType: " + this.mSrcType + ",mIsPermittedByCBM: " + this.mIsPermittedByCBM);
        int errors = 0;
        if (this.mSrcType == 0) {
            Log.e(TAG, "_play(): mSrcType is null play L_FAILED");
            return InputSource.ERR_FAILED;
        } else if (this.mIsPermittedByCBM || permittedToStart()) {
            try {
                if (this.mSource == null) {
                    Log.e(TAG, "_play(): mSource null so Play L_FAILED");
                    this.mCBM.release();
                    return InputSource.ERR_FAILED;
                }
                errors = this.mSource.play();
                this.mRealState = 2;
                return errors;
            } catch (RemoteException e) {
                this.mCBM.release();
                Log.e(TAG, "_play(): fail!");
            }
        } else {
            Log.e(TAG, "_play(): We're not Permitted to start by CBManager\r\n" + this.mIsPermittedByCBM);
            return InputSource.ERR_CBM_NOT_ALLOWED;
        }
    }

    private int _stop() {
        Log.d(TAG, "_stop() enter");
        int errors = 0;
        try {
            if (this.mSource == null) {
                Log.e(TAG, "stop(): mSource null");
                return InputSource.ERR_FAILED;
            }
            errors = this.mSource.stop();
            this.mRealState = 1;
            return errors;
        } catch (RemoteException e) {
            Log.e(TAG, "stop(): fail!");
        }
    }

    public int setSourceRect(int destination, int left, int top, int width, int height) {
        int errors = 0;
        Log.d(TAG, "setSourceRect(): destination:" + destination + "left:" + left + "top:" + top + "width:" + width + "height:" + height);
        try {
            if (this.mSource == null) {
                Log.e(TAG, "setSourceRect fail mSource null");
                return InputSource.ERR_FAILED;
            }
            errors = this.mSource.setSourceRect(destination, left, top, width, height);
            return errors;
        } catch (RemoteException e) {
            Log.d(TAG, "setSourceRect fail!");
        }
    }

    public int setDestination(int destination) {
        int errors = 0;
        Log.d(TAG, "setDestination(): destination:" + destination);
        if (destination == this.mDestType) {
            Log.d(TAG, "setDestination(): the current destination is already:" + destination);
            return InputSource.ERR_OK;
        }
        int i = this.mSrcType;
        CBManager cBManager = this.mCBM;
        if (i != 0) {
            if (permittedToSwitch(destination)) {
                Log.d(TAG, "setDestination(): after Permitted to switch by CBManager");
            } else {
                Log.e(TAG, "setDestination(): We're not Permitted to Switch dest by CBManager");
                return InputSource.ERR_CBM_NOT_ALLOWED;
            }
        }
        try {
            if (this.mSource == null) {
                Log.e(TAG, "setDestination(): fail mSource null");
                return InputSource.ERR_FAILED;
            }
            errors = this.mSource.setDestination(destination);
            this.mDestType = destination;
            return errors;
        } catch (RemoteException e) {
            Log.e(TAG, "setDestination(): fail!");
        }
    }

    public void setDisplay(SurfaceHolder sh) {
        Surface surface;
        Log.d(TAG, "setDisplay() ");
        this.mSurfaceHolder = sh;
        if (sh != null) {
            surface = sh.getSurface();
        } else {
            surface = null;
        }
        setSurface(surface, 1);
    }

    public void setRearDisplay(SurfaceHolder sh) {
        Surface surface;
        Log.d(TAG, "setRearDisplay() ");
        this.mRearSurfaceHolder = sh;
        if (sh != null) {
            surface = sh.getSurface();
        } else {
            surface = null;
        }
        setSurface(surface, 2);
    }

    public int getState() {
        Log.d(TAG, "GetState() Real State Is" + this.mRealState);
        return this.mRealState;
    }

    private int setSurface(Surface surface, int destType) {
        int errors = 0;
        Log.d(TAG, "setSurface() destType is :" + destType);
        if (surface == null) {
            Log.d(TAG, "setSurface(): set surface null");
        }
        try {
            if (this.mSource == null) {
                Log.e(TAG, "setSurface(): fail mSource null");
                return InputSource.ERR_FAILED;
            }
            if (destType == 2) {
                errors = this.mSource.setRearSurfaceTexture(surface);
            } else if (destType == 1) {
                errors = this.mSource.setSurfaceTexture(surface);
            }
            return errors;
        } catch (RemoteException e) {
            Log.e(TAG, "setSurface(): fail");
        }
    }

    private boolean permittedToStart() {
        Log.i(TAG, "permittedToStart(): Request Src :" + this.mSrcType);
        Parcel reply = Parcel.obtain();
        if (this.mCBM == null) {
            Log.i(TAG, "permittedToStart(): mCbm is null ");
            return false;
        } else if (this.mCBM.request(this.mSrcType, 1, reply) != 0) {
            Log.e(TAG, "permittedToStart(): ask permision from CBManager not Permitted");
            return false;
        } else if (reply.readInt() == 0) {
            Log.e(TAG, "permittedToStart(): ask permision from CBManager REQ_FORBID not Permitted");
            return false;
        } else {
            this.mCBM.setOnActionListener(this.mCBMActionListener);
            this.mIsPermittedByCBM = true;
            Log.e(TAG, "permittedToStart(): ask permision from CBManager Permitted");
            return true;
        }
    }

    private boolean permittedToSwitch(int destination) {
        int cbmRet = 0;
        Parcel reply = Parcel.obtain();
        CBManager cBManager;
        int i;
        CBManager cBManager2;
        switch (destination) {
            case 0:
                Log.d(TAG, "permittedToSwitch(): DEST_TYPE_NONE no need request");
                return true;
            case 1:
                Log.d(TAG, "permittedToSwitch(): DEST_TYPE_FRONT");
                cBManager = this.mCBM;
                i = this.mSrcType;
                cBManager2 = this.mCBM;
                cbmRet = cBManager.swiRequest(i, 1, reply);
                break;
            case 2:
                Log.d(TAG, "permittedToSwitch(): DEST_TYPE_REAR");
                cBManager = this.mCBM;
                i = this.mSrcType;
                cBManager2 = this.mCBM;
                cbmRet = cBManager.swiRequest(i, 2, reply);
                break;
            case 3:
                Log.d(TAG, "permittedToSwitch(): DEST_TYPE_FRONT_REAR");
                cBManager = this.mCBM;
                i = this.mSrcType;
                cBManager2 = this.mCBM;
                cbmRet = cBManager.swiRequest(i, 3, reply);
                break;
            default:
                Log.d(TAG, "permittedToSwitch(): Unknown");
                break;
        }
        if (cbmRet != 0) {
            Log.e(TAG, "permittedToSwitch():  ask permision from CBManager not Permitted");
            return false;
        }
        int ret = reply.readInt();
        Log.i(TAG, "permittedToSwitch(): swiRequest ret:" + ret);
        if (ret == 0) {
            Log.e(TAG, "permittedToSwitch(): ask permision from CBManager REQ_FORBID not Permitted");
            return false;
        }
        Log.i(TAG, "permittedToSwitch(): ask permision from CBManager Permitted");
        return true;
    }
}
