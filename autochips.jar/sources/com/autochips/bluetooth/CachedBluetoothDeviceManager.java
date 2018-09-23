package com.autochips.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothProfileManager.Profile;
import android.util.Log;
import com.autochips.bluetooth.LocalBluetoothManager.Callback;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class CachedBluetoothDeviceManager {
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugSettings);
    private static final String TAG = "CachedBluetoothDeviceManager";
    final List<CachedBluetoothDevice> mCachedDevices = new ArrayList();
    final List<Callback> mCallbacks;
    final LocalBluetoothManager mLocalManager;

    public CachedBluetoothDeviceManager(LocalBluetoothManager localManager) {
        this.mLocalManager = localManager;
        this.mCallbacks = localManager.getCallbacks();
        readPairedDevices();
    }

    private synchronized boolean readPairedDevices() {
        boolean z;
        Set<BluetoothDevice> bondedDevices = this.mLocalManager.getBluetoothAdapter().getBondedDevices();
        if (bondedDevices == null) {
            z = false;
        } else {
            z = false;
            for (BluetoothDevice device : bondedDevices) {
                if (findDevice(device) == null) {
                    CachedBluetoothDevice cachedDevice = new CachedBluetoothDevice(this.mLocalManager.getContext(), device);
                    this.mCachedDevices.add(cachedDevice);
                    dispatchDeviceAdded(cachedDevice);
                    z = true;
                }
            }
        }
        return z;
    }

    public synchronized List<CachedBluetoothDevice> getCachedDevicesCopy() {
        return new ArrayList(this.mCachedDevices);
    }

    void onBluetoothStateChanged(boolean enabled) {
        if (enabled) {
            readPairedDevices();
        }
    }

    public synchronized void onDeviceAppeared(BluetoothDevice device, short rssi, BluetoothClass btClass, String name) {
        boolean deviceAdded = false;
        CachedBluetoothDevice cachedDevice = findDevice(device);
        if (cachedDevice == null) {
            cachedDevice = new CachedBluetoothDevice(this.mLocalManager.getContext(), device);
            this.mCachedDevices.add(cachedDevice);
            deviceAdded = true;
        }
        cachedDevice.setRssi(rssi);
        cachedDevice.setBtClass(btClass);
        cachedDevice.setName(name);
        cachedDevice.setVisible(true);
        if (deviceAdded) {
            dispatchDeviceAdded(cachedDevice);
        }
    }

    public synchronized void onDeviceDisappeared(BluetoothDevice device) {
        CachedBluetoothDevice cachedDevice = findDevice(device);
        if (cachedDevice != null) {
            cachedDevice.setVisible(false);
            checkForDeviceRemoval(cachedDevice);
        }
    }

    private void checkForDeviceRemoval(CachedBluetoothDevice cachedDevice) {
        if (cachedDevice.getBondState() == 10 && !cachedDevice.isVisible()) {
            this.mCachedDevices.remove(cachedDevice);
            dispatchDeviceDeleted(cachedDevice);
        }
    }

    public synchronized void onDeviceNameUpdated(BluetoothDevice device) {
        CachedBluetoothDevice cachedDevice = findDevice(device);
        if (cachedDevice != null) {
            cachedDevice.refreshName();
        }
    }

    public synchronized CachedBluetoothDevice findDevice(BluetoothDevice device) {
        CachedBluetoothDevice cachedDevice;
        for (int i = this.mCachedDevices.size() - 1; i >= 0; i--) {
            cachedDevice = (CachedBluetoothDevice) this.mCachedDevices.get(i);
            if (cachedDevice.getDevice().equals(device)) {
                break;
            }
        }
        cachedDevice = null;
        return cachedDevice;
    }

    public String getName(BluetoothDevice device) {
        CachedBluetoothDevice cachedDevice = findDevice(device);
        if (cachedDevice != null) {
            return cachedDevice.getName();
        }
        String name = device.getName();
        return name == null ? device.getAddress() : name;
    }

    private void dispatchDeviceAdded(CachedBluetoothDevice cachedDevice) {
        synchronized (this.mCallbacks) {
            for (Callback callback : this.mCallbacks) {
                callback.onDeviceAdded(cachedDevice);
            }
        }
    }

    private void dispatchDeviceDeleted(CachedBluetoothDevice cachedDevice) {
        synchronized (this.mCallbacks) {
            for (Callback callback : this.mCallbacks) {
                callback.onDeviceDeleted(cachedDevice);
            }
        }
    }

    public synchronized void onBondingStateChanged(BluetoothDevice device, int bondState) {
        CachedBluetoothDevice cachedDevice = findDevice(device);
        if (cachedDevice == null) {
            if (readPairedDevices()) {
                cachedDevice = findDevice(device);
                if (cachedDevice == null) {
                    if (DEBUG) {
                        Log.e(TAG, "Got bonding state changed for " + device + "but device not added in cache");
                    }
                }
            } else if (DEBUG) {
                Log.e(TAG, "Got bonding state changed for " + device + ", but we have no record of that device.");
            }
        }
        cachedDevice.onBondingStateChanged(bondState);
    }

    public synchronized void showUnbondMessage(BluetoothDevice device, int reason) {
    }

    public synchronized void onProfileStateChanged(BluetoothDevice device, Profile profile, int newProfileState) {
        CachedBluetoothDevice cachedDevice = findDevice(device);
        if (cachedDevice != null) {
            cachedDevice.onProfileStateChanged(profile, newProfileState);
            cachedDevice.refresh();
        }
    }

    public synchronized void onConnectingError(BluetoothDevice device) {
        CachedBluetoothDevice cachedDevice = findDevice(device);
        if (cachedDevice != null) {
            cachedDevice.showConnectingError();
        }
    }

    public synchronized void onScanningStateChanged(boolean started) {
        if (started) {
            for (int i = this.mCachedDevices.size() - 1; i >= 0; i--) {
                CachedBluetoothDevice cachedDevice = (CachedBluetoothDevice) this.mCachedDevices.get(i);
                cachedDevice.setVisible(false);
                checkForDeviceRemoval(cachedDevice);
            }
        }
    }

    public synchronized void onBtClassChanged(BluetoothDevice device) {
        CachedBluetoothDevice cachedDevice = findDevice(device);
        if (cachedDevice != null) {
            cachedDevice.refreshBtClass();
        }
    }

    public synchronized void onUuidChanged(BluetoothDevice device) {
        if (DEBUG) {
            Log.d(TAG, "onUuidChanged");
        }
        CachedBluetoothDevice cachedDevice = findDevice(device);
        if (cachedDevice != null) {
            cachedDevice.onUuidChanged();
        }
    }
}
