package com.autochips.pveparams;

import android.util.Log;

public class PveParams {
    private static final boolean DEBUG = true;
    private static final String TAG = "PveParams";

    private static native void nativeBackSetStatus(int i);

    private static native void nativeDeinit();

    private static native void nativeExit();

    private static native int nativeGetTouchX();

    private static native int nativeGetTouchY();

    private static native void nativeReadCmd();

    private static native void nativeResume();

    private static native void nativeSuspend();

    private static native void nativeTouchConfig(byte[] bArr);

    private static native int nativeTouchCoordinateX();

    private static native int nativeTouchCoordinateY();

    private static native int nativeTouchDir();

    private static native void nativeTouchId(int i);

    private static native void nativeTouchStudy(byte[] bArr);

    private static native void nativeVcomSet(int i);

    private static native int nativecheckXyGalaOs();

    static {
        System.loadLibrary("pveparams_jni");
    }

    public static void Deinit() {
        nativeDeinit();
    }

    public static void VcomSet(int vcom) {
        Log.v(TAG, "java VcomSet" + vcom);
        nativeVcomSet(vcom);
    }

    public static void BackSetStatus(int state) {
        nativeBackSetStatus(state);
    }

    public static void ReadCmd() {
        nativeReadCmd();
    }

    public static void TouchId(int id) {
        Log.v(TAG, "java Touchid");
        nativeTouchId(id);
    }

    public static void TouchConfig(byte[] config) {
        nativeTouchConfig(config);
    }

    public static void TouchStudy(byte[] cmd) {
        nativeTouchStudy(cmd);
    }

    public static int checkXyGalaOs() {
        return nativecheckXyGalaOs();
    }

    public static int GetTouchX() {
        int ret = nativeGetTouchX();
        if (ret == 0) {
            return 65535;
        }
        return ret;
    }

    public static int GetTouchY() {
        return nativeGetTouchY();
    }

    public static int GetTouchDir() {
        return nativeTouchDir();
    }

    public static int GetTouchCoordinateX() {
        return nativeTouchCoordinateX();
    }

    public static int GetTouchCoordinateY() {
        return nativeTouchCoordinateY();
    }

    public static int get_test_1(byte[] cmd) {
        return 0;
    }

    public static int get_test_2(byte[] cmd) {
        return 0;
    }

    public static int get_test_3(byte[] cmd) {
        return 0;
    }

    public static void send_test_1(byte[] cmd) {
    }

    public static void send_test_2(byte[] cmd) {
    }

    public static void send_test_3(byte[] cmd) {
    }

    public static void resume() {
        nativeResume();
    }

    public static void suspend() {
        nativeSuspend();
    }

    public static void exit() {
        nativeSuspend();
    }
}
