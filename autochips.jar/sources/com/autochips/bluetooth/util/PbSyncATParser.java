package com.autochips.bluetooth.util;

import android.text.format.Time;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;
import com.autochips.dvp.MultiMediaConstant;
import com.autochips.inputsource.HDMI;
import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PbSyncATParser {
    public static final int AT_CMD_GET_CIMI = 8;
    public static final int AT_CMD_GET_CUR_CHARSET = 14;
    public static final int AT_CMD_GET_IMEI = 7;
    public static final int AT_CMD_GET_MANUFACTOR = 4;
    public static final int AT_CMD_GET_MODVER = 6;
    public static final int AT_CMD_GET_PB_CUR_PATH = 19;
    public static final int AT_CMD_GET_PB_IDXLIST_BYSPBR = 23;
    public static final int AT_CMD_GET_PB_LISTSIZE = 20;
    public static final int AT_CMD_GET_PB_RECORDS = 21;
    public static final int AT_CMD_GET_PB_RECORDS_BYSPBR = 22;
    public static final int AT_CMD_GET_PB_SPT_PATH = 18;
    public static final int AT_CMD_GET_SERIAL = 5;
    public static final int AT_CMD_GET_SMS_CUR_POS = 30;
    public static final int AT_CMD_GET_SMS_FORMAT = 26;
    public static final int AT_CMD_GET_SMS_LISTSZ = 32;
    public static final int AT_CMD_GET_SMS_RECORDS = 36;
    public static final int AT_CMD_GET_SMS_REC_BYTYPE = 34;
    public static final int AT_CMD_GET_SMS_REC_IDXLIST = 33;
    public static final int AT_CMD_GET_SMS_SERVICE_CENTER = 28;
    public static final int AT_CMD_GET_SMS_SPT_POS = 29;
    public static final int AT_CMD_GET_SMS_SPT_RECTYPE = 35;
    public static final int AT_CMD_GET_SMS_SPT_SERVICES = 24;
    public static final int AT_CMD_GET_SPT_CHARSET = 13;
    public static final int AT_CMD_RESET = 1;
    public static final int AT_CMD_SET_CMEEERROR = 3;
    public static final int AT_CMD_SET_CUR_CHARSET = 15;
    public static final int AT_CMD_SET_ECHO = 2;
    public static final int AT_CMD_SET_PB_CUR_PATH = 17;
    public static final int AT_CMD_SET_SMS_CNMI = 25;
    public static final int AT_CMD_SET_SMS_CUR_POS = 31;
    public static final int AT_CMD_SET_SMS_FORMAT = 27;
    public static final int AT_CMD_UNKNOWN = 0;
    public static final int BT_CHARSET_ASCII = 512;
    public static final int BT_CHARSET_GSM = 4;
    public static final int BT_CHARSET_HEX = 16;
    public static final int BT_CHARSET_IRA = 8;
    public static final int BT_CHARSET_NULL = 256;
    public static final int BT_CHARSET_PCC437 = 128;
    public static final int BT_CHARSET_PCCP = 32;
    public static final int BT_CHARSET_PCCP437 = 1024;
    public static final int BT_CHARSET_PCDN = 64;
    public static final int BT_CHARSET_UCS2 = 2;
    public static final int BT_CHARSET_UNKNOWN = 0;
    public static final int BT_CHARSET_UTF8 = 1;
    public static final int BT_SMS_STORAGEIDX_LSDDEL = 0;
    public static final int BT_SMS_STORAGEIDX_MAX = 3;
    public static final int BT_SMS_STORAGEIDX_RECV = 2;
    public static final int BT_SMS_STORAGEIDX_WRSD = 1;
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugPB);
    public static final int MAX_CNT_OF_BT_CHARSET = 11;
    public static final int MAX_OF_SERVICE_CENTER_LEN = 32;
    public static final int PBMGR_TEL_FAX = 3;
    public static final int PBMGR_TEL_HOME = 0;
    public static final int PBMGR_TEL_MOBILE = 2;
    public static final int PBMGR_TEL_OTHER = 4;
    public static final int PBMGR_TEL_UNKNOWN = 5;
    public static final int PBMGR_TEL_WORK = 1;
    private static final String TAG = "PbSyncATParser";
    boolean bUDHI;
    private int cur;
    private int iSCLen = 0;
    private List<BT_PB_ADDREC_PARAM_T> mAddRecs = new ArrayList();
    private int[] mBTSmsRecType = new int[]{0, 0, 0, 0, 0};
    private String[][] mBtSmsStorageListRecCnt = ((String[][]) Array.newInstance(String.class, new int[]{3, 3}));
    private int[][] mBtSmsStorageRecCnt = ((int[][]) Array.newInstance(Integer.TYPE, new int[]{3, 2}));
    private int mCharset = 0;
    private int mCurATCmd = 0;
    private int mCurIndex = -1;
    int mDcsCharSet;
    private ArrayList<Integer> mIndexList = new ArrayList();
    private int mLength = 0;
    private BT_PB_SETLISTINFO_PARAM_T mListInfoParam = new BT_PB_SETLISTINFO_PARAM_T();
    private BT_SMS_REC_PARAM_T mOneSmsRec = new BT_SMS_REC_PARAM_T();
    private String mPDUContent = null;
    private int mPDULength = 0;
    private int mParsePath = 0;
    BT_SMS_PDU_PARAM_T mPdu = new BT_SMS_PDU_PARAM_T();
    private String mRespondString = null;
    private String mServiceCenter = null;
    private int mServicePhoneNoType = 145;
    private int[] mServiceSptType = new int[3];
    private int[] mSmsFormat;
    private List<BT_SMS_REC_PARAM_T> mSmsRecs = new ArrayList();
    private String[] mSmsStorage;
    private PBMGRSPTCHARSET_T m_sptCharset = new PBMGRSPTCHARSET_T();
    private BT_PB_SETLISTINFO_PARAM_T rGetCurPath = new BT_PB_SETLISTINFO_PARAM_T();

    public static class BT_PB_ADDREC_PARAM_T {
        public int iIndex;
        public int iTelType;
        public String sDate;
        public String sName;
        public String sNumber;
        public String sSndName;
        public String sTime;
    }

    public static class BT_PB_SETLISTINFO_PARAM_T {
        public int ePath;
        public int iMaxCnt;
        public int iMissCnt;
        public int iRecCnt;
        public int iStartIdx;
    }

    public static class BT_SMS_PDU_PARAM_T {
        public byte bDataCodingScheme;
        public byte bPDUType;
        public int iUserDataLength;
        public long lSCTimeStamp;
        public String sAddress;
        public String sUserData;
    }

    public static class BT_SMS_REC_PARAM_T {
        public int iIndex;
        public long lTimeMillis;
        public String sContent;
        public String sTelNum;
        public String sType;
    }

    public static class PBMGRSPTCHARSET_T {
        public int iCharSet;
        public int iSptCnt;
        public Map<Integer, String> mapCharSet = new HashMap();
    }

    public void setCurATCmd(int cmd) {
        this.mCurATCmd = cmd;
    }

    public int getCurATCmd() {
        return this.mCurATCmd;
    }

    public void setRespondString(String strRes) {
        this.mRespondString = strRes;
    }

    public String getRespondString() {
        return this.mRespondString;
    }

    public void setCurIndex(int iIndex) {
        this.mCurIndex = iIndex;
    }

    public boolean ParseCSCS() {
        this.mCharset = 0;
        if (15 == this.mCurATCmd) {
            if (this.mRespondString.indexOf("OK") >= 0) {
                return true;
            }
            return false;
        } else if (14 == this.mCurATCmd) {
            istart = this.mRespondString.indexOf("\"");
            if (istart < 0) {
                return false;
            }
            this.mCharset = convertCharSetStr2Int(this.mRespondString.substring(istart + 1, this.mRespondString.indexOf("\"", istart + 1)), null);
            return true;
        } else if (13 != this.mCurATCmd) {
            return false;
        } else {
            this.m_sptCharset.iSptCnt = 0;
            this.m_sptCharset.iCharSet = 0;
            this.m_sptCharset.mapCharSet.clear();
            String[] split = this.mRespondString.split(":|,");
            int i = 1;
            while (i < split.length) {
                istart = 0;
                while (istart < split[i].length() && ('\"' == split[i].charAt(istart) || ' ' == split[i].charAt(istart) || '(' == split[i].charAt(istart))) {
                    istart++;
                }
                int iend = istart;
                while (iend < split[i].length() && '\"' != split[i].charAt(iend) && ' ' != split[i].charAt(iend) && ')' != split[i].charAt(iend)) {
                    iend++;
                }
                String sCharset = split[i].substring(istart, iend);
                if (DEBUG) {
                    Log.d(TAG, "[CSCS] sub: " + sCharset);
                }
                PBMGRSPTCHARSET_T pbmgrsptcharset_t = this.m_sptCharset;
                pbmgrsptcharset_t.iCharSet |= convertCharSetStr2Int(sCharset, this.m_sptCharset.mapCharSet);
                i++;
            }
            this.m_sptCharset.iSptCnt = this.m_sptCharset.mapCharSet.size();
            if (!DEBUG) {
                return true;
            }
            Log.d(TAG, "[CSCS] support size = " + this.m_sptCharset.iSptCnt);
            return true;
        }
    }

    public int getCurCharSet() {
        return this.mCharset;
    }

    public PBMGRSPTCHARSET_T getSptCharSet() {
        return this.m_sptCharset;
    }

    public boolean parseATE0() {
        if (this.mRespondString.indexOf("OK") >= 0) {
            return true;
        }
        return false;
    }

    public String parseCGSN() {
        String imei = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        int istart = this.mRespondString.indexOf(":");
        if (istart == -1) {
            return BluetoothPbapClientPath.PBAP_ROOT_NAME;
        }
        int iend = this.mRespondString.indexOf("\r\n", istart + 1);
        if (iend == -1) {
            return BluetoothPbapClientPath.PBAP_ROOT_NAME;
        }
        return this.mRespondString.substring(istart + 1, iend);
    }

    public String parseCGMM() {
        String factory = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        if (this.mRespondString.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME) || this.mRespondString.equals("\r\n")) {
            return factory;
        }
        int istart = this.mRespondString.indexOf(":");
        int iend;
        if (istart >= 0) {
            iend = this.mRespondString.indexOf("\r", istart + 1);
            if (iend == -1) {
                iend = this.mRespondString.length();
            }
            factory = this.mRespondString.substring(istart + 1, iend);
        } else {
            if (this.mRespondString.substring(0, 2).equals("\r\n")) {
                this.mRespondString = this.mRespondString.substring(2);
                if (DEBUG) {
                    Log.d(TAG, "mRespondString = " + this.mRespondString);
                }
            }
            iend = this.mRespondString.indexOf("\r", 0);
            if (iend == -1) {
                iend = this.mRespondString.length();
            }
            factory = this.mRespondString.substring(0, iend);
        }
        return factory;
    }

    public String parseCGMI() {
        String serial = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        if (this.mRespondString.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME) || this.mRespondString.equals("\r\n")) {
            return serial;
        }
        int istart = this.mRespondString.indexOf(":");
        int iend;
        if (istart >= 0) {
            iend = this.mRespondString.indexOf("\r", istart + 1);
            if (iend == -1) {
                iend = this.mRespondString.length();
            }
            serial = this.mRespondString.substring(istart + 1, iend);
        } else {
            if (this.mRespondString.substring(0, 2).equals("\r\n")) {
                this.mRespondString = this.mRespondString.substring(2);
                if (DEBUG) {
                    Log.d(TAG, "mRespondString = " + this.mRespondString);
                }
            }
            iend = this.mRespondString.indexOf("\r", 0);
            if (iend == -1) {
                iend = this.mRespondString.length();
            }
            serial = this.mRespondString.substring(0, iend);
        }
        return serial;
    }

    public boolean parseCPBS() {
        int iend = -1;
        if (17 == this.mCurATCmd) {
            if (this.mRespondString.indexOf("OK") >= 0) {
                return true;
            }
            return false;
        } else if (this.mRespondString.indexOf("+CPBS") < 0) {
            return false;
        } else {
            int istart;
            if (19 == this.mCurATCmd) {
                this.rGetCurPath.iRecCnt = 0;
                this.rGetCurPath.iMaxCnt = 0;
                boolean bNoQuote = false;
                istart = this.mRespondString.indexOf("\"");
                if (istart < 0) {
                    istart = this.mRespondString.indexOf(":");
                    bNoQuote = true;
                    if (istart < 0) {
                        return false;
                    }
                }
                if (bNoQuote) {
                    iend = this.mRespondString.indexOf(",", istart + 1);
                    if (iend < 0) {
                        iend = this.mRespondString.length();
                    }
                } else {
                    iend = this.mRespondString.indexOf("\"", istart + 1);
                    if (iend < 0) {
                        return false;
                    }
                }
                this.mParsePath = convertPathStr2Int(this.mRespondString.substring(istart + 1, iend).trim());
                this.rGetCurPath.ePath = this.mParsePath;
                istart = this.mRespondString.indexOf(",");
                if (istart < 0) {
                    return true;
                }
                iend = this.mRespondString.indexOf(",", istart + 1);
                if (iend < 0) {
                    return true;
                }
                this.rGetCurPath.iRecCnt = Integer.parseInt(this.mRespondString.substring(istart + 1, iend).trim());
                istart = iend;
                iend = this.mRespondString.indexOf("\r", istart + 1);
                if (iend < 0) {
                    iend = this.mRespondString.length();
                }
                if (iend < 0) {
                    return true;
                }
                this.rGetCurPath.iMaxCnt = Integer.parseInt(this.mRespondString.substring(istart + 1, iend).trim());
                return true;
            }
            if (18 == this.mCurATCmd) {
                boolean fgFoundMT = false;
                while (true) {
                    istart = this.mRespondString.indexOf("\"", iend + 1);
                    if (istart < 0) {
                        break;
                    }
                    iend = this.mRespondString.indexOf("\"", istart + 1);
                    String mPath = this.mRespondString.substring(istart + 1, iend);
                    if (mPath.equals("MT")) {
                        fgFoundMT = true;
                    }
                    this.mParsePath |= convertPathStr2Int(mPath);
                }
                if (fgFoundMT) {
                    if ((this.mParsePath & 48) == 0) {
                        this.mParsePath |= 16;
                    } else if ((this.mParsePath & 16) == 0) {
                        this.mParsePath |= 16;
                        this.mParsePath &= -33;
                    } else if ((this.mParsePath & 32) == 0) {
                        this.mParsePath |= 16;
                    }
                }
                if (this.mParsePath != 0) {
                    return true;
                }
            }
            return false;
        }
    }

    public int getParsePath() {
        return this.mParsePath;
    }

    public BT_PB_SETLISTINFO_PARAM_T getCurPath() {
        if (DEBUG) {
            Log.i(TAG, "CPBS() current count=" + this.rGetCurPath.iRecCnt + ", max count=" + this.rGetCurPath.iMaxCnt);
        }
        return this.rGetCurPath;
    }

    public boolean parseCPBR() {
        int iend = -1;
        this.mListInfoParam.iStartIdx = 0;
        this.mListInfoParam.iMaxCnt = 0;
        this.mListInfoParam.iMissCnt = 0;
        this.mListInfoParam.iRecCnt = 0;
        int istart;
        String[] split;
        if (20 == this.mCurATCmd) {
            istart = this.mRespondString.indexOf("(");
            if (istart < 0) {
                return false;
            }
            iend = this.mRespondString.indexOf(")");
            if (iend < 0) {
                return false;
            }
            String sTmp = this.mRespondString.substring(istart + 1, iend);
            if (sTmp.indexOf("-") >= 0) {
                split = sTmp.split("-");
                this.mListInfoParam.iStartIdx = Integer.parseInt(split[0].trim());
                this.mListInfoParam.iMaxCnt = Integer.parseInt(split[1].trim());
            } else {
                this.mListInfoParam.iStartIdx = Integer.parseInt(sTmp.trim());
            }
            if (this.mListInfoParam.iMaxCnt == 0) {
                if (this.mListInfoParam.iStartIdx > 1) {
                    this.mListInfoParam.iMaxCnt = this.mListInfoParam.iStartIdx;
                    this.mListInfoParam.iStartIdx = 1;
                } else {
                    this.mListInfoParam.iStartIdx = 0;
                    this.mListInfoParam.iMaxCnt = 0;
                }
            } else if (this.mListInfoParam.iStartIdx >= this.mListInfoParam.iMaxCnt && this.mListInfoParam.iStartIdx == this.mListInfoParam.iMaxCnt && this.mListInfoParam.iStartIdx != 1) {
                this.mListInfoParam.iStartIdx = 0;
                this.mListInfoParam.iMaxCnt = 0;
            }
            return true;
        } else if (21 != this.mCurATCmd) {
            return false;
        } else {
            this.mAddRecs.clear();
            while (this.mRespondString.indexOf("+CPBR:", iend + 1) >= 0) {
                BT_PB_ADDREC_PARAM_T tmpRec = new BT_PB_ADDREC_PARAM_T();
                istart = this.mRespondString.indexOf("+CPBR:", iend + 1);
                if (istart < 0) {
                    return false;
                }
                iend = this.mRespondString.indexOf("\r", istart + 1);
                if (iend < 0) {
                    return false;
                }
                split = this.mRespondString.substring(istart + 6, iend).split(",");
                tmpRec.iIndex = Integer.parseInt(split[0].trim());
                if (split[1].indexOf("\"") >= 0) {
                    String[] numSplit = split[1].split("\"");
                    if (numSplit.length >= 2) {
                        tmpRec.sNumber = numSplit[1];
                    } else {
                        tmpRec.sNumber = BluetoothPbapClientPath.PBAP_ROOT_NAME;
                    }
                } else {
                    tmpRec.sNumber = split[1].trim();
                }
                if (tmpRec.sNumber.length() >= 3 && tmpRec.sNumber.substring(0, 3).equals("+86")) {
                    tmpRec.sNumber = tmpRec.sNumber.substring(3);
                }
                if (split.length < 4) {
                    tmpRec.sName = BluetoothPbapClientPath.PBAP_ROOT_NAME;
                } else if (split[3].indexOf("\"") >= 0) {
                    String[] nameSplit = split[3].split("\"");
                    if (nameSplit.length >= 2) {
                        tmpRec.sName = nameSplit[1];
                    } else {
                        tmpRec.sName = BluetoothPbapClientPath.PBAP_ROOT_NAME;
                    }
                } else {
                    tmpRec.sName = split[3].trim();
                }
                this.mAddRecs.add(tmpRec);
            }
            return true;
        }
    }

    public BT_PB_SETLISTINFO_PARAM_T getListInfo() {
        return this.mListInfoParam;
    }

    public List<BT_PB_ADDREC_PARAM_T> getRecs() {
        return this.mAddRecs;
    }

    private int convertPathStr2Int(String path) {
        if (path.equals("ME") || path.equals("PM")) {
            return 16;
        }
        if (path.equals("SM")) {
            return 32;
        }
        if (path.equals("DC")) {
            return 256;
        }
        if (path.equals("RC")) {
            return 64;
        }
        if (path.equals("MC")) {
            return 1024;
        }
        if (path.equals("LD")) {
        }
        return 0;
    }

    private int convertCharSetStr2Int(String charset, Map<Integer, String> mapCharset) {
        if (charset.equals("HEX") || charset.equals("hex")) {
            if (mapCharset != null) {
                mapCharset.put(Integer.valueOf(16), "HEX");
            }
            return 16;
        } else if (charset.equals("GSM") || charset.equals("gsm")) {
            if (mapCharset != null) {
                mapCharset.put(Integer.valueOf(4), "GSM");
            }
            return 4;
        } else if (charset.equals("IRA") || charset.equals("ira")) {
            if (mapCharset != null) {
                mapCharset.put(Integer.valueOf(8), "IRA");
            }
            return 8;
        } else if (charset.equals("UCS2") || charset.equals("ucs2") || charset.equals("0055004300530032")) {
            if (mapCharset == null) {
                return 2;
            }
            mapCharset.put(Integer.valueOf(2), "UCS2");
            return 2;
        } else if (charset.equals("PCCP") || charset.equals("pccp")) {
            if (mapCharset != null) {
                mapCharset.put(Integer.valueOf(32), "PCCP");
            }
            return 32;
        } else if (charset.equals("PCDN") || charset.equals("pcdn")) {
            if (mapCharset != null) {
                mapCharset.put(Integer.valueOf(64), "PCDN");
            }
            return 64;
        } else if (charset.equals("UTF8") || charset.equals("utf8")) {
            if (mapCharset != null) {
                mapCharset.put(Integer.valueOf(1), "UTF8");
            }
            return 1;
        } else if (charset.equals("UTF-8") || charset.equals("utf-8")) {
            if (mapCharset != null) {
                mapCharset.put(Integer.valueOf(1), "UTF-8");
            }
            return 1;
        } else if (charset.equals("ASCII") || charset.equals("ascii")) {
            if (mapCharset != null) {
                mapCharset.put(Integer.valueOf(512), "ASCII");
            }
            return 512;
        } else if (charset.equals("PCC437") || charset.equals("pcc437")) {
            if (mapCharset != null) {
                mapCharset.put(Integer.valueOf(128), "PCC437");
            }
            return 128;
        } else if (charset.equals("PCCP437") || charset.equals("pccp437")) {
            if (mapCharset != null) {
                mapCharset.put(Integer.valueOf(1024), "PCCP437");
            }
            return 1024;
        } else if (charset.equals("005500430053002D0032")) {
            if (mapCharset == null) {
                return 2;
            }
            mapCharset.put(Integer.valueOf(2), "UCS-2");
            return 2;
        } else if (charset.equals("005500430053005F0032")) {
            if (mapCharset == null) {
                return 2;
            }
            mapCharset.put(Integer.valueOf(2), "UCS_2");
            return 2;
        } else if (charset.equals("005500540046002D0038")) {
            if (mapCharset != null) {
                mapCharset.put(Integer.valueOf(1), "UTF-8");
            }
            return 1;
        } else if (!charset.equals("005500540046005F0038")) {
            return 0;
        } else {
            if (mapCharset != null) {
                mapCharset.put(Integer.valueOf(1), "UTF_8");
            }
            return 1;
        }
    }

    public static String DecodeCharset(int curCharset, String string) {
        switch (curCharset) {
            case 1:
                if (string == null) {
                    return BluetoothPbapClientPath.PBAP_ROOT_NAME;
                }
                if (!IsUTF8Plus(string)) {
                    return string;
                }
                if (DEBUG) {
                    Log.i(TAG, "PbSyncATParser IsUTF8Plus = true");
                }
                return DecodeUTF8Plus(string);
            case 2:
                return DecodeUCS2(string);
            case 4:
                return string;
            default:
                if (DEBUG) {
                    Log.e(TAG, "not support");
                }
                return BluetoothPbapClientPath.PBAP_ROOT_NAME;
        }
    }

    private static String DecodeUCS2(String src) {
        if (src == null || src.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME) || src.length() % 2 != 0) {
            return BluetoothPbapClientPath.PBAP_ROOT_NAME;
        }
        byte[] bytes = new byte[(src.length() / 2)];
        for (int i = 0; i < src.length(); i += 2) {
            bytes[i / 2] = (byte) Integer.parseInt(src.substring(i, i + 2), 16);
        }
        String reValue = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        try {
            return new String(bytes, "UTF-16BE");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return reValue;
        }
    }

    public static boolean IsUTF8Plus(String str) {
        boolean bUTF8Plus = false;
        if (str == null || str.length() == 0) {
            return false;
        }
        try {
            byte[] bytes = str.getBytes("US-ASCII");
            int u4Idx = 0;
            while (u4Idx < bytes.length && (bytes.length <= 2 || u4Idx >= bytes.length - 2 || (byte) 69 != bytes[u4Idx] || (((byte) 55 >= bytes[u4Idx + 2] || bytes[u4Idx + 2] > (byte) 57) && ((byte) 65 > bytes[u4Idx + 2] || bytes[u4Idx + 2] > (byte) 70)))) {
                u4Idx++;
            }
            if (u4Idx + 2 < bytes.length) {
                bUTF8Plus = true;
            } else if (str.length() % 2 != 0) {
                return false;
            } else {
                u4Idx = 0;
                while (u4Idx < bytes.length) {
                    char tmpChar1 = str.charAt(u4Idx);
                    char tmpChar2 = str.charAt(u4Idx + 1);
                    if (tmpChar1 < '0' || tmpChar1 >= '8' || ((tmpChar2 < '0' || tmpChar2 > '9') && ((tmpChar2 < 'A' || tmpChar2 > 'F') && (tmpChar2 < 'a' || tmpChar2 > 'f')))) {
                        break;
                    }
                    u4Idx += 2;
                }
                if (u4Idx == bytes.length) {
                    bUTF8Plus = u4Idx >= 3;
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return bUTF8Plus;
    }

    public static String DecodeUTF8Plus(String str) {
        ArrayIndexOutOfBoundsException e;
        if (str == null) {
            return BluetoothPbapClientPath.PBAP_ROOT_NAME;
        }
        String decodedUTF8 = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        boolean bNonUTF = false;
        try {
            byte[] bytes = str.getBytes("US-ASCII");
            if (bytes == null) {
                return BluetoothPbapClientPath.PBAP_ROOT_NAME;
            }
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            int i = 0;
            while (i < bytes.length) {
                int i2 = i + 1;
                try {
                    int u = Character.digit((char) bytes[i], 16);
                    i = i2 + 1;
                    try {
                        int l = Character.digit((char) bytes[i2], 16);
                        if (u == -1 || l == -1) {
                            bNonUTF = true;
                            i2 = i;
                            break;
                        }
                        buffer.write((char) ((u << 4) + l));
                    } catch (ArrayIndexOutOfBoundsException e2) {
                        e = e2;
                        i2 = i;
                    }
                } catch (ArrayIndexOutOfBoundsException e3) {
                    e = e3;
                }
            }
            if (bNonUTF) {
                decodedUTF8 = str;
            } else {
                decodedUTF8 = new String(buffer.toByteArray(), "UTF-8");
            }
            return decodedUTF8;
        } catch (Exception e4) {
            e4.printStackTrace();
            return str;
        }
        e.printStackTrace();
        return str;
    }

    public boolean ParseCSMS() {
        if (24 == this.mCurATCmd) {
            String[] split = this.mRespondString.split(",");
            for (int i = 2; i < split.length; i++) {
                this.mServiceSptType[i - 2] = Integer.parseInt(split[i]);
            }
        }
        return true;
    }

    public boolean ParserCSCA() {
        if (24 == this.mCurATCmd) {
            int istart = this.mRespondString.indexOf("\"");
            if (istart < 0) {
                return false;
            }
            this.mServiceCenter = this.mRespondString.substring(istart + 1, this.mRespondString.indexOf("\"", istart + 1));
            istart = this.mRespondString.indexOf(",");
            if (istart < 0) {
                return false;
            }
            this.mServicePhoneNoType = Integer.parseInt(this.mRespondString.substring(istart, istart + 3));
        }
        return true;
    }

    public boolean ParseCMGF() {
        this.mSmsFormat = new int[2];
        if (26 == this.mCurATCmd) {
            int istart = this.mRespondString.indexOf("(");
            if (istart < 0) {
                return false;
            }
            int iend = this.mRespondString.indexOf(",");
            this.mSmsFormat[0] = Integer.parseInt(this.mRespondString.substring(istart + 1, iend));
            istart = iend;
            this.mSmsFormat[1] = Integer.parseInt(this.mRespondString.substring(istart + 1, this.mRespondString.indexOf(")")));
        }
        if (27 != this.mCurATCmd) {
            return true;
        }
        if (this.mRespondString.indexOf("OK") >= 0) {
            return true;
        }
        return false;
    }

    public boolean parseCPMS() {
        int istart;
        int iend;
        String[] split;
        int i;
        int icolumn;
        this.mSmsStorage = new String[3];
        if (29 == this.mCurATCmd) {
            istart = this.mRespondString.indexOf("(");
            if (istart < 0) {
                return false;
            }
            iend = this.mRespondString.indexOf(")");
            this.mSmsStorage[0] = this.mRespondString.substring(istart + 1, iend);
            istart = this.mRespondString.indexOf("(", iend + 1);
            if (istart < 0) {
                return false;
            }
            iend = this.mRespondString.indexOf(")");
            this.mSmsStorage[1] = this.mRespondString.substring(istart + 1, iend);
            istart = this.mRespondString.indexOf("(", iend + 1);
            if (istart < 0) {
                return false;
            }
            this.mSmsStorage[2] = this.mRespondString.substring(istart + 1, this.mRespondString.indexOf(")"));
        }
        if (30 == this.mCurATCmd || 32 == this.mCurATCmd) {
            split = this.mRespondString.split(",");
            i = 0;
            while (i < split.length) {
                if (i == 0) {
                    istart = this.mRespondString.indexOf(":");
                    if (istart < 0) {
                        return false;
                    }
                    istart++;
                } else {
                    istart = 0;
                }
                while (istart < split[i].length() && (' ' == split[i].charAt(istart) || '(' == split[i].charAt(istart))) {
                    istart++;
                }
                iend = istart + 1;
                while (iend < split[i].length() && '[' != split[i].charAt(iend) && ' ' != split[i].charAt(iend) && ')' != split[i].charAt(iend)) {
                    iend++;
                }
                int irow = i / 3;
                icolumn = i % 3;
                if (istart != split[i].length()) {
                    this.mBtSmsStorageListRecCnt[irow][icolumn] = split[i].substring(istart, iend);
                    if (DEBUG) {
                        Log.d(TAG, "Array[" + irow + "][" + icolumn + "] = " + this.mBtSmsStorageListRecCnt[irow][icolumn]);
                    }
                    i++;
                } else if (!DEBUG) {
                    return false;
                } else {
                    Log.d(TAG, "not parse CPMS");
                    return false;
                }
            }
        }
        if (31 == this.mCurATCmd) {
            split = this.mRespondString.split(",");
            i = 1;
            while (i < split.length) {
                istart = 0;
                while (istart < split[i].length() && (' ' == split[i].charAt(istart) || '(' == split[i].charAt(istart))) {
                    istart++;
                }
                iend = istart;
                while (iend < split[i].length() && '[' != split[i].charAt(iend) && ' ' != split[i].charAt(iend) && ')' != split[i].charAt(iend)) {
                    iend++;
                }
                icolumn = (i - 1) % 2;
                this.mBtSmsStorageRecCnt[(i - 1) / 3][icolumn] = Integer.parseInt(split[i].substring(istart + 1, iend));
                i++;
            }
        }
        return true;
    }

    public boolean ParseCNMI() {
        if (25 != this.mCurATCmd) {
            return true;
        }
        if (DEBUG) {
            Log.d(TAG, "respondString is:" + this.mRespondString);
        }
        if (this.mRespondString.indexOf("OK") >= 0) {
            return true;
        }
        return false;
    }

    public boolean ParseCMGL() {
        int istart;
        int iend = -1;
        Boolean result = Boolean.valueOf(true);
        if (35 == this.mCurATCmd) {
            String[] split = this.mRespondString.split(",");
            int i = 1;
            while (i < split.length) {
                istart = 0;
                while (istart < split[i].length() && (' ' == split[i].charAt(istart) || '(' == split[i].charAt(istart))) {
                    istart++;
                }
                iend = istart;
                while (iend < split[i].length() && '[' != split[i].charAt(iend) && ' ' != split[i].charAt(iend) && ')' != split[i].charAt(iend)) {
                    iend++;
                }
                String mTypeStr = split[i].substring(istart, iend);
                if (mTypeStr.equals("REC UNREAD") || mTypeStr.equals("0")) {
                    this.mBTSmsRecType[0] = 1;
                } else if (mTypeStr.equals("REC READ") || mTypeStr.equals("1")) {
                    this.mBTSmsRecType[1] = 1;
                } else if (mTypeStr.equals("STO UNSENT") || mTypeStr.equals("2")) {
                    this.mBTSmsRecType[2] = 1;
                } else if (mTypeStr.equals("STO SENT") || mTypeStr.equals("3")) {
                    this.mBTSmsRecType[3] = 1;
                } else if (mTypeStr.equals("ALL") || mTypeStr.equals("4")) {
                    this.mBTSmsRecType[4] = 1;
                } else if (!DEBUG) {
                    return false;
                } else {
                    Log.d(TAG, "Not support type");
                    return false;
                }
                i++;
            }
        }
        if (34 == this.mCurATCmd) {
            if (DEBUG) {
                Log.d(TAG, "respondString is:" + this.mRespondString);
            }
            this.mSmsRecs.clear();
            while (this.mRespondString.indexOf("+CMGL:", iend + 1) >= 0) {
                BT_SMS_REC_PARAM_T temSmsRec = new BT_SMS_REC_PARAM_T();
                istart = this.mRespondString.indexOf(":", iend + 1);
                iend = this.mRespondString.indexOf(",", istart + 1);
                if (DEBUG) {
                    Log.d(TAG, "istart value is:" + istart + " and iend value is:" + iend);
                }
                temSmsRec.iIndex = Integer.parseInt(this.mRespondString.substring(istart + 1, iend).trim());
                if (DEBUG) {
                    Log.d(TAG, "Record Index is:" + temSmsRec.iIndex);
                }
                istart = iend;
                iend = this.mRespondString.indexOf(",", istart + 1);
                if (DEBUG) {
                    Log.d(TAG, "istart value is:" + istart + " and iend value is:" + iend);
                }
                temSmsRec.sType = this.mRespondString.substring(istart + 1, iend).trim();
                int iType = Integer.parseInt(temSmsRec.sType);
                if (DEBUG) {
                    Log.d(TAG, "Record type is:" + temSmsRec.sType);
                }
                istart = this.mRespondString.indexOf(",", iend + 1);
                iend = this.mRespondString.indexOf("\r\n", istart + 1);
                if (DEBUG) {
                    Log.d(TAG, "istart value is:" + istart + " and iend value is:" + iend);
                }
                this.mPDULength = Integer.parseInt(this.mRespondString.substring(istart + 1, iend).trim());
                if (DEBUG) {
                    Log.d(TAG, "Pdu length is:" + this.mPDULength);
                }
                istart = iend;
                iend = this.mRespondString.indexOf("\r\n", iend + 1);
                if (DEBUG) {
                    Log.d(TAG, "istart value is:" + istart + " and iend value is:" + iend);
                }
                this.mPDUContent = this.mRespondString.substring(istart + 1, iend).trim();
                if (DEBUG) {
                    Log.d(TAG, "Pdu content is:" + this.mPDUContent);
                }
                boolean ret = decodePdu(this.mPDUContent, iType);
                if (DEBUG) {
                    Log.d(TAG, "decode pdu is:" + ret);
                }
                if (ret) {
                    temSmsRec.sTelNum = this.mPdu.sAddress;
                    if (DEBUG) {
                        Log.d(TAG, "temSmsRec.sTelNum is: " + temSmsRec.sTelNum);
                    }
                    temSmsRec.lTimeMillis = this.mPdu.lSCTimeStamp;
                    temSmsRec.sContent = this.mPdu.sUserData;
                    this.mSmsRecs.add(temSmsRec);
                } else {
                    if (DEBUG) {
                        Log.d(TAG, "decode pdu fail!");
                    }
                    result = Boolean.valueOf(false);
                }
            }
            if (this.mRespondString.indexOf("ERROR") >= 0) {
                if (DEBUG) {
                    Log.d(TAG, "abort,don't support this command");
                }
                result = Boolean.valueOf(false);
            } else if (DEBUG) {
                Log.d(TAG, "SMS record list over");
            }
        }
        return result.booleanValue();
    }

    public boolean ParseMMGL() {
        int iend = -1;
        this.mIndexList.clear();
        if (33 == this.mCurATCmd) {
            if (DEBUG) {
                Log.d(TAG, "respondString is:" + this.mRespondString);
            }
            while (this.mRespondString.indexOf("+MMGL", iend + 1) >= 0) {
                int istart = this.mRespondString.indexOf(":", iend + 1);
                iend = this.mRespondString.indexOf(",", istart + 1);
                if (DEBUG) {
                    Log.d(TAG, "istart value is:" + istart + " and iend value is:" + iend);
                }
                this.mIndexList.add(Integer.valueOf(Integer.parseInt(this.mRespondString.substring(istart + 1, iend).trim())));
            }
            if (this.mRespondString.indexOf("ERROR", iend + 1) >= 0) {
                if (this.mIndexList.size() <= 0) {
                    if (DEBUG) {
                        Log.d(TAG, "response is ERROR");
                    }
                    return false;
                }
            } else if (DEBUG) {
                Log.d(TAG, "SMS index list over");
            }
        }
        return true;
    }

    public boolean ParseCMGR() {
        if (DEBUG) {
            Log.d(TAG, "respondString is:" + this.mRespondString);
        }
        if (36 == this.mCurATCmd) {
            if (this.mRespondString.indexOf("+CMGR") >= 0) {
                BT_SMS_REC_PARAM_T temSmsRec = new BT_SMS_REC_PARAM_T();
                temSmsRec.iIndex = this.mCurIndex;
                if (DEBUG) {
                    Log.d(TAG, "index is: " + temSmsRec.iIndex);
                }
                int istart = this.mRespondString.indexOf(":", 0);
                int iend = this.mRespondString.indexOf(",", istart + 1);
                if (istart >= 0 && iend >= 0) {
                    if (DEBUG) {
                        Log.d(TAG, "istart value is:" + istart + " and iend value is:" + iend);
                    }
                    String sType = this.mRespondString.substring(istart + 1, iend).trim();
                    if (isInteger(sType)) {
                        temSmsRec.sType = sType;
                        int iType = Integer.parseInt(temSmsRec.sType);
                        if (DEBUG) {
                            Log.d(TAG, "Record type is:" + temSmsRec.sType);
                        }
                        istart = this.mRespondString.indexOf(",", iend + 1);
                        iend = this.mRespondString.indexOf("\r\n", istart + 1);
                        if (istart >= 0 && iend >= 0) {
                            if (DEBUG) {
                                Log.d(TAG, "istart value is:" + istart + " and iend value is:" + iend);
                            }
                            this.mPDULength = Integer.parseInt(this.mRespondString.substring(istart + 1, iend).trim());
                            if (DEBUG) {
                                Log.d(TAG, "Pdu length is:" + this.mPDULength);
                            }
                            istart = iend;
                            iend = this.mRespondString.indexOf("\r\n", iend + 1);
                            this.mLength = iend - istart;
                            if (DEBUG) {
                                Log.d(TAG, "istart value is:" + istart + " and iend value is:" + iend);
                            }
                            if (iend >= 0) {
                                this.mPDUContent = this.mRespondString.substring(istart + 1, iend).trim();
                                if (DEBUG) {
                                    Log.d(TAG, "Pdu content is:" + this.mPDUContent);
                                }
                                boolean ret = decodePdu(this.mPDUContent, iType);
                                if (DEBUG) {
                                    Log.d(TAG, "decode pdu is:" + ret);
                                }
                                if (ret) {
                                    temSmsRec.sTelNum = this.mPdu.sAddress;
                                    if (DEBUG) {
                                        Log.d(TAG, "temSmsRec.sTelNum is: " + temSmsRec.sTelNum);
                                    }
                                    temSmsRec.lTimeMillis = this.mPdu.lSCTimeStamp;
                                    temSmsRec.sContent = this.mPdu.sUserData;
                                    this.mOneSmsRec = temSmsRec;
                                } else if (!DEBUG) {
                                    return false;
                                } else {
                                    Log.d(TAG, "decode pdu fail!");
                                    return false;
                                }
                            } else if (!DEBUG) {
                                return false;
                            } else {
                                Log.e(TAG, "Respond format error, no PDU content");
                                return false;
                            }
                        } else if (!DEBUG) {
                            return false;
                        } else {
                            Log.e(TAG, "Respond format error, no PDU Length");
                            return false;
                        }
                    }
                    temSmsRec.sType = checkSmsType(sType);
                    if (DEBUG) {
                        Log.i(TAG, "Not PDU format,Text mode,SMS Type : " + temSmsRec.sType);
                    }
                    if (sType.equals("REC UNREAD") || sType.equals("REC READ")) {
                        istart = iend;
                        iend = this.mRespondString.indexOf(",", istart + 1);
                        if (iend < 0) {
                            return false;
                        }
                        temSmsRec.sTelNum = this.mRespondString.substring(istart + 2, iend - 1).trim();
                        istart = this.mRespondString.indexOf(",", iend + 2);
                        iend = this.mRespondString.indexOf("\r\n", istart + 1);
                        if (istart >= 0 && iend >= 0) {
                            temSmsRec.lTimeMillis = getTextSCTimestampMillis(this.mRespondString.substring(istart + 1, iend).trim());
                            istart = iend;
                            iend = this.mRespondString.indexOf("\r\n", istart + 1);
                            if (iend < 0) {
                                return false;
                            }
                            temSmsRec.sContent = this.mRespondString.substring(istart + 1, iend);
                        } else if (!DEBUG) {
                            return false;
                        } else {
                            Log.e(TAG, "Respond format error, no correct date type");
                            return false;
                        }
                    }
                    istart = iend;
                    iend = this.mRespondString.indexOf(",", istart + 1);
                    if (iend < 0) {
                        return false;
                    }
                    temSmsRec.sTelNum = this.mRespondString.substring(istart + 2, iend - 1).trim();
                    istart = iend;
                    iend = this.mRespondString.indexOf("\r\n", istart + 1);
                    if (iend < 0) {
                        return false;
                    }
                    temSmsRec.sContent = this.mRespondString.substring(istart + 1, iend);
                    this.mOneSmsRec = temSmsRec;
                    return true;
                } else if (!DEBUG) {
                    return false;
                } else {
                    Log.e(TAG, "Respond format error, no correct type");
                    return false;
                }
            }
            if (DEBUG) {
                Log.d(TAG, "respondString is:" + this.mRespondString);
            }
            if (!DEBUG) {
                return false;
            }
            Log.e(TAG, "Respond format error!");
            return false;
        }
        return true;
    }

    public List<BT_SMS_REC_PARAM_T> getSmsRecsList() {
        return this.mSmsRecs;
    }

    public ArrayList<Integer> getSmsIndexList() {
        return this.mIndexList;
    }

    public BT_SMS_REC_PARAM_T getOneSmsRec() {
        return this.mOneSmsRec;
    }

    public int getSmsCount() {
        if (isInteger(this.mBtSmsStorageListRecCnt[0][1])) {
            return Integer.parseInt(this.mBtSmsStorageListRecCnt[0][1]);
        }
        if (!DEBUG) {
            return -1;
        }
        Log.d(TAG, "error format" + this.mBtSmsStorageListRecCnt[0][1]);
        return -1;
    }

    public boolean decodePdu(String pdu, int type) {
        this.cur = 0;
        getSCAddress(pdu);
        this.cur = (this.iSCLen + 1) * 2;
        if (DEBUG) {
            Log.d(TAG, "cur =" + this.cur);
        }
        getPduType(pdu);
        if (type == 1 || type == 0) {
            getAddress(pdu);
            getDataCodingScheme(pdu);
            String sSCTimeStamp = pdu.substring(this.cur, this.cur + 14);
            this.cur += 14;
            byte[] bSCTimeStamp = IccUtils.hexStringToBytes(sSCTimeStamp);
            this.mPdu.lSCTimeStamp = getSCTimestampMillis(bSCTimeStamp);
            getUserData(pdu);
        } else if (type == 2 || type == 3) {
            this.cur += 2;
            getAddress(pdu);
            getDataCodingScheme(pdu);
            this.mPdu.lSCTimeStamp = 0;
            this.cur += 2;
            getUserData(pdu);
        } else if (!DEBUG) {
            return false;
        } else {
            Log.d(TAG, "Unsupport SMS type");
            return false;
        }
        return true;
    }

    void getSCAddress(String pdu) {
        int i = this.cur;
        this.cur = i + 1;
        int i2 = this.cur + 1;
        this.cur = i2;
        String sAddrLen = pdu.substring(i, i2).trim();
        if (isInteger(sAddrLen)) {
            this.iSCLen = Integer.parseInt(sAddrLen);
            if (DEBUG) {
                Log.d(TAG, "SC length is:" + this.iSCLen);
            }
        }
    }

    void getPduType(String pdu) {
        int i = this.cur;
        this.cur = i + 1;
        int i2 = this.cur + 1;
        this.cur = i2;
        String sPduType = pdu.substring(i, i2);
        if (DEBUG) {
            Log.d(TAG, "sPduType is:" + sPduType);
        }
        this.mPdu.bPDUType = IccUtils.hexStringToBytes(sPduType)[0];
        if (DEBUG) {
            Log.d(TAG, "pdu type is:" + this.mPdu.bPDUType);
        }
        if ((this.mPdu.bPDUType & 64) == 64) {
            this.bUDHI = true;
        } else {
            this.bUDHI = false;
        }
    }

    void getAddress(String pdu) {
        StringBuilder sb = new StringBuilder();
        int cnt = 0;
        int i = this.cur;
        this.cur = i + 1;
        int i2 = this.cur + 1;
        this.cur = i2;
        String sAddrLen = pdu.substring(i, i2);
        if (DEBUG) {
            Log.d(TAG, "sAddrLen is:" + sAddrLen);
        }
        int mAddrLen = IccUtils.hexStringToBytes(sAddrLen)[0] & HDMI.RCP_KEY_INVAILD;
        if (DEBUG) {
            Log.d(TAG, "mAddrLen is:" + mAddrLen);
        }
        if (mAddrLen == 0) {
            this.cur += 2;
            this.mPdu.sAddress = "00000";
            return;
        }
        int i3 = mAddrLen % 2;
        byte[] bAddress = IccUtils.hexStringToBytes(pdu.substring(this.cur, ((this.cur + 2) + mAddrLen) + i3));
        this.cur = ((this.cur + 2) + mAddrLen) + i3;
        int iLengthBytes = ((mAddrLen + i3) / 2) + 1;
        for (int num = 1; num < iLengthBytes; num++) {
            int alpha = bAddress[num] & 15;
            if (alpha < 10) {
                sb.append((char) (alpha + 48));
            } else {
                sb.append((char) ((alpha - 10) + 65));
            }
            cnt++;
            if (cnt < mAddrLen) {
                alpha = (bAddress[num] >> 4) & 15;
                if (alpha < 10) {
                    sb.append((char) (alpha + 48));
                } else {
                    sb.append((char) ((alpha - 10) + 65));
                }
                cnt++;
            }
        }
        this.mPdu.sAddress = sb.toString();
        if (DEBUG) {
            Log.d(TAG, "Addr is:" + this.mPdu.sAddress);
        }
    }

    void getDataCodingScheme(String pdu) {
        String mDcs = pdu.substring(this.cur + 2, this.cur + 4);
        this.cur += 4;
        if (DEBUG) {
            Log.d(TAG, "mDcs is:" + mDcs);
        }
        this.mPdu.bDataCodingScheme = IccUtils.hexStringToBytes(mDcs)[0];
        if (DEBUG) {
            Log.d(TAG, "mDcs to bytes is:" + this.mPdu.bDataCodingScheme);
        }
        if (this.mPdu.bDataCodingScheme > (byte) 0) {
            if ((this.mPdu.bDataCodingScheme ^ 246) == 0) {
                this.mDcsCharSet = 1;
            } else {
                this.mDcsCharSet = 2;
            }
        } else if (this.mPdu.bDataCodingScheme == (byte) 0) {
            this.mDcsCharSet = 4;
        } else {
            if (DEBUG) {
                Log.d(TAG, "Unsupport Charset Type!");
            }
            this.mDcsCharSet = 0;
        }
    }

    void getUserData(String pdu) {
        int i = this.cur;
        this.cur = i + 1;
        int i2 = this.cur + 1;
        this.cur = i2;
        String sUserDataLength = pdu.substring(i, i2);
        if (DEBUG) {
            Log.d(TAG, "sUserDataLength is:" + sUserDataLength);
        }
        this.mPdu.iUserDataLength = IccUtils.hexStringToBytes(sUserDataLength)[0] & HDMI.RCP_KEY_INVAILD;
        if (DEBUG) {
            Log.d(TAG, "User Data Length is:" + this.mPdu.iUserDataLength);
        }
        String mUserData;
        if (this.mDcsCharSet == 2) {
            if (this.bUDHI) {
                String sUDHLen = pdu.substring(this.cur, this.cur + 2);
                if (DEBUG) {
                    Log.d(TAG, "sUDHL is:" + sUDHLen);
                }
                int iUDHLen = IccUtils.hexStringToBytes(sUDHLen)[0] & HDMI.RCP_KEY_INVAILD;
                if (DEBUG) {
                    Log.d(TAG, "iUDHLen is:" + iUDHLen);
                }
                mUserData = pdu.substring((this.cur + 2) + (iUDHLen * 2), this.cur + (this.mPdu.iUserDataLength * 2));
            } else {
                int istart = this.cur;
                int iend = this.mLength - 2;
                if (DEBUG) {
                    Log.d(TAG, "istart value is:" + istart + " and iend value is:" + iend);
                }
                mUserData = pdu.substring(istart, iend);
            }
            this.mPdu.sUserData = DecodeCharset(this.mDcsCharSet, mUserData);
        } else if (this.mDcsCharSet == 4) {
            mUserData = pdu.substring(this.cur, ((this.iSCLen + 1) + this.mPDULength) * 2);
            this.mPdu.sUserData = decodeGSMCharset(mUserData, this.mPdu.iUserDataLength);
        } else {
            if (DEBUG) {
                Log.d(TAG, "Unsupport charset!");
            }
            this.mPdu.sUserData = "Cann't parse chareset!";
        }
    }

    String decodeGSMCharset(String sUserData, int iUserDataLength) {
        int a0 = 0;
        int mUdl = iUserDataLength;
        StringBuilder sb = new StringBuilder();
        int i = mUdl * 7;
        mUdl = i / 8;
        if (i % 8 != 0) {
            mUdl++;
        }
        byte[] bArr = new byte[mUdl];
        bArr = IccUtils.hexStringToBytes(sUserData);
        for (int j = 0; j < mUdl; j++) {
            i = j % 7;
            int a1 = bArr[j] & HDMI.RCP_KEY_INVAILD;
            sb.append((char) (((a1 << i) & MultiMediaConstant.ZOOM_INFO) | a0));
            if (6 != i) {
                a0 = (a1 >> (7 - i)) & MultiMediaConstant.ZOOM_INFO;
            } else {
                sb.append((char) ((a1 >> 1) & MultiMediaConstant.ZOOM_INFO));
                a0 = 0;
            }
        }
        return sb.toString();
    }

    long getSCTimestampMillis(byte[] pdu) {
        int cur = 0 + 1;
        int year = IccUtils.gsmBcdByteToInt(pdu[0]);
        int cur2 = cur + 1;
        int month = IccUtils.gsmBcdByteToInt(pdu[cur]);
        cur = cur2 + 1;
        int day = IccUtils.gsmBcdByteToInt(pdu[cur2]);
        cur2 = cur + 1;
        int hour = IccUtils.gsmBcdByteToInt(pdu[cur]);
        cur = cur2 + 1;
        int minute = IccUtils.gsmBcdByteToInt(pdu[cur2]);
        cur2 = cur + 1;
        int second = IccUtils.gsmBcdByteToInt(pdu[cur]);
        cur = cur2 + 1;
        byte tzByte = pdu[cur2];
        int timezoneOffset = IccUtils.gsmBcdByteToInt((byte) (tzByte & -9));
        if ((tzByte & 8) != 0) {
            timezoneOffset = -timezoneOffset;
        }
        Time time = new Time("UTC");
        time.year = year >= 90 ? year + 1900 : year + 2000;
        time.month = month - 1;
        time.monthDay = day;
        time.hour = hour;
        time.minute = minute;
        time.second = second;
        return time.toMillis(true);
    }

    long getTextSCTimestampMillis(String date) {
        int cur = 1 + 1;
        int cur2 = cur + 1;
        int year = Integer.parseInt(date.substring(cur, cur2));
        cur = cur2 + 1;
        int month = Integer.parseInt(date.substring(5, cur));
        cur++;
        int day = Integer.parseInt(date.substring(6, cur));
        cur++;
        int hour = Integer.parseInt(date.substring(7, cur));
        cur++;
        int minute = Integer.parseInt(date.substring(8, cur));
        int second = Integer.parseInt(date.substring(9, cur + 1));
        Time time = new Time("UTC");
        time.year = year >= 90 ? year + 1900 : year + 2000;
        time.month = month - 1;
        time.monthDay = day;
        time.hour = hour;
        time.minute = minute;
        time.second = second;
        return time.toMillis(true);
    }

    public String getFormatDate(long timeMillis) {
        StringBuffer dateBf = new StringBuffer();
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(timeMillis);
        dateBf.append(cal.get(1) + "-");
        int month = cal.get(2) + 1;
        if (month <= 9) {
            dateBf.append("0").append(month + "-");
        } else {
            dateBf.append(month + "-");
        }
        int day_of_month = cal.get(5);
        if (day_of_month <= 9) {
            dateBf.append("0").append(day_of_month + " ");
        } else {
            dateBf.append(day_of_month + " ");
        }
        int hour = cal.get(11);
        if (hour <= 9) {
            dateBf.append("0").append(hour + ":");
        } else {
            dateBf.append(hour + ":");
        }
        int minute = cal.get(12);
        if (minute <= 9) {
            dateBf.append("0").append(minute + ":");
        } else {
            dateBf.append(minute + ":");
        }
        int second = cal.get(13);
        if (second <= 9) {
            dateBf.append("0").append(second);
        } else {
            dateBf.append(second);
        }
        return dateBf.toString();
    }

    public boolean isInteger(String str) {
        try {
            Integer.parseInt(str);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    String checkSmsType(String type) {
        if (type.equals("REC UNREAD")) {
            return "0";
        }
        if (type.equals("REC READ")) {
            return "1";
        }
        if (type.equals("STO UNSENT")) {
            return "2";
        }
        if (type.equals("STO SENT")) {
            return "3";
        }
        if (type.equals("ALL")) {
            return "4";
        }
        return null;
    }
}
