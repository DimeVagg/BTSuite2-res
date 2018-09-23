package com.autochips.bluetooth.pbapclient;

import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;

public class BluetoothPbapClientPath {
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugPB);
    public static final int NUM_OF_PBMGR_PATH = 14;
    public static final int PBAP_BACK_FOLDER = 1;
    public static final String PBAP_CCH_NAME = "cch";
    public static final int PBAP_FORWARD_FOLDER = 0;
    public static final String PBAP_ICH_NAME = "ich";
    public static final String PBAP_MCH_NAME = "mch";
    public static final String PBAP_ME_NAME = "telecom";
    public static final String PBAP_OCH_NAME = "och";
    public static final String PBAP_PB_NAME = "pb";
    public static final int PBAP_ROOT_FOLDER = 2;
    public static final String PBAP_ROOT_NAME = "";
    public static final String PBAP_SIM1_ROOT_NAME = "SIM1";
    public static final String PBAP_SIM_NAME = "telecom";
    public static final int PBMGR_COMBINED_CALLED_HISTORY = 4096;
    public static final int PBMGR_INCOMING_CALLS_HISTORY = 64;
    public static final int PBMGR_MISSED_CALLS_HISTORY = 1024;
    public static final int PBMGR_OUTGOING_CALLS_HISTORY = 256;
    public static final int PBMGR_PB_ROOT = 2;
    public static final int PBMGR_PHONEBOOK = 16;
    public static final int PBMGR_ROOT = 1;
    public static final int PBMGR_SIM_COMBINED_CALLED_HISTORY = 8192;
    public static final int PBMGR_SIM_INCOMING_CALLS_HISTORY = 128;
    public static final int PBMGR_SIM_MISSED_CALLS_HISTORY = 2048;
    public static final int PBMGR_SIM_OUTGONING_CALLS_HISTORY = 512;
    public static final int PBMGR_SIM_PHONEBOOK = 32;
    public static final int PBMGR_SIM_ROOT = 8;
    public static final int PBMGR_SIM_TREE = 4;
    public static final int PBMGR_UNKNOW = 0;
    private static final String TAG = "BluetoothPbapClientPath";
    private int mCurLevel = -1;
    private int mCurrentPath = 0;
    private int mPathLevel = -1;
    private boolean mPullPBlist = false;
    private String[] mSetpath = new String[4];

    public int getCurrentPath() {
        return this.mCurrentPath;
    }

    public int getPathLevel(boolean bIsGetVcardEntry) {
        if (bIsGetVcardEntry) {
            return this.mPathLevel;
        }
        return this.mPathLevel - 1;
    }

    public String getFolderName() {
        if (this.mPathLevel < 0) {
            return null;
        }
        return this.mSetpath[this.mPathLevel - 1];
    }

    public String getIndexPath(int index) {
        if (index < 0 || index >= this.mPathLevel) {
            errorLog("getCurPath() index error!");
        }
        return this.mSetpath[index];
    }

    public int getCurIndex() {
        return this.mCurLevel;
    }

    public void increaseIndex() {
        this.mCurLevel++;
    }

    public void setPath(int folder_type) {
        printLog("[API] setPath(" + folder_type + ")");
        this.mCurrentPath = folder_type;
        this.mCurLevel = 0;
        switch (folder_type) {
            case 16:
                this.mSetpath[0] = PBAP_ROOT_NAME;
                this.mSetpath[1] = "telecom";
                this.mSetpath[2] = PBAP_PB_NAME;
                this.mPathLevel = 3;
                return;
            case 32:
                this.mSetpath[0] = PBAP_ROOT_NAME;
                this.mSetpath[1] = PBAP_SIM1_ROOT_NAME;
                this.mSetpath[2] = "telecom";
                this.mSetpath[3] = PBAP_PB_NAME;
                this.mPathLevel = 4;
                return;
            case 64:
                this.mSetpath[0] = PBAP_ROOT_NAME;
                this.mSetpath[1] = "telecom";
                this.mSetpath[2] = PBAP_ICH_NAME;
                this.mPathLevel = 3;
                return;
            case 128:
                this.mSetpath[0] = PBAP_ROOT_NAME;
                this.mSetpath[1] = PBAP_SIM1_ROOT_NAME;
                this.mSetpath[2] = "telecom";
                this.mSetpath[3] = PBAP_ICH_NAME;
                this.mPathLevel = 4;
                return;
            case 256:
                this.mSetpath[0] = PBAP_ROOT_NAME;
                this.mSetpath[1] = "telecom";
                this.mSetpath[2] = PBAP_OCH_NAME;
                this.mPathLevel = 3;
                return;
            case 512:
                this.mSetpath[0] = PBAP_ROOT_NAME;
                this.mSetpath[1] = PBAP_SIM1_ROOT_NAME;
                this.mSetpath[2] = "telecom";
                this.mSetpath[3] = PBAP_OCH_NAME;
                this.mPathLevel = 4;
                return;
            case 1024:
                this.mSetpath[0] = PBAP_ROOT_NAME;
                this.mSetpath[1] = "telecom";
                this.mSetpath[2] = PBAP_MCH_NAME;
                this.mPathLevel = 3;
                return;
            case 2048:
                this.mSetpath[0] = PBAP_ROOT_NAME;
                this.mSetpath[1] = PBAP_SIM1_ROOT_NAME;
                this.mSetpath[2] = "telecom";
                this.mSetpath[3] = PBAP_MCH_NAME;
                this.mPathLevel = 4;
                return;
            case 4096:
                this.mSetpath[0] = PBAP_ROOT_NAME;
                this.mSetpath[1] = "telecom";
                this.mSetpath[2] = PBAP_CCH_NAME;
                this.mPathLevel = 3;
                return;
            case 8192:
                this.mSetpath[0] = PBAP_ROOT_NAME;
                this.mSetpath[1] = PBAP_SIM1_ROOT_NAME;
                this.mSetpath[2] = "telecom";
                this.mSetpath[3] = PBAP_CCH_NAME;
                this.mPathLevel = 4;
                return;
            default:
                this.mPathLevel = -1;
                errorLog("Unknown set path operation");
                return;
        }
    }

    public String getAbsolutePath(int path) {
        switch (path) {
            case 16:
                return "telecom/pb.vcf";
            case 32:
                return "SIM1/telecom/pb.vcf";
            case 64:
                return "telecom/ich.vcf";
            case 128:
                return "SIM1/telecom/ich.vcf";
            case 256:
                return "telecom/och.vcf";
            case 512:
                return "SIM1/telecom/och.vcf";
            case 1024:
                return "telecom/mch.vcf";
            case 2048:
                return "SIM1/telecom/mch.vcf";
            case 4096:
                return "telecom/cch.vcf";
            case 8192:
                return "SIM1/telecom/cch.vcf";
            default:
                errorLog("Unknown path operation");
                return null;
        }
    }

    private void printLog(String msg) {
        if (DEBUG) {
            Log.d(TAG, msg);
        }
    }

    private void errorLog(String msg) {
        Log.e(TAG, msg);
    }
}
