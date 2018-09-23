package com.autochips.bluetooth.hf;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;
import java.util.HashMap;
import java.util.Timer;
import java.util.TimerTask;

public class BluetoothHfUtility {
    public static final String ACTION_CALL_STATE_CHANGE = "com.autochips.bluetooth.hf.BluetoothHfUtility.action.callStateChange";
    private static final boolean COMPLEMENT_3WAY_CALLING = false;
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugHF);
    public static final String EXTRA_CALL_STATE = "com.autochips.bluetooth.hf.BluetoothHfUtility.extra.callState";
    public static final int HFP_CONNECT_STATE_CONNECTED = 1;
    public static final int HFP_CONNECT_STATE_IDLE = 0;
    private static final int HFP_UTILITY_CALLHELD_VALUE_BOTH_ACTIVE_HOLD = 1;
    private static final int HFP_UTILITY_CALLHELD_VALUE_NO_HOLD = 0;
    private static final int HFP_UTILITY_CALLHELD_VALUE_ON_HOLD = 2;
    private static final int HFP_UTILITY_CALLSETUP_VALUE_ALERTING = 3;
    private static final int HFP_UTILITY_CALLSETUP_VALUE_INCOMING = 1;
    private static final int HFP_UTILITY_CALLSETUP_VALUE_NOT_SETUP = 0;
    private static final int HFP_UTILITY_CALLSETUP_VALUE_OUTGOING = 2;
    public static final int HFP_UTILITY_CALLSTATE_IDLE = 1;
    public static final int HFP_UTILITY_CALLSTATE_INCOMING = 2;
    public static final int HFP_UTILITY_CALLSTATE_OUTGOING = 3;
    public static final int HFP_UTILITY_CALLSTATE_SPEAKING = 4;
    private static final int HFP_UTILITY_CALL_VALUE_CALL_ACTIVE = 1;
    private static final int HFP_UTILITY_CALL_VALUE_NO_CALL = 0;
    private static final String TAG = "BluetoothHfUtility";
    private static final int TIMER_BROADCAST_CALLSTATE = 0;
    private static final int TIMER_QUERY_CALLINGNUMBER = 1;
    private static String mCallingNumber = BluetoothPbapClientPath.PBAP_ROOT_NAME;
    private int mBattchgValue = 0;
    private int mCallState = 1;
    private int mCallValue = 0;
    private int mCallheldValue = 0;
    private int mCallsetupValue = 0;
    private Context mContext = null;
    private int mHFConnectState = 0;
    private BluetoothHfAdapter mHfAdapter = null;
    private int mRoamValue = 0;
    private int mServiceValue = 0;
    private int mSignalValue = 0;
    private HashMap<Integer, TimerTask> mTaskList = null;
    private Timer mTimer = null;

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfUtility$1 */
    class C00671 extends TimerTask {
        C00671() {
        }

        public void run() {
            if (BluetoothHfUtility.DEBUG) {
                Log.d(BluetoothHfUtility.TAG, "TimerTask run: scheduleBroadcastCallState");
            }
            if (BluetoothHfUtility.DEBUG) {
                Log.i(BluetoothHfUtility.TAG, "broadcast call state. state = " + BluetoothHfUtility.this.mCallState);
            }
            Intent stateIntent = new Intent(BluetoothHfUtility.ACTION_CALL_STATE_CHANGE);
            stateIntent.putExtra(BluetoothHfUtility.EXTRA_CALL_STATE, BluetoothHfUtility.this.mCallState);
            if (BluetoothHfUtility.this.mContext != null) {
                BluetoothHfUtility.this.mContext.sendBroadcast(stateIntent);
            } else {
                Log.e(BluetoothHfUtility.TAG, "---------context is null------------");
            }
            BluetoothHfUtility.this.stopTimer(0);
        }
    }

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfUtility$2 */
    class C00682 extends TimerTask {
        C00682() {
        }

        public void run() {
            if (BluetoothHfUtility.DEBUG) {
                Log.d(BluetoothHfUtility.TAG, "TimerTask run: mTimerQueryCallingNumber");
            }
            if (BluetoothHfUtility.this.mHfAdapter != null) {
                BluetoothHfUtility.this.mHfAdapter.Bluetooth_Hf_QueryCalllist();
            } else {
                Log.e(BluetoothHfUtility.TAG, "---------hfAdapter is null------------");
            }
            BluetoothHfUtility.this.stopTimer(1);
        }
    }

    public BluetoothHfUtility(Context context, BluetoothHfAdapter hfAdapter) {
        if (DEBUG) {
            Log.i(TAG, "create instance");
        }
        this.mContext = context;
        if (this.mContext == null) {
            Log.e(TAG, "---------context is null------------");
        }
        this.mHfAdapter = hfAdapter;
        if (this.mContext == null) {
            Log.e(TAG, "---------hfAdapter is null------------");
        }
        reset();
    }

    public void reset() {
        if (DEBUG) {
            Log.i(TAG, "reset");
        }
        stopTimer(0);
        stopTimer(1);
        if (this.mCallState != 1) {
            if (DEBUG) {
                Log.i(TAG, "send call idle due to reset operation.");
            }
            Intent stateIntent = new Intent(ACTION_CALL_STATE_CHANGE);
            stateIntent.putExtra(EXTRA_CALL_STATE, 1);
            if (this.mContext != null) {
                this.mContext.sendBroadcast(stateIntent);
            } else {
                Log.e(TAG, "---------context is null------------");
            }
        }
        this.mServiceValue = 0;
        this.mCallValue = 0;
        this.mCallsetupValue = 0;
        this.mCallheldValue = 0;
        this.mSignalValue = 0;
        this.mRoamValue = 0;
        this.mBattchgValue = 0;
        this.mCallState = 1;
        mCallingNumber = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        this.mHFConnectState = 0;
    }

    public synchronized int getCallState() {
        return this.mCallState;
    }

    public synchronized String getCallingNumber() {
        return mCallingNumber;
    }

    public synchronized boolean setCallingNumber(String number) {
        boolean z = true;
        synchronized (this) {
            if (1 == this.mCallState) {
                z = false;
            } else {
                mCallingNumber = number;
            }
        }
        return z;
    }

    public synchronized void updateCallRelatedValue(int call, int callsetup, int callheld) {
        if (DEBUG) {
            Log.i(TAG, "updateCallRelatedValue");
        }
        if (DEBUG) {
            Log.i(TAG, "before update: call=" + this.mCallValue + ",callsetup=" + this.mCallsetupValue + ",callheld=" + this.mCallheldValue);
        }
        if (this.mCallValue != call || this.mCallsetupValue != callsetup || this.mCallheldValue != callheld) {
            this.mCallValue = call;
            this.mCallsetupValue = callsetup;
            this.mCallheldValue = callheld;
            onCallStateChange(judgeCallState(call, callsetup, callheld));
            if (DEBUG) {
                Log.i(TAG, "after update: call=" + this.mCallValue + ",callsetup=" + this.mCallsetupValue + ",callheld=" + this.mCallheldValue);
            }
        } else if (DEBUG) {
            Log.i(TAG, "identical values");
        }
    }

    public synchronized void updateCallValue(int call) {
        if (DEBUG) {
            Log.i(TAG, "updateCallValue");
        }
        if (DEBUG) {
            Log.i(TAG, "before update: call=" + this.mCallValue + ",callsetup=" + this.mCallsetupValue + ",callheld=" + this.mCallheldValue);
        }
        if (this.mCallValue != call) {
            int callState;
            this.mCallValue = call;
            if (this.mCallValue == 1 && call == 0 && this.mCallheldValue == 0) {
                callState = 1;
            } else {
                callState = judgeCallState(this.mCallValue, this.mCallsetupValue, this.mCallheldValue);
            }
            onCallStateChange(callState);
            if (DEBUG) {
                Log.i(TAG, "after update: call=" + this.mCallValue + ",callsetup=" + this.mCallsetupValue + ",callheld=" + this.mCallheldValue);
            }
        } else if (DEBUG) {
            Log.i(TAG, "identical value");
        }
    }

    public synchronized void updateCallsetupValue(int callsetup) {
        if (DEBUG) {
            Log.i(TAG, "updateCallsetupValue");
        }
        if (DEBUG) {
            Log.i(TAG, "before update: call=" + this.mCallValue + ",callsetup=" + this.mCallsetupValue + ",callheld=" + this.mCallheldValue);
        }
        if (this.mCallsetupValue != callsetup) {
            this.mCallsetupValue = callsetup;
            onCallStateChange(judgeCallState(this.mCallValue, this.mCallsetupValue, this.mCallheldValue));
            if (DEBUG) {
                Log.i(TAG, "after update: call=" + this.mCallValue + ",callsetup=" + this.mCallsetupValue + ",callheld=" + this.mCallheldValue);
            }
        } else if (DEBUG) {
            Log.i(TAG, "identical value");
        }
    }

    public synchronized void updateCallheldValue(int callheld) {
        if (DEBUG) {
            Log.i(TAG, "updateCallheldValue");
        }
        if (DEBUG) {
            Log.i(TAG, "before update: call=" + this.mCallValue + ",callsetup=" + this.mCallsetupValue + ",callheld=" + this.mCallheldValue);
        }
        if (this.mCallheldValue != callheld) {
            this.mCallheldValue = callheld;
            onCallStateChange(judgeCallState(this.mCallValue, this.mCallsetupValue, this.mCallheldValue));
            if (DEBUG) {
                Log.i(TAG, "after update: call=" + this.mCallValue + ",callsetup=" + this.mCallsetupValue + ",callheld=" + this.mCallheldValue);
            }
        } else if (DEBUG) {
            Log.i(TAG, "identical value");
        }
    }

    private synchronized void scheduleBroadcastCallState(long delayMS) {
        if (DEBUG) {
            Log.d(TAG, "scheduleBroadcastCallState, delay = " + delayMS);
        }
        stopTimer(0);
        startTimer(0, delayMS);
    }

    private synchronized void scheduleGetCallList(long delayMS) {
        if (DEBUG) {
            Log.d(TAG, "scheduleGetCallList, delay = " + delayMS);
        }
        stopTimer(1);
        startTimer(1, delayMS);
    }

    private synchronized void startTimer(int timer_type, long delayMS) {
        if (this.mTimer == null) {
            this.mTimer = new Timer();
        }
        if (this.mTaskList == null) {
            this.mTaskList = new HashMap();
        }
        if (this.mTaskList.get(Integer.valueOf(timer_type)) == null) {
            TimerTask Task = null;
            if (timer_type == 0) {
                Task = new C00671();
                this.mTimer.schedule(Task, delayMS);
            } else if (1 == timer_type) {
                Task = new C00682();
                this.mTimer.schedule(Task, delayMS);
            }
            if (Task != null) {
                this.mTaskList.put(Integer.valueOf(timer_type), Task);
            }
        } else if (DEBUG) {
            Log.w(TAG, "startTimer: already start!");
        }
    }

    private synchronized void stopTimer(int timer_type) {
        if (!(this.mTaskList == null || this.mTaskList.get(Integer.valueOf(timer_type)) == null)) {
            ((TimerTask) this.mTaskList.get(Integer.valueOf(timer_type))).cancel();
            this.mTaskList.remove(Integer.valueOf(timer_type));
            if (this.mTaskList.size() == 0) {
                this.mTimer.cancel();
                this.mTimer.purge();
                this.mTimer = null;
                this.mTaskList = null;
            }
        }
    }

    private int judgeCallState(int call, int callsetup, int callheld) {
        if (call != 0 || callheld != 0) {
            return 4;
        }
        if (callsetup == 1) {
            return 2;
        }
        if (callsetup == 2 || callsetup == 3) {
            return 3;
        }
        return 1;
    }

    private void onCallStateChange(int callState) {
        if (callState != this.mCallState) {
            int broadStateDelay = 100;
            switch (callState) {
                case 1:
                    mCallingNumber = BluetoothPbapClientPath.PBAP_ROOT_NAME;
                    break;
                case 2:
                case 3:
                case 4:
                    if (mCallingNumber.isEmpty()) {
                        if (1 != this.mHFConnectState) {
                            Log.e(TAG, "Call state change. HF not connected. now state is : " + this.mHFConnectState);
                            break;
                        }
                        scheduleGetCallList(50);
                        broadStateDelay = 600;
                        break;
                    }
                    break;
                default:
                    Log.e(TAG, "Call state change error. invalid state : " + callState);
                    return;
            }
            scheduleBroadcastCallState((long) broadStateDelay);
            this.mCallState = callState;
        }
    }

    public void updateHFConnectedState(int state) {
        if (state != this.mHFConnectState) {
            switch (state) {
                case 0:
                    break;
                case 1:
                    if (mCallingNumber.isEmpty() && this.mCallState != 1) {
                        scheduleGetCallList(50);
                        scheduleBroadcastCallState(600);
                        break;
                    }
                default:
                    Log.e(TAG, "HF connect state change error. invalid state : " + state);
                    return;
            }
            this.mHFConnectState = state;
        }
    }
}
