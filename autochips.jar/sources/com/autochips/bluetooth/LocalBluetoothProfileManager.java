package com.autochips.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothProfileManager;
import android.bluetooth.BluetoothProfileManager.Profile;
import android.bluetooth.BluetoothUuid;
import android.content.Context;
import android.os.ParcelUuid;
import android.util.Log;
import java.util.List;
import java.util.Set;

public class LocalBluetoothProfileManager {
    public static final String A2DPSink_DEVICE_ADDR = "device_addr";
    public static final String A2DP_ACTION_SINK_STATE_CHANGED = "android.bluetooth.a2dp.action.SINK_STATE_CHANGED";
    public static final String A2DP_EXTRA_PREVIOUS_SINK_STATE = "android.bluetooth.a2dp.extra.PREVIOUS_SINK_STATE";
    public static final String A2DP_EXTRA_SINK_STATE = "android.bluetooth.a2dp.extra.SINK_STATE";
    static final ParcelUuid[] A2DP_PROFILE_UUIDS = new ParcelUuid[]{BluetoothUuid.AudioSink, BluetoothUuid.AdvAudioDist};
    public static final ParcelUuid[] A2DP_SINK_UUIDS = new ParcelUuid[]{BluetoothUuid.AudioSource, BluetoothUuid.AdvAudioDist};
    public static final String ACTION_ALL_PROFILES_DISABLED = "android.bluetooth.profilemanager.action.ALL_PROFILES_DISABLED";
    public static final String ACTION_DISABLE_PROFILES = "android.bluetooth.profilemanager.action.DISABLE_PROFILES";
    public static final String ACTION_PROFILE_STATE_UPDATE = "android.bluetooth.profilemanager.action.PROFILE_CHANGED";
    public static final String ACTION_STATE_CHANGED = "android.bluetooth.profilemanager.action.STATE_CHANGED";
    public static final String ACTION_TIMEOUT = "android.bluetooth.profilemanager.action.TIMEOUT";
    public static final String ACTION_UPDATE_NOTIFICATION = "android.bluetooth.profilemanager.action.UPDATE_ NOTIFICATION";
    public static final ParcelUuid[] AVRCP_CT_UUIDS = new ParcelUuid[]{BluetoothUuid.AvrcpTarget};
    static final ParcelUuid[] BIP_PROFILE_UUIDS = new ParcelUuid[]{BluetoothUuid.BipResponder};
    private static final String BLUETOOTH_PERM = "android.permission.BLUETOOTH";
    static final ParcelUuid[] BPP_PROFILE_UUIDS = new ParcelUuid[]{BluetoothUuid.BppReceiver};
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugSettings);
    static final ParcelUuid[] DUN_PROFILE_UUIDS = new ParcelUuid[]{BluetoothUuid.DUN};
    public static final String EXTRA_NEW_STATE = "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE";
    public static final String EXTRA_PREVIOUS_STATE = "android.bluetooth.profilemanager.extra.EXTRA_PREVIOUS_STATE";
    public static final String EXTRA_PROFILE = "android.bluetooth.profilemanager.extra.ATCPROFILE";
    static final ParcelUuid[] FTP_PROFILE_UUIDS = new ParcelUuid[]{BluetoothUuid.ObexFileTransfer};
    static final ParcelUuid[] HEADSET_PROFILE_UUIDS = new ParcelUuid[]{BluetoothUuid.HSP, BluetoothUuid.Handsfree};
    public static final String HF_DEVICE_ADDR = "device_addr";
    static final ParcelUuid[] HF_PROFILE_UUIDS = new ParcelUuid[]{BluetoothUuid.HandsfreeAudioGateway, BluetoothUuid.HeadsetAudioGateway};
    static final ParcelUuid[] HID_PROFILE_UUIDS = new ParcelUuid[]{BluetoothUuid.Hid};
    private static Object INSTANCE_LOCK = new Object();
    static final ParcelUuid[] OPP_PROFILE_UUIDS = new ParcelUuid[]{BluetoothUuid.ObexObjectPush};
    static final ParcelUuid[] PAN_PROFILE_UUIDS = new ParcelUuid[]{BluetoothUuid.PANU};
    static final ParcelUuid[] PBAP_SERVER_UUIDS = new ParcelUuid[]{BluetoothUuid.PBAP_PSE};
    static final ParcelUuid[] PRX_PROFILE_UUIDS = new ParcelUuid[]{BluetoothUuid.Proximity};
    public static final int STATE_ABNORMAL = 14;
    public static final int STATE_ACTIVE = 0;
    public static final int STATE_BROWSE_CONNECTED = 17;
    public static final int STATE_BROWSE_DISCONNECTED = 18;
    public static final int STATE_CONNECTED = 1;
    public static final int STATE_CONNECTING = 3;
    public static final int STATE_DISABLED = 13;
    public static final int STATE_DISABLING = 12;
    public static final int STATE_DISCONNECTED = 2;
    public static final int STATE_DISCONNECTING = 4;
    public static final int STATE_ENABLED = 11;
    public static final int STATE_ENABLING = 10;
    public static final int STATE_PLAYING = 15;
    public static final int STATE_STANDSTILL = 19;
    public static final int STATE_UNKNOWN = 5;
    private static final String TAG = "LocalBluetoothProfileManager";
    private static LocalBluetoothManager mAdapter;
    private static Context mContext;
    private static LocalBluetoothManager mLocalManager;
    private static LocalBluetoothProfileManager mLocalProfileMananger;
    private static BluetoothProfileManager mService;

    public enum BTProfile {
        Bluetooth_HEADSET(0),
        Bluetooth_A2DP(1),
        Bluetooth_HID(2),
        Bluetooth_FTP_Client(3),
        Bluetooth_FTP_Server(4),
        Bluetooth_BIP_Initiator(5),
        Bluetooth_BIP_Responder(6),
        Bluetooth_BPP_Sender(7),
        Bluetooth_SIMAP(8),
        Bluetooth_PBAP(9),
        Bluetooth_OPP_Server(10),
        Bluetooth_OPP_Client(11),
        Bluetooth_DUN(12),
        Bluetooth_AVRCP(13),
        Bluetooth_PRXM(14),
        Bluetooth_PRXR(15),
        Bluetooth_PAN_NAP(16),
        Bluetooth_PAN_GN(17),
        Bluetooth_MAP_Server(18),
        Bluetooth_HF(19),
        Bluetooth_PBAP_Client(20),
        Bluetooth_A2DP_SINK(21),
        Bluetooth_AVRCP_CT(22),
        Bluetooth_DUN_DT(23);
        
        public final int localizedString;

        private BTProfile(int localizedString) {
            this.localizedString = localizedString;
        }
    }

    private static boolean init(LocalBluetoothManager Adapter) {
        if (Adapter == null) {
            return false;
        }
        if (mService == null) {
            mService = new BluetoothProfileManager(Adapter.getContext());
        }
        mAdapter = Adapter;
        mContext = mAdapter.getContext();
        return true;
    }

    public static LocalBluetoothProfileManager getProfileManager(LocalBluetoothManager localManager) {
        synchronized (INSTANCE_LOCK) {
            if (mLocalProfileMananger == null) {
                mLocalProfileMananger = new LocalBluetoothProfileManager();
            }
        }
        if (init(localManager)) {
            return mLocalProfileMananger;
        }
        return null;
    }

    public static boolean containsAnyUuid(ParcelUuid[] uuidA, ParcelUuid[] uuidB) {
        return BluetoothUuid.containsAnyUuid(uuidA, uuidB);
    }

    public static void updateProfiles(ParcelUuid[] uuids, List<Profile> profiles) {
        profiles.clear();
        if (BluetoothUuid.containsAnyUuid(uuids, HEADSET_PROFILE_UUIDS)) {
        }
        if (BluetoothUuid.containsAnyUuid(uuids, A2DP_PROFILE_UUIDS)) {
            profiles.add(Profile.Bluetooth_A2DP);
        }
        if (BluetoothUuid.containsAnyUuid(uuids, HF_PROFILE_UUIDS)) {
            profiles.add(Profile.Bluetooth_HF);
            profiles.add(Profile.Bluetooth_HID);
        }
        if (BluetoothUuid.containsAnyUuid(uuids, PBAP_SERVER_UUIDS)) {
            profiles.add(Profile.Bluetooth_PBAP_Client);
        }
        if (BluetoothUuid.containsAnyUuid(uuids, A2DP_SINK_UUIDS)) {
            profiles.add(Profile.Bluetooth_A2DP_SINK);
        }
        if (BluetoothUuid.containsAnyUuid(uuids, AVRCP_CT_UUIDS)) {
            profiles.add(Profile.Bluetooth_AVRCP_CT);
        }
        if (BluetoothUuid.containsAnyUuid(uuids, DUN_PROFILE_UUIDS)) {
            profiles.add(Profile.Bluetooth_DUN_DT);
        }
    }

    public Set<BluetoothDevice> getConnectedDevices(Profile profile) {
        return mService.getConnectedDevices(profile);
    }

    public boolean connect(BluetoothDevice device, Profile profile) {
        return mService.connect(profile, device);
    }

    public boolean disconnect(BluetoothDevice device, Profile profile) {
        log("disconnect" + profile.toString() + " device name is " + device.getName());
        return mService.disconnect(profile, device);
    }

    public boolean isPreferred(BluetoothDevice device, Profile profile) {
        return mService.isPreferred(profile, device);
    }

    public int getPreferred(BluetoothDevice device, Profile profile) {
        if (mService != null) {
            return mService.getPreferred(profile, device);
        }
        log("getPreferred: mService is null");
        return -1;
    }

    public void setPreferred(BluetoothDevice device, Profile profile, boolean preferred) {
        mService.setPreferred(profile, device, preferred);
    }

    public int getConnectionStatus(BluetoothDevice device, Profile profile) {
        int state = mService.getState(profile, device);
        log("getConnectionStatus:profile->" + profile + ",state->" + state);
        return convertState(profile, state);
    }

    public int convertState(Profile profile, int status) {
        if (profile == Profile.Bluetooth_HEADSET) {
            switch (status) {
                case 0:
                    return 2;
                case 1:
                    return 3;
                case 2:
                    return 1;
                default:
                    return 5;
            }
        } else if (profile == Profile.Bluetooth_A2DP) {
            switch (status) {
                case 0:
                    return 2;
                case 1:
                    return 3;
                case 2:
                    return 1;
                case 3:
                    return 4;
                case 10:
                    return 0;
                default:
                    return 5;
            }
        } else if (profile == Profile.Bluetooth_PBAP) {
            switch (status) {
                case 0:
                    return 2;
                case 1:
                    return 3;
                case 2:
                    return 1;
                default:
                    return 5;
            }
        } else if (profile == Profile.Bluetooth_A2DP_SINK || profile == Profile.Bluetooth_AVRCP_CT) {
            switch (status) {
                case 0:
                    return 0;
                case 1:
                case 15:
                case 19:
                    return 1;
                case 2:
                    return 2;
                case 3:
                    return 3;
                case 4:
                    return 4;
                case 11:
                    return 11;
                case 13:
                    return 13;
                case 14:
                    return 14;
                default:
                    return 5;
            }
        } else if (profile == Profile.Bluetooth_HF || profile == Profile.Bluetooth_HID) {
            switch (status) {
                case 1:
                    return 1;
                case 2:
                    return 2;
                case 3:
                    return 3;
                default:
                    return 5;
            }
        } else {
            if (status < 0 || status > 5) {
                status = 5;
            }
            return status;
        }
    }

    public boolean isConnected(BluetoothDevice device, Profile profile) {
        return SettingsBtStatus.isConnectionStatusConnected(getConnectionStatus(device, profile));
    }

    private void log(String info) {
        if (DEBUG) {
            Log.v(TAG, "[BT][profile manager]" + info);
        }
    }
}
