package com.autochips.logo;

public class AtcLogo {
    public static final String TAG = "ATCLogo";

    public static native int readlogo(byte[] bArr, int i, int i2);

    public static native int writelogo(byte[] bArr, int i, int i2);

    static {
        System.loadLibrary("atclogo");
    }
}
