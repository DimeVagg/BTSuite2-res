package com.autochips.bluetooth.avrcpct;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Binder;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.avrcpct.IBluetoothAvrcpCtPlayerManage.Stub;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;

public class BluetoothAvrcpCtPlayerManage {
    public static final String ACTION_MEDIA_DATA_UPDATE = "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.action.ACTION_MEDIA_DATA_UPDATE";
    public static final String ACTION_PLAYBACK_DATA_UPDATE = "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.action.ACTION_PLAYBACK_DATA_UPDATE";
    public static final int CMD_GET_ELEMENATTRIBUTES = 6;
    public static final int CMD_GET_PLAYERCAPABILITY = 11;
    public static final int CMD_GET_PLAYERSTATUS = 7;
    public static final int CMD_NEXT = 4;
    public static final int CMD_PAUSE = 2;
    public static final int CMD_PLAY = 1;
    public static final int CMD_PREV = 3;
    public static final int CMD_REG_NOTIFICATION_PLAYBACK_POS_CHANGED = 10;
    public static final int CMD_REG_NOTIFICATION_PLAYBACK_STATUS_CHANGED = 8;
    public static final int CMD_REG_NOTIFICATION_TRACK_CHANGED = 9;
    public static final int CMD_RESERVED = 0;
    public static final int CMD_STOP = 5;
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugMusic);
    public static final String MEDIA_ALBUM = "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.extra.MEIDA_ALBUM";
    public static final String MEDIA_ARTIST = "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.extra.MEDIA_ARTIST";
    public static final String MEDIA_LENGTH = "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.extra.MEDIA_LENGTH";
    public static final String MEDIA_POSITION = "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.extra.MEDIA_POSITION";
    public static final String MEDIA_TITLE = "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.extra.MEDIA_TITLE";
    public static final byte PAUSED = (byte) 2;
    public static final String PLAYBACK_STATUS = "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.extra.PLAYBACK_STATUS";
    public static final byte PLAYING = (byte) 1;
    public static final byte STOPPED = (byte) 0;
    private static final String TAG = "BluetoothAvrcpCtPlayerManage";
    private static BluetoothAvrcpCtPlayerManage mInstance;
    private static AvrcpCtPlayerUtility mPlayerUtility;
    private static IBluetoothAvrcpCtPlayerManage mService;
    private ServiceConnection mConnection = new C00211();
    private final Context mContext;

    /* renamed from: com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtPlayerManage$1 */
    class C00211 implements ServiceConnection {
        C00211() {
        }

        public void onServiceConnected(ComponentName className, IBinder service) {
            BluetoothAvrcpCtPlayerManage.mService = Stub.asInterface(service);
            BluetoothAvrcpCtPlayerManage.log("Proxy object connected");
            try {
                BluetoothAvrcpCtPlayerManage.mService.regClientBinder(new Binder());
            } catch (RemoteException e) {
                Log.e(BluetoothAvrcpCtPlayerManage.TAG, BluetoothPbapClientPath.PBAP_ROOT_NAME, e);
            }
        }

        public void onServiceDisconnected(ComponentName className) {
            BluetoothAvrcpCtPlayerManage.log("Proxy object disconnected");
            BluetoothAvrcpCtPlayerManage.mService = null;
        }
    }

    public static BluetoothAvrcpCtPlayerManage getInstance(Context context) {
        BluetoothAvrcpCtPlayerManage bluetoothAvrcpCtPlayerManage;
        synchronized (BluetoothAvrcpCtPlayerManage.class) {
            if (mInstance == null) {
                mInstance = new BluetoothAvrcpCtPlayerManage(context);
            }
            bluetoothAvrcpCtPlayerManage = mInstance;
        }
        return bluetoothAvrcpCtPlayerManage;
    }

    public BluetoothAvrcpCtPlayerManage(Context c) {
        this.mContext = c;
        if (!this.mContext.getApplicationContext().bindService(new Intent(this.mContext, BluetoothAvrcpCtService.class), this.mConnection, 0)) {
            Log.e(TAG, "Could not bind to Bluetooth avrcp ct playermanage Service");
        }
        mPlayerUtility = new AvrcpCtPlayerUtility(c, this);
    }

    protected void finalize() throws Throwable {
        try {
            close();
        } finally {
            super.finalize();
        }
    }

    public synchronized void close() {
        Log.w(TAG, "close");
        if (this.mConnection != null) {
            this.mContext.unbindService(this.mConnection);
            this.mConnection = null;
        }
        if (mInstance != null) {
            mInstance = null;
        }
    }

    public boolean pause(String BT_Addr) {
        log("pause()");
        if (mService != null) {
            try {
                return mService.playPause(BT_Addr);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            Log.w(TAG, "Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return true;
        }
    }

    public boolean play(String BT_Addr) {
        log("play()");
        if (mService != null) {
            try {
                return mService.playContinue(BT_Addr);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return true;
        }
    }

    public boolean forward(String BT_Addr) {
        if (mService != null) {
            try {
                return mService.playForward(BT_Addr);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return true;
        }
    }

    public boolean backward(String BT_Addr) {
        if (mService != null) {
            try {
                return mService.playBackward(BT_Addr);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            Log.w(TAG, "Proxy not attached to service");
            if (DEBUG) {
                log(Log.getStackTraceString(new Throwable()));
            }
            return true;
        }
    }

    public boolean stop(String BT_Addr) {
        if (mService != null) {
            try {
                return mService.playStop(BT_Addr);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            Log.w(TAG, "Proxy not attached to service");
            if (DEBUG) {
                log(Log.getStackTraceString(new Throwable()));
            }
            return true;
        }
    }

    public boolean fastFoward(String BT_Addr) {
        if (mService != null) {
            try {
                return mService.playFastForward(BT_Addr);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return true;
        }
    }

    public boolean rewind(String BT_Addr) {
        if (mService != null) {
            try {
                return mService.playRewind(BT_Addr);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return true;
        }
    }

    public boolean getElementAttributes(long identifier, byte count, int[] attributes) {
        if (mService != null) {
            try {
                return mService.playgetElementAttributes(identifier, count, attributes);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return true;
        }
    }

    public boolean getPlayerStatus() {
        if (mService != null) {
            try {
                return mService.playgetPlayerStatus();
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return true;
        }
    }

    public boolean registerNotificationReq(byte event_id, int playback_interval) {
        if (mService != null) {
            try {
                return mService.playregisterNotificationReq(event_id, playback_interval);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return true;
        }
    }

    public boolean getItemAttributes(byte scope, long uid, char uid_counter, byte count, int[] attributeIds) {
        if (mService != null) {
            try {
                return mService.playgetItemAttributes(scope, uid, uid_counter, count, attributeIds);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return true;
        }
    }

    public boolean informDisplaybaleCharset(byte count, char charset_id) {
        if (mService != null) {
            try {
                return mService.playinformDisplaybaleCharset(count, charset_id);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return true;
        }
    }

    public boolean getCapabilities(byte capability_id) {
        if (mService != null) {
            try {
                return mService.playgetCapabilities(capability_id);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return true;
        }
    }

    public int resetAudio(int on_off, int release) {
        if (mService != null) {
            try {
                return mService.playresetAudio(on_off, release);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return -1;
        }
    }

    public boolean regResume(boolean appResume) {
        if (mService != null) {
            try {
                mService.playregResume(appResume);
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
        }
        return true;
    }

    public boolean notifyResume() {
        if (mService != null) {
            try {
                mService.playonResume();
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
        }
        if (mPlayerUtility != null) {
            mPlayerUtility.onMusicPlayerStateChanged(true);
        }
        return true;
    }

    public boolean notifyRevoke() {
        if (mService != null) {
            try {
                mService.playonRevoke();
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
        }
        if (mPlayerUtility != null) {
            mPlayerUtility.onMusicPlayerStateChanged(false);
        }
        return true;
    }

    public int getA2dpSinkStateValue() {
        if (mService != null) {
            try {
                return mService.getA2dpSinkState();
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return 0;
        }
    }

    public String getA2dpAddr() {
        if (mService != null) {
            try {
                return mService.getA2dpSourceAddr();
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return null;
        }
    }

    public int getAvrcpStateValue() {
        if (mService != null) {
            try {
                return mService.getAvrcpctState();
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return 0;
        }
    }

    public int getAvrcpRemoteNotifyEvent() {
        if (mPlayerUtility != null) {
            return mPlayerUtility.getRemoteNotifyEvent();
        }
        log("Proxy not attached to service");
        log(Log.getStackTraceString(new Throwable()));
        return 0;
    }

    public int getTrackChangedEventStatus() {
        if (mService != null) {
            try {
                return mService.getTrackChangedEventStatus();
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return 0;
        }
    }

    public int getPosChangedEventStatus() {
        if (mService != null) {
            try {
                return mService.getPosChangedEventStatus();
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return 0;
        }
    }

    public AvrcpCtPlayerUtility getUtility() {
        return mPlayerUtility;
    }

    public void sendAvrcpCommand(int cmd) {
        if (mPlayerUtility != null) {
            mPlayerUtility.sendCommand(cmd);
            return;
        }
        log("Proxy not attached to service");
        log(Log.getStackTraceString(new Throwable()));
    }

    public int getA2dpAudioStatus() {
        if (mService != null) {
            try {
                return mService.getA2dpAudioStatus();
            } catch (RemoteException e) {
                Log.e(TAG, e.toString());
            }
        } else {
            log("Proxy not attached to service");
            log(Log.getStackTraceString(new Throwable()));
            return 0;
        }
    }

    private static void log(String msg) {
        if (DEBUG) {
            Log.d(TAG, msg);
        }
    }
}
