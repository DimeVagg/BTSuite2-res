package com.autochips.metazone;

public class AtcMetazone {
    public static final String TAG = "ATCMetazone";

    public static native int flush(boolean z);

    public static native int readbinary(long j, byte[] bArr, long j2);

    public static native int readreserved(byte[] bArr, long j);

    public static native int readval(long j, long[] jArr);

    public static native int writebinary(long j, byte[] bArr, long j2);

    public static native int writereserved(byte[] bArr, long j);

    public static native int writeval(long j, long j2);

    static {
        System.loadLibrary("metazone");
    }
}
