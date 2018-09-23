package com.autochips.inputsource;

import android.cbm.CBManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Point;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;

public class HDMI extends InputSourceClient {
    public static final String ACTION_BTHID_CONNECT_STATE = "autochips.intent.action.CONNECT_STATE";
    public static final String ACTION_BTHID_RESOLUTION = "autochips.intent.action.RESOLUTION";
    public static final String ACTION_MHLHID_CONTROL_A2DP = "autochips.intent.action.CONTROL_A2DP";
    public static final String ACTION_MHLHID_CONTROL_DATA = "autochips.intent.action.CONTROL_DATA";
    public static final String ACTION_MHLHID_GET_CONNECT_STATE = "autochips.intent.action.GET_CONNECT_STATE";
    public static final String ACTION_MHLHID_GET_RESOLUTION = "autochips.intent.action.GET_RESOLUTION";
    public static final String ACTION_MHLHID_MOUSE_DATA = "autochips.intent.action.MOUSE_DATA";
    public static final String ACTION_MHLHID_NOTIFY_RESOLUTION = "autochips.intent.action.NOTIFY_RESOLUTION";
    public static final int CALIBRATION_POINT_NUM = 4;
    public static final int DEVICE_HDMI = 1;
    public static final int DEVICE_MHL = 2;
    public static final int DEVICE_NULL = 0;
    public static final int DEVICE_TYPE_CHANGE = 1001;
    public static final String HID_CMD = "HIDCmd";
    public static final String HID_CONNECT_STATE = "HidConnectState";
    public static final int HID_CONTROL_CMD_BACK = 4;
    public static final int HID_CONTROL_CMD_HOME = 1;
    public static final int HID_CONTROL_CMD_MENU = 16;
    public static final int HID_CONTROL_CMD_NEXT = 128;
    public static final int HID_CONTROL_CMD_PLAY_PAUSE = 32;
    public static final int HID_CONTROL_CMD_PREVIOUS = 64;
    public static final int HID_CONTROL_CMD_STOP = 256;
    public static final int HID_CONTROL_CMD_VOLUME_DOWN = 1024;
    public static final int HID_CONTROL_CMD_VOLUME_UP = 512;
    public static final int IS_CMD_ID_SEND_RCP = 1;
    public static final int MHL_BT_HID_MSG_BASE = 1000;
    public static final String MOUSE_BTN_DOWN = "ButtonDown";
    public static final String MOUSE_DATA_X = "CoordinateX";
    public static final String MOUSE_DATA_Y = "CoordinateY";
    private static final int ORGIN_POINT_IDX = 4;
    public static final int PHONE_ORIENTATION_CHANGE = 1002;
    public static final String PHONE_RESOLUTION = "PhoneResolution";
    public static final int RCP_KEY_ANGLE = 80;
    public static final int RCP_KEY_BACKWARD = 76;
    public static final int RCP_KEY_CHANNEL_DOWN = 49;
    public static final int RCP_KEY_CHANNEL_UP = 48;
    public static final int RCP_KEY_CLEAR = 44;
    public static final int RCP_KEY_CONTENTS_MENU = 11;
    public static final int RCP_KEY_DOT = 42;
    public static final int RCP_KEY_DOWN = 2;
    public static final int RCP_KEY_EJECT = 74;
    public static final int RCP_KEY_ENTER = 43;
    public static final int RCP_KEY_EXIT = 13;
    public static final int RCP_KEY_F1 = 113;
    public static final int RCP_KEY_F2 = 114;
    public static final int RCP_KEY_F3 = 115;
    public static final int RCP_KEY_F4 = 116;
    public static final int RCP_KEY_F5 = 117;
    public static final int RCP_KEY_FAST_FORWARD = 73;
    public static final int RCP_KEY_FAVORITE_MENU = 12;
    public static final int RCP_KEY_FORWARD = 75;
    public static final int RCP_KEY_HELP = 54;
    public static final int RCP_KEY_INPUT_SELECT = 52;
    public static final int RCP_KEY_INVAILD = 255;
    public static final int RCP_KEY_LEFT = 3;
    public static final int RCP_KEY_LEFT_DOWN = 8;
    public static final int RCP_KEY_LEFT_UP = 7;
    public static final int RCP_KEY_MUTE = 67;
    public static final int RCP_KEY_MUTE_FUNCTION = 101;
    public static final int RCP_KEY_NUMERIC0 = 32;
    public static final int RCP_KEY_NUMERIC1 = 33;
    public static final int RCP_KEY_NUMERIC2 = 34;
    public static final int RCP_KEY_NUMERIC3 = 35;
    public static final int RCP_KEY_NUMERIC4 = 36;
    public static final int RCP_KEY_NUMERIC5 = 37;
    public static final int RCP_KEY_NUMERIC6 = 38;
    public static final int RCP_KEY_NUMERIC7 = 39;
    public static final int RCP_KEY_NUMERIC8 = 40;
    public static final int RCP_KEY_NUMERIC9 = 41;
    public static final int RCP_KEY_PAGE_DOWN = 56;
    public static final int RCP_KEY_PAGE_UP = 55;
    public static final int RCP_KEY_PAUSE = 70;
    public static final int RCP_KEY_PAUSE_PLAY_FUNCTION = 97;
    public static final int RCP_KEY_PAUSE_RECORD_FUNCITON = 99;
    public static final int RCP_KEY_PLAY = 68;
    public static final int RCP_KEY_PLAY_FUNCTION = 96;
    public static final int RCP_KEY_PREVIOUS_CHANNEL = 50;
    public static final int RCP_KEY_RECORD = 71;
    public static final int RCP_KEY_RECORD_FUNCTION = 98;
    public static final int RCP_KEY_RESTORE_VOLUME_FUNCTION = 102;
    public static final int RCP_KEY_REWIND = 72;
    public static final int RCP_KEY_RIGHT = 4;
    public static final int RCP_KEY_RIGHT_DOWN = 6;
    public static final int RCP_KEY_RIGHT_UP = 5;
    public static final int RCP_KEY_ROOT_MENU = 9;
    public static final int RCP_KEY_SELECT = 0;
    public static final int RCP_KEY_SELECT_MEDIA_FUNCTION = 104;
    public static final int RCP_KEY_SETUP_MENU = 10;
    public static final int RCP_KEY_SHOW_INFORMATION = 53;
    public static final int RCP_KEY_SOUND_SELECT = 51;
    public static final int RCP_KEY_STOP = 69;
    public static final int RCP_KEY_STOP_FUNCTION = 100;
    public static final int RCP_KEY_SUBPICTURE = 81;
    public static final int RCP_KEY_TUNE_FUNCTION = 103;
    public static final int RCP_KEY_UP = 1;
    public static final int RCP_KEY_VENDOR_SPECIFIC = 126;
    public static final int RCP_KEY_VOLUME_DOWN = 66;
    public static final int RCP_KEY_VOLUME_UP = 65;
    public static final int RESOLUTION_UNKNOWN = 0;
    public static final int SIGNAL_CHANGE = 2;
    public static final int SIGNAL_LOST = 1;
    public static final int SIGNAL_READY = 0;
    private static final String TAG = "HDMI.JAVA";
    private static final Point[] calibratPoint = new Point[]{new Point(0, 0), new Point(0, 300), new Point(300, -300), new Point(0, 300), new Point(-1024, -1024)};
    private int[] carkitPoint = new int[4];
    BroadcastReceiver mBtHidListener = new C00831();
    private int mCalibrateNum = 0;
    Context mHDMIContext = null;
    private EventHandler mHDMIEventHandler;
    private boolean mIsBTHIDConnected = false;
    private boolean mIsCalibrate = false;
    private boolean mIsLandScape = false;
    private boolean mIsLastButton = false;
    private int mLastX = 0;
    private int mLastY = 0;
    private OnMHLPhoneSignalListener mOnMHLPhoneSignalListener;
    public int mPhoneResolutionIndex = 0;

