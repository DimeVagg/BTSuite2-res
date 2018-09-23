package com.autochips.bluetooth.PbSyncManager;

import android.bluetooth.BluetoothDevice;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import java.util.List;

public interface IPBSyncManager extends IInterface {

    public static abstract class Stub extends Binder implements IPBSyncManager {
        private static final String DESCRIPTOR = "com.autochips.bluetooth.PbSyncManager.IPBSyncManager";
        static final int TRANSACTION_AddCall = 12;
        static final int TRANSACTION_ClearRemoteDevice = 4;
        static final int TRANSACTION_DeInit = 2;
        static final int TRANSACTION_GetNameByTelExectly = 11;
        static final int TRANSACTION_GetRecCnt = 8;
        static final int TRANSACTION_GetRecord = 9;
        static final int TRANSACTION_GetSyncPath = 17;
        static final int TRANSACTION_GetSyncState = 16;
        static final int TRANSACTION_Init = 1;
        static final int TRANSACTION_SearchPhonebook = 10;
        static final int TRANSACTION_SetDownloadMaxCnt = 13;
        static final int TRANSACTION_SetIndStep = 7;
        static final int TRANSACTION_SetRemoteDevInfo = 15;
        static final int TRANSACTION_SetRemoteDevice = 3;
        static final int TRANSACTION_SetTimeOutVal = 14;
        static final int TRANSACTION_StartDownload = 5;
        static final int TRANSACTION_StopDownload = 6;

        private static class Proxy implements IPBSyncManager {
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

