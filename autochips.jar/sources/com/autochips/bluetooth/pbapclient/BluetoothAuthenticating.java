package com.autochips.bluetooth.pbapclient;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import com.android.internal.app.AlertActivity;
import com.android.internal.app.AlertController.AlertParams;

public class BluetoothAuthenticating extends AlertActivity implements OnClickListener {
    public static final String ACTION_CANCEL = "com.autochips.bluetooth.extra.action_cancel";
    public static final String ACTION_RETURN = "com.autochips.bluetooth.extra.action_return";
    public static final String AUTHENTICATE_RESULT = "com.autochips.bluetooth.extra.authenticate_result";
    public static final String AUTHETICATE_CODE = "com.autochips.bluetooth.extra.autheticate_code";
    private static final int AUTHETICATE_TIMEOUT_IND = 101;
    public static final String DEVICE_NAME = "com.autochips.bluetooth.extra.device_name";
    public static final int RESULT_CANCEL = 3;
    public static final int RESULT_OTHERS = 5;
    public static final int RESULT_TIMEOUT = 4;
    public static final int RESULT_USER_ACCEPT = 1;
    public static final int RESULT_USER_REJECT = 2;
    private static final String TAG = "BluetoothAuthenticating";
    public static final String TIMEOUT_VALUE = "com.autochips.bluetooth.extra.timeout_value";
    private IntentFilter mCancelFilter = null;
    private BroadcastReceiver mCancelReceiver = new C00752();
    private Handler mHandler = new C00741();
    private AlertParams mPara;
    private EditText mPasscodeEdit;
    private boolean mResultSent = false;
    private String mReturnAction = null;
    private View mView = null;

    /* renamed from: com.autochips.bluetooth.pbapclient.BluetoothAuthenticating$1 */
    class C00741 extends Handler {
        C00741() {
        }

        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 101:
                    BluetoothAuthenticating.this.sendResult(4);
                    return;
                default:
                    Log.e(BluetoothAuthenticating.TAG, "Unsupported indication");
                    return;
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.pbapclient.BluetoothAuthenticating$2 */
    class C00752 extends BroadcastReceiver {
        C00752() {
        }

        public void onReceive(Context context, Intent intent) {
            Log.d(BluetoothAuthenticating.TAG, "onReceive()");
            BluetoothAuthenticating.this.sendResult(3);
            BluetoothAuthenticating.this.finish();
        }
    }

    private void sendResult(int res) {
        Log.d(TAG, "Authenticate : " + res);
        if (!this.mResultSent) {
            Intent intent = new Intent(this.mReturnAction);
            intent.putExtra(AUTHENTICATE_RESULT, res);
            intent.putExtra(AUTHETICATE_CODE, this.mPasscodeEdit.getText().toString());
            sendBroadcast(intent);
            this.mResultSent = true;
        }
    }

    protected void onCreate(Bundle savedInstanceState) {
        Log.v(TAG, "OnCreate");
        super.onCreate(savedInstanceState);
        Intent intent = getIntent();
        String cancel = intent.getStringExtra(ACTION_CANCEL);
        this.mReturnAction = intent.getStringExtra(ACTION_RETURN);
        int timeout = intent.getIntExtra(TIMEOUT_VALUE, -1);
        if (cancel != null) {
            this.mCancelFilter = new IntentFilter(intent.getStringExtra(ACTION_CANCEL));
        } else {
            this.mCancelFilter = null;
        }
        setUpDialog();
        if (timeout > 0) {
            this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(101), (long) timeout);
        }
    }

    protected void onStart() {
        Log.v(TAG, "onStart");
        super.onStart();
        if (this.mCancelFilter != null) {
            registerReceiver(this.mCancelReceiver, this.mCancelFilter);
        }
    }

    protected void onDestroy() {
        Log.v(TAG, "onDestroy()");
        super.onDestroy();
    }

    protected void onStop() {
        Log.v(TAG, "onStop()");
        if (this.mCancelFilter != null) {
            unregisterReceiver(this.mCancelReceiver);
        }
        sendResult(5);
        super.onStop();
    }

    private void setUpDialog() {
        Log.v(TAG, "setUpDialog");
    }

    private View createView() {
        Log.v(TAG, "createView");
        return null;
    }

    public void onClick(DialogInterface dialog, int which) {
        Log.v(TAG, "onClick");
        if (which == -1) {
            Log.v(TAG, "positive button");
            if (this.mPasscodeEdit.getText().toString().length() > 0) {
                sendResult(1);
            } else {
                Log.e(TAG, "passcode is null");
                sendResult(2);
            }
        } else if (which == -2) {
            Log.v(TAG, "negative button");
            sendResult(2);
        }
        finish();
    }
}
