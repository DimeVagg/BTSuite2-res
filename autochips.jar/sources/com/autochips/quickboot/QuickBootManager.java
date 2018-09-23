package com.autochips.quickboot;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import com.autochips.quickboot.IQuickBootService.Stub;

public class QuickBootManager {
    public static final String ACTION_QB_POWEROFF = "autochips.intent.action.QB_POWEROFF";
    public static final String ACTION_QB_POWERON = "autochips.intent.action.QB_POWERON";
    public static final String ACTION_QB_SERVICE = "autochips.intent.action.QB_SERVICE";
    private ServiceConnection mCon = new C00871();
    private IQuickBootService mSer = null;

    /* renamed from: com.autochips.quickboot.QuickBootManager$1 */
    class C00871 implements ServiceConnection {
        C00871() {
        }

        public void onServiceConnected(ComponentName name, IBinder binder) {
            QuickBootManager.this.mSer = Stub.asInterface(binder);
        }

        public void onServiceDisconnected(ComponentName name) {
            QuickBootManager.this.mSer = null;
        }
    }

    public QuickBootManager(Context ctx) {
        bindService(ctx);
    }

    private void bindService(Context ctx) {
        ctx.bindService(new Intent(ACTION_QB_SERVICE), this.mCon, 1);
    }

    public boolean addToWhiteList(String packageName) {
        if (this.mSer != null) {
            try {
                return this.mSer.addToWhiteList(packageName);
            } catch (RemoteException e) {
            }
        }
        return false;
    }

    public boolean removeFromWhiteList(String packageName) {
        if (this.mSer != null) {
            try {
                return this.mSer.removeFromWhiteList(packageName);
            } catch (RemoteException e) {
            }
        }
        return false;
    }

    public boolean addToYellowList(String packageName) {
        if (this.mSer != null) {
            try {
                return this.mSer.addToYellowList(packageName);
            } catch (RemoteException e) {
            }
        }
        return false;
    }

    public boolean removeFromYellowList(String packageName) {
        if (this.mSer != null) {
            try {
                return this.mSer.removeFromYellowList(packageName);
            } catch (RemoteException e) {
            }
        }
        return false;
    }
}
