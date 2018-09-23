package com.autochips.bluetooth.hf;

import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.content.Intent;
import android.media.Ringtone;
import android.media.RingtoneManager;
import android.net.Uri;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;
import com.autochips.dvp.MultiMediaConstant;

public class BluetoothHfAtHandler {
    public static final String ACTION_AG_MIC_GAIN_CHANGED = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.AG_MIC_GAIN_CHANGED";
    public static final String ACTION_AG_VOLUME_CHANGED = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.AG_VOLUME_CHANGED";
    public static final String ACTION_BLUETOOTH_AT_CMD_WARNING = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.BLUETOOTH_AT_CMD_WARNING";
    public static final String ACTION_CALLSETUP_CHANGED = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.CALLSETUP_STATE_CHANGED";
    public static final String ACTION_CALL_STATE_CHANGED = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.CALL_STATE_CHANGED";
    public static final String ACTION_INDICATORCONTROL_CHANGED = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.INDICATORCONTROL_CHANGED";
    public static final String ACTION_PHONEIDENTIFICATION_CHANGED = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.PHONEIDENTIFICATION_CHANGED";
    public static final String ACTION_PHONE_NUMBER_CHANGED = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.PHONE_NUMBER_CHANGED";
    private static final int BRSF_AG_CODEC_NEGOTIATION = 512;
    private static final int BRSF_AG_EC_NR = 2;
    private static final int BRSF_AG_ENHANCED_CALL_CONTROL = 128;
    private static final int BRSF_AG_ENHANCED_CALL_STATUS = 64;
    private static final int BRSF_AG_ENHANCED_ERR_RESULT_CODES = 256;
    private static final int BRSF_AG_IN_BAND_RING = 8;
    private static final int BRSF_AG_REJECT_CALL = 32;
    private static final int BRSF_AG_THREE_WAY_CALLING = 1;
    private static final int BRSF_AG_VOICE_RECOG = 4;
    private static final int BRSF_AG_VOICE_TAG_NUMBE = 16;
    private static final int BRSF_HF_CLIP = 4;
    private static final int BRSF_HF_CODEC_NEGOTIATION = 128;
    private static final int BRSF_HF_CW_THREE_WAY_CALLING = 2;
    private static final int BRSF_HF_EC_NR = 1;
    private static final int BRSF_HF_ENHANCED_CALL_CONTROL = 64;
    private static final int BRSF_HF_ENHANCED_CALL_STATUS = 32;
    private static final int BRSF_HF_REMOTE_VOL_CONTROL = 16;
    private static final int BRSF_HF_VOICE_REG_ACT = 8;
    private static final String[] CIND_Resp_Str = new String[]{"service", "callsetup", "call_setup", "callheld", "call", "signal", "roam", "battchg"};
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugHF);
    public static final String EXTRA_BLUETOOTH_AT_CMD_WANING_TYPE = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.BLUETOOTH_AT_CMD_WARNING_TYPE";
    public static final String EXTRA_NEW_AG_MIC_GAIN = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_MIC_GAIN";
    public static final String EXTRA_NEW_AG_VOLUME = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_AG_VOLUME";
    public static final String EXTRA_NEW_BATTCHG = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_BATTCHG";
    public static final String EXTRA_NEW_CALLSETUP_STATE = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_CALLSETUP_STATE";
    public static final String EXTRA_NEW_CALL_STATE = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_CALL_STATE";
    public static final String EXTRA_NEW_PHONEIDENTIFICATION = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_PHONEIDENTIFICATION";
    public static final String EXTRA_NEW_PHONE_NUMBER = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_PHONE_NUMBER";
    public static final String EXTRA_NEW_ROAM = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_ROAM";
    public static final String EXTRA_NEW_SERVICE = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_SERVICE";
    public static final String EXTRA_NEW_SIGNAL = "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_SIGNAL";
    public static final int HF_AT_CMD_RESULT_ERROR = 0;
    public static final int HF_AT_CMD_RESULT_NORESPONSE = 2;
    public static final int HF_AT_CMD_RESULT_NO_CARRIER = 4;
    public static final int HF_AT_CMD_RESULT_OK = 1;
    public static final int HF_AT_CMD_RESULT_SEND_FAIL = 3;
    public static final int HF_AT_CMD_WARNING_NONE = 0;
    public static final int HF_AT_CMD_WARNING_NO_CARRIER = 1;
    private static final String TAG = "BluetoothHfAtHandler";
    public static final int TYPE_HANDSFREE = 2;
    public static final int TYPE_HANDSFREE_AUDIOGATEWAY = 3;
    public static final int TYPE_HEADSET = 1;
    public static final int TYPE_UNKNOWN = 0;
    private static int mBattchg;
    public static int mCall;
    public static int mCallsetup;
    private static String mClipPhoneNumber = BluetoothPbapClientPath.PBAP_ROOT_NAME;
    private static Ringtone mCurrentRingtone = null;
    private static String mFactory;
    private static int mHfAtCmdResult;
    protected static BluetoothHfAtParser mHfAtParser;
    private static int mLocalBrsf = 0;
    private static int mRemoteBrsf = 0;
    private static int mRoam;
    private static String mSerial;
    private static int mService;
    private static int mSignal;
    private static BluetoothHfService mhfservice = null;
    private int mAGMicGain = Integer.MIN_VALUE;
    private Intent mAGMicGain_intent;
    private int mAGSpeakerGain = Integer.MIN_VALUE;
    private Intent mAGVolume_intent;
    private Intent mATCmdWarning_intent;
    private int mBattchgCIEVIndex = 5;
    private int mCallCIEVIndex = 2;
    private Intent mCall_intent;
    private int mCallheldCIEVIndex = 7;
    private int mCallsetupCIEVIndex = 3;
    private Intent mCallsetup_intent;
    private boolean[] mClccUsed;
    private int mClcc_dir;
    private int mClcc_idx;
    private int mClcc_mode;
    private int mClcc_mprty;
    private String mClcc_number;
    private int mClcc_status;
    private int mClcc_type;
    private Context mContext;
    private boolean mInbandRingtoneOn = false;
    private Intent mIndicatorControl_intent;
    private Intent mPhoneIdentification_intent;
    private Intent mPhonenumber_intent;
    private int mRoamCIEVIndex = 6;
    private int mServiceCIEVIndex = 1;
    private int mSignalCIEVIndex = 4;

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtHandler$1 */
    class C00431 extends HfAtCommandHandler {
        C00431() {
        }

        public void handleResponseCode() {
            if (BluetoothHfAtHandler.DEBUG) {
                BluetoothHfAtHandler.log("[ATCMD] OK  ");
            }
            BluetoothHfAtHandler.mHfAtCmdResult = 1;
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtHandler$2 */
    class C00442 extends HfAtCommandHandler {
        C00442() {
        }

        public void handleResponseCode() {
            if (BluetoothHfAtHandler.DEBUG) {
                BluetoothHfAtHandler.log("[ATCMD] ERROR ");
            }
            BluetoothHfAtHandler.mHfAtCmdResult = 0;
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtHandler$3 */
    class C00453 extends HfAtCommandHandler {
        C00453() {
        }

        public void handleResponseCode() {
            if (BluetoothHfAtHandler.DEBUG) {
                BluetoothHfAtHandler.log("[ATCMD] NO CARRIER ");
            }
            BluetoothHfAtHandler.this.mATCmdWarning_intent.putExtra(BluetoothHfAtHandler.EXTRA_BLUETOOTH_AT_CMD_WANING_TYPE, 1);
            BluetoothHfAtHandler.this.mContext.sendBroadcast(BluetoothHfAtHandler.this.mATCmdWarning_intent);
            BluetoothHfAtHandler.mHfAtCmdResult = 4;
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtHandler$4 */
    class C00464 extends HfAtCommandHandler {
        C00464() {
        }

        public void handleResponseCode() {
            if (BluetoothHfAtHandler.DEBUG) {
                BluetoothHfAtHandler.log("[ATCMD] RING ");
            }
            if (!BluetoothHfAtHandler.IsHfRingTonePlaying()) {
                BluetoothHfAtHandler.this.HfPlayRingTone();
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtHandler$5 */
    class C00475 extends HfAtCommandHandler {
        C00475() {
        }

        public void handleResponseCode(Object[] args) {
            if (BluetoothHfAtHandler.DEBUG) {
                BluetoothHfAtHandler.log("[ATCMD]+CIEV args =" + args[0] + args[1] + BluetoothHfAtHandler.this.mCallsetupCIEVIndex);
            }
            if (args.length > 1 && ((Integer) args[0]).intValue() > 0) {
                int CievIndex = args[0].toString().charAt(0) - 48;
                int[] cievVals = new int[BluetoothHfAtHandler.CIND_Resp_Str.length];
                cievVals[CievIndex - 1] = args[1].toString().charAt(0) - 48;
                BluetoothHfAtHandler.this.updateIndication(1 << CievIndex, cievVals);
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtHandler$6 */
    class C00486 extends HfAtCommandHandler {
        C00486() {
        }

        public void handleResponseCode(Object[] args) {
            if (BluetoothHfAtHandler.DEBUG) {
                Log.i(BluetoothHfAtHandler.TAG, "[ATCMD] +BRSF ");
            }
            if (args.length >= 1) {
                BluetoothHfAtHandler.mRemoteBrsf = ((Integer) args[0]).intValue();
                if (BluetoothHfAtHandler.DEBUG) {
                    Log.i(BluetoothHfAtHandler.TAG, "mRemoteBrsf = " + BluetoothHfAtHandler.mRemoteBrsf);
                }
                if ((BluetoothHfAtHandler.mRemoteBrsf & 8) != 0) {
                    BluetoothHfAtHandler.this.mInbandRingtoneOn = true;
                } else {
                    BluetoothHfAtHandler.this.mInbandRingtoneOn = false;
                }
            } else if (BluetoothHfAtHandler.DEBUG) {
                Log.w(BluetoothHfAtHandler.TAG, "HF AG didn't sent BRSF assuming 0");
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtHandler$7 */
    class C00497 extends HfAtCommandHandler {
        C00497() {
        }

        public void handleResponseCode(Object[] args) {
            Log.i(BluetoothHfAtHandler.TAG, "[ATCMD] +BCS ");
            if (args.length >= 1) {
                int remoteCodecID = ((Integer) args[0]).intValue();
                if (true == isSupportedCodec(remoteCodecID)) {
                    codecSelected(remoteCodecID);
                    return;
                }
                Log.e(BluetoothHfAtHandler.TAG, "AG codec id is error" + remoteCodecID);
                codecReNegotiate();
            } else if (BluetoothHfAtHandler.DEBUG) {
                Log.w(BluetoothHfAtHandler.TAG, "HF AG didn't sent BRSF assuming 0");
            }
        }

        private boolean isSupportedCodec(int codecID) {
            if (1 == codecID) {
                return true;
            }
            if (2 != codecID) {
                return false;
            }
            if (true != BluetoothHfAtHandler.isLocalDeviceSupportCodecNegotiation()) {
                return false;
            }
            return true;
        }

        private void codecSelected(int codecID) {
            if (BluetoothHfAtHandler.mhfservice.selectHFSCOCodecID(codecID)) {
                BluetoothHfAtHandler.HfAtCmdCodecSelected(codecID);
            }
        }

        private void codecReNegotiate() {
            BluetoothHfAtHandler.HfAtCmdAvialableCodecs();
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtHandler$8 */
    class C00508 extends HfAtCommandHandler {
        C00508() {
        }

        public void handleResponseCode(Object[] args) {
            if (BluetoothHfAtHandler.DEBUG) {
                Log.i(BluetoothHfAtHandler.TAG, "[ATCMD] +BSIR ");
            }
            if (args.length >= 1 && (args[0] instanceof Integer)) {
                if (((Integer) args[0]).intValue() == 1) {
                    BluetoothHfAtHandler.this.mInbandRingtoneOn = true;
                } else if (((Integer) args[0]).intValue() == 0) {
                    BluetoothHfAtHandler.this.mInbandRingtoneOn = false;
                }
                if (BluetoothHfAtHandler.DEBUG) {
                    Log.i(BluetoothHfAtHandler.TAG, "mInbandRingtoneOn = " + BluetoothHfAtHandler.mRemoteBrsf);
                }
            } else if (BluetoothHfAtHandler.DEBUG) {
                Log.w(BluetoothHfAtHandler.TAG, "HF  +BSIR value is not valid");
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAtHandler$9 */
    class C00519 extends HfAtCommandHandler {
        C00519() {
        }

        public void handleResponseCode(Object[] args) {
            if (BluetoothHfAtHandler.DEBUG) {
                BluetoothHfAtHandler.log("[ATCMD] +CCWA ");
            }
        }
    }

    public BluetoothHfAtHandler(Context context, BluetoothHfService hfservice) {
        boolean bluetoothCapable = true;
        this.mContext = context;
        mhfservice = hfservice;
        if (BluetoothAdapter.getDefaultAdapter() == null) {
            bluetoothCapable = false;
        }
        mHfAtCmdResult = 2;
        mClipPhoneNumber = "unkown";
        mLocalBrsf = MultiMediaConstant.SV_E_DRM_NOT_ALLOWED;
        this.mCallsetup_intent = new Intent(ACTION_CALLSETUP_CHANGED);
        this.mCall_intent = new Intent(ACTION_CALL_STATE_CHANGED);
        this.mPhonenumber_intent = new Intent(ACTION_PHONE_NUMBER_CHANGED);
        this.mATCmdWarning_intent = new Intent(ACTION_BLUETOOTH_AT_CMD_WARNING);
        this.mAGVolume_intent = new Intent(ACTION_AG_VOLUME_CHANGED);
        this.mAGMicGain_intent = new Intent(ACTION_AG_MIC_GAIN_CHANGED);
        this.mIndicatorControl_intent = new Intent(ACTION_INDICATORCONTROL_CHANGED);
        this.mPhoneIdentification_intent = new Intent(ACTION_PHONEIDENTIFICATION_CHANGED);
        initializeAtParser();
        if (bluetoothCapable) {
            resetAtState();
        }
    }

    protected void initializeAtParser() {
        mHfAtParser = new BluetoothHfAtParser();
    }

    public static BluetoothHfAtParser getAtParser() {
        return mHfAtParser;
    }

    synchronized void resetAtState() {
        mRemoteBrsf = 0;
    }

    public static boolean isLocalDeviceSupportThreeWayCall() {
        if ((mLocalBrsf & 2) != 0) {
            return true;
        }
        return false;
    }

    public boolean isRemoteDeviceSupportECNR() {
        if ((mRemoteBrsf & 2) != 0) {
            return true;
        }
        return false;
    }

    public boolean isRemoteDeviceSupportInBandRing() {
        if ((mRemoteBrsf & 8) != 0) {
            return true;
        }
        return false;
    }

    public static boolean isRemoteDeviceSupportThreeWayCall() {
        if ((mRemoteBrsf & 1) != 0) {
            return true;
        }
        return false;
    }

    public boolean isRemoteDeviceSupportEnhanceCallStatus() {
        if ((mRemoteBrsf & 64) != 0) {
            return true;
        }
        return false;
    }

    public boolean isRemoteDeviceSupportEnhanceCallControl() {
        if ((mRemoteBrsf & 128) != 0) {
            return true;
        }
        return false;
    }

    public static boolean isRemoteDeviceSupportVoiceRecognition() {
        if ((mRemoteBrsf & 4) != 0) {
            return true;
        }
        return false;
    }

    public static boolean isRemoteDeviceSupportCodecNegotiation() {
        if ((mRemoteBrsf & 512) != 0) {
            return true;
        }
        return false;
    }

    public static boolean isLocalDeviceSupportCodecNegotiation() {
        return (mLocalBrsf & 128) != 0;
    }

    public static int getHfAtCmdResult() {
        return mHfAtCmdResult;
    }

    public static void clearHfAtCmdResult() {
        mHfAtCmdResult = 2;
    }

    public static void HfAtCmdQuerySupportFeatures() {
        sendURC("AT+BRSF=" + mLocalBrsf);
    }

    public static void HfAtCmdQueryCalllist() {
        sendURC("AT+CLCC");
    }

    public static void HfAtCmdTestallHeld() {
        sendURC("AT+CHLD=?");
    }

    public static void HfAtCmdTestCIND() {
        sendURC("AT+CIND=?");
    }

    public static void HfAtCmdReadCIND() {
        sendURC("AT+CIND?");
    }

    public static void HfAtCmdReadCGMM() {
        sendURC("AT+CGMM");
    }

    public static void HfAtCmdReadCGMI() {
        sendURC("AT+CGMI");
    }

    public static void HSAtCmdAcceptIncommingCall() {
        sendURC("AT+CKPD=200");
    }

    public static void HfAtCmdSetBVRA(boolean isAcitvate) {
        if (isAcitvate) {
            sendURC("AT+BVRA=1");
        } else {
            sendURC("AT+BVRA=0");
        }
    }

    public static void HfAtCmdSetCCWA(boolean isActivate) {
        if (isActivate) {
            sendURC("AT+CCWA=1");
        } else {
            sendURC("AT+CCWA=0");
        }
    }

    public static void HfAtCmdSetCMER(boolean isAcitvate) {
        if (isAcitvate) {
            sendURC("AT+CMER=3,0,0,1");
        } else {
            sendURC("AT+CMER=3,0,0,0");
        }
    }

    public static void HfAtCmdSetIndicator() {
        sendURC("AT+BIA=1,1,1,1,1,1,1");
    }

    public static void HfAtCmdClearCLIPPhoneNumber() {
        mClipPhoneNumber = "unkown";
    }

    public static String getCLIPPhoneNumber() {
        if (DEBUG) {
            log("getCLIPPhoneNumber");
        }
        return mClipPhoneNumber;
    }

    public static void HfAtCmdSetCLIP(boolean isAcitvate) {
        if (isAcitvate) {
            sendURC("AT+CLIP=1");
        } else {
            sendURC("AT+CLIP=0");
        }
    }

    public void HfAtCmdDialNumber(String phone_number) {
        if (phone_number != null) {
            sendURC("ATD" + phone_number);
        }
    }

    public static void HfAtCmdCodecSelected(int codecID) {
        sendURC("AT+BCS=" + codecID);
    }

    public static void HfAtCmdAvialableCodecs() {
        sendURC("AT+BAC=1,2");
    }

    private void parsingCIND(String CindResponse) {
        int CurrentIndex = 0;
        int i = 0;
        while (i < CindResponse.length()) {
            if (CindResponse.charAt(i) == '\"') {
                int j = CindResponse.indexOf(34, i + 1);
                if (j == -1) {
                    break;
                }
                CurrentIndex++;
                String CindName = CindResponse.substring(i + 1, j);
                i = j + 1;
                int cind_index = 0;
                while (cind_index < CIND_Resp_Str.length) {
                    if (!CindName.contains(CIND_Resp_Str[cind_index])) {
                        cind_index++;
                    } else if (cind_index == 0) {
                        this.mServiceCIEVIndex = CurrentIndex;
                    } else if (cind_index == 1) {
                        this.mCallsetupCIEVIndex = CurrentIndex;
                    } else if (cind_index != 2) {
                        if (cind_index == 3) {
                            this.mCallheldCIEVIndex = CurrentIndex;
                        } else if (cind_index == 4) {
                            this.mCallCIEVIndex = CurrentIndex;
                        } else if (cind_index == 5) {
                            this.mSignalCIEVIndex = CurrentIndex;
                        } else if (cind_index == 6) {
                            this.mRoamCIEVIndex = CurrentIndex;
                        } else if (cind_index == 7) {
                            this.mBattchgCIEVIndex = CurrentIndex;
                        }
                    }
                }
            }
            i++;
        }
        if (DEBUG) {
            Log.i(TAG, "parsingCIND: " + this.mServiceCIEVIndex + this.mCallCIEVIndex + this.mCallsetupCIEVIndex + this.mCallheldCIEVIndex + this.mSignalCIEVIndex + this.mRoamCIEVIndex + this.mBattchgCIEVIndex);
        }
    }

    private void CindIndexParser(Object[] args) {
        StringBuffer sbCind = new StringBuffer();
        for (Object obj : args) {
            sbCind.append(obj + ",");
        }
        this.mServiceCIEVIndex = 0;
        this.mCallCIEVIndex = 0;
        this.mCallsetupCIEVIndex = 0;
        this.mCallheldCIEVIndex = 0;
        this.mSignalCIEVIndex = 0;
        this.mRoamCIEVIndex = 0;
        this.mBattchgCIEVIndex = 0;
        parsingCIND(sbCind.toString());
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

    public void initializeHfAtParser() {
        if (DEBUG) {
            log("Registering Handsfree AT commands");
        }
        BluetoothHfAtParser parser = getAtParser();
        parser.register("OK", new C00431());
        parser.register("ERROR", new C00442());
        parser.register("NO CARRIER", new C00453());
        parser.register("RING", new C00464());
        parser.register("+CIEV", new C00475());
        parser.register("+BRSF", new C00486());
        parser.register("+BCS", new C00497());
        parser.register("+BSIR", new C00508());
        parser.register("+CCWA", new C00519());
        parser.register("+CMEE", new HfAtCommandHandler() {
            public void handleResponseCode(Object[] args) {
                if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("[ATCMD] +CMEE  args =");
                }
            }
        });
        parser.register("+CIND", new HfAtCommandHandler() {
            public void handleResponseCode(Object[] args) {
                if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("[ATCMD] +CIND  args =" + args.length);
                }
                int cindIndex = 0;
                int[] cindVals = new int[args.length];
                if (args.length < 1 || !(args[0] instanceof Integer)) {
                    BluetoothHfAtHandler.this.CindIndexParser(args);
                    return;
                }
                if (args.length >= BluetoothHfAtHandler.this.mCallCIEVIndex && BluetoothHfAtHandler.this.mCallCIEVIndex > 0) {
                    cindIndex = 0 | (1 << BluetoothHfAtHandler.this.mCallCIEVIndex);
                    cindVals[BluetoothHfAtHandler.this.mCallCIEVIndex - 1] = ((Integer) args[BluetoothHfAtHandler.this.mCallCIEVIndex - 1]).intValue();
                }
                if (args.length >= BluetoothHfAtHandler.this.mCallsetupCIEVIndex && BluetoothHfAtHandler.this.mCallsetupCIEVIndex > 0) {
                    cindIndex |= 1 << BluetoothHfAtHandler.this.mCallsetupCIEVIndex;
                    cindVals[BluetoothHfAtHandler.this.mCallsetupCIEVIndex - 1] = ((Integer) args[BluetoothHfAtHandler.this.mCallsetupCIEVIndex - 1]).intValue();
                }
                if (args.length >= BluetoothHfAtHandler.this.mSignalCIEVIndex && BluetoothHfAtHandler.this.mSignalCIEVIndex > 0) {
                    cindIndex |= 1 << BluetoothHfAtHandler.this.mSignalCIEVIndex;
                    cindVals[BluetoothHfAtHandler.this.mSignalCIEVIndex - 1] = ((Integer) args[BluetoothHfAtHandler.this.mSignalCIEVIndex - 1]).intValue();
                }
                if (args.length >= BluetoothHfAtHandler.this.mBattchgCIEVIndex && BluetoothHfAtHandler.this.mBattchgCIEVIndex > 0) {
                    cindIndex |= 1 << BluetoothHfAtHandler.this.mBattchgCIEVIndex;
                    cindVals[BluetoothHfAtHandler.this.mBattchgCIEVIndex - 1] = ((Integer) args[BluetoothHfAtHandler.this.mBattchgCIEVIndex - 1]).intValue();
                }
                if (args.length >= BluetoothHfAtHandler.this.mServiceCIEVIndex && BluetoothHfAtHandler.this.mServiceCIEVIndex > 0) {
                    cindIndex |= 1 << BluetoothHfAtHandler.this.mServiceCIEVIndex;
                    cindVals[BluetoothHfAtHandler.this.mServiceCIEVIndex - 1] = ((Integer) args[BluetoothHfAtHandler.this.mServiceCIEVIndex - 1]).intValue();
                }
                if (args.length >= BluetoothHfAtHandler.this.mRoamCIEVIndex && BluetoothHfAtHandler.this.mRoamCIEVIndex > 0) {
                    cindIndex |= 1 << BluetoothHfAtHandler.this.mRoamCIEVIndex;
                    cindVals[BluetoothHfAtHandler.this.mRoamCIEVIndex - 1] = ((Integer) args[BluetoothHfAtHandler.this.mRoamCIEVIndex - 1]).intValue();
                }
                BluetoothHfAtHandler.this.updateIndication(cindIndex, cindVals);
            }
        });
        parser.register("+CGMM", new HfAtCommandHandler() {
            public void handleResponseCode(Object[] args) {
                if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("[ATCMD] +CGMM  length =" + args.length);
                }
                if (args.length >= 1) {
                    String phone_identification = BluetoothHfAtHandler.combineArgs(args);
                    if (BluetoothHfAtHandler.DEBUG) {
                        BluetoothHfAtHandler.log("[ATCMD] +CGMM  args =" + phone_identification);
                    }
                    BluetoothHfAtHandler.mSerial = phone_identification;
                    BluetoothHfAtHandler.this.mPhoneIdentification_intent.putExtra(BluetoothHfAtHandler.EXTRA_NEW_PHONEIDENTIFICATION, phone_identification);
                    BluetoothHfAtHandler.this.mContext.sendBroadcast(BluetoothHfAtHandler.this.mPhoneIdentification_intent);
                } else if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("invalid CGMM data");
                }
            }
        });
        parser.register("+CGMI", new HfAtCommandHandler() {
            public void handleResponseCode(Object[] args) {
                if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("[ATCMD] +CGMI  length =" + args.length);
                }
                if (args.length >= 1) {
                    String phone_identification = BluetoothHfAtHandler.combineArgs(args);
                    if (BluetoothHfAtHandler.DEBUG) {
                        BluetoothHfAtHandler.log("[ATCMD] +CGMI  args =" + phone_identification);
                    }
                    BluetoothHfAtHandler.mFactory = phone_identification;
                } else if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("invalid CGMI data");
                }
            }
        });
        parser.register("+BINP", new HfAtCommandHandler() {
            public void handleResponseCode(Object[] args) {
                if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("[ATCMD] +BINP  args =" + args);
                }
            }
        });
        parser.register("+VTS", new HfAtCommandHandler() {
            public void handleResponseCode(Object[] args) {
                if (args.length >= 1) {
                    char c;
                    if (args[0] instanceof Integer) {
                        c = ((Integer) args[0]).toString().charAt(0);
                    } else {
                        c = ((String) args[0]).charAt(0);
                    }
                    if (!isValidDtmf(c)) {
                    }
                }
            }

            private boolean isValidDtmf(char c) {
                switch (c) {
                    case '#':
                    case '*':
                        return true;
                    default:
                        return Character.digit(c, 14) != -1;
                }
            }
        });
        parser.register("+CHLD", new HfAtCommandHandler() {
            public void handleResponseCode(Object[] args) {
                if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("[ATCMD] +CHLD ");
                }
            }
        });
        parser.register("+BTRH", new HfAtCommandHandler() {
            public void handleResponseCode(Object[] args) {
                if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("[ATCMD] +BTRH ");
                }
            }
        });
        parser.register("+CLIP", new HfAtCommandHandler() {
            public void handleResponseCode(Object[] args) {
                if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("[ATCMD] +CLIP  args =");
                }
                if (args.length > 1) {
                    String outputStr = BluetoothHfAtHandler.this.parserUseableString(args[0].toString());
                    if (outputStr != null) {
                        String new_phone_number = outputStr;
                        String format_type = args[1].toString();
                        if (BluetoothHfAtHandler.DEBUG) {
                            BluetoothHfAtHandler.log("[ATCMD] +CLIP  phone number is :" + new_phone_number + "format is" + format_type);
                        }
                        BluetoothHfAtHandler.mClipPhoneNumber = new_phone_number;
                        BluetoothHfAtHandler.this.mPhonenumber_intent.putExtra(BluetoothHfAtHandler.EXTRA_NEW_PHONE_NUMBER, BluetoothHfAtHandler.mClipPhoneNumber);
                        BluetoothHfAtHandler.this.mContext.sendBroadcast(BluetoothHfAtHandler.this.mPhonenumber_intent);
                        if (BluetoothHfAtHandler.DEBUG) {
                            BluetoothHfAtHandler.log("[ATCMD] +CLIP  update ");
                        }
                    } else if (BluetoothHfAtHandler.DEBUG) {
                        BluetoothHfAtHandler.log("invalid CLIP phone number");
                    }
                } else if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("invalid CLIP data");
                }
            }
        });
        parser.register("+VGM", new HfAtCommandHandler() {
            public void handleResponseCode(Object[] args) {
                if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("[ATCMD] +VGM ");
                }
                if (args.length == 1 && (args[0] instanceof Integer)) {
                    BluetoothHfAtHandler.this.mAGMicGain = ((Integer) args[0]).intValue();
                    BluetoothHfAtHandler.this.mAGMicGain_intent.putExtra(BluetoothHfAtHandler.EXTRA_NEW_AG_MIC_GAIN, BluetoothHfAtHandler.this.mAGMicGain);
                    BluetoothHfAtHandler.this.mContext.sendBroadcast(BluetoothHfAtHandler.this.mAGMicGain_intent);
                }
            }
        });
        parser.register("+VGS", new HfAtCommandHandler() {
            public void handleResponseCode(Object[] args) {
                if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("[ATCMD] +VGS ");
                }
                if (args.length == 1 && (args[0] instanceof Integer)) {
                    BluetoothHfAtHandler.this.mAGSpeakerGain = ((Integer) args[0]).intValue();
                    BluetoothHfAtHandler.this.mAGVolume_intent.putExtra(BluetoothHfAtHandler.EXTRA_NEW_AG_VOLUME, BluetoothHfAtHandler.this.mAGSpeakerGain);
                    BluetoothHfAtHandler.this.mContext.sendBroadcast(BluetoothHfAtHandler.this.mAGVolume_intent);
                }
            }
        });
        parser.register("+CLCC", new HfAtCommandHandler() {
            public void handleResponseCode(Object[] args) {
                if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("[ATCMD] +CLCC  length = " + args.length);
                }
                if (args.length >= 7) {
                    BluetoothHfAtHandler.this.mClcc_idx = ((Integer) args[0]).intValue();
                    if (args[1] instanceof Integer) {
                        BluetoothHfAtHandler.this.mClcc_dir = ((Integer) args[1]).intValue();
                    }
                    if (args[2] instanceof Integer) {
                        BluetoothHfAtHandler.this.mClcc_status = ((Integer) args[2]).intValue();
                    }
                    if (args[3] instanceof Integer) {
                        BluetoothHfAtHandler.this.mClcc_mode = ((Integer) args[3]).intValue();
                    }
                    if (args[4] instanceof Integer) {
                        BluetoothHfAtHandler.this.mClcc_mprty = ((Integer) args[4]).intValue();
                    }
                    BluetoothHfAtHandler.this.mClcc_number = BluetoothHfAtHandler.this.parserUseableString(args[5].toString());
                    if (args[6] instanceof Integer) {
                        BluetoothHfAtHandler.this.mClcc_type = ((Integer) args[6]).intValue();
                    }
                    BluetoothHfAtHandler.this.mPhonenumber_intent.putExtra(BluetoothHfAtHandler.EXTRA_NEW_PHONE_NUMBER, BluetoothHfAtHandler.this.mClcc_number);
                    BluetoothHfAtHandler.this.mContext.sendBroadcast(BluetoothHfAtHandler.this.mPhonenumber_intent);
                    if (BluetoothHfAtHandler.DEBUG) {
                        BluetoothHfAtHandler.log("[ATCMD] CLCC update " + BluetoothHfAtHandler.this.mClcc_idx + BluetoothHfAtHandler.this.mClcc_dir + BluetoothHfAtHandler.this.mClcc_status + BluetoothHfAtHandler.this.mClcc_number + BluetoothHfAtHandler.this.mClcc_type);
                    }
                } else if (BluetoothHfAtHandler.DEBUG) {
                    BluetoothHfAtHandler.log("[ATCMD] +CLCC  invalid  ");
                }
            }
        });
    }

    private boolean HfPlayRingTone() {
        if (DEBUG) {
            log("HfPlayRingTone ");
        }
        Uri ringuri = RingtoneManager.getActualDefaultRingtoneUri(this.mContext, 1);
        if (ringuri != null) {
            if (DEBUG) {
                log("[ATCMD] play ring tone " + ringuri);
            }
            mCurrentRingtone = RingtoneManager.getRingtone(this.mContext, ringuri);
            if (mCurrentRingtone != null) {
                mCurrentRingtone.play();
                return true;
            }
            if (DEBUG) {
                log("mCurrentRingtone is null ");
            }
            return false;
        }
        if (DEBUG) {
            log("ringuri is null ");
        }
        return false;
    }

    public static boolean HfStopRingTone() {
        if (DEBUG) {
            log("HfStopRingTone ");
        }
        if (mCurrentRingtone == null) {
            return false;
        }
        mCurrentRingtone.stop();
        mCurrentRingtone = null;
        return true;
    }

    public static boolean IsHfRingTonePlaying() {
        return mCurrentRingtone != null;
    }

    private String parserUseableString(String inputStr) {
        String outputString = null;
        for (int i = 0; i < inputStr.length(); i++) {
            if (inputStr.charAt(i) == '\"') {
                int j = inputStr.indexOf(34, i + 1);
                if (j == -1) {
                    break;
                }
                outputString = inputStr.substring(i + 1, j);
            }
        }
        return outputString;
    }

    private void updateIndication(int index, int[] vals) {
        if (!(((1 << this.mCallsetupCIEVIndex) & index) == 0 || mCallsetup == vals[this.mCallsetupCIEVIndex - 1])) {
            mCallsetup = vals[this.mCallsetupCIEVIndex - 1];
            if (DEBUG) {
                log("[ATCMD] Callsetup value=" + mCallsetup);
            }
            switch (mCallsetup) {
                case 0:
                    mClipPhoneNumber = BluetoothPbapClientPath.PBAP_ROOT_NAME;
                    if (IsHfRingTonePlaying()) {
                        HfStopRingTone();
                        break;
                    }
                    break;
                case 1:
                    mClipPhoneNumber = BluetoothPbapClientPath.PBAP_ROOT_NAME;
                    break;
                case 3:
                    break;
            }
            if (!IsHfRingTonePlaying()) {
                HfPlayRingTone();
            }
            this.mCallsetup_intent.putExtra(EXTRA_NEW_CALLSETUP_STATE, mCallsetup);
            this.mContext.sendBroadcast(this.mCallsetup_intent);
        }
        if (!(((1 << this.mCallCIEVIndex) & index) == 0 || mCall == vals[this.mCallCIEVIndex - 1])) {
            mCall = vals[this.mCallCIEVIndex - 1];
            if (DEBUG) {
                log("[ATCMD] Call=" + mCall + "stop alerting");
            }
            if (IsHfRingTonePlaying()) {
                HfStopRingTone();
            }
            this.mCall_intent.putExtra(EXTRA_NEW_CALL_STATE, mCall);
            this.mContext.sendBroadcast(this.mCall_intent);
        }
        if (!(((1 << this.mServiceCIEVIndex) & index) == 0 || mService == vals[this.mServiceCIEVIndex - 1])) {
            mService = vals[this.mServiceCIEVIndex - 1];
            this.mIndicatorControl_intent.putExtra(EXTRA_NEW_SERVICE, mService);
        }
        if (!(((1 << this.mSignalCIEVIndex) & index) == 0 || mSignal == vals[this.mSignalCIEVIndex - 1])) {
            mSignal = vals[this.mSignalCIEVIndex - 1];
            this.mIndicatorControl_intent.putExtra(EXTRA_NEW_SIGNAL, mSignal);
        }
        if (!(((1 << this.mBattchgCIEVIndex) & index) == 0 || mBattchg == vals[this.mBattchgCIEVIndex - 1])) {
            mBattchg = vals[this.mBattchgCIEVIndex - 1];
            this.mIndicatorControl_intent.putExtra(EXTRA_NEW_BATTCHG, mBattchg);
        }
        if (!(((1 << this.mRoamCIEVIndex) & index) == 0 || mRoam == vals[this.mRoamCIEVIndex - 1])) {
            mRoam = vals[this.mRoamCIEVIndex - 1];
            this.mIndicatorControl_intent.putExtra(EXTRA_NEW_SERVICE, mRoam);
        }
        if (((1 << this.mServiceCIEVIndex) & index) != 0 || ((1 << this.mSignalCIEVIndex) & index) != 0 || ((1 << this.mBattchgCIEVIndex) & index) != 0 || ((1 << this.mRoamCIEVIndex) & index) != 0) {
            this.mContext.sendBroadcast(this.mIndicatorControl_intent);
        }
    }

    public static boolean HfConnectProcess() {
        log(" HfConnectProcess start...");
        mCall = 0;
        mCallsetup = 0;
        mService = 0;
        mSignal = 0;
        mRoam = 0;
        mBattchg = 0;
        if (mhfservice.isWBSSupported()) {
            mLocalBrsf |= 128;
        } else {
            mLocalBrsf &= -129;
        }
        clearHfAtCmdResult();
        HfAtCmdQuerySupportFeatures();
        waitforHfCmdResult(20);
        if (isLocalDeviceSupportCodecNegotiation() && isRemoteDeviceSupportCodecNegotiation()) {
            HfAtCmdAvialableCodecs();
            waitforHfCmdResult(20);
        }
        HfAtCmdTestCIND();
        if (waitforHfCmdResult(40) == 1) {
            HfAtCmdReadCIND();
            waitforHfCmdResult(20);
            HfAtCmdSetCMER(true);
            waitforHfCmdResult(20);
            if (isLocalDeviceSupportThreeWayCall() && isRemoteDeviceSupportThreeWayCall()) {
                HfAtCmdTestallHeld();
                waitforHfCmdResult(20);
            }
            HfAtCmdSetCLIP(true);
            waitforHfCmdResult(20);
            HfAtCmdReadCGMM();
            waitforHfCmdResult(20);
            if (DEBUG) {
                log("HfConnect sucess");
            }
            return true;
        } else if (!DEBUG) {
            return false;
        } else {
            log(" HfConnect failure ");
            return false;
        }
    }

    public static int waitforHfCmdResult(int timedelay) {
        int CmdResult = 2;
        while (timedelay > 1) {
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            timedelay--;
            CmdResult = getHfAtCmdResult();
            if (CmdResult != 2) {
                clearHfAtCmdResult();
                break;
            }
        }
        if (timedelay > 1) {
            return CmdResult;
        }
        if (DEBUG) {
            log("hf cmd no response");
        }
        return 2;
    }

    public static boolean sendURC(String urc) {
        return mhfservice.sendHfURC(urc);
    }

    public static boolean isHfConnected() {
        return mhfservice.isHfConnected();
    }

    public static String getFactory() {
        if (DEBUG) {
            log("getFactory: " + mFactory);
        }
        return mFactory;
    }

    public static String getSerial() {
        if (DEBUG) {
            log("mSerial: " + mSerial);
        }
        return mSerial;
    }

    private static void log(String msg) {
        Log.d(TAG, msg);
    }
}
