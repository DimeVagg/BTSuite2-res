package com.autochips.bluetooth.spp;

import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.ParcelUuid;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class SppService extends Service {
    public static final String AT_RESPOND = "AT_Respond";
    private static final boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugSPP);
    public static final ParcelUuid SPP_ParcelUuid = ParcelUuid.fromString("00001101-0000-1000-8000-00805F9B34FB");
    public static final int SPP_RECIEVE_RESPOND = 10001;
    public static final int SPP_RECIEVE_RESPOND_SMS = 10003;
    public static final int SPP_STATE_CHANGE = 10000;
    public static final int SPP_STATE_CHANGE_SMS = 10002;
    public static final UUID SPP_UUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
    public static final int STATE_CONNECTED = 2;
    public static final int STATE_CONNECTED_FAILED = 3;
    public static final int STATE_CONNECTING = 1;
    public static final int STATE_DISCONNECTED_IND = 4;
    public static final int STATE_NONE = 0;
    private static final String TAG = "SppService";
    private BluetoothAdapter mAdapter = BluetoothAdapter.getDefaultAdapter();
    private final IBinder mBinder = new LocalBinder();
    private ConnectThread mConnectThread;
    private ConnectedThread mConnectedThread;
    private Handler mHandler;
    private BluetoothDevice mRemoteDevice;
    private boolean mSetNewCommand = false;
    private boolean mSetSyncSms = false;
    private Handler mSppHandler;
    private int mState;
    private boolean mfgIsSppSerial = false;

    private class ConnectThread extends Thread {
        private String mSocketType;
        private final BluetoothDevice mmDevice;
        private final BluetoothSocket mmSocket;

        public ConnectThread(BluetoothDevice device, boolean secure) {
            this.mmDevice = device;
            BluetoothSocket tmp = null;
            this.mSocketType = secure ? "Secure" : "Insecure";
            if (secure) {
                try {
                    tmp = device.createRfcommSocketToServiceRecord(SppService.SPP_UUID);
                } catch (IOException e) {
                    if (SppService.DEBUG) {
                        Log.e(SppService.TAG, "Socket Type: " + this.mSocketType + "create() failed", e);
                    }
                }
            } else {
                tmp = device.createInsecureRfcommSocketToServiceRecord(SppService.SPP_UUID);
            }
            this.mmSocket = tmp;
        }

        public void run() {
            if (SppService.DEBUG) {
                Log.i(SppService.TAG, "BEGIN mConnectThread SocketType:" + this.mSocketType);
            }
            setName("ConnectThread" + this.mSocketType);
            SppService.this.mAdapter.cancelDiscovery();
            try {
                this.mmSocket.connect();
                synchronized (SppService.this) {
                    SppService.this.mConnectThread = null;
                }
                SppService.this.connected(this.mmSocket, this.mmDevice, this.mSocketType);
            } catch (IOException e) {
                try {
                    this.mmSocket.close();
                } catch (IOException e2) {
                    if (SppService.DEBUG) {
                        Log.e(SppService.TAG, "unable to close() " + this.mSocketType + " socket during connection failure", e2);
                    }
                }
                SppService.this.connectionFailed();
                synchronized (SppService.this) {
                    SppService.this.mConnectThread = null;
                }
            }
        }

        public void cancel() {
            try {
                this.mmSocket.close();
            } catch (IOException e) {
                if (SppService.DEBUG) {
                    Log.e(SppService.TAG, "close() of connect " + this.mSocketType + " socket failed", e);
                }
            }
        }
    }

    private class ConnectedThread extends Thread {
        volatile boolean bCloseSocket = false;
        private final InputStream mmInStream;
        private final OutputStream mmOutStream;
        private final BluetoothSocket mmSocket;

        public ConnectedThread(BluetoothSocket socket, String socketType) {
            if (SppService.DEBUG) {
                Log.d(SppService.TAG, "create ConnectedThread: " + socketType);
            }
            this.mmSocket = socket;
            InputStream tmpIn = null;
            OutputStream tmpOut = null;
            this.bCloseSocket = false;
            try {
                tmpIn = socket.getInputStream();
                tmpOut = socket.getOutputStream();
            } catch (IOException e) {
                if (SppService.DEBUG) {
                    Log.e(SppService.TAG, "temp sockets not created", e);
                }
            }
            this.mmInStream = tmpIn;
            this.mmOutStream = tmpOut;
        }

        public void run() {
            if (SppService.DEBUG) {
                Log.i(SppService.TAG, "BEGIN mConnectedThread");
            }
            String sCombineRead = null;
            byte[] buffer = new byte[1024];
            String strOKEnd = "OK\r\n";
            String strErrEnd = "ERROR\r\n";
            String strSpcialSmsErrEnd = "CMS ERROR";
            int iOKlength = strOKEnd.length();
            int iERRORlength = strErrEnd.length();
            while (!this.bCloseSocket) {
                int bytes = this.mmInStream.read(buffer);
                if (SppService.DEBUG) {
                    Log.i(SppService.TAG, "read:" + new String(buffer, 0, bytes));
                }
                String sRead = new String(buffer, 0, bytes);
                if (SppService.this.mSetNewCommand) {
                    sCombineRead = sRead;
                    SppService.this.mSetNewCommand = false;
                } else {
                    try {
                        sCombineRead = sCombineRead + sRead;
                    } catch (IOException e) {
                        if (!this.bCloseSocket) {
                            if (SppService.DEBUG) {
                                Log.e(SppService.TAG, "[SPP]disconnected by phone", e);
                            }
                            SppService.this.connectionLost();
                            return;
                        } else if (SppService.DEBUG) {
                            Log.e(SppService.TAG, "[SPP]disconnected success", e);
                            return;
                        } else {
                            return;
                        }
                    }
                }
                Message msg;
                Bundle bundle;
                if (SppService.this.mfgIsSppSerial) {
                    msg = SppService.this.mSppHandler.obtainMessage(10001);
                    bundle = new Bundle();
                    bundle.putString("AT_Respond", sRead);
                    msg.setData(bundle);
                    SppService.this.mHandler.sendMessage(msg);
                } else if (sRead.lastIndexOf(strOKEnd) >= 0 || sRead.lastIndexOf(strErrEnd) >= 0 || sCombineRead.lastIndexOf(strOKEnd) >= 0 || sCombineRead.lastIndexOf(strErrEnd) >= 0 || sRead.lastIndexOf(strSpcialSmsErrEnd) >= 0 || sCombineRead.lastIndexOf(strSpcialSmsErrEnd) >= 0) {
                    if (SppService.this.mSetSyncSms) {
                        msg = SppService.this.mSppHandler.obtainMessage(10003);
                        bundle = new Bundle();
                        bundle.putString("AT_Respond", sCombineRead);
                        msg.setData(bundle);
                        SppService.this.mSppHandler.sendMessage(msg);
                    } else {
                        msg = SppService.this.mHandler.obtainMessage(10001);
                        bundle = new Bundle();
                        bundle.putString("AT_Respond", sCombineRead);
                        msg.setData(bundle);
                        SppService.this.mHandler.sendMessage(msg);
                    }
                }
            }
        }

        public void write(byte[] buffer) {
            try {
                SppService.this.mSetNewCommand = true;
                String sendMessage = new String(buffer);
                if (SppService.DEBUG) {
                    Log.i(SppService.TAG, "send AT Command:" + sendMessage);
                }
                this.mmOutStream.write(buffer);
            } catch (IOException e) {
                if (SppService.DEBUG) {
                    Log.e(SppService.TAG, "Exception during write", e);
                }
                SppService.this.connectionLost();
            }
        }

        public void cancel() {
            try {
                this.bCloseSocket = true;
                this.mmSocket.close();
            } catch (IOException e) {
                if (SppService.DEBUG) {
                    Log.e(SppService.TAG, "close() of connect socket failed", e);
                }
            }
        }
    }

    public class LocalBinder extends Binder {
        public SppService getSppService() {
            return SppService.this;
        }
    }

    public void onCreate() {
        this.mState = 0;
    }

    public void onDestroy() {
        if (this.mConnectThread != null) {
            this.mConnectThread.cancel();
            this.mConnectThread = null;
        }
        if (this.mConnectedThread != null) {
            this.mConnectedThread.cancel();
            this.mConnectedThread = null;
        }
    }

    public IBinder onBind(Intent intent) {
        return this.mBinder;
    }

    public void onTaskRemoved(Intent rootIntent) {
        if (DEBUG) {
            Log.d(TAG, "onTaskRemoved()");
        }
        super.onTaskRemoved(rootIntent);
        stopSelf();
    }

    private synchronized void setState(int state) {
        if (DEBUG) {
            Log.d(TAG, "setState() " + this.mState + " -> " + state);
        }
        this.mState = state;
        if (this.mSetSyncSms) {
            if (DEBUG) {
                Log.d(TAG, "Sent to SMS");
            }
            this.mSppHandler.obtainMessage(SPP_STATE_CHANGE_SMS, state, -1).sendToTarget();
        } else {
            if (DEBUG) {
                Log.d(TAG, "Sent to PB");
            }
            this.mHandler.obtainMessage(SPP_STATE_CHANGE, state, -1).sendToTarget();
        }
    }

    public synchronized int getState() {
        return this.mState;
    }

    public synchronized void setHandler(Handler handler) {
        this.mHandler = handler;
    }

    public synchronized void setSppHandler(Handler handler) {
        this.mSppHandler = handler;
    }

    public synchronized void setSyncObject(boolean b) {
        if (DEBUG) {
            Log.d(TAG, "setSyncObject param is: " + b);
        }
        this.mSetSyncSms = b;
    }

    public void setSppType(boolean fgIsSpp) {
        this.mfgIsSppSerial = fgIsSpp;
    }

    public synchronized void connect(String btAddr, boolean secure) {
        if (DEBUG) {
            Log.d(TAG, "connect to: " + btAddr);
        }
        this.mRemoteDevice = this.mAdapter.getRemoteDevice(btAddr);
        if (this.mAdapter.getBondedDevices().contains(this.mRemoteDevice)) {
            if (this.mState == 1 && this.mConnectThread != null) {
                this.mConnectThread.cancel();
                this.mConnectThread = null;
            }
            if (this.mConnectedThread != null) {
                this.mConnectedThread.cancel();
                this.mConnectedThread = null;
            }
            this.mConnectThread = new ConnectThread(this.mRemoteDevice, secure);
            this.mConnectThread.start();
            setState(1);
        } else if (DEBUG) {
            Log.e(TAG, btAddr + " has not paired, pair first!");
        }
    }

    public synchronized void disconnect() {
        if (DEBUG) {
            Log.d(TAG, "spp disconnect");
        }
        if (this.mConnectedThread != null) {
            this.mConnectedThread.cancel();
            this.mConnectedThread = null;
        }
        setState(0);
    }

    public synchronized void connected(BluetoothSocket socket, BluetoothDevice device, String socketType) {
        if (DEBUG) {
            Log.d(TAG, "connected, Socket Type:" + socketType);
        }
        if (this.mConnectThread != null) {
            this.mConnectThread.cancel();
            this.mConnectThread = null;
        }
        if (this.mConnectedThread != null) {
            this.mConnectedThread.cancel();
            this.mConnectedThread = null;
        }
        this.mConnectedThread = new ConnectedThread(socket, socketType);
        this.mConnectedThread.start();
        try {
            Thread.sleep(100);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        setState(2);
    }

    public void write(byte[] out) {
        synchronized (this) {
            if (this.mState != 2) {
                return;
            }
            ConnectedThread r = this.mConnectedThread;
            r.write(out);
        }
    }

    private void connectionFailed() {
        if (DEBUG) {
            Log.e(TAG, "connectionFailed()");
        }
        setState(3);
    }

    private void connectionLost() {
        if (DEBUG) {
            Log.e(TAG, "[SPP] phone disconnect");
        }
        setState(4);
    }

    public String getString() {
        return "SPP Service";
    }
}
