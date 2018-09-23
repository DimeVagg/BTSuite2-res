package com.autochips.backcar;

import android.cbm.CBManager;
import android.cbm.CBManager.OnActionListener;
import android.os.Message;
import android.os.Parcel;
import android.util.Log;
import android.view.Surface;

public class BackCar {
    public static final int CBM_CONTROL_NONE = 0;
    public static final int CBM_CONTROL_STARTED = 2;
    public static final int CBM_CONTROL_STOPED = 1;
    public static final int EVENT_BACKCAR_ERROR = 4;
    public static final int EVENT_BACKCAR_IDLE = 0;
    public static final int EVENT_BACKCAR_RUNNING = 2;
    public static final int EVENT_BACKCAR_START = 1;
    public static final int EVENT_BACKCAR_STOP = 3;
    public static final int SIGNAL_LOST = 1;
    public static final int SIGNAL_READY = 0;
    public static final String TAG = "BackCar";
    public static final int VIDEO_FLIP_H = 1;
    public static final int VIDEO_FLIP_HnV = 3;
    public static final int VIDEO_FLIP_NONE = 0;
    public static final int VIDEO_FLIP_V = 2;
    private static CBManager gCBM = null;
    private static OnActionListener mCBMActionListener = new C00001();
    protected static int mCbmCtlStatus = 0;
    private static OnSignalListener mOnSignalListener;

    /* renamed from: com.autochips.backcar.BackCar$1 */
    static class C00001 implements OnActionListener {
        C00001() {
        }

