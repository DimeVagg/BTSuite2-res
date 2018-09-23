package com.autochips.bluetooth;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.util.Log;
import com.autochips.bluetooth.spp.SppService;
import com.autochips.bluetooth.spp.SppService.LocalBinder;

public class BtSPPAdapter {
    public static final String SPP_DATA = "com.autochips.bluetooth.BtSPPAdapter.data";
    public static final String SPP_DATA_EXTRA = "com.autochips.bluetooth.BtSPPAdapter.data.extra";
    public static final String SPP_STATE_CHANGE = "com.autochips.bluetooth.BtSPPAdapter.stateChange";
    public static final String SPP_STATE_CHANGE_EXTRA = "com.autochips.bluetooth.BtSPPAdapter.stateChange.extra";
    public static final int STATE_CONNECTED = 2;
    public static final int STATE_CONNECTED_FAILED = 3;
    public static final int STATE_CONNECTING = 1;
    public static final int STATE_DISCONNECTED_IND = 4;
    public static final int STATE_NONE = 0;
    private final String TAG = "BtSPPAdapter";
    private Handler handler = new C00021();
    private ServiceConnection mCon = new C00032();
    private Context mContext;
    private Intent sppData;
    private SppService sppService = null;
    private Intent sppStateChange;

    /* renamed from: com.autochips.bluetooth.BtSPPAdapter$1 */
    class C00021 extends Handler {
        C00021() {
        }

        public void handleMessage(Message msg) {
            switch (msg.what) {
                case SppService.SPP_STATE_CHANGE /*10000*/:
                    Log.i("BtSPPAdapter", "MESSAGE_STATE_CHANGE" + msg.arg1);
                    BtSPPAdapter.this.sppStateChange.putExtra(BtSPPAdapter.SPP_STATE_CHANGE_EXTRA, msg.arg1);
                    BtSPPAdapter.this.mContext.sendBroadcast(BtSPPAdapter.this.sppStateChange);
                    return;
                case 10001:
                    Log.i("BtSPPAdapter", "MESSAGE_RECIEVE_DATA");
                    String sRespond = msg.getData().getString("AT_Respond");
                    Log.i("BtSPPAdapter", "MESSAGE_RECIEVE_DATA:data = " + sRespond);
                    BtSPPAdapter.this.sppData.putExtra(BtSPPAdapter.SPP_DATA_EXTRA, sRespond);
                    BtSPPAdapter.this.mContext.sendBroadcast(BtSPPAdapter.this.sppData);
                    return;
                default:
                    return;
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.BtSPPAdapter$2 */
    class C00032 implements ServiceConnection {
        C00032() {
        }

        public void onServiceConnected(ComponentName arg0, IBinder arg1) {
            BtSPPAdapter.this.sppService = ((LocalBinder) arg1).getSppService();
            if (BtSPPAdapter.this.sppService != null) {
                BtSPPAdapter.this.sppService.setHandler(BtSPPAdapter.this.handler);
            }
            Log.i("BtSPPAdapter", new StringBuilder().append("onServiceConnected: sppService is null? ").append(BtSPPAdapter.this.sppService).toString() == null ? "yes" : "no");
        }

        public void onServiceDisconnected(ComponentName arg0) {
            BtSPPAdapter.this.sppService = null;
        }
    }

    public BtSPPAdapter(Context context) {
        Log.i("BtSPPAdapter", "BtSPPAdapter");
        this.mContext = context;
        this.sppStateChange = new Intent(SPP_STATE_CHANGE);
        this.sppData = new Intent(SPP_DATA);
    }

    public boolean start() {
        if (this.sppService == null) {
            return this.mContext.bindService(new Intent(this.mContext, SppService.class), this.mCon, 0);
        }
        Log.i("BtSPPAdapter", "start:sppService is not null");
        return true;
    }

    public void stop() {
        if (this.sppService == null) {
            this.mContext.unbindService(this.mCon);
        } else {
            Log.i("BtSPPAdapter", "stop:sppService is not null");
        }
    }

    public boolean connect(String btAddr) {
        if (this.sppService == null || getState() == 2) {
            Log.i("BtSPPAdapter", "Connect:SppService is null or has connected");
            return false;
        }
        this.sppService.connect(btAddr, false);
        return true;
    }

    public boolean disconnct() {
        if (this.sppService == null || getState() != 2) {
            Log.i("BtSPPAdapter", "Disconnct:SppService is null or not connect");
            return false;
        }
        this.sppService.disconnect();
        return true;
    }

    public boolean write(String str) {
        if (this.sppService == null || getState() != 2) {
            Log.i("BtSPPAdapter", "Write:SppService is null or not connect");
            return false;
        }
        this.sppService.write(str.getBytes());
        return true;
    }

    public int getState() {
        if (this.sppService != null) {
            return this.sppService.getState();
        }
        Log.i("BtSPPAdapter", "getState:SppService is null");
        return -1;
    }

    public boolean setIsSppSerial(boolean fgIsSppSerial) {
        if (this.sppService != null) {
            this.sppService.setSppType(fgIsSppSerial);
        } else {
            Log.i("BtSPPAdapter", "setIsSppSerial:SppService is null");
        }
        return this.sppService != null;
    }
}
