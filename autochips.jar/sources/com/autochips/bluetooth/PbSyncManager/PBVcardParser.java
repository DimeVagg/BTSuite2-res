package com.autochips.bluetooth.PbSyncManager;

import android.content.Context;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public class PBVcardParser {
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugPB);
    private static final int QUOTEDPRINTABLE = 1;
    private static final String TAG = "PBVcardParser";
    private static final String mBeginVcard = "BEGIN:VCARD";
    private static final String mEncoding = "ENCODING";
    private static final String mEndVcard = "END:VCARD";
    private static final String mName = "N";
    private static final String mQuotedPrintable = "QUOTED-PRINTABLE";
    private static final String mTel = "TEL";
    private static final String mTimestamp = "X-IRMC-CALL-DATETIME";
    private String mAdditional = null;
    private String mCallTime = null;
    private final Context mContext;
    private String mFamily = null;
    private String mGiven = null;
    private String mParseName = null;
    private String mPrefix = null;
    private String mSuffix = null;
    private List<String> mTelNum = new ArrayList();

    PBVcardParser(Context context) {
        this.mContext = context;
    }

    public static String UTF8_Decoding(String str) {
        if (str == null) {
            return BluetoothPbapClientPath.PBAP_ROOT_NAME;
        }
        try {
            int i;
            byte[] bytes = str.replace("=\n", BluetoothPbapClientPath.PBAP_ROOT_NAME).replace("==", "=").getBytes("US-ASCII");
            for (i = 0; i < bytes.length; i++) {
                byte b = bytes[i];
                if (b != (byte) 95) {
                    bytes[i] = b;
                } else {
                    bytes[i] = (byte) 32;
                }
            }
            if (bytes == null) {
                return BluetoothPbapClientPath.PBAP_ROOT_NAME;
            }
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            i = 0;
            while (i < bytes.length) {
                int b2 = bytes[i];
                if (b2 == 61) {
                    i++;
                    try {
                        int u = Character.digit((char) bytes[i], 16);
                        i++;
                        int l = Character.digit((char) bytes[i], 16);
                        if (!(u == -1 || l == -1)) {
                            buffer.write((char) ((u << 4) + l));
                        }
                    } catch (ArrayIndexOutOfBoundsException e) {
                        e.printStackTrace();
                    }
                } else {
                    buffer.write(b2);
                }
                i++;
            }
            return new String(buffer.toByteArray(), "UTF-8");
        } catch (Exception e2) {
            e2.printStackTrace();
            return BluetoothPbapClientPath.PBAP_ROOT_NAME;
        }
    }

    public static String UTF8_DecodingWithoutQuoted(String str) {
        ArrayIndexOutOfBoundsException e;
        if (str == null) {
            return BluetoothPbapClientPath.PBAP_ROOT_NAME;
        }
        try {
            int i;
            byte[] bytes = str.replaceAll("=\n", BluetoothPbapClientPath.PBAP_ROOT_NAME).getBytes("US-ASCII");
            for (i = 0; i < bytes.length; i++) {
                byte b = bytes[i];
                if (b != (byte) 95) {
                    bytes[i] = b;
                } else {
                    bytes[i] = (byte) 32;
                }
            }
            if (bytes == null) {
                return BluetoothPbapClientPath.PBAP_ROOT_NAME;
            }
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            int i2 = 0;
            while (i2 < bytes.length) {
                int b2 = bytes[i2];
                i = i2 + 1;
                try {
                    int u = Character.digit((char) bytes[i2], 16);
                    i2 = i + 1;
                    try {
                        int l = Character.digit((char) bytes[i], 16);
                        if (!(u == -1 || l == -1)) {
                            buffer.write((char) ((u << 4) + l));
                            i = i2;
                            i2 = i;
                        }
                    } catch (ArrayIndexOutOfBoundsException e2) {
                        e = e2;
                        i = i2;
                        e.printStackTrace();
                        i2 = i;
                    }
                } catch (ArrayIndexOutOfBoundsException e3) {
                    e = e3;
                    e.printStackTrace();
                    i2 = i;
                }
            }
            return new String(buffer.toByteArray(), "UTF-8");
        } catch (Exception e4) {
            e4.printStackTrace();
            return BluetoothPbapClientPath.PBAP_ROOT_NAME;
        }
    }

    public boolean doParseVcard(String filename, List<PBRecord> listRecords) {
        boolean bIsFindName = false;
        String strNameAll = null;
        try {
            FileInputStream fis = this.mContext.openFileInput(filename);
            DataInputStream dataIn = new DataInputStream(fis);
            while (true) {
                try {
                    String strLine = dataIn.readLine();
                    if (strLine == null) {
                        break;
                    } else if (strLine.indexOf(mBeginVcard) >= 0) {
                        bIsFindName = false;
                        this.mFamily = null;
                        this.mGiven = null;
                        this.mAdditional = null;
                        this.mPrefix = null;
                        this.mSuffix = null;
                        this.mParseName = null;
                        this.mTelNum.clear();
                        this.mCallTime = null;
                        strNameAll = null;
                    } else if (strLine.indexOf(mEndVcard) >= 0) {
                        parseName(strNameAll);
                        for (int i = 0; i < this.mTelNum.size(); i++) {
                            listRecords.add(new PBRecord(0, this.mFamily + this.mAdditional + this.mGiven, (String) this.mTelNum.get(i), this.mCallTime));
                        }
                    } else {
                        int iend = strLine.indexOf(":");
                        if (iend >= 0) {
                            String strSub = strLine.substring(0, iend);
                            if (strSub.substring(0, strSub.length() < mName.length() ? strSub.length() : mName.length()).equals(mName)) {
                                strNameAll = strLine;
                                bIsFindName = true;
                            } else {
                                if (strSub.substring(0, strSub.length() < mTel.length() ? strSub.length() : mTel.length()).equals(mTel)) {
                                    parseTel(strLine);
                                    bIsFindName = false;
                                } else {
                                    if (strSub.substring(0, strSub.length() < mTimestamp.length() ? strSub.length() : mTimestamp.length()).equals(mTimestamp)) {
                                        parseCallTime(strLine);
                                        bIsFindName = false;
                                    }
                                }
                            }
                        } else if (true == bIsFindName) {
                            strNameAll = strNameAll + strLine;
                        }
                    }
                } catch (IOException e) {
                    Log.e(TAG, "PBListInfo.log read exception");
                    e.printStackTrace();
                }
            }
            dataIn.close();
            fis.close();
            return true;
        } catch (FileNotFoundException e2) {
            Log.e(TAG, filename + " not found");
            e2.printStackTrace();
            return false;
        }
    }

    private void parseName(String string) {
        if (string == null) {
            Log.d(TAG, "no N string here.");
            this.mFamily = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            this.mGiven = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            this.mAdditional = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            this.mPrefix = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            this.mSuffix = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            return;
        }
        if (DEBUG) {
            Log.d(TAG, string);
        }
        int iEncodeMethod = 0;
        int istart = string.indexOf(":");
        String sSub = string.substring(0, istart);
        int iEncodeStart = sSub.indexOf(mEncoding);
        if (iEncodeStart >= 0) {
            int iEncodeEnd = sSub.indexOf(";", mEncoding.length() + iEncodeStart);
            if (iEncodeEnd < 0) {
                iEncodeEnd = istart;
            }
            if (sSub.substring((mEncoding.length() + iEncodeStart) + 1, iEncodeEnd).equals(mQuotedPrintable)) {
                iEncodeMethod = 1;
            }
        }
        int iend = string.indexOf(";", istart + 1 < string.length() ? istart + 1 : string.length());
        if (iend < 0) {
            if (istart + 1 < string.length()) {
                this.mFamily = string.substring(istart + 1);
                if (iEncodeMethod == 1) {
                    this.mFamily = UTF8_Decoding(this.mFamily);
                } else {
                    try {
                        this.mFamily = new String(this.mFamily.getBytes("ISO-8859-1"), "UTF-8");
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                this.mFamily = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            }
            this.mGiven = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            this.mAdditional = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            this.mPrefix = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            this.mSuffix = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            return;
        }
        this.mFamily = string.substring(istart + 1, iend);
        istart = iend;
        iend = string.indexOf(";", istart + 1);
        if (iend < 0) {
            this.mGiven = string.substring(istart + 1);
            this.mAdditional = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            this.mPrefix = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            this.mSuffix = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        } else {
            this.mGiven = string.substring(istart + 1, iend);
            istart = iend;
            iend = string.indexOf(";", istart + 1);
            if (iend < 0) {
                this.mAdditional = string.substring(istart + 1);
                this.mPrefix = BluetoothPbapClientPath.PBAP_ROOT_NAME;
                this.mSuffix = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            } else {
                this.mAdditional = string.substring(istart + 1, iend);
                this.mPrefix = BluetoothPbapClientPath.PBAP_ROOT_NAME;
                this.mSuffix = BluetoothPbapClientPath.PBAP_ROOT_NAME;
            }
        }
        if (iEncodeMethod == 1) {
            swapNames();
            this.mFamily = UTF8_Decoding(this.mFamily);
            this.mGiven = UTF8_Decoding(this.mGiven);
            this.mAdditional = UTF8_Decoding(this.mAdditional);
            this.mPrefix = UTF8_Decoding(this.mPrefix);
            this.mSuffix = UTF8_Decoding(this.mSuffix);
        } else if (iEncodeMethod == 0) {
            try {
                swapNames();
                this.mFamily = new String(this.mFamily.getBytes("ISO-8859-1"), "UTF-8");
                this.mGiven = new String(this.mGiven.getBytes("ISO-8859-1"), "UTF-8");
                this.mAdditional = new String(this.mAdditional.getBytes("ISO-8859-1"), "UTF-8");
                this.mPrefix = new String(this.mPrefix.getBytes("ISO-8859-1"), "UTF-8");
                this.mSuffix = new String(this.mSuffix.getBytes("ISO-8859-1"), "UTF-8");
            } catch (UnsupportedEncodingException e2) {
                e2.printStackTrace();
            }
        }
    }

    private void parseTel(String string) {
        int istart = string.indexOf(":");
        if (istart < string.length() - 1) {
            String strSub = string.substring(istart + 1).replaceAll("-", BluetoothPbapClientPath.PBAP_ROOT_NAME);
            if (strSub.length() >= 3 && strSub.substring(0, 3).equals("+86")) {
                strSub = strSub.substring(3);
            }
            this.mTelNum.add(strSub);
        }
    }

    private void parseCallTime(String string) {
        String sModeTime = "20050320T100000";
        int istart = string.indexOf(":");
        if (istart < string.length() - 1) {
            String strSub = string.substring(istart + 1).trim();
            if (strSub.length() >= sModeTime.length()) {
                String sYear = strSub.substring(0, 4);
                String sMonth = strSub.substring(4, 6);
                String sDay = strSub.substring(6, 8);
                String sHour = strSub.substring(9, 11);
                String sMinute = strSub.substring(11, 13);
                this.mCallTime = sYear + "-" + sMonth + "-" + sDay + " " + sHour + ":" + sMinute + ":" + strSub.substring(13, 15);
                return;
            }
            Log.e(TAG, "time format is not stadard:" + strSub);
            this.mCallTime = "2008-01-01 00:00:00";
        }
    }
    
   private void swapNames() {
      String tmp = this.mAdditional;
      this.mAdditional = this.mGiven;
      this.mGiven = tmp;
      this.mAdditional = this.mAdditional.isEmpty() ? "" : this.mFamily.isEmpty() ? this.mAdditional : " " + this.mAdditional;
      this.mGiven = this.mGiven.isEmpty() ? "" : !this.mFamily.isEmpty() || !this.mAdditional.isEmpty() ? " " + this.mGiven : this.mGiven; 
   }
}
