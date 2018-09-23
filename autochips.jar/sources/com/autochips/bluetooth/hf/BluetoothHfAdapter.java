package com.autochips.bluetooth.hf;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Binder;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.hf.IBluetoothHfServerNotify.Stub;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;

public class BluetoothHfAdapter {
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugHF);
    public static final String HF_SERVICE_CLASS_NAME = "com.autochips.bluetooth.BluetoothHfService";
    private static final String TAG = "BluetoothHfAdapter";
    private static BluetoothHfAdapter mInstance = null;
    private final Context mContext;
    private IBluetoothHfServerNotify mHfServerNotify = null;
    private ServiceConnection mHfServerNotifyConnection = new C00421();
    private BluetoothHfUtility mHfUtility = null;

    /* renamed from: com.autochips.bluetooth.hf.BluetoothHfAdapter$1 */
    class C00421 implements ServiceConnection {
        C00421() {
        }

        public void onServiceConnected(ComponentName className, IBinder service) {
            if (BluetoothHfAdapter.DEBUG) {
                Log.w(BluetoothHfAdapter.TAG, "HfServerNotify Connected ");
            }
            BluetoothHfAdapter.this.mHfServerNotify = Stub.asInterface(service);
            try {
                BluetoothHfAdapter.this.mHfServerNotify.regClientBinder(new Binder());
            } catch (RemoteException e) {
                Log.e(BluetoothHfAdapter.TAG, BluetoothPbapClientPath.PBAP_ROOT_NAME, e);
            }
        }

        public void onServiceDisconnected(ComponentName className) {
            if (BluetoothHfAdapter.DEBUG) {
                Log.w(BluetoothHfAdapter.TAG, "HfServerNotify Disconnected ");
            }
            BluetoothHfAdapter.this.mHfServerNotify = null;
        }
    }

    public static BluetoothHfAdapter getInstance(Context context) {
        BluetoothHfAdapter bluetoothHfAdapter;
        synchronized (BluetoothHfAdapter.class) {
            if (mInstance == null) {
                mInstance = new BluetoothHfAdapter(context);
            }
            bluetoothHfAdapter = mInstance;
        }
        return bluetoothHfAdapter;
    }

    protected void finalize() throws Throwable {
        try {
            if (mInstance != null) {
                if (DEBUG) {
                    Log.i(TAG, "BluetoothHfAdapter finalize ");
                }
                mInstance = null;
            }
            super.finalize();
        } catch (Throwable th) {
            super.finalize();
        }
    }

    public synchronized void close() {
        if (this.mHfServerNotifyConnection != null) {
            this.mContext.unbindService(this.mHfServerNotifyConnection);
            this.mHfServerNotifyConnection = null;
        }
        if (DEBUG) {
            Log.i(TAG, "BluetoothHfAdapter close! ");
        }
        if (mInstance != null) {
            mInstance = null;
        }
        if (this.mHfUtility != null) {
            this.mHfUtility.reset();
            this.mHfUtility = null;
        }
    }

    public BluetoothHfAdapter(Context context) {
        if (DEBUG) {
            Log.i(TAG, "bindService ");
        }
        this.mContext = context;
        if (context.getApplicationContext().bindService(new Intent(context, BluetoothHfService.class), this.mHfServerNotifyConnection, 0)) {
            if (DEBUG) {
                Log.i(TAG, "bindService success");
            }
        } else if (DEBUG) {
            Log.e(TAG, "cannot bindService !!! ");
        }
        this.mHfUtility = new BluetoothHfUtility(this.mContext, this);
        if (this.mHfUtility != null) {
            this.mHfUtility.reset();
        }
    }

    public boolean Bluetooth_Hf_isConnected() {
        if (this.mHfServerNotify != null) {
            try {
                return this.mHfServerNotify.isHfPrfileConnected();
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            if (DEBUG) {
                Log.w(TAG, "mHfServerNotify is null");
            }
            if (DEBUG) {
                Log.w(TAG, Log.getStackTraceString(new Throwable()));
            }
            return false;
        }
    }

    public void Bluetooth_Hf_DialNumber(String phone_number) {
        if (this.mHfServerNotify != null) {
            try {
                this.mHfServerNotify.DialNumber(phone_number);
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public void Bluetooth_Hf_Redial() {
        if (this.mHfServerNotify != null) {
            try {
                this.mHfServerNotify.Redial();
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public void Bluetooth_Hf_AcceptIncommingCall() {
        if (this.mHfServerNotify != null) {
            try {
                this.mHfServerNotify.AcceptIncommingCall();
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public void Bluetooth_Hf_TerminatePhoneCall() {
        if (this.mHfServerNotify != null) {
            try {
                this.mHfServerNotify.TerminatePhoneCall();
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public void Bluetooth_Hf_WaitCall() {
        if (this.mHfServerNotify != null) {
            try {
                this.mHfServerNotify.CallWait();
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public void Bluetooth_Hf_HoldCall() {
        if (this.mHfServerNotify != null) {
            try {
                this.mHfServerNotify.CallWait();
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public void Bluetooth_Hf_Hangup_WaitingCall() {
        if (this.mHfServerNotify != null) {
            try {
                this.mHfServerNotify.CallHold("0");
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public void Bluetooth_Hf_SendDTMFCode(String dtmf_code) {
        if (this.mHfServerNotify != null) {
            try {
                this.mHfServerNotify.SendDTMFCode(dtmf_code);
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public void Bluetooth_Hf_QuerySubcriberInfo() {
        if (this.mHfServerNotify != null) {
            try {
                this.mHfServerNotify.QuerySubcriberInfo();
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public boolean Bluetooth_Hf_IsAudioTransferTowardsAG() {
        if (this.mHfServerNotify != null) {
            try {
                if (this.mHfServerNotify.IsSCOConnected()) {
                    return false;
                }
                return true;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return true;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (!DEBUG) {
            return true;
        }
        Log.w(TAG, Log.getStackTraceString(new Throwable()));
        return true;
    }

    public void Bluetooth_Hf_SwithAudioTransfer(boolean btowards_AG) {
        if (this.mHfServerNotify != null) {
            if (btowards_AG) {
                try {
                    if (DEBUG) {
                        Log.w(TAG, "Swith AudioTransfer ,btowards_AG ");
                    }
                } catch (RemoteException e) {
                    Log.e(TAG, e.toString());
                    return;
                }
            } else if (DEBUG) {
                Log.w(TAG, "Swith AudioTransfer ,btowards_HF ");
            }
            this.mHfServerNotify.SwithAudioTransfer(btowards_AG);
            return;
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public void Bluetooth_Hf_RequestCallAudio(boolean fgEnable) {
        if (this.mHfServerNotify != null) {
            try {
                if (DEBUG) {
                    Log.d(TAG, "Bluetooth_Hf_RequestCallAudio enable = " + fgEnable);
                }
                this.mHfServerNotify.requestSCOSoundEnable(fgEnable);
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public int Bluetooth_Hf_GetCallValue() {
        int callValue = 0;
        if (this.mHfServerNotify != null) {
            try {
                callValue = this.mHfServerNotify.getHfCallValue();
                if (DEBUG) {
                    Log.d(TAG, "Bluetooth_Hf_GetCallValue=" + callValue);
                }
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            if (DEBUG) {
                Log.w(TAG, "mHfServerNotify is null");
            }
            if (DEBUG) {
                Log.w(TAG, Log.getStackTraceString(new Throwable()));
            }
        }
        return callValue;
    }

    public int Bluetooth_Hf_GetCallsetupValue() {
        int callsetupValue = 0;
        if (this.mHfServerNotify != null) {
            try {
                callsetupValue = this.mHfServerNotify.getHfCallsetupValue();
                if (DEBUG) {
                    Log.d(TAG, "Bluetooth_Hf_GetCallsetupValue=" + callsetupValue);
                }
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            if (DEBUG) {
                Log.w(TAG, "mHfServerNotify is null");
            }
            if (DEBUG) {
                Log.w(TAG, Log.getStackTraceString(new Throwable()));
            }
        }
        return callsetupValue;
    }

    public String Bluetooth_Hf_GetClipNumber() {
        String clipNum = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        if (this.mHfServerNotify != null) {
            try {
                clipNum = this.mHfServerNotify.getCLIPPhoneNumber();
                if (DEBUG) {
                    Log.d(TAG, "Bluetooth_Hf_GetClipNumber=" + clipNum);
                }
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            if (DEBUG) {
                Log.w(TAG, "mHfServerNotify is null");
            }
            if (DEBUG) {
                Log.w(TAG, Log.getStackTraceString(new Throwable()));
            }
        }
        return clipNum;
    }

    public void Bluetooth_Hf_QueryCalllist() {
        if (this.mHfServerNotify != null) {
            try {
                if (DEBUG) {
                    Log.d(TAG, "Bluetooth_Hf_QueryCalllist");
                }
                this.mHfServerNotify.hfAtCmdQueryCalllist();
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public void Bluetooth_Hf_UpdateCallRelatedValues(int call, int callsetup, int callheld) {
        if (this.mHfUtility != null) {
            this.mHfUtility.updateCallRelatedValue(call, callsetup, callheld);
        } else if (DEBUG) {
            Log.w(TAG, "mHfUtility is null");
        }
    }

    public void Bluetooth_Hf_UpdateCallValue(int call) {
        if (this.mHfUtility != null) {
            this.mHfUtility.updateCallValue(call);
        } else if (DEBUG) {
            Log.w(TAG, "mHfUtility is null");
        }
    }

    public void Bluetooth_Hf_UpdateCallsetupValue(int callsetup) {
        if (this.mHfUtility != null) {
            this.mHfUtility.updateCallsetupValue(callsetup);
        } else if (DEBUG) {
            Log.w(TAG, "mHfUtility is null");
        }
    }

    public void Bluetooth_Hf_UpdateCallheldValue(int callheld) {
        if (this.mHfUtility != null) {
            this.mHfUtility.updateCallheldValue(callheld);
        } else if (DEBUG) {
            Log.w(TAG, "mHfUtility is null");
        }
    }

    public void Bluetooth_Hf_UpdateCallingNumber(String number) {
        if (this.mHfUtility != null) {
            this.mHfUtility.setCallingNumber(number);
        } else if (DEBUG) {
            Log.w(TAG, "mHfUtility is null");
        }
    }

    public String Bluetooth_Hf_GetCallingNumber() {
        if (this.mHfUtility != null) {
            return this.mHfUtility.getCallingNumber();
        }
        if (DEBUG) {
            Log.w(TAG, "mHfUtility is null");
        }
        return BluetoothPbapClientPath.PBAP_ROOT_NAME;
    }

    public int Bluetooth_Hf_GetCallState() {
        if (this.mHfUtility != null) {
            return this.mHfUtility.getCallState();
        }
        if (DEBUG) {
            Log.w(TAG, "mHfUtility is null");
        }
        return 1;
    }

    public void Bluetooth_Hf_ResetUtility() {
        if (this.mHfUtility != null) {
            this.mHfUtility.reset();
        } else if (DEBUG) {
            Log.w(TAG, "mHfUtility is null");
        }
    }

    public boolean Bluetooth_Hf_IsMESupportVoiceRecog() {
        boolean result = false;
        if (this.mHfServerNotify != null) {
            try {
                if (DEBUG) {
                    Log.d(TAG, "Bluetooth_Hf_IsMESupportVoiceRecog");
                }
                result = this.mHfServerNotify.isRemoteDeviceSupportVoiceRecog();
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            if (DEBUG) {
                Log.w(TAG, "mHfServerNotify is null");
            }
            if (DEBUG) {
                Log.w(TAG, Log.getStackTraceString(new Throwable()));
            }
        }
        return result;
    }

    public boolean Bluetooth_Hf_sendAtCmd(String cmd, boolean wait) {
        int result = 0;
        if (this.mHfServerNotify != null) {
            try {
                if (DEBUG) {
                    Log.d(TAG, "Bluetooth_Hf_sendAtCmd");
                }
                result = this.mHfServerNotify.sendATCommand(cmd, wait);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            if (DEBUG) {
                Log.w(TAG, "mHfServerNotify is null");
            }
            if (DEBUG) {
                Log.w(TAG, Log.getStackTraceString(new Throwable()));
            }
        }
        if (DEBUG) {
            Log.d(TAG, "Bluetooth_Hf_sendAtCmd result:" + result);
        }
        if (result == 1) {
            return true;
        }
        return false;
    }

    public void Bluetooth_Hf_QueryPhoneIndicator() {
        if (this.mHfServerNotify != null) {
            try {
                if (DEBUG) {
                    Log.d(TAG, "Bluetooth_Hf_QueryPhoneIndicator");
                }
                this.mHfServerNotify.hfAtCmdQueryPhoneIndicator();
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public void Bluetooth_Hf_QueryPhoneIdentification() {
        if (this.mHfServerNotify != null) {
            try {
                if (DEBUG) {
                    Log.d(TAG, "Bluetooth_Hf_QueryPhoneIdentification");
                }
                this.mHfServerNotify.hfAtCmdQueryPhoneIdentification();
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public void Bluetooth_Hf_EnableVoiceRecognition(boolean fgEnable) {
        if (this.mHfServerNotify != null) {
            try {
                if (DEBUG) {
                    Log.d(TAG, "Bluetooth_Hf_EnableVoiceRecognition enable = " + fgEnable);
                }
                this.mHfServerNotify.enableVoiceRecognition(fgEnable);
                return;
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
                return;
            }
        }
        if (DEBUG) {
            Log.w(TAG, "mHfServerNotify is null");
        }
        if (DEBUG) {
            Log.w(TAG, Log.getStackTraceString(new Throwable()));
        }
    }

    public void Bluetooth_Hf_updateHFConnectedState(int state) {
        if (this.mHfUtility != null) {
            Log.i(TAG, "Bluetooth_Hf_updateHFConnectedState");
            this.mHfUtility.updateHFConnectedState(state);
        } else if (DEBUG) {
            Log.w(TAG, "mHfUtility is null");
        }
    }

    public boolean Bluetooth_Hf_isReconnectNeeded() {
        if (this.mHfServerNotify != null) {
            try {
                return this.mHfServerNotify.getReconnectSuggestion();
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            if (DEBUG) {
                Log.w(TAG, "mHfServerNotify is null");
            }
            if (DEBUG) {
                Log.w(TAG, Log.getStackTraceString(new Throwable()));
            }
            return false;
        }
    }
}