            public boolean Init() throws RemoteException {
                boolean _result = true;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
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

            public boolean DeInit() throws RemoteException {
                boolean _result = false;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(2, _data, _reply, 0);
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

            public boolean SetRemoteDevice(BluetoothDevice remoteDevice, int path) throws RemoteException {
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
                    _data.writeInt(path);
                    this.mRemote.transact(3, _data, _reply, 0);
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

            public boolean ClearRemoteDevice() throws RemoteException {
                boolean _result = false;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(4, _data, _reply, 0);
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
                    this.mRemote.transact(5, _data, _reply, 0);
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

            public boolean StopDownload(int path) throws RemoteException {
                boolean _result = false;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(path);
                    this.mRemote.transact(6, _data, _reply, 0);
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

            public boolean SetIndStep(int path) throws RemoteException {
                boolean _result = false;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(path);
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

            public int GetRecCnt(String btaddr, int path) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(btaddr);
                    _data.writeInt(path);
                    this.mRemote.transact(8, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public boolean GetRecord(int path, int u4FirstIdx, int u4RecCnt, List<PBRecord> record) throws RemoteException {
                boolean z = false;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(path);
                    _data.writeInt(u4FirstIdx);
                    _data.writeInt(u4RecCnt);
                    _data.writeTypedList(record);
                    this.mRemote.transact(9, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        z = true;
                    }
                    _reply.readTypedList(record, PBRecord.CREATOR);
                    return z;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public boolean SearchPhonebook(String btAddr, String search, List<PBRecord> record) throws RemoteException {
                boolean z = false;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(btAddr);
                    _data.writeString(search);
                    _data.writeTypedList(record);
                    this.mRemote.transact(10, _data, _reply, 0);
                    _reply.readException();
                    if (_reply.readInt() != 0) {
                        z = true;
                    }
                    _reply.readTypedList(record, PBRecord.CREATOR);
                    return z;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public String GetNameByTelExectly(String btAddr, String tel) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(btAddr);
                    _data.writeString(tel);
                    this.mRemote.transact(11, _data, _reply, 0);
                    _reply.readException();
                    String _result = _reply.readString();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public void AddCall(int type, String name, String tel, String time) throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(type);
                    _data.writeString(name);
                    _data.writeString(tel);
                    _data.writeString(time);
                    this.mRemote.transact(12, _data, _reply, 0);
                    _reply.readException();
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public boolean SetDownloadMaxCnt(int path, int iMaxCnt) throws RemoteException {
                boolean _result = false;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(path);
                    _data.writeInt(iMaxCnt);
                    this.mRemote.transact(13, _data, _reply, 0);
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

            public boolean SetTimeOutVal(int path, int iTimeOut) throws RemoteException {
                boolean _result = false;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeInt(path);
                    _data.writeInt(iTimeOut);
                    this.mRemote.transact(14, _data, _reply, 0);
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

            public boolean SetRemoteDevInfo(String factory, String serial, String imei) throws RemoteException {
                boolean _result = false;
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(factory);
                    _data.writeString(serial);
                    _data.writeString(imei);
                    this.mRemote.transact(15, _data, _reply, 0);
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

            public int GetSyncState() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(16, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }

            public int GetSyncPath() throws RemoteException {
                Parcel _data = Parcel.obtain();
                Parcel _reply = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(17, _data, _reply, 0);
                    _reply.readException();
                    int _result = _reply.readInt();
                    return _result;
                } finally {
                    _reply.recycle();
                    _data.recycle();
                }
            }
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IPBSyncManager asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin == null || !(iin instanceof IPBSyncManager)) {
                return new Proxy(obj);
            }
            return (IPBSyncManager) iin;
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
                    data.enforceInterface(DESCRIPTOR);
                    _result = Init();
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 2:
                    data.enforceInterface(DESCRIPTOR);
                    _result = DeInit();
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 3:
                    BluetoothDevice _arg02;
                    data.enforceInterface(DESCRIPTOR);
                    if (data.readInt() != 0) {
                        _arg02 = (BluetoothDevice) BluetoothDevice.CREATOR.createFromParcel(data);
                    } else {
                        _arg02 = null;
                    }
                    _result = SetRemoteDevice(_arg02, data.readInt());
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 4:
                    data.enforceInterface(DESCRIPTOR);
                    _result = ClearRemoteDevice();
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 5:
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
                case 6:
                    data.enforceInterface(DESCRIPTOR);
                    _result = StopDownload(data.readInt());
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 7:
                    data.enforceInterface(DESCRIPTOR);
                    _result = SetIndStep(data.readInt());
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 8:
                    data.enforceInterface(DESCRIPTOR);
                    _result2 = GetRecCnt(data.readString(), data.readInt());
                    reply.writeNoException();
                    reply.writeInt(_result2);
                    return true;
                case 9:
                    data.enforceInterface(DESCRIPTOR);
                    _arg0 = data.readInt();
                    int _arg12 = data.readInt();
                    int _arg2 = data.readInt();
                    List<PBRecord> _arg3 = data.createTypedArrayList(PBRecord.CREATOR);
                    _result = GetRecord(_arg0, _arg12, _arg2, _arg3);
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    reply.writeTypedList(_arg3);
                    return true;
                case 10:
                    data.enforceInterface(DESCRIPTOR);
                    String _arg03 = data.readString();
                    String _arg13 = data.readString();
                    List<PBRecord> _arg22 = data.createTypedArrayList(PBRecord.CREATOR);
                    _result = SearchPhonebook(_arg03, _arg13, _arg22);
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    reply.writeTypedList(_arg22);
                    return true;
                case 11:
                    data.enforceInterface(DESCRIPTOR);
                    String _result3 = GetNameByTelExectly(data.readString(), data.readString());
                    reply.writeNoException();
                    reply.writeString(_result3);
                    return true;
                case 12:
                    data.enforceInterface(DESCRIPTOR);
                    AddCall(data.readInt(), data.readString(), data.readString(), data.readString());
                    reply.writeNoException();
                    return true;
                case 13:
                    data.enforceInterface(DESCRIPTOR);
                    _result = SetDownloadMaxCnt(data.readInt(), data.readInt());
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 14:
                    data.enforceInterface(DESCRIPTOR);
                    _result = SetTimeOutVal(data.readInt(), data.readInt());
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 15:
                    data.enforceInterface(DESCRIPTOR);
                    _result = SetRemoteDevInfo(data.readString(), data.readString(), data.readString());
                    reply.writeNoException();
                    if (_result) {
                        i = 1;
                    }
                    reply.writeInt(i);
                    return true;
                case 16:
                    data.enforceInterface(DESCRIPTOR);
                    _result2 = GetSyncState();
                    reply.writeNoException();
                    reply.writeInt(_result2);
                    return true;
                case 17:
                    data.enforceInterface(DESCRIPTOR);
                    _result2 = GetSyncPath();
                    reply.writeNoException();
                    reply.writeInt(_result2);
                    return true;
                case 1598968902:
                    reply.writeString(DESCRIPTOR);
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    }

    void AddCall(int i, String str, String str2, String str3) throws RemoteException;

    boolean ClearRemoteDevice() throws RemoteException;

    boolean DeInit() throws RemoteException;

    String GetNameByTelExectly(String str, String str2) throws RemoteException;

    int GetRecCnt(String str, int i) throws RemoteException;

    boolean GetRecord(int i, int i2, int i3, List<PBRecord> list) throws RemoteException;

    int GetSyncPath() throws RemoteException;

    int GetSyncState() throws RemoteException;

    boolean Init() throws RemoteException;

    boolean SearchPhonebook(String str, String str2, List<PBRecord> list) throws RemoteException;

    boolean SetDownloadMaxCnt(int i, int i2) throws RemoteException;

    boolean SetIndStep(int i) throws RemoteException;

    boolean SetRemoteDevInfo(String str, String str2, String str3) throws RemoteException;

    boolean SetRemoteDevice(BluetoothDevice bluetoothDevice, int i) throws RemoteException;

    boolean SetTimeOutVal(int i, int i2) throws RemoteException;

    boolean StartDownload(int i, boolean z) throws RemoteException;

    boolean StopDownload(int i) throws RemoteException;
}
