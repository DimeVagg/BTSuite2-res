package com.autochips.bluetooth.util;

import android.content.Context;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;
import java.util.ArrayList;
import java.util.List;

public class PBSyncParsePclFile {
    public static final int BT_SYNCPREVUSINGMETHOD_ATCPROT = 4;
    public static final int BT_SYNCPREVUSINGMETHOD_ATEOBEX = 3;
    public static final int BT_SYNCPREVUSINGMETHOD_ATMSYNC = 1;
    public static final int BT_SYNCPREVUSINGMETHOD_ATTSSPCSDW = 2;
    public static final int BT_SYNCPREVUSINGMETHOD_MOTOV = 5;
    public static final int BT_SYNCPREVUSINGMETHOD_NONE = 0;
    public static final int BT_SYNCPREVUSINGMETHOD_SAMSUNG_D908 = 6;
    public static final int HFP_COM = 1;
    public static final int HISTORY_ITEM_TYPE = 2;
    public static final int MAX_CNT_OF_BT_COM = 4;
    public static final int MAX_CNT_OF_BT_SYNCPREVUSINGMETHOD = 7;
    public static final int MAX_OF_PHONECONFIG_ITEM_CNT = 3;
    public static final int PBAP_COM = 3;
    public static final int PBCONTACT_ITEM_TYPE = 0;
    public static final int SIMCONTACT_ITEM_TYPE = 1;
    public static final int SPP_COM = 2;
    public static final int SYNCML_COM = 0;
    private static final String TAG = "PBSyncParsePclFile";
    private static final String TAG_CONTACT = "Contact";
    private static final String TAG_CONTACTCOM = "ContactCOM";
    private static final String TAG_CONTACTMETHOD = "ContactMethod";
    private static final String TAG_FACTORY = "Factory";
    private static final String TAG_HISTORY = "History";
    private static final String TAG_NAME = "name";
    private static final String TAG_PBCONTACT = "PBContact";
    private static final String TAG_PBCONTACTCOM = "PBContactCOM";
    private static final String TAG_PBCONTACTMETHOD = "PBContactMethod";
    private static final String TAG_SERIAL = "Serial";
    private static final String TAG_SIMCONTACT = "SIMContact";
    private static final String TAG_SIMCONTACTCOM = "SIMContactCOM";
    private static final String TAG_SIMCONTACTMETHOD = "SIMContactMethod";
    private static final PBSyncParsePclFile m_Instance = new PBSyncParsePclFile();
    private static boolean m_Parsed = false;
    private Context mContext;
    private String mFactory = BluetoothPbapClientPath.PBAP_ROOT_NAME;
    private BT_PHONECONFIG_LIST_T mPhoneCfg = new BT_PHONECONFIG_LIST_T();
    private String mSerial = BluetoothPbapClientPath.PBAP_ROOT_NAME;
    private BT_PHONE_INFO_NODE_T m_rSerialNd = null;

    public class BT_PHONECONFIG_LIST_NODE_T {
        public List<BT_PHONE_INFO_NODE_T> rSerialList = new ArrayList();
        public String sFactory;
        public int u4Curcnt;
    }

    public class BT_PHONECONFIG_LIST_T {
        public List<BT_PHONECONFIG_LIST_NODE_T> rPhoneCfgList = new ArrayList();
        public int u4Count;
    }

    public class BT_PHONE_INFO_NODE_T {
        public BT_PROTOCOL_CFG_T[] rProtocol;
        public String sSerial;
    }

    public class BT_PROTOCOL_CFG_T {
        public int eComType;
        public int eMethod;
        public int u1Protocol;
    }

    private PBSyncParsePclFile() {
    }

    public static PBSyncParsePclFile getInstance() {
        return m_Instance;
    }

