package com.autochips.version;

import android.util.Log;

public class SdkVersion {
    private static final String BR = "MAIN_BR";
    private static final String MM = "01";
    private static final String Rev = "005";
    private static final String TAG = "sdkVersion";
    private static final String mm = "00";

    private static native String getBuildDate();

    private static native int getChangeList();

    static {
        System.loadLibrary("version_jni");
    }

    public static void printVersion() {
        Log.i(TAG, "autochips.jar: V01.00.005_" + getChangeList() + "_" + getBuildDate());
    }

    public String getVersion() {
        Log.i(TAG, "getVersion");
        return null;
    }
}
