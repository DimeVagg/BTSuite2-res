package com.autochips.bluetooth.hid;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.SystemClock;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.hid.IBluetoothHidDeviceUtility.Stub;

public class BluetoothHidAdapter {
    private static final double ACCELERATION_SCALE_ADJUSTMENT_CONST = -0.06d;
    private static final byte AC_REPORT_ID = (byte) 3;
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugHF);
    private static final int DEFAULT_INTERRUPT_LATENCY = 100;
    public static final int HID_ADAPTER_CMD_BACK = 4;
    public static final int HID_ADAPTER_CMD_HOME = 1;
    public static final int HID_ADAPTER_CMD_MENU = 16;
    public static final int HID_ADAPTER_CMD_NEXT = 128;
    public static final int HID_ADAPTER_CMD_PLAY_PAUSE = 32;
    public static final int HID_ADAPTER_CMD_PREVIOS = 64;
    public static final int HID_ADAPTER_CMD_STOP = 256;
    public static final int HID_ADAPTER_CMD_VOLUME_DOWN = 1024;
    public static final int HID_ADAPTER_CMD_VOLUME_UP = 512;
    public static final String HID_SERVICE_CLASS_NAME = "com.autochips.bluetooth.BluetoothHidService";
    private static final byte KEYBOARD_REPORT_ID = (byte) 2;
    private static final int MAX_INTERRUPT_LATENCY = 500;
    private static final int MIN_INTERRUPT_LATENCY = 10;
    private static final byte MOUSE_REPORT_ID = (byte) 1;
    private static final String TAG = "BluetoothHidAdapter";
    private static BluetoothHidAdapter mInstance = null;
    private boolean mACIntAbout2Send = false;
    private int mCMDAbout2Send = 0;
    private ServiceConnection mConnection = new C00691();
    private final Context mContext;
    private IBluetoothHidDeviceUtility mHidDeviceUtility = null;
    private Thread mIntSendThread = null;
    private boolean mIntSendThreadStarted = false;
    private byte mKBDataAbout2Send = (byte) 0;
    private boolean mKBIntAbout2Send = false;
    private long mLastMouseTime = 0;
    private boolean mMouseIntAbout2Send = false;
    private byte mMouseLButtonAbout2Send = (byte) 0;
    private int mMouseXAbout2Send = 0;
    private int mMouseYAbout2Send = 0;
    private int mThreadLatency = 100;

    /* renamed from: com.autochips.bluetooth.hid.BluetoothHidAdapter$1 */
    class C00691 implements ServiceConnection {
        C00691() {
        }

        public void onServiceConnected(ComponentName className, IBinder service) {
            if (BluetoothHidAdapter.DEBUG) {
                Log.w(BluetoothHidAdapter.TAG, "BluetoothHidDeviceUtility Connected ");
            }
            BluetoothHidAdapter.this.mHidDeviceUtility = Stub.asInterface(service);
        }

        public void onServiceDisconnected(ComponentName className) {
            if (BluetoothHidAdapter.DEBUG) {
                Log.w(BluetoothHidAdapter.TAG, "BluetoothHidDeviceUtility Disconnected ");
            }
            BluetoothHidAdapter.this.mHidDeviceUtility = null;
        }
    }

    public static BluetoothHidAdapter getInstance(Context context) {
        BluetoothHidAdapter bluetoothHidAdapter;
        synchronized (BluetoothHidAdapter.class) {
            if (mInstance == null) {
                mInstance = new BluetoothHidAdapter(context);
            }
            bluetoothHidAdapter = mInstance;
        }
        return bluetoothHidAdapter;
    }

    public BluetoothHidAdapter(Context context) {
        if (DEBUG) {
            Log.i(TAG, "bindService ");
        }
        this.mContext = context;
        if (context.getApplicationContext().bindService(new Intent(context, BluetoothHidService.class), this.mConnection, 0)) {
            if (DEBUG) {
                Log.i(TAG, "bindService success");
            }
        } else if (DEBUG) {
            Log.e(TAG, "cannot bindService !!! ");
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

    public synchronized boolean connect(String addr) throws RemoteException {
        boolean connect;
        if (DEBUG) {
            Log.i(TAG, "connect ");
        }
        if (this.mHidDeviceUtility != null) {
            connect = this.mHidDeviceUtility.connect(addr);
        } else {
            Log.e(TAG, "Adapter not bind to service!!! ");
            connect = false;
        }
        return connect;
    }

    public synchronized boolean disconnect() throws RemoteException {
        boolean disconnect;
        if (DEBUG) {
            Log.i(TAG, "disconnect ");
        }
        if (this.mHidDeviceUtility != null) {
            disconnect = this.mHidDeviceUtility.disconnect();
        } else {
            Log.e(TAG, "Adapter not bind to service!!! ");
            disconnect = false;
        }
        return disconnect;
    }

    public synchronized boolean isConnected() throws RemoteException {
        boolean isHidConnected;
        if (this.mHidDeviceUtility != null) {
            isHidConnected = this.mHidDeviceUtility.isHidConnected();
        } else {
            Log.e(TAG, "Adapter not bind to service!!! ");
            isHidConnected = false;
        }
        return isHidConnected;
    }

    public synchronized String getConnectedAddr() throws RemoteException {
        String connectedAddr;
        if (this.mHidDeviceUtility != null) {
            connectedAddr = this.mHidDeviceUtility.getConnectedAddr();
        } else {
            Log.e(TAG, "Adapter not bind to service!!! ");
            connectedAddr = null;
        }
        return connectedAddr;
    }

    public synchronized boolean sendMouseData(boolean buttonDown, int relativeX, int relativeY) throws RemoteException {
        boolean z = true;
        byte b = (byte) 0;
        synchronized (this) {
            if (DEBUG) {
                Log.i(TAG, "sendMouseData button=" + buttonDown + ",X=" + relativeX + ",Y=" + relativeY);
            }
            if (this.mHidDeviceUtility.isHidConnected() && this.mIntSendThreadStarted) {
                if (this.mMouseIntAbout2Send) {
                    this.mMouseXAbout2Send += relativeX;
                    this.mMouseYAbout2Send += relativeY;
                } else {
                    this.mMouseXAbout2Send = relativeX;
                    this.mMouseYAbout2Send = relativeY;
                    this.mMouseIntAbout2Send = true;
                }
                if (buttonDown) {
                    b = (byte) 1;
                }
                this.mMouseLButtonAbout2Send = b;
            } else {
                if (DEBUG) {
                    Log.i(TAG, "sendMouseData fails.");
                }
                this.mMouseIntAbout2Send = false;
                z = false;
            }
        }
        return z;
    }

    public synchronized boolean sendKeyboardData(byte keyCode) throws RemoteException {
        boolean z = true;
        synchronized (this) {
            if (DEBUG) {
                Log.i(TAG, "sendKeyboardData key=" + keyCode);
            }
            if (this.mHidDeviceUtility.isHidConnected() && this.mIntSendThreadStarted) {
                this.mKBDataAbout2Send = keyCode;
                this.mKBIntAbout2Send = true;
            } else {
                if (DEBUG) {
                    Log.i(TAG, "sendKeyboardData fails.");
                }
                this.mKBIntAbout2Send = false;
                z = false;
            }
        }
        return z;
    }

    public synchronized boolean sendControlData(int cmdCode) throws RemoteException {
        boolean z = true;
        synchronized (this) {
            if (DEBUG) {
                Log.i(TAG, "sendControlData cmd=" + cmdCode);
            }
            if (this.mHidDeviceUtility.isHidConnected() && this.mIntSendThreadStarted) {
                this.mCMDAbout2Send = cmdCode;
                this.mACIntAbout2Send = true;
            } else {
                if (DEBUG) {
                    Log.i(TAG, "sendControlData fails.");
                }
                this.mACIntAbout2Send = false;
                z = false;
            }
        }
        return z;
    }

    public synchronized boolean startHIDSendThread(int threadLatency) {
        boolean z = true;
        synchronized (this) {
            if (DEBUG) {
                Log.i(TAG, "startHIDSendThread start");
            }
            if (this.mIntSendThread != null) {
                if (DEBUG) {
                    Log.i(TAG, "startHIDSendThread has beed started.");
                }
                z = false;
            } else {
                this.mThreadLatency = threadLatency;
                if (threadLatency > MAX_INTERRUPT_LATENCY || threadLatency < 10) {
                    this.mThreadLatency = 100;
                }
                this.mIntSendThread = new Thread(TAG) {
                    public void run() {
                        if (BluetoothHidAdapter.DEBUG) {
                            Log.i(BluetoothHidAdapter.TAG, "HID send Thread  starting. latency is " + BluetoothHidAdapter.this.mThreadLatency);
                        }
                        BluetoothHidAdapter.this.mMouseIntAbout2Send = false;
                        BluetoothHidAdapter.this.mACIntAbout2Send = false;
                        BluetoothHidAdapter.this.mKBIntAbout2Send = false;
                        BluetoothHidAdapter.this.mLastMouseTime = SystemClock.elapsedRealtime();
                        while (BluetoothHidAdapter.this.mIntSendThreadStarted) {
                            try {
                                byte[] dataSend;
                                if (BluetoothHidAdapter.this.mMouseIntAbout2Send) {
                                    int ySend;
                                    double scale = BluetoothHidAdapter.this.calculateMouseScale(SystemClock.elapsedRealtime() - BluetoothHidAdapter.this.mLastMouseTime, BluetoothHidAdapter.this.mMouseXAbout2Send, BluetoothHidAdapter.this.mMouseYAbout2Send);
                                    int xSend = BluetoothHidAdapter.this.mMouseXAbout2Send >= 0 ? (int) ((((double) BluetoothHidAdapter.this.mMouseXAbout2Send) / scale) + 0.5d) : (int) ((((double) BluetoothHidAdapter.this.mMouseXAbout2Send) / scale) - 0.5d);
                                    if (BluetoothHidAdapter.this.mMouseYAbout2Send >= 0) {
                                        ySend = (int) ((((double) BluetoothHidAdapter.this.mMouseYAbout2Send) / scale) + 0.5d);
                                    } else {
                                        ySend = (int) ((((double) BluetoothHidAdapter.this.mMouseYAbout2Send) / scale) - 0.5d);
                                    }
                                    BluetoothHidAdapter.this.mHidDeviceUtility.sendIntData(new byte[]{(byte) 1, BluetoothHidAdapter.this.mMouseLButtonAbout2Send, (byte) xSend, (byte) (xSend >> 8), (byte) ySend, (byte) (ySend >> 8)}, 6);
                                    BluetoothHidAdapter.this.mMouseIntAbout2Send = false;
                                    BluetoothHidAdapter.this.mLastMouseTime = SystemClock.elapsedRealtime();
                                }
                                if (BluetoothHidAdapter.this.mKBIntAbout2Send) {
                                    dataSend = new byte[]{(byte) 2, BluetoothHidAdapter.this.mKBDataAbout2Send};
                                    BluetoothHidAdapter.this.mHidDeviceUtility.sendIntData(dataSend, 2);
                                    dataSend[1] = (byte) 0;
                                    BluetoothHidAdapter.this.mHidDeviceUtility.sendIntData(dataSend, 2);
                                    BluetoothHidAdapter.this.mMouseIntAbout2Send = false;
                                }
                                if (BluetoothHidAdapter.this.mACIntAbout2Send) {
                                    dataSend = new byte[]{BluetoothHidAdapter.AC_REPORT_ID, (byte) BluetoothHidAdapter.this.mCMDAbout2Send, (byte) (BluetoothHidAdapter.this.mCMDAbout2Send >> 8)};
                                    BluetoothHidAdapter.this.mHidDeviceUtility.sendIntData(dataSend, 3);
                                    dataSend[1] = (byte) 0;
                                    dataSend[2] = (byte) 0;
                                    BluetoothHidAdapter.this.mHidDeviceUtility.sendIntData(dataSend, 3);
                                    BluetoothHidAdapter.this.mACIntAbout2Send = false;
                                }
                                C00702.sleep((long) BluetoothHidAdapter.this.mThreadLatency);
                            } catch (Exception e) {
                            }
                        }
                        if (BluetoothHidAdapter.DEBUG) {
                            Log.i(BluetoothHidAdapter.TAG, "HID send Thread finished");
                        }
                    }
                };
                this.mIntSendThreadStarted = true;
                this.mIntSendThread.start();
            }
        }
        return z;
    }

    public synchronized void stopHIDSendThread() {
        if (DEBUG) {
            Log.i(TAG, "stopHIDSendThread start");
        }
        this.mIntSendThreadStarted = false;
        if (this.mIntSendThread != null) {
            this.mIntSendThread = null;
        }
    }

    private double calculateMouseScale(long timeElapsed, int x, int y) {
        if (timeElapsed >= 90) {
            return 1.0d;
        }
        double speedTmp = (Math.hypot((double) x, (double) y) / ((double) timeElapsed)) * 1000.0d;
        if (speedTmp <= 500.0d) {
            return 1.0d;
        }
        if (speedTmp >= 9000.0d) {
            return 3.0d;
        }
        double scale = (Math.sqrt((8.0E-4d * speedTmp) + 0.09d) + 0.3d) + ACCELERATION_SCALE_ADJUSTMENT_CONST;
        if (scale <= 1.0d) {
            return 1.0d;
        }
        if (scale >= 3.0d) {
            return 3.0d;
        }
        return scale;
    }

    public synchronized void close() {
        this.mIntSendThreadStarted = false;
        if (this.mIntSendThread != null) {
            this.mIntSendThread.stop();
        }
        this.mIntSendThread = null;
        mInstance = null;
        if (this.mConnection != null) {
            if (DEBUG) {
                Log.d(TAG, "+unbindService()");
            }
            this.mContext.unbindService(this.mConnection);
            this.mConnection = null;
        }
    }
}
