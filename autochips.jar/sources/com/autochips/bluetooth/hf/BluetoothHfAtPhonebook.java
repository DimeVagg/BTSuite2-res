package com.autochips.bluetooth.hf;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;

public class BluetoothHfAtPhonebook {
    public static final String AT_RESPOND = "AT_Respond";
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugHF);
    public static final int HFP_RECIEVE_RESPOND = 11000;
    public static final int HFP_RECIEVE_RESPOND_SMS = 11001;
    private static final String TAG = "BluetoothHfAtPhonebook";
    private static BluetoothHfAtPhonebook instance = new BluetoothHfAtPhonebook();
    private String mCPBRCombStr = BluetoothPbapClientPath.PBAP_ROOT_NAME;
    private Handler mHandler;
    private boolean mHfPhonebookDownloading;
    private boolean mSetSyncSms = false;
    private Handler mSmsHandler;
    private boolean mbGetRspFromRawdata = false;

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtPhonebook$1 */
    class C00521 extends HfAtCommandHandler {
        C00521() {
        }

        public void handleResponseCode(Object[] args) {
            String response = "+CSCS:" + BluetoothHfAtPhonebook.combineArgs(args);
            if (BluetoothHfAtPhonebook.DEBUG) {
                BluetoothHfAtPhonebook.log("[HF_PBAT_CMD]" + response);
            }
            BluetoothHfAtPhonebook.this.SendMessage(response);
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtPhonebook$2 */
    class C00532 extends HfAtCommandHandler {
        C00532() {
        }

        public void handleResponseCode(Object[] args) {
            String response = "+CPBS:" + BluetoothHfAtPhonebook.combineArgs(args);
            if (BluetoothHfAtPhonebook.DEBUG) {
                BluetoothHfAtPhonebook.log("[HF_PBAT_CMD]" + response);
            }
            BluetoothHfAtPhonebook.access$484(BluetoothHfAtPhonebook.this, response + "\r\n");
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtPhonebook$3 */
    class C00543 extends HfAtCommandHandler {
        C00543() {
        }

        public void handleResponseCode(Object[] args) {
            BluetoothHfAtPhonebook.this.mHfPhonebookDownloading = true;
            String response = "+CPBR:" + BluetoothHfAtPhonebook.combineArgs(args);
            if (BluetoothHfAtPhonebook.DEBUG) {
                BluetoothHfAtPhonebook.log("[HF_PBAT_CMD]" + response);
            }
            BluetoothHfAtPhonebook.access$484(BluetoothHfAtPhonebook.this, response + "\r\n");
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtPhonebook$4 */
    class C00554 extends HfAtCommandHandler {
        C00554() {
        }

        public void handleResponseCode(Object[] args) {
            String response = "+CPMS:" + BluetoothHfAtPhonebook.combineArgs(args);
            if (BluetoothHfAtPhonebook.DEBUG) {
                BluetoothHfAtPhonebook.log("[HF_SMS_CMD]" + response);
            }
            BluetoothHfAtPhonebook.this.SendMessageSms(response);
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtPhonebook$5 */
    class C00565 extends HfAtCommandHandler {
        C00565() {
        }

        public void handleResponseCode(Object[] args) {
            String response = "+CMGR:" + BluetoothHfAtPhonebook.combineArgs(args);
            if (BluetoothHfAtPhonebook.DEBUG) {
                BluetoothHfAtPhonebook.log("[HF_SMS_CMD]" + response);
            }
            BluetoothHfAtPhonebook.this.SendMessageSms(response);
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtPhonebook$6 */
    class C00576 extends HfAtCommandHandler {
        C00576() {
        }

        public void handleResponseCode(Object[] args) {
            String response = "+MMGL:" + BluetoothHfAtPhonebook.combineArgs(args);
            if (BluetoothHfAtPhonebook.DEBUG) {
                BluetoothHfAtPhonebook.log("[HF_SMS_CMD]" + response);
            }
            BluetoothHfAtPhonebook.this.SendMessageSms(response);
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtPhonebook$7 */
    class C00587 extends HfAtCommandHandler {
        C00587() {
        }

        public void handleResponseCode(Object[] args) {
            String response = "+CMGL:" + BluetoothHfAtPhonebook.combineArgs(args);
            if (BluetoothHfAtPhonebook.DEBUG) {
                BluetoothHfAtPhonebook.log("[HF_SMS_CMD]" + response);
            }
            BluetoothHfAtPhonebook.access$484(BluetoothHfAtPhonebook.this, response);
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtPhonebook$8 */
    class C00598 extends HfAtCommandHandler {
        C00598() {
        }

        public void handleResponseCode(Object[] args) {
            String response = "+CMSERROR:" + BluetoothHfAtPhonebook.combineArgs(args);
            if (BluetoothHfAtPhonebook.DEBUG) {
                BluetoothHfAtPhonebook.log("[HF_SMS_CMD]" + response);
            }
            BluetoothHfAtPhonebook.this.SendMessageSms(response);
        }
    }

    static /* synthetic */ String access$484(BluetoothHfAtPhonebook x0, Object x1) {
        String str = x0.mCPBRCombStr + x1;
        x0.mCPBRCombStr = str;
        return str;
    }

    private BluetoothHfAtPhonebook() {
        if (DEBUG) {
            log(" construct BluetoothHfAtPhonebook");
        }
    }

    public static BluetoothHfAtPhonebook getInstance() {
        return instance;
    }

    public synchronized void setHandler(Handler handler) {
        this.mHandler = handler;
    }

    public synchronized void setSmsHandler(Handler handler) {
        this.mSmsHandler = handler;
    }

    public synchronized void setSyncObject(boolean b) {
        this.mSetSyncSms = b;
    }

    private void SendMessage(String data) {
        if (this.mHandler != null) {
            Message msg = this.mHandler.obtainMessage(HFP_RECIEVE_RESPOND);
            Bundle bundle = new Bundle();
            bundle.putString("AT_Respond", data);
            msg.setData(bundle);
            this.mHandler.sendMessage(msg);
        } else if (DEBUG) {
            Log.e(TAG, "SendMessage fail ,mHandler is null");
        }
    }

    private void SendMessageSms(String data) {
        if (this.mSmsHandler != null) {
            Message msg = this.mSmsHandler.obtainMessage(HFP_RECIEVE_RESPOND_SMS);
            Bundle bundle = new Bundle();
            bundle.putString("AT_Respond", data);
            msg.setData(bundle);
            this.mSmsHandler.sendMessage(msg);
        } else if (DEBUG) {
            Log.e(TAG, "SendMessageSms fail ,mHandler is null");
        }
    }

    private static void log(String msg) {
        Log.d(TAG, msg);
    }

    private static String combineArgs(Object[] args) {
        int i = 0;
        StringBuffer output = new StringBuffer();
        if (args.length > 1) {
            i = 0;
            while (i < args.length - 1) {
                output.append(args[i] + ",");
                i++;
            }
        }
        output.append(args[i]);
        return output.toString();
    }

    public void initializeHfAtPhonebookParser() {
        if (DEBUG) {
            log("Registering Handsfree AT commands");
        }
        BluetoothHfAtParser parser = BluetoothHfAtHandler.getAtParser();
        parser.register("+CSCS", new C00521());
        parser.register("+CPBS", new C00532());
        parser.register("+CPBR", new C00543());
        parser.register("+CPMS", new C00554());
        parser.register("+CMGR", new C00565());
        parser.register("+MMGL", new C00576());
        parser.register("+CMGL", new C00587());
        parser.register("+CMSERROR", new C00598());
    }

    public boolean isHfConnected() {
        if (DEBUG) {
            log(" isHfConnected");
        }
        return BluetoothHfAtHandler.isHfConnected();
    }

    public boolean sendPbAtCommand(String pbCmd) {
        if (DEBUG) {
            log(" sendPbAtCommand" + pbCmd);
        }
        this.mHfPhonebookDownloading = false;
        return BluetoothHfAtHandler.sendURC(pbCmd);
    }

    public int sendPbAtCommandWithResult(String pbCmd, int timeout_100ms) {
        if (pbCmd.equals("AT+CGMI") || pbCmd.equals("AT+CGMM")) {
            this.mbGetRspFromRawdata = true;
        } else {
            this.mbGetRspFromRawdata = false;
        }
        BluetoothHfAtHandler.clearHfAtCmdResult();
        if (sendPbAtCommand(pbCmd)) {
            return BluetoothHfAtHandler.waitforHfCmdResult(timeout_100ms);
        }
        return 3;
    }

    public String ReadPbAtResponse() {
        if (this.mbGetRspFromRawdata) {
            this.mCPBRCombStr = BluetoothHfAtParser.getRawData();
        }
        if (DEBUG) {
            log(" ReadPbAtResponse:" + this.mCPBRCombStr);
        }
        return this.mCPBRCombStr;
    }

    public void ResetPbAtResponse() {
        this.mCPBRCombStr = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        BluetoothHfAtParser.resetRawData();
    }

    public String ReadCGMMResponse() {
        return BluetoothHfAtHandler.getFactory();
    }

    public String ReadCGMIResponse() {
        return BluetoothHfAtHandler.getSerial();
    }
}
