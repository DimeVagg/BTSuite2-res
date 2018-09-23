package com.autochips.bluetooth.util;

import android.util.Log;

public class PbSyncATGen {
    private static final String TAG = "PbSyncATGen";
    private int mCurProfile = 0;

    public void SetCurProfile(int profile) {
        this.mCurProfile = profile;
    }

    public String GetATResetAT() {
        return "AT\r";
    }

    public String GetATSetEcho(boolean bEcho) {
        if (3 == this.mCurProfile) {
            return "ATE\r";
        }
        if (bEcho) {
            return "ATE1\r";
        }
        return "ATE0\r";
    }

    public String GetATGetIMEI() {
        if (2 == this.mCurProfile) {
            return "AT+CGSN";
        }
        return "AT+CGSN\r";
    }

    public String GetATGetManufactor() {
        if (2 == this.mCurProfile) {
            return "AT+CGMI";
        }
        if (3 == this.mCurProfile) {
            return "AT+GMI\r";
        }
        return "AT+CGMI";
    }

    public String GetATGetSerial() {
        if (2 == this.mCurProfile) {
            return "AT+CGMM";
        }
        return "AT+CGMM\r";
    }

    public String GetATGetSptCharSet() {
        if (2 == this.mCurProfile) {
            return "AT+CSCS=?";
        }
        return "AT+CSCS=?\r";
    }

    public String GetATGetCurCharSet() {
        if (2 == this.mCurProfile) {
            return "AT+CSCS?";
        }
        return "AT+CSCS?\r";
    }

    public String GetATSetCharSet(String sTgtCharSet) {
        if (2 == this.mCurProfile) {
            return "AT+CSCS=\"" + sTgtCharSet + "\"";
        }
        return "AT+CSCS=\"" + sTgtCharSet + "\"\r";
    }

    public String GetATPBSetPath(int path) {
        String sTgtPath = convertPathInt2String(path);
        if (2 == this.mCurProfile) {
            return "AT+CPBS=\"" + sTgtPath + "\"";
        }
        return "AT+CPBS=\"" + sTgtPath + "\"\r";
    }

    public String GetATPBGetCurPath() {
        if (2 == this.mCurProfile) {
            return "AT+CPBS?";
        }
        return "AT+CPBS?\r";
    }

    public String GetATPBGetListSz() {
        if (2 == this.mCurProfile) {
            return "AT+CPBS?";
        }
        return "AT+CPBS?\r";
    }

    public String GetATPBGetListSzByCPBR() {
        if (2 == this.mCurProfile) {
            return "AT+CPBR=?";
        }
        return "AT+CPBR=?\r";
    }

    public String GetATPBGetRecs(int start, int end) {
        if (2 == this.mCurProfile) {
            return "AT+CPBR=" + start + "," + end;
        }
        return "AT+CPBR=" + start + "," + end + "\r";
    }

    public String GetATPBGetRecsBySPBR(int iIndex) {
        if (2 == this.mCurProfile) {
            return "AT+SPBR=" + iIndex;
        }
        return "AT+SPBR=" + iIndex + "\r";
    }

    public String GetATPBGetIdxLstBySPBR() {
        if (2 == this.mCurProfile) {
            return "AT+INFO";
        }
        return "AT+INFO\r";
    }

    public String GetATPBGetSptPath() {
        if (2 == this.mCurProfile) {
            return "AT+CPBS=?";
        }
        return "AT+CPBS=?\r";
    }

    private String convertPathInt2String(int path) {
        switch (path) {
            case 16:
                return "ME";
            case 32:
                return "SM";
            case 64:
            case 128:
                return "RC";
            case 256:
            case 512:
                return "DC";
            case 1024:
            case 2048:
                return "MC";
            default:
                Log.e(TAG, "Unknown path operation");
                return null;
        }
    }

    public String GetATGetSMSSptService() {
        if (2 == this.mCurProfile) {
            return "AT+CSMS?";
        }
        return "AT+CSMS?\r";
    }

    public String GetATGetSMSFormat() {
        if (2 == this.mCurProfile) {
            return "AT+CMGF?";
        }
        return "AT+CMGF?\r";
    }

    public String GetATSetSMSFormat(int format) {
        if (2 == this.mCurProfile) {
            return "AT+CMGF=" + format;
        }
        return "AT+CMGF=" + format + "\r";
    }

    public String GetATGetSMSSrvCenter() {
        if (2 == this.mCurProfile) {
            return "AT+CSCA?";
        }
        return "AT+CSCA?\r";
    }

    public String GetATGetSMSSptPos() {
        if (2 == this.mCurProfile) {
            return "AT+CPMS=?";
        }
        return "AT+CPMS=?\r";
    }

    public String GetATGetSMSCurPos() {
        if (2 == this.mCurProfile) {
            return "AT+CPMS?";
        }
        return "AT+CPMS?\r";
    }

    public String GetATSetSMSCNMI() {
        if (2 == this.mCurProfile) {
            return "AT+CNMI=2,1";
        }
        return "AT+CNMI=2,1\r";
    }

    public String GetATSetSMSCurPos() {
        if (2 == this.mCurProfile) {
            return "AT+CPMS=";
        }
        return "AT+CPMS=\r";
    }

    public String GetATGetSMSRecByType(int type) {
        if (2 == this.mCurProfile) {
            return "AT+CMGL=" + type;
        }
        return "AT+CMGL=" + type + "\r";
    }

    public String GetATGetSMSSptRecType(int type) {
        if (2 == this.mCurProfile) {
            return "AT+CMGL=?";
        }
        return "AT+CMGL=?\r";
    }

    public String GetATSetSMSRecLstByMMGL(int type) {
        if (2 == this.mCurProfile) {
            return "AT+MMGL=" + type;
        }
        return "AT+MMGL=" + type + "\r";
    }

    public String GetATGetSMSRec(int index) {
        if (2 == this.mCurProfile) {
            return "AT+CMGR=" + index;
        }
        return "AT+CMGR=" + index + "\r";
    }
}
