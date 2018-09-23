package com.autochips.bluetooth.dundt;

import android.bluetooth.BluetoothDevice;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import java.util.List;

public interface ISMSSyncManager extends IInterface {

    public static abstract class Stub extends Binder implements ISMSSyncManager {
        private static final String DESCRIPTOR = "com.autochips.bluetooth.dundt.ISMSSyncManager";
        static final int TRANSACTION_GetRecCnt = 4;
        static final int TRANSACTION_GetRecord = 5;
        static final int TRANSACTION_GetSyncState = 6;
        static final int TRANSACTION_SetRemoteDevInfo = 7;
        static final int TRANSACTION_SetRemoteDevice = 1;
        static final int TRANSACTION_StartDownload = 2;
        static final int TRANSACTION_StopDownload = 3;

        private static class Proxy implements ISMSSyncManager {
            private IBinder mRemote;

            Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            public boolean SetRemoteDevice(BluetoothDevice remoteDevice) throws RemoteException {
                boolean _result = true;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (remoteDevice != null) {
                        _data.writeInt(1);
                        remoteDevice.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(1, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() == 0) {
                        _result = false;
                    }
                    _reply.recycle();
                    _data.recycle();
                    return _result;
                } catch (Throwable th) {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public boolean StartDownload(int path, boolean bContinue) throws RemoteException {
                boolean _result = true;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    int i;
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(path);
                    if (bContinue) {
                        i = 1;
                    } else {
                        i = 0;
                    }
                    _data.writeInt(i);
                    this.mRemote.transact(2, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() == 0) {
                        _result = false;
                    }
                    _reply.recycle();
                    _data.recycle();
                    return _result;
                } catch (Throwable th) {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public boolean StopDownload() throws RemoteException {
                boolean _result = false;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(3, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        _result = true;
                    }
                    _reply.recycle();
                    _data.recycle();
                    return _result;
                } catch (Throwable th) {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public int GetRecCnt(int path) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(path);
                    this.mRemote.transact(4, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public boolean GetRecord(int path, int u4FirstIdx, int u4RecCnt, List<SMSRecord> record) throws RemoteException {
                boolean z = false;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(path);
                    _data.writeInt(u4FirstIdx);
                    _data.writeInt(u4RecCnt);
                    _data.writeTypedList(record);
                    this.mRemote.transact(5, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        z = true;
                    }
                    _reply.readTypedList(record, SMSRecord.CREATOR);
                    return z;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public int GetSyncState() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(6, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public boolean SetRemoteDevInfo(String factory, String serial, String imei) throws RemoteException {
                boolean _result = false;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(factory);
                    _data.writeString(serial);
                    _data.writeString(imei);
                    this.mRemote.transact(7, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        _result = true;
                    }
                    _reply.recycle();
                    _data.recycle();
                    return _result;
                } catch (Throwable th) {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static ISMSSyncManager asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin == null || !(iin instanceof ISMSSyncManager)) {
                return new Proxy(obj);
            }
            return (ISMSSyncManager) iin;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            int i = 0;
            boolean _result;
            int _arg0;
            int _result2;
            switch (code) {
                case 1:
                    BluetoothDevice _arg02;
                    data.enforceInterface(DESCRIPTOR);
                    if (data.readInt() != 0) {
                        _arg02 = (BluetoothDevice) BluetoothDevice.CREATOR.createFromParcel(data);
                    } else {
                        _arg02 = null;
                    }
                    _result = SetRemoteDevice(_arg02);
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 2:
                    boolean _arg1;
                    data.enforceInterface(DESCRIPTOR);
                    _arg0 = data.readInt();
                    if (data.readInt() != 0) {
                        _arg1 = true;
                    } else {
                        _arg1 = false;
                    }
                    _result = StartDownload(_arg0, _arg1);
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 3:
                    data.enforceInterface(DESCRIPTOR);
                    _result = StopDownload();
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 4:
                    data.enforceInterface(DESCRIPTOR);
                    _result2 = GetRecCnt(data.readInt());
                    reply.writeNoException();
                    reply.writeInt(_result2);
                    return true;
                case 5:
                    data.enforceInterface(DESCRIPTOR);
                    _arg0 = data.readInt();
                    int _arg12 = data.readInt();
                    int _arg2 = data.readInt();
                    List<SMSRecord> _arg3 = data.createTypedArrayList(SMSRecord.CREATOR);
                    _result = GetRecord(_arg0, _arg12, _arg2, _arg3);
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    reply.writeTypedList(_arg3);
                    return true;
                case 6:
                    data.enforceInterface(DESCRIPTOR);
                    _result2 = GetSyncState();
                    reply.writeNoException();
                    reply.writeInt(_result2);
                    return true;
                case 7:
                    data.enforceInterface(DESCRIPTOR);
                    _result = SetRemoteDevInfo(data.readString(), data.readString(), data.readString());
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    int GetRecCnt(int i) throws RemoteException;

    boolean GetRecord(int i, int i2, int i3, List<SMSRecord> list) throws RemoteException;

    int GetSyncState() throws RemoteException;

    boolean SetRemoteDevInfo(String str, String str2, String str3) throws RemoteException;

    boolean SetRemoteDevice(BluetoothDevice bluetoothDevice) throws RemoteException;

    boolean StartDownload(int i, boolean z) throws RemoteException;

    boolean StopDownload() throws RemoteException;
}
