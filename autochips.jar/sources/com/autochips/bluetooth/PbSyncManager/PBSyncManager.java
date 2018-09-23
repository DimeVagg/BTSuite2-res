package com.autochips.bluetooth.PbSyncManager;

import android.bluetooth.BluetoothDevice;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.PbSyncManager.IPBSyncManager.Stub;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;
import java.util.List;

public class PBSyncManager {
    private static boolean DBG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugPB);
    private static final String TAG = "PBSyncManager";
    private static PBSyncManager mInstance = null;
    private ServiceConnection mConnection = new C00061();
    private final Context mContext;
    private IPBSyncManager mPbSyncService;

    /* renamed from: com.autochips.bluetooth.PbSyncManager.PBSyncManager$1 */
    class C00061 implements ServiceConnection {
        C00061() {
        }

        public void onServiceDisconnected(ComponentName name) {
            if (PBSyncManager.DBG) {
                PBSyncManager.log("Porxy object disconnected");
            }
            PBSyncManager.this.mPbSyncService = null;
        }

        public void onServiceConnected(ComponentName name, IBinder service) {
            if (PBSyncManager.DBG) {
                PBSyncManager.log("Porxy object connected");
            }
            PBSyncManager.this.mPbSyncService = Stub.asInterface(service);
        }
    }

    public static PBSyncManager getInstance(Context context) {
        PBSyncManager pBSyncManager;
        synchronized (PBSyncManager.class) {
            if (mInstance == null) {
                mInstance = new PBSyncManager(context);
            }
            pBSyncManager = mInstance;
        }
        return pBSyncManager;
    }

    public PBSyncManager(Context context) {
        this.mContext = context;
        if (DBG) {
            Log.i(TAG, IPBSyncManager.class.getName());
        }
        if (!context.getApplicationContext().bindService(new Intent(IPBSyncManager.class.getName()), this.mConnection, 1)) {
            Log.e(TAG, "Could not bind to PBSyncManager Service");
        }
    }

    protected void finalize() throws Throwable {
        try {
            if (DBG) {
                Log.d(TAG, "+finalize()");
            }
            close();
        } finally {
            super.finalize();
        }
    }

    public synchronized void close() {
        if (this.mConnection != null) {
            if (DBG) {
                Log.d(TAG, "+unbindService()");
            }
            this.mContext.unbindService(this.mConnection);
            this.mConnection = null;
            mInstance = null;
        }
    }

    public boolean Init() {
        if (DBG) {
            log("Init()");
        }
        try {
            return this.mPbSyncService.Init();
        } catch (RemoteException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean SetRemoteDevice(BluetoothDevice remoteDevice, int path) {
        if (DBG) {
            log("SetRemoteDevice(" + remoteDevice.getAddress() + "," + path + ")");
        }
        try {
            return this.mPbSyncService.SetRemoteDevice(remoteDevice, path);
        } catch (RemoteException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean StartDownload(int path, boolean bContinue) {
        if (DBG) {
            log("StartDownload(" + path + ", " + bContinue + ")");
        }
        try {
            return this.mPbSyncService.StartDownload(path, bContinue);
        } catch (RemoteException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean StopDownload(int path) {
        if (DBG) {
            log("StopDownload(" + path + ")");
        }
        if (this.mPbSyncService != null) {
            try {
                return this.mPbSyncService.StopDownload(path);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public int GetRecCnt(String btaddr, int path) {
        if (DBG) {
            log("GetRecCnt(" + btaddr + ", " + path + ")");
        }
        if (this.mPbSyncService != null) {
            try {
                return this.mPbSyncService.GetRecCnt(btaddr, path);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
        Log.e(TAG, "mPbSyncService is null!");
        return 0;
    }

    public boolean GetRecord(int path, int u4FirstIdx, int u4RecCnt, List<PBRecord> record) {
        if (DBG) {
            log("GetRecord(" + path + "," + u4FirstIdx + "," + u4RecCnt + ")");
        }
        if (this.mPbSyncService != null) {
            try {
                return this.mPbSyncService.GetRecord(path, u4FirstIdx, u4RecCnt, record);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean SearchPhonebook(String btAddr, String search, List<PBRecord> record) {
        if (DBG) {
            log("SearchPhonebook(" + btAddr + ", " + search + ")");
        }
        if (this.mPbSyncService != null) {
            try {
                return this.mPbSyncService.SearchPhonebook(btAddr, search, record);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public String GetNameByTelExectly(String btAddr, String tel) {
        if (DBG) {
            log("GetNameByTelExectly(" + btAddr + ", " + tel + ")");
        }
        if (this.mPbSyncService != null) {
            try {
                return this.mPbSyncService.GetNameByTelExectly(btAddr, tel);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
        return BluetoothPbapClientPath.PBAP_ROOT_NAME;
    }

    public void AddCall(int type, String name, String tel, String time) {
        if (DBG) {
            log("AddCall(" + type + ", " + name + ", " + tel + ", " + time + ")");
        }
        if (this.mPbSyncService != null) {
            try {
                this.mPbSyncService.AddCall(type, name, tel, time);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    public void SetDownloadMaxCnt(int path, int iMaxCnt) {
        if (DBG) {
            log("SetDownloadMaxCnt(" + path + ", " + iMaxCnt + ")");
        }
        if (this.mPbSyncService != null) {
            try {
                this.mPbSyncService.SetDownloadMaxCnt(path, iMaxCnt);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    public int GetSyncState() {
        if (DBG) {
            log("GetSyncState()");
        }
        if (this.mPbSyncService != null) {
            try {
                return this.mPbSyncService.GetSyncState();
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
        return 0;
    }

    public int GetSyncPath() {
        if (DBG) {
            log("GetSyncPath()");
        }
        if (this.mPbSyncService != null) {
            try {
                return this.mPbSyncService.GetSyncPath();
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
        return 8;
    }

    private static void log(String msg) {
        Log.d(TAG, msg);
    }
}