    public void setContext(Context context) {
        this.mContext = context;
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean parserPclFile(java.lang.String r27) {
        /*
        r26 = this;
        r23 = m_Parsed;
        if (r23 == 0) goto L_0x0007;
    L_0x0004:
        r23 = 1;
    L_0x0006:
        return r23;
    L_0x0007:
        r23 = 1;
        m_Parsed = r23;
        r19 = 0;
        r8 = 0;
        r7 = 0;
        r6 = 0;
        r21 = 0;
        r20 = 0;
        r22 = 0;
        r16 = 0;
        r14 = 0;
        r10 = 0;
        r10 = new java.io.FileInputStream;	 Catch:{ FileNotFoundException -> 0x0061 }
        r0 = r27;
        r10.<init>(r0);	 Catch:{ FileNotFoundException -> 0x0061 }
        r23 = "PBSyncParsePclFile";
        r24 = new java.lang.StringBuilder;
        r24.<init>();
        r25 = "parserPclFile ";
        r24 = r24.append(r25);
        r0 = r24;
        r1 = r27;
        r24 = r0.append(r1);
        r24 = r24.toString();
        android.util.Log.d(r23, r24);
        r13 = android.util.Xml.newPullParser();	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "UTF-8";
        r0 = r23;
        r13.setInput(r10, r0);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r2 = 0;
        r5 = r13.getEventType();	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r17 = r16;
    L_0x004f:
        r23 = 1;
        r0 = r23;
        if (r5 == r0) goto L_0x0b08;
    L_0x0055:
        switch(r5) {
            case 2: goto L_0x0081;
            case 3: goto L_0x0af5;
            default: goto L_0x0058;
        };	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
    L_0x0058:
        r16 = r17;
    L_0x005a:
        r5 = r13.next();	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r17 = r16;
        goto L_0x004f;
    L_0x0061:
        r4 = move-exception;
        r23 = "PBSyncParsePclFile";
        r24 = new java.lang.StringBuilder;
        r24.<init>();
        r25 = "Couldn't find file: ";
        r24 = r24.append(r25);
        r0 = r24;
        r1 = r27;
        r24 = r0.append(r1);
        r24 = r24.toString();
        android.util.Log.d(r23, r24);
        r23 = 0;
        goto L_0x0006;
    L_0x0081:
        r12 = r13.getName();	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r23 = "PBSyncParsePclFile";
        r24 = new java.lang.StringBuilder;	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r24.<init>();	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r25 = "TGA name: ";
        r24 = r24.append(r25);	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r0 = r24;
        r24 = r0.append(r12);	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r24 = r24.toString();	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        android.util.Log.d(r23, r24);	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r23 = "Factory";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r12);	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        if (r23 == 0) goto L_0x013e;
    L_0x00a9:
        r2 = r13.getAttributeCount();	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r9 = r2 + -1;
        r15 = r14;
    L_0x00b0:
        if (r9 < 0) goto L_0x0139;
    L_0x00b2:
        r3 = r13.getAttributeName(r9);	 Catch:{ XmlPullParserException -> 0x0b37, IOException -> 0x0b2c, all -> 0x0b21 }
        r23 = "PBSyncParsePclFile";
        r24 = new java.lang.StringBuilder;	 Catch:{ XmlPullParserException -> 0x0b37, IOException -> 0x0b2c, all -> 0x0b21 }
        r24.<init>();	 Catch:{ XmlPullParserException -> 0x0b37, IOException -> 0x0b2c, all -> 0x0b21 }
        r25 = "attrname: ";
        r24 = r24.append(r25);	 Catch:{ XmlPullParserException -> 0x0b37, IOException -> 0x0b2c, all -> 0x0b21 }
        r0 = r24;
        r24 = r0.append(r3);	 Catch:{ XmlPullParserException -> 0x0b37, IOException -> 0x0b2c, all -> 0x0b21 }
        r24 = r24.toString();	 Catch:{ XmlPullParserException -> 0x0b37, IOException -> 0x0b2c, all -> 0x0b21 }
        android.util.Log.d(r23, r24);	 Catch:{ XmlPullParserException -> 0x0b37, IOException -> 0x0b2c, all -> 0x0b21 }
        r23 = "name";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r3);	 Catch:{ XmlPullParserException -> 0x0b37, IOException -> 0x0b2c, all -> 0x0b21 }
        if (r23 == 0) goto L_0x0b41;
    L_0x00da:
        r14 = new com.autochips.bluetooth.util.PBSyncParsePclFile$BT_PHONECONFIG_LIST_NODE_T;	 Catch:{ XmlPullParserException -> 0x0b37, IOException -> 0x0b2c, all -> 0x0b21 }
        r0 = r26;
        r14.<init>();	 Catch:{ XmlPullParserException -> 0x0b37, IOException -> 0x0b2c, all -> 0x0b21 }
        r23 = 0;
        r0 = r23;
        r14.u4Curcnt = r0;	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r23 = r13.getAttributeValue(r9);	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r0 = r23;
        r14.sFactory = r0;	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r23 = "PBSyncParsePclFile";
        r24 = new java.lang.StringBuilder;	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r24.<init>();	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r25 = "attr value: ";
        r24 = r24.append(r25);	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r0 = r14.sFactory;	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r25 = r0;
        r24 = r24.append(r25);	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r24 = r24.toString();	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        android.util.Log.d(r23, r24);	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r0 = r26;
        r0 = r0.mPhoneCfg;	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r23 = r0;
        r0 = r23;
        r0 = r0.rPhoneCfgList;	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r23 = r0;
        r0 = r23;
        r0.add(r14);	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r0 = r26;
        r0 = r0.mPhoneCfg;	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r23 = r0;
        r0 = r23;
        r0 = r0.u4Count;	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r24 = r0;
        r24 = r24 + 1;
        r0 = r24;
        r1 = r23;
        r1.u4Count = r0;	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r6 = 1;
        r7 = 0;
        r20 = r20 + 1;
    L_0x0134:
        r9 = r9 + -1;
        r15 = r14;
        goto L_0x00b0;
    L_0x0139:
        r14 = r15;
        r16 = r17;
        goto L_0x005a;
    L_0x013e:
        r23 = "Serial";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r12);	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        if (r23 == 0) goto L_0x0058;
    L_0x0148:
        r16 = new com.autochips.bluetooth.util.PBSyncParsePclFile$BT_PHONE_INFO_NODE_T;	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r0 = r16;
        r1 = r26;
        r0.<init>();	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r22 = r22 + 1;
        r23 = 3;
        r0 = r23;
        r0 = new com.autochips.bluetooth.util.PBSyncParsePclFile.BT_PROTOCOL_CFG_T[r0];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r0 = r23;
        r1 = r16;
        r1.rProtocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r11 = 0;
    L_0x0162:
        r23 = 3;
        r0 = r23;
        if (r11 >= r0) goto L_0x017c;
    L_0x0168:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = new com.autochips.bluetooth.util.PBSyncParsePclFile$BT_PROTOCOL_CFG_T;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r24;
        r1 = r26;
        r0.<init>();	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23[r11] = r24;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r11 = r11 + 1;
        goto L_0x0162;
    L_0x017c:
        r2 = r13.getAttributeCount();	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r9 = r2 + -1;
    L_0x0182:
        if (r9 < 0) goto L_0x0ade;
    L_0x0184:
        r3 = r13.getAttributeName(r9);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "PBSyncParsePclFile";
        r24 = new java.lang.StringBuilder;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24.<init>();	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r25 = "TGA attrname: ";
        r24 = r24.append(r25);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r24;
        r24 = r0.append(r3);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = r24.toString();	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        android.util.Log.d(r23, r24);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "name";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r3);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x01d8;
    L_0x01ac:
        r23 = r13.getAttributeValue(r9);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r23;
        r1 = r16;
        r1.sSerial = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "PBSyncParsePclFile";
        r24 = new java.lang.StringBuilder;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24.<init>();	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r25 = "TGA attr value: ";
        r24 = r24.append(r25);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.sSerial;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r25 = r0;
        r24 = r24.append(r25);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = r24.toString();	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        android.util.Log.d(r23, r24);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r7 = 1;
    L_0x01d5:
        r9 = r9 + -1;
        goto L_0x0182;
    L_0x01d8:
        r23 = "Contact";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r3);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0410;
    L_0x01e2:
        r18 = r13.getAttributeValue(r9);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "PBSyncParsePclFile";
        r24 = new java.lang.StringBuilder;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24.<init>();	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r25 = "TGA attr value: ";
        r24 = r24.append(r25);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r24;
        r1 = r18;
        r24 = r0.append(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = r24.toString();	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        android.util.Log.d(r23, r24);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 0;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 0;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "HFP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0291;
    L_0x0232:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x027c:
        r4 = move-exception;
    L_0x027d:
        r23 = "PBSyncParsePclFile";
        r24 = "Got execption parsing xml";
        r0 = r23;
        r1 = r24;
        android.util.Slog.w(r0, r1, r4);	 Catch:{ all -> 0x0351 }
        if (r10 == 0) goto L_0x028d;
    L_0x028a:
        r10.close();	 Catch:{ IOException -> 0x0b16 }
    L_0x028d:
        r23 = 1;
        goto L_0x0006;
    L_0x0291:
        r23 = "SPP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x02fb;
    L_0x029d:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 3;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 3;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x02e7:
        r4 = move-exception;
    L_0x02e8:
        r23 = "PBSyncParsePclFile";
        r24 = "Got ioexecption parsing xml";
        r0 = r23;
        r1 = r24;
        android.util.Slog.w(r0, r1, r4);	 Catch:{ all -> 0x0351 }
        if (r10 == 0) goto L_0x028d;
    L_0x02f5:
        r10.close();	 Catch:{ IOException -> 0x02f9 }
        goto L_0x028d;
    L_0x02f9:
        r23 = move-exception;
        goto L_0x028d;
    L_0x02fb:
        r23 = "PBAP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0358;
    L_0x0307:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 3;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 3;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0351:
        r23 = move-exception;
    L_0x0352:
        if (r10 == 0) goto L_0x0357;
    L_0x0354:
        r10.close();	 Catch:{ IOException -> 0x0b19 }
    L_0x0357:
        throw r23;
    L_0x0358:
        r23 = "DUN";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 != 0) goto L_0x037c;
    L_0x0364:
        r23 = "SYNCML";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 != 0) goto L_0x037c;
    L_0x0370:
        r23 = "NOTSUPPORT";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x03a2;
    L_0x037c:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x03a2:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 0;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 0;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 0;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 0;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0410:
        r23 = "History";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r3);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0524;
    L_0x041a:
        r18 = r13.getAttributeValue(r9);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "HFP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0450;
    L_0x042a:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 2;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 2;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0450:
        r23 = "SPP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0482;
    L_0x045c:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 2;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 3;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 2;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0482:
        r23 = "PBAP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x04b4;
    L_0x048e:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 2;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 2;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 3;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x04b4:
        r23 = "DUN";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 != 0) goto L_0x04d8;
    L_0x04c0:
        r23 = "SYNCML";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 != 0) goto L_0x04d8;
    L_0x04cc:
        r23 = "NOTSUPPORT";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x04ec;
    L_0x04d8:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 2;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x04ec:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 2;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 0;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 2;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 2;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 0;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0524:
        r23 = "SIMContact";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r3);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0586;
    L_0x052e:
        r18 = r13.getAttributeValue(r9);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "HFP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0552;
    L_0x053e:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0552:
        r23 = "SPP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0572;
    L_0x055e:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0572:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0586:
        r23 = "PBContact";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r3);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x06ac;
    L_0x0590:
        r18 = r13.getAttributeValue(r9);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 0;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "HFP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x05d8;
    L_0x05b2:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x05d8:
        r23 = "SPP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x060a;
    L_0x05e4:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 3;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x060a:
        r23 = "PBAP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x063c;
    L_0x0616:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 3;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x063c:
        r23 = "DUN";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 != 0) goto L_0x0660;
    L_0x0648:
        r23 = "SYNCML";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 != 0) goto L_0x0660;
    L_0x0654:
        r23 = "NOTSUPPORT";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0674;
    L_0x0660:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0674:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 0;
        r0 = r24;
        r1 = r23;
        r1.u1Protocol = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 0;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x06ac:
        r23 = "PBContactCOM";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r3);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x070e;
    L_0x06b6:
        r18 = r13.getAttributeValue(r9);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "HFP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x06da;
    L_0x06c6:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x06da:
        r23 = "SPP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x06fa;
    L_0x06e6:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x06fa:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x070e:
        r23 = "SIMContactCOM";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r3);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0770;
    L_0x0718:
        r18 = r13.getAttributeValue(r9);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "HFP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x073c;
    L_0x0728:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x073c:
        r23 = "SPP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x075c;
    L_0x0748:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x075c:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0770:
        r23 = "ContactCOM";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r3);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0808;
    L_0x077a:
        r18 = r13.getAttributeValue(r9);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "HFP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x07b0;
    L_0x078a:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x07b0:
        r23 = "SPP";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x07e2;
    L_0x07bc:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x07e2:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.eComType = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0808:
        r23 = "ContactMethod";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r3);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0942;
    L_0x0812:
        r18 = r13.getAttributeValue(r9);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "ATMSYNC";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0848;
    L_0x0822:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0848:
        r23 = "ATTSSPCSDW";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x087a;
    L_0x0854:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x087a:
        r23 = "ATEOBEX";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x08ac;
    L_0x0886:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 3;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 3;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x08ac:
        r23 = "MOTOV";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x08de;
    L_0x08b8:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 5;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 5;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x08de:
        r23 = "SAMSUNGD";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0910;
    L_0x08ea:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 6;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 6;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0910:
        r23 = "ATCPROT";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x01d5;
    L_0x091c:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0942:
        r23 = "PBContactMethod";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r3);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0a10;
    L_0x094c:
        r18 = r13.getAttributeValue(r9);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "ATMSYNC";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0970;
    L_0x095c:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0970:
        r23 = "ATTSSPCSDW";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0990;
    L_0x097c:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0990:
        r23 = "ATEOBEX";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x09b0;
    L_0x099c:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 3;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x09b0:
        r23 = "MOTOV";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x09d0;
    L_0x09bc:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 5;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x09d0:
        r23 = "SAMSUNGD";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x09f0;
    L_0x09dc:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 6;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x09f0:
        r23 = "ATCPROT";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x01d5;
    L_0x09fc:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 0;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0a10:
        r23 = "SIMContactMethod";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r3);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x01d5;
    L_0x0a1a:
        r18 = r13.getAttributeValue(r9);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = "ATMSYNC";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0a3e;
    L_0x0a2a:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 1;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0a3e:
        r23 = "ATTSSPCSDW";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0a5e;
    L_0x0a4a:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 2;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0a5e:
        r23 = "ATEOBEX";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0a7e;
    L_0x0a6a:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 3;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0a7e:
        r23 = "MOTOV";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0a9e;
    L_0x0a8a:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 5;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0a9e:
        r23 = "SAMSUNGD";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x0abe;
    L_0x0aaa:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 6;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0abe:
        r23 = "ATCPROT";
        r0 = r18;
        r1 = r23;
        r23 = r0.equals(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        if (r23 == 0) goto L_0x01d5;
    L_0x0aca:
        r0 = r16;
        r0 = r0.rProtocol;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r24 = 1;
        r23 = r23[r24];	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r24 = 4;
        r0 = r24;
        r1 = r23;
        r1.eMethod = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x01d5;
    L_0x0ade:
        r0 = r14.rSerialList;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r0 = r23;
        r1 = r16;
        r0.add(r1);	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r0 = r14.u4Curcnt;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        r23 = r0;
        r23 = r23 + 1;
        r0 = r23;
        r14.u4Curcnt = r0;	 Catch:{ XmlPullParserException -> 0x027c, IOException -> 0x02e7 }
        goto L_0x005a;
    L_0x0af5:
        r12 = r13.getName();	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        r23 = "Factory";
        r0 = r23;
        r23 = r0.equalsIgnoreCase(r12);	 Catch:{ XmlPullParserException -> 0x0b32, IOException -> 0x0b27, all -> 0x0b1c }
        if (r23 == 0) goto L_0x0058;
    L_0x0b03:
        r6 = 0;
        r16 = r17;
        goto L_0x005a;
    L_0x0b08:
        if (r10 == 0) goto L_0x0b3d;
    L_0x0b0a:
        r10.close();	 Catch:{ IOException -> 0x0b11 }
        r16 = r17;
        goto L_0x028d;
    L_0x0b11:
        r23 = move-exception;
        r16 = r17;
        goto L_0x028d;
    L_0x0b16:
        r23 = move-exception;
        goto L_0x028d;
    L_0x0b19:
        r24 = move-exception;
        goto L_0x0357;
    L_0x0b1c:
        r23 = move-exception;
        r16 = r17;
        goto L_0x0352;
    L_0x0b21:
        r23 = move-exception;
        r14 = r15;
        r16 = r17;
        goto L_0x0352;
    L_0x0b27:
        r4 = move-exception;
        r16 = r17;
        goto L_0x02e8;
    L_0x0b2c:
        r4 = move-exception;
        r14 = r15;
        r16 = r17;
        goto L_0x02e8;
    L_0x0b32:
        r4 = move-exception;
        r16 = r17;
        goto L_0x027d;
    L_0x0b37:
        r4 = move-exception;
        r14 = r15;
        r16 = r17;
        goto L_0x027d;
    L_0x0b3d:
        r16 = r17;
        goto L_0x028d;
    L_0x0b41:
        r14 = r15;
        goto L_0x0134;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.autochips.bluetooth.util.PBSyncParsePclFile.parserPclFile(java.lang.String):boolean");
    }

    public BT_PHONE_INFO_NODE_T getPclCfgFrmList(String sFactory, String sSerial) {
        if (sFactory == null || sSerial == null || sFactory.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME) || sSerial.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME)) {
            return null;
        }
        if (sFactory.equals(this.mFactory) && sSerial.equals(this.mSerial)) {
            return this.m_rSerialNd;
        }
        this.mFactory = sFactory;
        this.mSerial = sSerial;
        if (this.mPhoneCfg != null) {
            for (int u4Idx1 = 0; u4Idx1 < this.mPhoneCfg.u4Count; u4Idx1++) {
                BT_PHONECONFIG_LIST_NODE_T rPhoneCfgNd = (BT_PHONECONFIG_LIST_NODE_T) this.mPhoneCfg.rPhoneCfgList.get(u4Idx1);
                if (rPhoneCfgNd.sFactory.equalsIgnoreCase(sFactory)) {
                    for (int u4Idx2 = 0; u4Idx2 < rPhoneCfgNd.u4Curcnt; u4Idx2++) {
                        BT_PHONE_INFO_NODE_T rSerialNd = (BT_PHONE_INFO_NODE_T) rPhoneCfgNd.rSerialList.get(u4Idx2);
                        if (rSerialNd.sSerial.equalsIgnoreCase(sSerial)) {
                            this.m_rSerialNd = rSerialNd;
                            return rSerialNd;
                        }
                    }
                    continue;
                }
            }
        }
        this.m_rSerialNd = null;
        return null;
    }
}