        /* JADX WARNING: inconsistent code. */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public int onAction(int r6, int r7, int r8) {
            /*
            r5 = this;
            r4 = 1;
            r3 = 0;
            r0 = "BackCar";
            r1 = new java.lang.StringBuilder;
            r1.<init>();
            r2 = "mBC_CBMListener onAction Start command: ";
            r1 = r1.append(r2);
            r1 = r1.append(r6);
            r2 = " cmdAttr: ";
            r1 = r1.append(r2);
            r1 = r1.append(r7);
            r2 = " priority: ";
            r1 = r1.append(r2);
            r1 = r1.append(r8);
            r1 = r1.toString();
            android.util.Log.i(r0, r1);
            switch(r6) {
                case 3: goto L_0x0056;
                case 4: goto L_0x0039;
                case 5: goto L_0x0039;
                case 6: goto L_0x0056;
                default: goto L_0x0031;
            };
        L_0x0031:
            r0 = "BackCar";
            r1 = "mBC_CBMListener Unknown CMD!";
            android.util.Log.i(r0, r1);
        L_0x0038:
            return r3;
        L_0x0039:
            r0 = "BackCar";
            r1 = "mBC_CBMListener: CBM_STOP!";
            android.util.Log.i(r0, r1);
            r0 = com.autochips.backcar.BackCar.mCbmCtlStatus;
            if (r0 != r4) goto L_0x004c;
        L_0x0044:
            r0 = "BackCar";
            r1 = "mBC_CBMListener CBM_STOP Already Stoped mDestType:";
            android.util.Log.i(r0, r1);
            goto L_0x0038;
        L_0x004c:
            com.autochips.backcar.BackCar.mCbmCtlStatus = r4;
        L_0x004e:
            r0 = "BackCar";
            r1 = "mBC_CBMListener onAction End!!!";
            android.util.Log.d(r0, r1);
            goto L_0x0038;
        L_0x0056:
            r0 = "BackCar";
            r1 = "mBC_CBMListener CBM_START mSrcType is !";
            android.util.Log.i(r0, r1);
            r0 = com.autochips.backcar.BackCar.mCbmCtlStatus;
            if (r0 != 0) goto L_0x0069;
        L_0x0061:
            r0 = "BackCar";
            r1 = "mBC_CBMListener  Already Started mDestType:";
            android.util.Log.i(r0, r1);
            goto L_0x0038;
        L_0x0069:
            r0 = com.autochips.backcar.BackCar.mCbmCtlStatus;
            if (r0 != r4) goto L_0x004e;
        L_0x006d:
            com.autochips.backcar.BackCar.mCbmCtlStatus = r3;
            goto L_0x004e;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.autochips.backcar.BackCar.1.onAction(int, int, int):int");
        }
    }

    public interface OnSignalListener {
        void onSignal(int i, int i2, int i3);
    }

    public static native Message getEvent();

    public static native int init();

    public static native boolean isARM2Reversing();

    public static native void nativeBCInformArm2();

    private static native void nativeConfig(int i);

    private static native void nativeDeinit();

    private static native void nativePlaySound(byte[] bArr);

    private static native void nativeReset();

    private static native void nativeResume();

    private static native void nativeSetBrightness(int i);

    private static native void nativeSetHue(int i);

    private static native void nativeSetMirror(int i);

    private static native void nativeSetSaturation(int i);

    private static native void nativeSetSourceRect(int i, int i2, int i3, int i4);

    private static native void nativeSetVideoSurface(Surface surface);

    private static native int nativeStart();

    private static native int nativeStartup();

    private static native void nativeStop();

    private static native void nativeStopSound();

    private static native void nativeSuspend();

    static {
        System.loadLibrary("backcar_jni");
    }

    public static void Deinit() {
        Log.i(TAG, "Deinit: we're going to Deinit resource");
        nativeDeinit();
    }

    public static void setVideoSurface(Surface surface) {
        nativeSetVideoSurface(surface);
    }

    public static void playSound(byte[] data) {
        if (mCbmCtlStatus != 1) {
            nativePlaySound(data);
        } else {
            Log.i(TAG, "playSound(): we were stopped by CBM do not play sound");
        }
    }

    private static void StopSound() {
        nativeStopSound();
    }

    public static int start() {
        if (gCBM == null) {
            gCBM = new CBManager();
        }
        Parcel p = Parcel.obtain();
        Log.i(TAG, "***cbm return value is " + gCBM.requestAsync(1, 1));
        Log.i(TAG, "Request cbm (BC_ARM1)");
        nativeStart();
        return 0;
    }

    public static void stop() {
        Log.i(TAG, "stop() enter ");
        nativeStop();
        if (gCBM != null) {
            gCBM.release();
            Log.i(TAG, "Release cbm (BC_ARM1)");
            gCBM = null;
        }
    }

    public static void reset() {
        Log.i(TAG, "reset() enter ");
        nativeReset();
    }

    public static void resume() {
        nativeResume();
    }

    public static void suspend() {
        nativeSuspend();
        if (gCBM != null) {
            gCBM.release();
            gCBM = null;
        }
    }

    public static void startup() {
        if (gCBM == null) {
            gCBM = new CBManager();
        }
        Parcel p = Parcel.obtain();
        Log.i(TAG, "startup(): CBM requestAsync return value is " + gCBM.requestAsync(1, 1));
        gCBM.setOnActionListener(mCBMActionListener);
        nativeStartup();
        gCBM.release();
        gCBM = null;
    }

    public static void config(int video_port) {
        nativeConfig(video_port);
    }

    public static void SetSourceRect(int left, int top, int width, int height) {
        nativeSetSourceRect(left, top, width, height);
    }

    public static void SetBrightness(int u4Brightness) {
        nativeSetBrightness(u4Brightness);
    }

    public static void SetHue(int u4Hue) {
        nativeSetHue(u4Hue);
    }

    public static void SetSaturation(int u4Saturation) {
        nativeSetSaturation(u4Saturation);
    }

    public static void SetMirror(int iMirror) {
        nativeSetMirror(iMirror);
    }

    public void setOnSignalListener(OnSignalListener listener) {
        mOnSignalListener = listener;
    }

    private static void signalNotifyNative(int what, int arg1, int arg2) {
        Log.i(TAG, "signalNotifyNative");
        if (mOnSignalListener != null) {
            Log.i(TAG, "InputSourceClient.java handleMessage msg: onSignal" + what);
            mOnSignalListener.onSignal(what, arg1, arg2);
            return;
        }
        Log.i(TAG, "InputSourceClient.java handleMessage mOnSignalListener not set so do not notify");
    }

    public static void InformArm2() {
        Log.i(TAG, "System Server Inform Arm2backcar Arm1 is ready !\r\n");
        nativeBCInformArm2();
    }
}
