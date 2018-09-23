package com.autochips.cbmctx;

import android.cbm.CBManager;
import android.os.Parcel;
import android.util.Log;

public class CBMCtx {
    public static final int E_FAIL = -1;
    public static final int SRC_AVIN_A = 9;
    public static final int SRC_AVIN_AV = 10;
    public static final int SRC_AVIN_A_RDS = 15;
    public static final int SRC_AVIN_V = 8;
    public static final int SRC_BACKCAR = 1;
    public static final int SRC_BT_MUSIC = 3;
    public static final int SRC_BT_PHONE = 2;
    public static final int SRC_DIGITAL = 11;
    public static final int SRC_DVD = 7;
    public static final int SRC_HDMI_MHL = 13;
    public static final int SRC_IPOD = 14;
    public static final int SRC_MM_A = 5;
    public static final int SRC_MM_AV = 6;
    public static final int SRC_MM_V = 4;
    public static final int SRC_YPBPR_VGA = 12;
    public static final int S_OK = 0;
    private static final String TAG = "CBMCtx";
    private CBManager mCbm = new CBManager();

    public int query(Parcel reply) {
        Log.d(TAG, "query");
        return this.mCbm.query(reply);
    }
}
