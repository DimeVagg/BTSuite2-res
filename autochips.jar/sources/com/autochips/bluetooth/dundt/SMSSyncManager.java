package com.autochips.bluetooth.dundt;

import android.bluetooth.BluetoothDevice;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.dundt.ISMSSyncManager.Stub;
import java.util.List;

public class SMSSyncManager {
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugSMS);
    private static final String TAG = "SMSSyncManager";
    private static SMSSyncManager mInstance = null;
    private ServiceConnection mConnection = new C00321();
    private final Context mContext;
    private ISMSSyncManager mSmsSyncService;

    /* renamed from: com.autochips.bluetooth.dundt.SMSSyncManager$1 */
    class C00321 implements ServiceConnection {
        C00321() {
        }

        public void onServiceDisconnected(ComponentName name) {
            if (SMSSyncManager.DEBUG) {
                Log.d(SMSSyncManager.TAG, "Porxy object disconnected");
            }
            SMSSyncManager.this.mSmsSyncService = null;
        }

        public void onServiceConnected(ComponentName name, IBinder service) {
            if (SMSSyncManager.DEBUG) {
                Log.d(SMSSyncManager.TAG, "Porxy object connected");
            }
            SMSSyncManager.this.mSmsSyncService = Stub.asInterface(service);
        }
    }

    public static SMSSyncManager getInstance(Context context) {
        SMSSyncManager sMSSyncManager;
        synchronized (SMSSyncManager.class) {
            if (mInstance == null) {
                mInstance = new SMSSyncManager(context);
            }
            sMSSyncManager = mInstance;
        }
        return sMSSyncManager;
    }

    public SMSSyncManager(Context context) {
        this.mContext = context;
        if (!context.getApplicationContext().bindService(new Intent(ISMSSyncManager.class.getName()), this.mConnection, 1) && DEBUG) {
            Log.e(TAG, "Could not bind to SMSSyncManager Service");
        }
    }

    protected void finalize() throws Throwable {
        try {
            if (DEBUG) {
                Log.d(TAG, "+finalize()");
            }
            close();
        } finally {
            super.finalize();
        }
    }

    public synchronized void close() {
        if (this.mConnection != null) {
            if (DEBUG) {
                Log.d(TAG, "+unbindService()");
            }
            this.mContext.unbindService(this.mConnection);
            this.mConnection = null;
            mInstance = null;
        }
    }

    public boolean SetRemoteDevice(BluetoothDevice remoteDevice) {
        if (DEBUG) {
            Log.d(TAG, "SetRemoteDevice(" + remoteDevice.getAddress() + ")");
        }
        try {
            return this.mSmsSyncService.SetRemoteDevice(remoteDevice);
        } catch (RemoteException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean StartDownload(int path, boolean bContinue) {
        if (DEBUG) {
            Log.d(TAG, "StartDownload(" + path + ", " + bContinue + ")");
        }
        try {
            return this.mSmsSyncService.StartDownload(path, bContinue);
        } catch (RemoteException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean StopDownload() {
        if (DEBUG) {
            Log.d(TAG, "StopDownload");
        }
        try {
            if (this.mSmsSyncService != null) {
                return this.mSmsSyncService.StopDownload();
            }
        } catch (RemoteException e) {
            e.printStackTrace();
        }
        return false;
    }

    public int GetSyncState() {
        if (DEBUG) {
            Log.d(TAG, "GetSyncState");
        }
        try {
            return this.mSmsSyncService.GetSyncState();
        } catch (RemoteException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int GetRecCnt(int type) {
        if (DEBUG) {
            Log.d(TAG, "GetRecCnt(" + type + ")");
        }
        try {
            return this.mSmsSyncService.GetRecCnt(type);
        } catch (RemoteException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public boolean GetRecord(int type, int u4FirstIdx, int u4RecCnt, List<SMSRecord> record) {
        if (DEBUG) {
            Log.d(TAG, "GetRecord(" + type + "," + u4FirstIdx + "," + u4RecCnt + ")");
        }
        try {
            return this.mSmsSyncService.GetRecord(type, u4FirstIdx, u4RecCnt, record);
        } catch (RemoteException e) {
            e.printStackTrace();
            return false;
        }
    }
}
