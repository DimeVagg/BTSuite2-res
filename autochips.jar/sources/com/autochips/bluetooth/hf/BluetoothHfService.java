package com.autochips.bluetooth.hf;

import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothProfileManager.Profile;
import android.bluetooth.IBluetoothHf;
import android.bluetooth.IBluetoothHf.Stub;
import android.cbm.CBManager;
import android.cbm.CBManager.OnActionListener;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.IBinder.DeathRecipient;
import android.os.Message;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.LocalBluetoothProfileManager;
import com.autochips.bluetooth.LocalBluetoothProfileManager.BTProfile;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class BluetoothHfService extends Service {
    public static final String ACTION_BLUETOOTH_HF_CONNECT_FINISH = "com.autochips.bluetooth.BtDialPadActivity.action.BLUETOOTH_HF_CONNECT_FINISH";
    public static final String ACTION_SCO_STATE_CHANGED = "com.autochips.bluetooth.BluetoothHfService.action.SCO_STATE_CHANGED";
    public static final String ACTION_SRVICE_CREATED = "com.autochips.bluetooth.BluetoothHfService.action.SRVICE_CREATED";
    private static final String BLUETOOTH_ADMIN_PERM = "android.permission.BLUETOOTH_ADMIN";
    private static final String BLUETOOTH_PERM = "android.permission.BLUETOOTH";
    public static final int BT_HF_STATE_AUDIO_RESET = 256;
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugHF);
    public static final int DIRECTION_INCOMING = 1;
    public static final int DIRECTION_OUTGOING = 2;
    public static final int EVENT_HF_SINK_AUDIO_RELEASE = 4;
    public static final int EVENT_HF_SINK_AUDIO_REQUEST = 3;
    public static final int EVENT_HF_SINK_SHUTDOWN = 2;
    public static final int EVENT_HF_SINK_STARTED = 1;
    public static final String EXTRA_BLUETOOTH_HF_CONNECTING_RESULT = "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_HF_CONNECTING_RESULT";
    public static final String EXTRA_NEW_SCO_STATE = "com.autochips.bluetooth.BluetoothHfService.extra.EXTRA_NEW_SCO_STATE";
    public static final int HFP_CONTEXT = 1;
    static final int HF_SCO_CONNECTED = 1;
    static final int HF_SCO_DISCONNECTED = 0;
    public static final int HSP_CONTEXT = 0;
    public static final int MANDATORY_SCO_CODEC_NARROW_BAND = 1;
    public static final int MANDATORY_SCO_CODEC_WIDE_BAND = 2;
    private static final String TAG = "BluetoothHfService";
    private static final boolean auto_accept_hf_connection = true;
    private static int sAtInputCount = 0;
    private BluetoothAdapter mAdapter;
    private String[] mAtBuf = new String[5];
    private int mBufCount;
    private volatile boolean mConnectInterrupted;
    private actionTimeoutThread mConnectTimeout = null;
    private BluetoothDevice mCurrentRemoteDevice;
    private int mDirection;
    private actionTimeoutThread mDisconnectTimeout = null;
    private BluetoothDevice mHandsfreeDevice;
    private BluetoothHfAtHandler mHfAtHandler;
    protected BluetoothHfAtParser mHfAtParser;
    private final Stub mHfBinder = new C00612();
    private Thread mHfConnectThead;
    Intent mHfConnect_finish_intent = new Intent(ACTION_BLUETOOTH_HF_CONNECT_FINISH);
    private Thread mHfListener;
    private final IBluetoothHfServerNotify.Stub mHfServerNotify = new C00623();
    private volatile boolean mInterrupted;
    private boolean mIsAudioEnable = false;
    private boolean mIsConnected;
    private boolean mIsStartEvent;
    private int mNativeData;
    private boolean mNativeSupportWBS = false;
    private BroadcastReceiver mReceiver = new C00645();
    private CBManager mSCOCBM = null;
    private OnActionListener mSCOCBMActionListener = new C00656();
    private boolean mSCOConnected;
    private int mScoState;
    private int mSelectedSCOCodec = 1;
    private int mServerState;
    private Handler mServiceHandler = new C00634();
    private boolean reconnectSuggestion = false;
    Intent sco_state_intent = new Intent(ACTION_SCO_STATE_CHANGED);
    Map<String, String> stateMap = new HashMap();
    Intent update_state_intent = new Intent(LocalBluetoothProfileManager.ACTION_PROFILE_STATE_UPDATE);

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfService$2 */
    class C00612 extends Stub {
        C00612() {
        }

        public boolean connect(BluetoothDevice device) throws RemoteException {
            BluetoothHfService.this.mCurrentRemoteDevice = device;
            String BT_Addr = device.getAddress();
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "BluetoothHfServer Connect" + BT_Addr);
            }
            BluetoothHfService.this.connectHfDevice(BT_Addr);
            return BluetoothHfService.auto_accept_hf_connection;
        }

        public boolean disconnect(BluetoothDevice device) throws RemoteException {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "BluetoothHfServer Disconnect");
            }
            BluetoothHfService.this.disconnectHfDevice(device.getAddress());
            BluetoothHfService.this.mCurrentRemoteDevice = null;
            return BluetoothHfService.auto_accept_hf_connection;
        }

        public boolean isConnected() throws RemoteException {
            return BluetoothHfService.this.mIsConnected;
        }

        public boolean sendURC(String urc) throws RemoteException {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "BluetoothHfServer sendURC");
            }
            return BluetoothHfService.this.sendHfURC(urc);
        }

        public int getState(BluetoothDevice device) throws RemoteException {
            if (BluetoothHfService.this.stateMap.isEmpty()) {
                return 2;
            }
            if (BluetoothHfService.this.stateMap.containsKey(device.getAddress())) {
                String tmpStr = ((String) BluetoothHfService.this.stateMap.get(device.getAddress())).toString();
                if (tmpStr.equals("connecting") || tmpStr.equals("authorize")) {
                    return 3;
                }
                if (tmpStr.equals("connected")) {
                    return 1;
                }
                if (tmpStr.equals("disconnect")) {
                    return 2;
                }
                if (tmpStr.equals("disconnecting")) {
                    return 4;
                }
            }
            return 2;
        }

        public BluetoothDevice[] getCurrentDevices() throws RemoteException {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "getCurrentDevices");
            }
            Set<BluetoothDevice> deviceList = new HashSet();
            Set<BluetoothDevice> pairedDevices = BluetoothAdapter.getDefaultAdapter().getBondedDevices();
            if (pairedDevices != null) {
                for (BluetoothDevice tmpDevice : pairedDevices) {
                    if (BluetoothHfService.this.stateMap.containsKey(tmpDevice.getAddress()) && ((String) BluetoothHfService.this.stateMap.get(tmpDevice.getAddress())).equals("connected")) {
                        deviceList.add(tmpDevice);
                    }
                }
            }
            if (BluetoothHfService.DEBUG) {
                Log.v(BluetoothHfService.TAG, "getCurrentDevices:deviceList.size=" + deviceList.size());
            }
            return (BluetoothDevice[]) deviceList.toArray(new BluetoothDevice[deviceList.size()]);
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfService$3 */
    class C00623 extends IBluetoothHfServerNotify.Stub {
        C00623() {
        }

        public boolean isHfPrfileConnected() throws RemoteException {
            return BluetoothHfService.this.mIsConnected;
        }

        public void DialNumber(String phone_number) {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "DialNumber: " + phone_number);
            }
            BluetoothHfService.this.sendHfURC("ATD" + phone_number + ";");
        }

        public void AcceptIncommingCall() {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "Answer Incomming Call: ");
            }
            if (!BluetoothHfService.this.sendHfURC("ATA")) {
                Log.w(BluetoothHfService.TAG, "call  answer send urc failure ");
            }
        }

        public void TerminatePhoneCall() {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "Terminate Phone Call: ");
            }
            if (!BluetoothHfService.this.sendHfURC("AT+CHUP")) {
                Log.w(BluetoothHfService.TAG, "Terminate PhoneCall send urc failure ");
            }
        }

        public void CallWait() {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "CallWait: ");
            }
            BluetoothHfService.this.sendHfURC("AT+CCWA=1");
        }

        public void CallHold(String index) {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "CallHold: ");
            }
            BluetoothHfService.this.sendHfURC("AT+CHLD=" + index);
        }

        public void SendDTMFCode(String dtmf_code) {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "Send DTMF : ");
            }
            BluetoothHfService.this.sendHfURC("AT+VTS=" + dtmf_code);
        }

        public void QuerySubcriberInfo() {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "Hold Call: ");
            }
            if (!BluetoothHfService.this.sendHfURC("AT+CNUM")) {
                Log.w(BluetoothHfService.TAG, "Query Subcriber Infomation send urc failure ");
            }
        }

        public boolean IsSCOConnected() {
            return BluetoothHfService.this.mSCOConnected;
        }

        public void SendBCCCode() {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "Send BCC : ");
            }
            BluetoothHfService.this.sendHfURC("AT+BCC");
        }

        public void SwithAudioTransfer(boolean btowards_AG) {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "Swith Audio Transfer ");
            }
            if (btowards_AG) {
                if (1 == BluetoothHfService.this.mScoState) {
                    Log.w(BluetoothHfService.TAG, "Transfer towards AG phone ");
                    BluetoothHfService.this.closeHandsfreeAudioNative();
                    BluetoothHfService.this.mScoState = 4;
                }
            } else if (2 == BluetoothHfService.this.mScoState) {
                Log.w(BluetoothHfService.TAG, "Transfer towards HF car");
                if (BluetoothHfService.auto_accept_hf_connection == BluetoothHfService.this.isUsingWideBandSpeech()) {
                    SendBCCCode();
                } else {
                    BluetoothHfService.this.connectHandsfreeAudioNative();
                }
                BluetoothHfService.this.mScoState = 3;
            }
        }

        public boolean Redial() {
            return BluetoothHfService.this.sendHfURC("AT+BLDN");
        }

        public boolean QueryCallList() {
            return BluetoothHfService.this.sendHfURC("AT+CLCC");
        }

        public boolean SetPhoneSpeakerGain(int speaker_gain) {
            if (speaker_gain > 15) {
                Log.i(BluetoothHfService.TAG, "[speaker gaiin too big  " + speaker_gain);
                speaker_gain = 15;
            } else if (speaker_gain < 0) {
                speaker_gain = 0;
            }
            return BluetoothHfService.this.sendHfURC("AT+VGS=" + speaker_gain);
        }

        public boolean handsfreeSinkSetPhoneMicGain(int mic_gain) {
            if (mic_gain > 15) {
                mic_gain = 15;
            } else if (mic_gain < 0) {
                mic_gain = 0;
            }
            return BluetoothHfService.this.sendHfURC("AT+VGM=" + mic_gain);
        }

        public void requestSCOSoundEnable(boolean fgEnable) {
            BluetoothHfService.this.requestCBMSCOEnable(fgEnable);
        }

        public int getHfCallValue() {
            return BluetoothHfAtHandler.mCall;
        }

        public int getHfCallsetupValue() {
            return BluetoothHfAtHandler.mCallsetup;
        }

        public String getCLIPPhoneNumber() {
            return BluetoothHfAtHandler.getCLIPPhoneNumber();
        }

        public boolean isRemoteDeviceSupportVoiceRecog() {
            return BluetoothHfAtHandler.isRemoteDeviceSupportVoiceRecognition();
        }

        public int sendATCommand(String atCmd, boolean wait) {
            BluetoothHfService.this.sendHfURC(atCmd);
            if (wait) {
                return BluetoothHfAtHandler.waitforHfCmdResult(10);
            }
            return 1;
        }

        public void hfAtCmdQueryCalllist() {
            BluetoothHfAtHandler.HfAtCmdQueryCalllist();
        }

        public void hfAtCmdQueryPhoneIndicator() {
            BluetoothHfAtHandler.HfAtCmdReadCIND();
        }

        public void hfAtCmdQueryPhoneIdentification() {
            BluetoothHfAtHandler.HfAtCmdReadCGMM();
        }

        public void enableVoiceRecognition(boolean fgEnable) {
            BluetoothHfAtHandler.HfAtCmdSetBVRA(fgEnable);
        }

        public void regClientBinder(IBinder cb) {
            try {
                cb.linkToDeath(new HfClientDeathHandler(cb), 0);
            } catch (RemoteException e) {
                Log.e(BluetoothHfService.TAG, "regClientBinder could not link to " + cb + " binder death.");
            }
        }

        public boolean getReconnectSuggestion() {
            return BluetoothHfService.this.reconnectSuggestion;
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfService$4 */
    class C00634 extends Handler {
        C00634() {
        }

        public void handleMessage(Message msg) {
            super.handleMessage(msg);
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "handleMessage(): " + msg.what);
            }
            try {
                Bundle data = msg.getData();
                String deviceAddr = data != null ? data.getString("device_addr") : null;
                BluetoothHfService.this.update_state_intent.putExtra("device_addr", deviceAddr);
                switch (msg.what) {
                    case -1:
                        BluetoothHfService.this.mServerState = -1;
                        BluetoothHfService.this.updateDeviceState(deviceAddr, "disconnect");
                        BluetoothHfService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 5);
                        BluetoothHfService.this.sendBroadcast(BluetoothHfService.this.update_state_intent, BluetoothHfService.BLUETOOTH_PERM);
                        return;
                    case 1:
                        BluetoothHfService.this.mServerState = 1;
                        BluetoothHfService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 1);
                        BluetoothHfService.this.sendBroadcast(BluetoothHfService.this.update_state_intent, BluetoothHfService.BLUETOOTH_PERM);
                        BluetoothHfService.this.killConnetTimeoutThread();
                        return;
                    case 2:
                        BluetoothHfService.this.mServerState = 2;
                        BluetoothHfService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 2);
                        BluetoothHfService.this.sendBroadcast(BluetoothHfService.this.update_state_intent, BluetoothHfService.BLUETOOTH_PERM);
                        BluetoothHfService.this.killDisconnetTimeoutThread();
                        return;
                    case 3:
                        BluetoothHfService.this.mServerState = 3;
                        BluetoothHfService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 3);
                        BluetoothHfService.this.sendBroadcast(BluetoothHfService.this.update_state_intent, BluetoothHfService.BLUETOOTH_PERM);
                        return;
                    case 4:
                        BluetoothHfService.this.mServerState = 4;
                        BluetoothHfService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 4);
                        BluetoothHfService.this.sendBroadcast(BluetoothHfService.this.update_state_intent, BluetoothHfService.BLUETOOTH_PERM);
                        return;
                    case 256:
                        if (deviceAddr.equals("0")) {
                            BluetoothHfService.this.setEnableSCOAudioNative(false);
                            return;
                        } else if (deviceAddr.equals("1")) {
                            BluetoothHfService.this.setEnableSCOAudioNative(BluetoothHfService.auto_accept_hf_connection);
                            return;
                        } else {
                            return;
                        }
                    default:
                        BluetoothHfService.this.mServerState = -1;
                        BluetoothHfService.this.updateDeviceState(deviceAddr, "disconnect");
                        BluetoothHfService.this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 5);
                        BluetoothHfService.this.sendBroadcast(BluetoothHfService.this.update_state_intent, BluetoothHfService.BLUETOOTH_PERM);
                        return;
                }
            } catch (Exception e) {
                if (BluetoothHfService.DEBUG) {
                    Log.i(BluetoothHfService.TAG, "hf stateMap error");
                }
                e.printStackTrace();
            }
            if (BluetoothHfService.DEBUG) {
                Log.i(BluetoothHfService.TAG, "hf stateMap error");
            }
            e.printStackTrace();
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfService$5 */
    class C00645 extends BroadcastReceiver {
        C00645() {
        }

        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            BluetoothDevice device = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            if ("android.bluetooth.device.action.BOND_STATE_CHANGED".equals(intent.getAction()) && intent.getIntExtra("android.bluetooth.device.extra.BOND_STATE", Integer.MIN_VALUE) == 10 && BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "BluetoothHfServer Disconnect");
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfService$6 */
    class C00656 implements OnActionListener {
        C00656() {
        }

        public int onAction(int command, int appScene, int priority) {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "onAction:cmd = " + command);
            }
            switch (command) {
                case 2:
                case 4:
                case 5:
                    BluetoothHfService.this.requestCBMSCOEnable(false);
                    break;
                case 3:
                case 6:
                    BluetoothHfService.this.requestCBMSCOEnable(BluetoothHfService.auto_accept_hf_connection);
                    break;
            }
            return 0;
        }
    }

    private class HfClientDeathHandler implements DeathRecipient {
        private IBinder mCb;

        HfClientDeathHandler(IBinder cb) {
            this.mCb = cb;
        }

        public void binderDied() {
            if (BluetoothHfService.DEBUG) {
                Log.d(BluetoothHfService.TAG, "HfClientDeathHandler:binderDied");
            }
            if (BluetoothHfService.this.mIsAudioEnable) {
                BluetoothHfService.this.requestCBMSCOEnable(false);
            }
            if (BluetoothHfAtHandler.IsHfRingTonePlaying()) {
                BluetoothHfAtHandler.HfStopRingTone();
            }
            if (BluetoothHfService.this.mIsConnected && BluetoothHfService.this.mHandsfreeDevice != null) {
                BluetoothHfService.this.disconnectHfDevice(BluetoothHfService.this.mHandsfreeDevice.getAddress());
            }
        }

        public IBinder getBinder() {
            return this.mCb;
        }
    }

    private class actionTimeoutThread extends Thread {
        public String BT_Addr;
        public String state;
        private boolean stoped = false;

        private actionTimeoutThread() {
        }

        public void run() {
            actionTimeout(this.BT_Addr, this.state);
        }

        public void shutdown() {
            this.stoped = BluetoothHfService.auto_accept_hf_connection;
        }

        private void actionTimeout(String BT_Addr, String state) {
            boolean timeout = false;
            int cnt = 0;
            if (BluetoothHfService.this.stateMap.containsKey(BT_Addr)) {
                while (!((String) BluetoothHfService.this.stateMap.get(BT_Addr)).equals(state) && !this.stoped) {
                    if (cnt >= 60000) {
                        timeout = BluetoothHfService.auto_accept_hf_connection;
                        break;
                    }
                    try {
                        Thread.sleep(100);
                    } catch (Exception e) {
                        if (BluetoothHfService.DEBUG) {
                            Log.e(BluetoothHfService.TAG, "Waiting for action was interrupted.");
                        }
                    }
                    cnt += 100;
                }
                if (timeout) {
                    if (BluetoothHfService.DEBUG) {
                        Log.w(BluetoothHfService.TAG, "Waiting action time-out. Force return.");
                    }
                    if (!state.equals("connected") && state.equals("disconnect")) {
                    }
                }
            } else if (BluetoothHfService.DEBUG) {
                Log.e(BluetoothHfService.TAG, "ERROR: stateMap not contain " + BT_Addr);
            }
        }
    }

    private native int acceptHandsfreeConnectionNative();

    private native void classInitHandsfreeNative();

    private native void cleanupHandsfreeNativeDataNative();

    private native void closeHandsfreeAudioNative();

    private native boolean connectHandsfreeAudioNative();

    private native int connectHandsfreeNative(String str, int i);

    private native void disconnectHandsfreeNative();

    private native void initializeHandsfreeNativeDataNative();

    private native void rejectHandsfreeConnectionNative();

    private native boolean selectSCOCodecNative(int i);

    private native boolean sendHandsfreeURCNative(String str);

    private native void setEnableSCOAudioNative(boolean z);

    private native void setHandsfreeEventNative(int i);

    private native boolean setUpHandsfreeListeningSocketsNative();

    private native void tearDownHandsfreeListeningSocketsNative();

    private native int waitForHandsfreeAsyncConnectNative(String str, int i, int i2);

    private native boolean waitForHandsfreeSinkIndicationNative();

    static {
        System.loadLibrary("exthf_jni");
    }

    private synchronized boolean startHfListenerThread() {
        boolean z = false;
        synchronized (this) {
            if (DEBUG) {
                Log.i(TAG, "[API] start");
            }
            if (this.mHfListener == null) {
                this.mHfListener = new Thread(TAG) {
                    public void run() {
                        if (BluetoothHfService.DEBUG) {
                            Log.i(BluetoothHfService.TAG, "Hf Listener Thread  starting");
                        }
                        while (!BluetoothHfService.this.mInterrupted) {
                            if (!BluetoothHfService.this.waitForHandsfreeSinkIndicationNative()) {
                                if (BluetoothHfService.DEBUG) {
                                    Log.d(BluetoothHfService.TAG, "HandsfreeSink Indication interrupted , exiting");
                                }
                                BluetoothHfService.this.mInterrupted = BluetoothHfService.auto_accept_hf_connection;
                                ActivityManager am = (ActivityManager) BluetoothHfService.this.getSystemService("activity");
                                MemoryInfo outInfo = new MemoryInfo();
                                am.getMemoryInfo(outInfo);
                                Log.e(BluetoothHfService.TAG, "system total memory is " + (outInfo.totalMem >> 10) + "k");
                                Log.e(BluetoothHfService.TAG, "system available memory is " + (outInfo.availMem >> 10) + "k");
                                if (BluetoothHfAtHandler.IsHfRingTonePlaying()) {
                                    BluetoothHfAtHandler.HfStopRingTone();
                                }
                                if (BluetoothHfService.this.mAdapter != null) {
                                    BluetoothHfService.this.mAdapter.reset();
                                }
                            }
                        }
                        if (BluetoothHfService.DEBUG) {
                            Log.d(BluetoothHfService.TAG, "Hf Connect Thread finished");
                        }
                    }
                };
                if (setUpHandsfreeListeningSocketsNative()) {
                    this.mInterrupted = false;
                    this.mHfListener.start();
                } else {
                    if (DEBUG) {
                        Log.e(TAG, "Could not set up listening socket, exiting");
                    }
                }
            }
            z = auto_accept_hf_connection;
        }
        return z;
    }

    private void killConnetTimeoutThread() {
        if (this.mConnectTimeout != null) {
            try {
                if (DEBUG) {
                    Log.i(TAG, "mConnectTimeout close.");
                }
                this.mConnectTimeout.shutdown();
                this.mConnectTimeout.join();
                this.mConnectTimeout = null;
                if (DEBUG) {
                    Log.i(TAG, "mConnectTimeout close OK.");
                }
            } catch (InterruptedException e) {
                if (DEBUG) {
                    Log.e(TAG, "mConnectTimeout close error.");
                }
            }
        }
    }

    private void killDisconnetTimeoutThread() {
        if (this.mDisconnectTimeout != null) {
            try {
                if (DEBUG) {
                    Log.i(TAG, "mDisconnectTimeout close.");
                }
                this.mDisconnectTimeout.shutdown();
                this.mDisconnectTimeout.join();
                this.mDisconnectTimeout = null;
                if (DEBUG) {
                    Log.i(TAG, "mDisconnectTimeout close OK.");
                }
            } catch (InterruptedException e) {
                if (DEBUG) {
                    Log.e(TAG, "mDisconnectTimeout close error.");
                }
            }
        }
    }

    private void connectHfDevice(String BT_Addr) {
        if (DEBUG) {
            Log.d(TAG, "connectHfDevice" + BT_Addr);
        }
        this.mDirection = 2;
        this.mServerState = 3;
        updateDeviceState(BT_Addr, "connecting");
        updateSettingsState("connecting", getBluetoothDevice(BT_Addr));
        int ret = connectHandsfreeNative(BT_Addr, 1);
        if (ret < 0 && DEBUG) {
            Log.e(TAG, "connectHandsfreeNative failure ,return value is" + ret);
        }
    }

    private void disconnectHfDevice(String BT_Addr) {
        if (this.stateMap.containsKey(BT_Addr)) {
            if (DEBUG) {
                Log.i(TAG, "disconnectHfDevice address = " + BT_Addr + ((String) this.stateMap.get(BT_Addr)));
            }
            if (((String) this.stateMap.get(BT_Addr)).equals("connected")) {
                this.mServerState = 4;
                updateDeviceState(BT_Addr, "disconnecting");
                updateSettingsState("disconnecting", getBluetoothDevice(BT_Addr));
                disconnectHandsfreeNative();
            } else if (DEBUG) {
                Log.e(TAG, "error state to disconnect");
            }
        }
    }

    private void updateSettingsState(String state, BluetoothDevice device) {
        Intent tmpInt = new Intent(LocalBluetoothProfileManager.ACTION_STATE_CHANGED);
        if (state.equals("connected")) {
            tmpInt.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 1);
            this.mAdapter.updateConnectionState(device, 1, 2, 1);
        } else if (state.equals("connecting")) {
            tmpInt.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 3);
            this.mAdapter.updateConnectionState(device, 1, 1, 0);
        } else if (state.equals("disconnect")) {
            tmpInt.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 2);
            this.mAdapter.updateConnectionState(device, 1, 0, 3);
        } else if (state.equals("disconnecting")) {
            tmpInt.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 4);
            this.mAdapter.updateConnectionState(device, 1, 3, 2);
        }
        tmpInt.putExtra("android.bluetooth.device.extra.DEVICE", device);
        tmpInt.putExtra(LocalBluetoothProfileManager.EXTRA_PREVIOUS_STATE, -1);
        tmpInt.putExtra("android.bluetooth.profilemanager.extra.PROFILE", Profile.Bluetooth_HF);
        tmpInt.putExtra(LocalBluetoothProfileManager.EXTRA_PROFILE, BTProfile.Bluetooth_HF);
        sendBroadcast(tmpInt);
        if (DEBUG) {
            Log.v(TAG, "sendBroadcast:" + state);
        }
    }

    private String getState(String BT_Addr) {
        if (!this.stateMap.isEmpty() && this.stateMap.containsKey(BT_Addr)) {
            return ((String) this.stateMap.get(BT_Addr)).toString();
        }
        return null;
    }

    public void onCreate() {
        if (DEBUG) {
            Log.i(TAG, "Enter onCreate");
        }
        this.mAdapter = BluetoothAdapter.getDefaultAdapter();
        this.mCurrentRemoteDevice = null;
        this.stateMap.clear();
        this.mServerState = 6;
        this.mSCOConnected = false;
        this.mScoState = 2;
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.bluetooth.device.action.BOND_STATE_CHANGED");
        registerReceiver(this.mReceiver, filter);
        this.mHfAtHandler = new BluetoothHfAtHandler(this, this);
        this.mHfAtParser = BluetoothHfAtHandler.getAtParser();
        this.mSCOCBM = new CBManager();
        if (this.mSCOCBM != null) {
            this.mSCOCBM.setOnActionListener(this.mSCOCBMActionListener);
        }
        localCreateService();
        super.onCreate();
        if (DEBUG) {
            Log.i(TAG, "on create finish");
        }
    }

    public void onDestroy() {
        if (DEBUG) {
            Log.i(TAG, "onDestroy()");
        }
        unregisterReceiver(this.mReceiver);
        if (this.mSCOCBM != null) {
            if (this.mIsAudioEnable) {
                requestCBMSCOEnable(false);
            }
            this.mSCOCBM = null;
        }
        localClearService();
        this.mCurrentRemoteDevice = null;
        super.onDestroy();
    }

    public void onTaskRemoved(Intent rootIntent) {
        if (DEBUG) {
            Log.d(TAG, "onTaskRemoved()");
        }
        super.onTaskRemoved(rootIntent);
        stopSelf();
    }

    void localCreateService() {
        if (DEBUG) {
            Log.i(TAG, "localCreateService mServerState = " + this.mServerState);
        }
        if (this.mServerState != 0) {
            this.update_state_intent.putExtra("android.bluetooth.profilemanager.extra.PROFILE", Profile.Bluetooth_HF);
            this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_PROFILE, BTProfile.Bluetooth_HF);
            this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 10);
            sendBroadcast(this.update_state_intent);
            classInitHandsfreeNative();
            initializeHandsfreeNativeDataNative();
            if (DEBUG) {
                Log.d(TAG, "start Hf Connect Thread");
            }
            if (startHfListenerThread()) {
                this.mServerState = 0;
                this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 11);
                sendBroadcast(this.update_state_intent);
            }
        }
    }

    void localClearService() {
        setHandsfreeEventNative(2);
        killConnetTimeoutThread();
        killDisconnetTimeoutThread();
        if (this.mHfListener != null) {
            if (DEBUG) {
                Log.i(TAG, "stopping Connect Thread");
            }
            this.mInterrupted = auto_accept_hf_connection;
            try {
                setHandsfreeEventNative(2);
                this.mHfListener.interrupt();
                if (DEBUG) {
                    Log.i(TAG, "waiting for thread to terminate");
                }
                this.mHfListener.join();
                this.mHfListener = null;
                if (BluetoothHfAtHandler.IsHfRingTonePlaying()) {
                    BluetoothHfAtHandler.HfStopRingTone();
                }
            } catch (InterruptedException e) {
                if (DEBUG) {
                    Log.e(TAG, "Interrupted waiting for Connect Thread to join");
                }
            }
            this.update_state_intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 13);
            sendBroadcast(this.update_state_intent);
            this.mServerState = 6;
        }
        tearDownHandsfreeListeningSocketsNative();
        cleanupHandsfreeNativeDataNative();
    }

    public IBinder onBind(Intent intent) {
        String action = intent.getAction();
        if (DEBUG) {
            Log.i(TAG, "Enter onBind(): " + action);
        }
        if (IBluetoothHf.class.getName().equals(action)) {
            return this.mHfBinder;
        }
        return this.mHfServerNotify;
    }

    public boolean isHfConnected() {
        return this.mIsConnected;
    }

    private void printLog(String msg) {
        if (DEBUG) {
            Log.i(TAG, msg);
        }
    }

    private void updateDeviceState(String deviceAddr, String state) {
        if (this.stateMap.containsKey(deviceAddr)) {
            this.stateMap.remove(deviceAddr);
        }
        this.stateMap.put(deviceAddr, state);
        if (state != null) {
            if (state.equals("connected")) {
                sendServiceMsg(1, deviceAddr);
            } else if (state.equals("disconnect")) {
                sendServiceMsg(2, deviceAddr);
            } else if (state.equals("connecting")) {
                sendServiceMsg(3, deviceAddr);
            } else if (state.equals("disconnecting")) {
                sendServiceMsg(4, deviceAddr);
            }
        }
    }

    private void sendServiceMsg(int what, String addr) {
        Message msg = Message.obtain();
        msg.what = what;
        Bundle data = new Bundle();
        data.putString("device_addr", addr);
        msg.setData(data);
        this.mServiceHandler.sendMessage(msg);
    }

    private BluetoothDevice getBluetoothDevice(String BT_Addr) {
        return BluetoothAdapter.getDefaultAdapter().getRemoteDevice(BT_Addr);
    }

    private BluetoothDevice getCurrentDevice() {
        return this.mCurrentRemoteDevice;
    }

    public void startEventThread() {
        this.mIsStartEvent = auto_accept_hf_connection;
        setHandsfreeEventNative(1);
    }

    public synchronized boolean sendHfURC(String urc) {
        boolean sendHandsfreeURCNative;
        if (DEBUG) {
            Log.i(TAG, "sendURC: " + urc);
        }
        if (urc.length() > 0) {
            sendHandsfreeURCNative = sendHandsfreeURCNative(urc);
        } else {
            sendHandsfreeURCNative = false;
        }
        return sendHandsfreeURCNative;
    }

    public void requestCBMSCOEnable(boolean fgEnable) {
        if (this.mIsAudioEnable == fgEnable && fgEnable == auto_accept_hf_connection && BluetoothHfAtHandler.mCall == 1) {
            resetScoAudio(auto_accept_hf_connection);
        }
        if (this.mIsAudioEnable != fgEnable) {
            if (fgEnable) {
                int cbmRet = -1;
                Parcel reply = Parcel.obtain();
                int ret = 0;
                try {
                    if (this.mSCOCBM != null) {
                        CBManager cBManager = this.mSCOCBM;
                        CBManager cBManager2 = this.mSCOCBM;
                        CBManager cBManager3 = this.mSCOCBM;
                        cbmRet = cBManager.request(2, 1, reply);
                    }
                    ret = reply.readInt();
                    if (DEBUG) {
                        Log.d(TAG, "mSCOCBM.request return = " + ret);
                    }
                    if (cbmRet != -1 && ret != 0 && ret == 1) {
                        if (BluetoothHfAtHandler.mCall == 1 || BluetoothHfAtHandler.mCallsetup != 1) {
                            resetScoAudio(auto_accept_hf_connection);
                        }
                        this.mIsAudioEnable = auto_accept_hf_connection;
                    }
                } finally {
                    reply.recycle();
                }
            } else {
                resetScoAudio(false);
                this.mIsAudioEnable = false;
                this.mSCOCBM.release();
            }
        }
    }

    private void resetScoAudio(boolean isEnable) {
        sendServiceMsg(256, isEnable ? "1" : "0");
    }

    protected synchronized void handleInput(String input) {
        if (DEBUG) {
            Log.i(TAG, "handleInput: " + input);
        }
        if (sAtInputCount == Integer.MAX_VALUE) {
            sAtInputCount = 0;
        } else {
            sAtInputCount++;
        }
        this.mHfAtParser.processHfAtCommands(input);
    }

    private synchronized boolean startHfConnectThread() {
        if (DEBUG) {
            Log.i(TAG, "startHfConnectThread start");
        }
        this.mHfConnectThead = new Thread(TAG) {
            public void run() {
                if (BluetoothHfService.DEBUG) {
                    Log.i(BluetoothHfService.TAG, "Hfp Connect Thread  starting");
                }
                while (!BluetoothHfService.this.mConnectInterrupted) {
                    int connect_result;
                    if (BluetoothHfAtHandler.HfConnectProcess()) {
                        connect_result = 1;
                    } else {
                        connect_result = 0;
                    }
                    BluetoothHfService.this.mHfConnect_finish_intent.putExtra(BluetoothHfService.EXTRA_BLUETOOTH_HF_CONNECTING_RESULT, connect_result);
                    BluetoothHfService.this.sendBroadcast(BluetoothHfService.this.mHfConnect_finish_intent);
                    BluetoothHfService.this.mConnectInterrupted = BluetoothHfService.auto_accept_hf_connection;
                }
                if (BluetoothHfService.DEBUG) {
                    Log.i(BluetoothHfService.TAG, "Hf Connect Thread finished");
                }
            }
        };
        this.mConnectInterrupted = false;
        this.mHfConnectThead.start();
        return auto_accept_hf_connection;
    }

    private synchronized void onHfConnectRequest(String address, int type) {
        if (DEBUG) {
            Log.i(TAG, "[API] onConnectRequest(" + address + "," + Integer.toString(type) + ")");
        }
        this.mDirection = 1;
        this.mHandsfreeDevice = this.mAdapter.getRemoteDevice(address);
        acceptHandsfreeConnectionNative();
        updateDeviceState(address, "connecting");
    }

    private synchronized void onHfConnected(String address, int type) {
        if (DEBUG) {
            Log.i(TAG, "[API] onConnected(" + address + "," + Integer.toString(type) + ")");
        }
        if (isWBSSupported()) {
            selectHFSCOCodecID(1);
        }
        startEventThread();
        this.mIsConnected = auto_accept_hf_connection;
        this.mHandsfreeDevice = this.mAdapter.getRemoteDevice(address);
        this.mHfAtHandler.initializeHfAtParser();
        startHfConnectThread();
        updateSettingsState("connected", getBluetoothDevice(address));
        updateDeviceState(address, "connected");
    }

    private synchronized void onHfDisconnected(String address, int type) {
        boolean z = auto_accept_hf_connection;
        synchronized (this) {
            if (DEBUG) {
                Log.i(TAG, "[API] onDisconnected(" + address + "," + Integer.toString(type) + ")");
            }
            this.mDirection = 0;
            this.mIsStartEvent = false;
            this.mBufCount = 0;
            this.mHandsfreeDevice = null;
            if (type != 1) {
                z = false;
            }
            this.reconnectSuggestion = z;
            this.mIsConnected = false;
            this.mSelectedSCOCodec = 1;
            updateSettingsState("disconnect", getBluetoothDevice(address));
            updateDeviceState(address, "disconnect");
            this.mHfAtHandler.resetAtState();
            if (BluetoothHfAtHandler.IsHfRingTonePlaying()) {
                BluetoothHfAtHandler.HfStopRingTone();
            }
        }
    }

    private synchronized void onHfSCOConnected() {
        if (DEBUG) {
            Log.i(TAG, "[API] onSCOConnected");
        }
        this.mSCOConnected = auto_accept_hf_connection;
        this.mScoState = 1;
        this.sco_state_intent.putExtra(EXTRA_NEW_SCO_STATE, 1);
        sendBroadcast(this.sco_state_intent);
    }

    private synchronized void onHfSCODisconnected() {
        if (DEBUG) {
            Log.i(TAG, "[API] onSCODisconnected");
        }
        this.mSCOConnected = false;
        this.mScoState = 2;
        this.sco_state_intent.putExtra(EXTRA_NEW_SCO_STATE, 0);
        sendBroadcast(this.sco_state_intent);
    }

    private void onHfPacketReceived(String atCmd) {
        Log.i(TAG, "[API] onPacketReceived(" + atCmd + ") : mIsStartEvent=" + String.valueOf(this.mIsStartEvent));
        if (this.mIsStartEvent) {
            handleInput(atCmd);
        } else if (this.mBufCount < this.mAtBuf.length) {
            String[] strArr = this.mAtBuf;
            int i = this.mBufCount;
            this.mBufCount = i + 1;
            strArr[i] = atCmd;
        } else if (DEBUG) {
            Log.w(TAG, "[ERR] Run out of AtBuf capacity");
        }
    }

    private void onHfEvent(int event) {
        if (DEBUG) {
            Log.i(TAG, "[API] onEvent(" + String.valueOf(event) + ")" + "mBufCount" + this.mBufCount);
        }
        switch (event) {
            case 1:
                if (this.mBufCount > 0) {
                    while (this.mBufCount > 0) {
                        String[] strArr = this.mAtBuf;
                        int i = this.mBufCount - 1;
                        this.mBufCount = i;
                        handleInput(strArr[i]);
                    }
                    return;
                }
                return;
            default:
                return;
        }
    }

    public boolean selectHFSCOCodecID(int codecID) {
        if (selectSCOCodecNative(codecID)) {
            this.mSelectedSCOCodec = codecID;
            return auto_accept_hf_connection;
        }
        this.mSelectedSCOCodec = 1;
        Log.e(TAG, " select codec failed. codec id = " + codecID);
        return false;
    }

    public boolean isWBSSupported() {
        return this.mNativeSupportWBS;
    }

    public boolean isUsingWideBandSpeech() {
        return this.mSelectedSCOCodec == 2 ? auto_accept_hf_connection : false;
    }
}