    /* renamed from: com.autochips.inputsource.HDMI$1 */
    class C00831 extends BroadcastReceiver {
        C00831() {
        }

        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (action == null) {
                Log.i(HDMI.TAG, "mBtHidListener - action is null");
            } else if (HDMI.ACTION_BTHID_CONNECT_STATE.equals(action)) {
                HDMI.this.mIsBTHIDConnected = intent.getBooleanExtra(HDMI.HID_CONNECT_STATE, false);
                HDMI.this.mLastX = 0;
                HDMI.this.mLastY = 0;
                HDMI.this.mIsLastButton = false;
                if (HDMI.this.mIsBTHIDConnected && HDMI.this.SendMSGToQueryResolution()) {
                    Log.i(HDMI.TAG, "bt hid is connnet, query resolution ");
                }
                Log.i(HDMI.TAG, "mBtHidListener - ACTION_MHLHID_CONNECT_STATE mIsBTHIDConnected is " + HDMI.this.mIsBTHIDConnected);
            } else if (HDMI.ACTION_BTHID_RESOLUTION.equals(action)) {
                int PhoneIndex = intent.getIntExtra(HDMI.PHONE_RESOLUTION, 0);
                if (HDMI.this.mPhoneResolutionIndex != 0) {
                    HDMI.this.mPhoneResolutionIndex = PhoneIndex;
                    Log.i(HDMI.TAG, "mBtHidListener  ACTION_MHLHID_RESOLUTION mPhoneResolutionIndex is " + HDMI.this.mPhoneResolutionIndex);
                    HDMI.this.setPhoneResolution(HDMI.this.mPhoneResolutionIndex);
                }
                Log.i(HDMI.TAG, "mBtHidListener  ACTION_MHLHID_RESOLUTION mPhoneResolutionIndex is " + HDMI.this.mPhoneResolutionIndex);
            } else {
                Log.i(HDMI.TAG, "mBtHidListener - Unkown Action");
            }
        }
    }

    private class EventHandler extends Handler {
        private HDMI HDMI;

        public EventHandler(HDMI source, Looper looper) {
            super(looper);
            this.HDMI = source;
        }

        public void handleMessage(Message msg) {
            Log.i(HDMI.TAG, "InputSourceClient.java handleMessage msg:" + msg.what + ";param1:" + msg.arg1 + ";param2:" + msg.arg2);
            switch (msg.what) {
                case 1001:
                case 1002:
                    if (HDMI.this.mOnMHLPhoneSignalListener != null) {
                        HDMI.this.mOnMHLPhoneSignalListener.onMHLPhoneSignal(msg.what, msg.arg1, msg.arg2);
                        return;
                    } else {
                        Log.i(HDMI.TAG, "HDMI.java handleMessage mOnSignalListener not set so do not notify");
                        return;
                    }
                default:
                    return;
            }
        }
    }

    public interface OnMHLPhoneSignalListener {
        void onMHLPhoneSignal(int i, int i2, int i3);
    }

    private native int getCarKitMax(boolean z, boolean z2);

    private native boolean getPhoneInputValidDetect(int i, int i2, boolean z);

    private native int getPhoneMax(boolean z, boolean z2);

    private native int getPhoneResolution(int[] iArr, boolean z);

    private native int getPhoneX(int i, boolean z);

    private native int getPhoneY(int i, boolean z);

    private native int setPhoneResolution(int i);

    static {
        System.loadLibrary("mhlhid");
    }

    public void setOnMHLPhoneSignalListener(OnMHLPhoneSignalListener listener) {
        this.mOnMHLPhoneSignalListener = listener;
    }

    public HDMI(Context context) {
        try {
            mService = InputSourceClient.getService();
            if (mService != null) {
                this.mSource = mService.create(this);
                Log.e(TAG, "mSource:" + this.mSource);
            } else {
                Log.e(TAG, "construct mService get null");
            }
            this.mCBM = new CBManager();
            if (context != null) {
                this.mHDMIContext = context;
                Log.d(TAG, "mHDMIContext:" + this.mHDMIContext);
                IntentFilter filter = new IntentFilter();
                filter.addAction(ACTION_BTHID_CONNECT_STATE);
                filter.addAction(ACTION_BTHID_RESOLUTION);
                this.mHDMIContext.registerReceiver(this.mBtHidListener, filter);
                Looper looper = Looper.myLooper();
                if (looper != null) {
                    this.mHDMIEventHandler = new EventHandler(this, looper);
                    return;
                }
                looper = Looper.getMainLooper();
                if (looper != null) {
                    this.mHDMIEventHandler = new EventHandler(this, looper);
                    return;
                } else {
                    this.mHDMIEventHandler = null;
                    return;
                }
            }
            Log.e(TAG, "mHDMIContext is null");
        } catch (RemoteException e) {
            Log.d(TAG, "source create fail");
        }
    }

    public void release() {
        try {
            if (this.mSource == null) {
                Log.e(TAG, "release mSource null");
                return;
            }
            this.mSource.release();
            this.mCBM.release();
            this.mSource = null;
            this.mHDMIContext.unregisterReceiver(this.mBtHidListener);
            super.release();
        } catch (RemoteException e) {
            Log.e(TAG, "source release fail");
        }
    }

    public int setSource(int inputSrcType) {
        Log.d(TAG, "setSource inputSrcType:" + inputSrcType);
        int errors = 0;
        CBManager cBManager = this.mCBM;
        this.mSrcType = 13;
        try {
            if (this.mSource == null) {
                Log.e(TAG, "setSource mSource null");
                return InputSource.ERR_FAILED;
            }
            errors = this.mSource.setSource(inputSrcType, 0, 0);
            return errors;
        } catch (RemoteException e) {
            Log.d(TAG, "setsource fail!");
        }
    }

    public int sendRcp(int para) {
        int errors = 0;
        Log.d(TAG, "sendRcp");
        try {
            if (this.mSource == null) {
                Log.e(TAG, "sendRcp fail mSource null");
                return InputSource.ERR_FAILED;
            }
            errors = this.mSource.setCmd(1, para);
            return errors;
        } catch (RemoteException e) {
            Log.e(TAG, "sendRcp fail");
        }
    }

    public int getSignalStatus() {
        int[] status = new int[]{0, 0};
        Log.d(TAG, "get signal status");
        try {
            if (this.mSource == null) {
                Log.e(TAG, "sendRcp fail mSource null");
                return InputSource.ERR_FAILED;
            }
            this.mSource.getParam(5, status);
            Log.d(TAG, "status : " + status[0]);
            return status[0];
        } catch (RemoteException e) {
            Log.e(TAG, "get signal status fail");
        }
    }

    public int play() {
        Log.d(TAG, "HDMI play");
        return super.play();
    }

    public int stop() {
        Log.d(TAG, "HDMI stop");
        return super.stop();
    }

    public int notifymsg(int msg, int param1, int param2) {
        Log.i(TAG, "HDMI notify msg:" + msg + ";param1:" + param1 + ";param2:" + param2);
        if (this.mHDMIEventHandler != null) {
            Message m = this.mHDMIEventHandler.obtainMessage(msg, param1, param2, Integer.valueOf(0));
            switch (msg) {
                case 1001:
                    if (param1 == 2) {
                        SendMSGToQueryHIDConnection();
                    }
                    this.mHDMIEventHandler.sendMessage(m);
                    break;
                case 1002:
                    if (param1 == 0) {
                        this.mIsLandScape = false;
                    } else {
                        this.mIsLandScape = true;
                    }
                    this.mHDMIEventHandler.sendMessage(m);
                    Log.d(TAG, "HDMI notify msg:PHONE_ORIENTATION_CHANGE mIsLandScape is " + this.mIsLandScape);
                    break;
            }
        }
        return super.notifymsg(msg, param1, param2);
    }

    public boolean getBTHIDConnectState() {
        Log.i(TAG, "getBTHIDConnectStatus: mIsBTHIDConnected is " + this.mIsBTHIDConnected);
        return this.mIsBTHIDConnected;
    }

    public boolean getPhoneResolutionValid() {
        Log.i(TAG, "getPhoneResolutionIndex: mPhoneResolutionIndex is " + this.mPhoneResolutionIndex);
        if (this.mPhoneResolutionIndex == 0) {
            return false;
        }
        return true;
    }

    public void setCarkitPoint(int x, int y, int pointIndex) {
        Log.i(TAG, "setCarkitPoint[" + pointIndex + "]:(" + x + ", " + y + ")");
        switch (pointIndex) {
            case 1:
                this.carkitPoint[0] = (y << 16) | x;
                this.mCalibrateNum = 1;
                SendHIDMouseData(false, calibratPoint[1].x, calibratPoint[1].y);
                try {
                    Thread.sleep(10);
                } catch (Exception e) {
                    Log.e(TAG, "thread sleep exception = " + e);
                }
                SendHIDMouseData(false, 0, 0);
                try {
                    Thread.sleep(10);
                    return;
                } catch (Exception e2) {
                    Log.e(TAG, "thread sleep exception = " + e2);
                    return;
                }
            case 2:
                this.carkitPoint[1] = (y << 16) | x;
                this.mCalibrateNum = 2;
                SendHIDMouseData(false, calibratPoint[2].x, calibratPoint[2].y);
                try {
                    Thread.sleep(10);
                } catch (Exception e22) {
                    Log.e(TAG, "thread sleep exception = " + e22);
                }
                SendHIDMouseData(false, 0, 0);
                try {
                    Thread.sleep(10);
                    return;
                } catch (Exception e222) {
                    Log.e(TAG, "thread sleep exception = " + e222);
                    return;
                }
            case 3:
                this.carkitPoint[2] = (y << 16) | x;
                this.mCalibrateNum = 3;
                SendHIDMouseData(false, calibratPoint[3].x, calibratPoint[3].y);
                try {
                    Thread.sleep(10);
                } catch (Exception e2222) {
                    Log.e(TAG, "thread sleep exception = " + e2222);
                }
                SendHIDMouseData(false, 0, 0);
                try {
                    Thread.sleep(10);
                    return;
                } catch (Exception e22222) {
                    Log.e(TAG, "thread sleep exception = " + e22222);
                    return;
                }
            case 4:
                this.carkitPoint[3] = (y << 16) | x;
                this.mCalibrateNum = 4;
                return;
            default:
                return;
        }
    }

    public boolean getCalibrateResolutionValid() {
        if (this.mCalibrateNum < 4) {
            Log.e(TAG, "Don't Get Enough Calibrate Point");
            return false;
        }
        this.mPhoneResolutionIndex = getPhoneResolution(this.carkitPoint, this.mIsLandScape);
        if (this.mPhoneResolutionIndex != 0) {
            Log.d(TAG, "mPhoneResolutionIndex is " + this.mPhoneResolutionIndex);
            SendMSGToNotifyResolution(this.mPhoneResolutionIndex);
            this.mIsCalibrate = false;
            return true;
        }
        Log.e(TAG, "Calibrate Failed");
        this.mIsCalibrate = false;
        return false;
    }

    public void setCalibrate() {
        Log.d(TAG, "Calibrate Start");
        SendHIDMouseData(false, calibratPoint[4].x, calibratPoint[4].y);
        try {
            Thread.sleep(10);
        } catch (Exception e) {
            Log.e(TAG, "thread sleep exception = " + e);
        }
        SendHIDMouseData(false, calibratPoint[4].x, calibratPoint[4].y);
        try {
            Thread.sleep(10);
        } catch (Exception e2) {
            Log.e(TAG, "thread sleep exception = " + e2);
        }
        SendHIDMouseData(false, calibratPoint[0].x, calibratPoint[0].y);
        try {
            Thread.sleep(10);
        } catch (Exception e22) {
            Log.e(TAG, "thread sleep exception = " + e22);
        }
        SendHIDMouseData(false, 0, 0);
        try {
            Thread.sleep(10);
        } catch (Exception e222) {
            Log.e(TAG, "thread sleep exception = " + e222);
        }
        this.mIsCalibrate = true;
    }

    public void setPhoneOrientation(boolean isLandscape) {
        this.mIsLandScape = isLandscape;
        Log.d(TAG, "Phone Orientation isLandscape is " + isLandscape);
    }

    public void HandleMouseEvent(int touchEvent, int iX, int iY) {
        boolean bIsInputValid = getPhoneInputValidDetect(iX, iY, this.mIsLandScape);
        Log.d(TAG, "handleMouseEvent " + touchEvent);
        switch (touchEvent) {
            case 0:
            case 2:
                if (bIsInputValid) {
                    SendHIDMouseData(true, getPhoneX(iX - this.mLastX, this.mIsLandScape), getPhoneY(iY - this.mLastY, this.mIsLandScape));
                    if (!this.mIsLastButton) {
                        try {
                            Thread.sleep(10);
                        } catch (Exception e) {
                            Log.e(TAG, "thread sleep exception = " + e);
                        }
                    }
                    this.mLastX = iX;
                    this.mLastY = iY;
                    this.mIsLastButton = true;
                    return;
                }
                return;
            case 1:
                if (this.mIsLastButton) {
                    SendHIDMouseData(false, 0, 0);
                    SendHIDMouseData(false, getPhoneMax(true, this.mIsLandScape), getPhoneMax(false, this.mIsLandScape));
                }
                this.mLastX = getCarKitMax(true, this.mIsLandScape);
                this.mLastY = getCarKitMax(false, this.mIsLandScape);
                this.mIsLastButton = false;
                return;
            default:
                return;
        }
    }

    public boolean HandleButtonEvent(int cmd) {
        if (cmd >= 1 && cmd <= 1024) {
            return SendHIDControlData(cmd);
        }
        Log.e(TAG, "HandleButtonEvent - button Cmd " + cmd + " is not right");
        return false;
    }

    private boolean SendMSGToQueryHIDConnection() {
        if (this.mHDMIContext == null) {
            Log.e(TAG, "SendMSGToQueryHIDConnection - mHDMIContext is null");
            return false;
        }
        this.mHDMIContext.sendBroadcast(new Intent(ACTION_MHLHID_GET_CONNECT_STATE));
        return true;
    }

    private boolean SendMSGToQueryResolution() {
        if (this.mHDMIContext == null) {
            Log.e(TAG, "SendMSGToQueryResolution - mHDMIContext is null");
            return false;
        }
        this.mHDMIContext.sendBroadcast(new Intent(ACTION_MHLHID_GET_RESOLUTION));
        return true;
    }

    private boolean SendMSGToNotifyResolution(int PhoneResolution) {
        if (this.mHDMIContext == null) {
            Log.e(TAG, "SendMSGToQueryResolution - mHDMIContext is null");
            return false;
        }
        Intent intent = new Intent(ACTION_MHLHID_NOTIFY_RESOLUTION);
        intent.putExtra(PHONE_RESOLUTION, PhoneResolution);
        this.mHDMIContext.sendBroadcast(intent);
        return true;
    }

    private boolean SendHIDMouseData(boolean bIsBtnDown, int iX, int iY) {
        if (this.mHDMIContext == null) {
            Log.e(TAG, "SendMSGToQueryResolution - mHDMIContext is null");
            return false;
        }
        Intent intent = new Intent(ACTION_MHLHID_MOUSE_DATA);
        intent.putExtra(MOUSE_BTN_DOWN, bIsBtnDown);
        intent.putExtra(MOUSE_DATA_X, iX);
        intent.putExtra(MOUSE_DATA_Y, iY);
        this.mHDMIContext.sendBroadcast(intent);
        return true;
    }

    private boolean SendHIDControlData(int uCMD) {
        if (this.mHDMIContext == null) {
            Log.e(TAG, "SendMSGToQueryResolution - mHDMIContext is null");
            return false;
        }
        Intent intent = new Intent(ACTION_MHLHID_MOUSE_DATA);
        intent.putExtra(HID_CMD, uCMD);
        this.mHDMIContext.sendBroadcast(intent);
        return true;
    }
}
