package com.autochips.bluetooth;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothProfileManager.Profile;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences.Editor;
import android.util.Log;
import com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility;
import com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtPlayerManage;
import com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService;
import com.autochips.bluetooth.hf.BluetoothHfAdapter;
import com.autochips.bluetooth.hf.BluetoothHfAtHandler;
import com.autochips.bluetooth.hf.BluetoothHfService;

public class BluetoothEventRedirector {
    public static final String ACTION_QB_POWEROFF = "autochips.intent.action.QB_POWEROFF";
    public static final String ACTION_QB_POWERON = "autochips.intent.action.QB_POWERON";
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugSettings);
    private static final String TAG = "BluetoothEventRedirector";
    private AvrcpCtPlayerUtility mAvrcpCtPLayerUtility;
    private BluetoothAvrcpCtPlayerManage mAvrcpCtPlayerManage;
    private BroadcastReceiver mBroadcastReceiver = new C00011();
    private BluetoothHfAdapter mHfAdapter;
    private boolean mIsA2DPEnable = true;
    private LocalBluetoothManager mManager;

    /* renamed from: com.autochips.bluetooth.BluetoothEventRedirector$1 */
    class C00011 extends BroadcastReceiver {
        C00011() {
        }

        public void onReceive(Context context, Intent intent) {
            if (BluetoothEventRedirector.DEBUG) {
                Log.v(BluetoothEventRedirector.TAG, "Received " + intent.getAction());
            }
            String action = intent.getAction();
            BluetoothDevice device = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            if (action.equals("android.bluetooth.adapter.action.STATE_CHANGED")) {
                int state = intent.getIntExtra("android.bluetooth.adapter.extra.STATE", Integer.MIN_VALUE);
                BluetoothEventRedirector.this.mManager.setBluetoothStateInt(state);
                if (BluetoothEventRedirector.DEBUG) {
                    Log.d(BluetoothEventRedirector.TAG, "state= " + state);
                }
                if (state != 12) {
                    if (BluetoothEventRedirector.this.mHfAdapter != null) {
                        BluetoothEventRedirector.this.mHfAdapter.close();
                        BluetoothEventRedirector.this.mHfAdapter = null;
                    }
                    if (BluetoothEventRedirector.this.mAvrcpCtPlayerManage != null) {
                        BluetoothEventRedirector.this.mAvrcpCtPLayerUtility = null;
                        BluetoothEventRedirector.this.mAvrcpCtPlayerManage.close();
                        BluetoothEventRedirector.this.mAvrcpCtPlayerManage = null;
                    }
                }
            } else if (action.equals("android.bluetooth.adapter.action.DISCOVERY_STARTED")) {
                BluetoothEventRedirector.this.persistDiscoveringTimestamp();
                BluetoothEventRedirector.this.mManager.onScanningStateChanged(true);
            } else if (action.equals("android.bluetooth.adapter.action.DISCOVERY_FINISHED")) {
                BluetoothEventRedirector.this.persistDiscoveringTimestamp();
                BluetoothEventRedirector.this.mManager.onScanningStateChanged(false);
            } else if (action.equals("android.bluetooth.device.action.FOUND")) {
                BluetoothEventRedirector.this.mManager.getCachedDeviceManager().onDeviceAppeared(device, intent.getShortExtra("android.bluetooth.device.extra.RSSI", Short.MIN_VALUE), (BluetoothClass) intent.getParcelableExtra("android.bluetooth.device.extra.CLASS"), intent.getStringExtra("android.bluetooth.device.extra.NAME"));
            } else if (action.equals(CachedBluetoothDevice.ACTION_DISAPPEARED)) {
                BluetoothEventRedirector.this.mManager.getCachedDeviceManager().onDeviceDisappeared(device);
            } else if (action.equals("android.bluetooth.device.action.NAME_CHANGED")) {
                BluetoothEventRedirector.this.mManager.getCachedDeviceManager().onDeviceNameUpdated(device);
            } else if (action.equals("android.bluetooth.device.action.BOND_STATE_CHANGED")) {
                int bondState = intent.getIntExtra("android.bluetooth.device.extra.BOND_STATE", Integer.MIN_VALUE);
                CachedBluetoothDeviceManager cachedDeviceMgr = BluetoothEventRedirector.this.mManager.getCachedDeviceManager();
                cachedDeviceMgr.onBondingStateChanged(device, bondState);
                if (bondState == 10) {
                    if (device.isBluetoothDock()) {
                        BluetoothEventRedirector.this.mManager.removeDockAutoConnectSetting(device.getAddress());
                        if (!device.getAddress().equals(BluetoothEventRedirector.this.getDockedDeviceAddress(context))) {
                            cachedDeviceMgr.onDeviceDisappeared(device);
                        }
                    }
                    cachedDeviceMgr.showUnbondMessage(device, intent.getIntExtra(CachedBluetoothDevice.EXTRA_REASON, Integer.MIN_VALUE));
                }
            } else if (action.equals("android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED")) {
                newState = intent.getIntExtra("android.bluetooth.profile.extra.STATE", 0);
                oldState = intent.getIntExtra("android.bluetooth.profile.extra.PREVIOUS_STATE", 0);
                if (newState == 0 && oldState == 1 && BluetoothEventRedirector.DEBUG) {
                    Log.i(BluetoothEventRedirector.TAG, "Failed to connect BT headset");
                }
                BluetoothEventRedirector.this.mManager.getCachedDeviceManager().onProfileStateChanged(device, Profile.Bluetooth_HEADSET, newState);
            } else if (action.equals(LocalBluetoothProfileManager.A2DP_ACTION_SINK_STATE_CHANGED)) {
                newState = intent.getIntExtra(LocalBluetoothProfileManager.A2DP_EXTRA_SINK_STATE, 0);
                oldState = intent.getIntExtra(LocalBluetoothProfileManager.A2DP_EXTRA_PREVIOUS_SINK_STATE, 0);
                if (newState == 0 && oldState == 1 && BluetoothEventRedirector.DEBUG) {
                    Log.i(BluetoothEventRedirector.TAG, "Failed to connect BT A2DP");
                }
                BluetoothEventRedirector.this.mManager.getCachedDeviceManager().onProfileStateChanged(device, Profile.Bluetooth_A2DP, newState);
            } else if (!action.equals("android.bluetooth.ftp.action.STATE_CHANGED")) {
                if (action.equals(LocalBluetoothProfileManager.ACTION_STATE_CHANGED)) {
                    newState = intent.getIntExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 0);
                    oldState = intent.getIntExtra(LocalBluetoothProfileManager.EXTRA_PREVIOUS_STATE, 0);
                    Profile profile = (Profile) intent.getSerializableExtra("android.bluetooth.profilemanager.extra.PROFILE");
                    if (profile != null) {
                        BluetoothEventRedirector.this.mManager.getCachedDeviceManager().onProfileStateChanged(device, profile, newState);
                    }
                } else if (action.equals("android.bluetooth.device.action.CLASS_CHANGED")) {
                    BluetoothEventRedirector.this.mManager.getCachedDeviceManager().onBtClassChanged(device);
                } else if (action.equals("android.bluetooth.device.action.UUID")) {
                    BluetoothEventRedirector.this.mManager.getCachedDeviceManager().onUuidChanged(device);
                } else if (!action.equals(CachedBluetoothDevice.ACTION_PAIRING_CANCEL)) {
                    if (action.equals("android.intent.action.DOCK_EVENT")) {
                        if (intent.getIntExtra("android.intent.extra.DOCK_STATE", 1) == 0 && device != null && device.getBondState() == 10) {
                            BluetoothEventRedirector.this.mManager.getCachedDeviceManager().onDeviceDisappeared(device);
                        }
                    } else if (action.equals(LocalBluetoothProfileManager.ACTION_PROFILE_STATE_UPDATE)) {
                        Profile profilename = (Profile) intent.getSerializableExtra("android.bluetooth.profilemanager.extra.PROFILE");
                        int profilestate = intent.getIntExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, 14);
                        int prevstate = intent.getIntExtra(LocalBluetoothProfileManager.EXTRA_PREVIOUS_STATE, 14);
                        if (BluetoothEventRedirector.DEBUG) {
                            Log.d(BluetoothEventRedirector.TAG, "profilename:" + profilename + ",profilestate:" + profilestate);
                        }
                        if (profilename == null) {
                            return;
                        }
                        if (profilename.equals(Profile.Bluetooth_HF)) {
                            String addr = intent.getStringExtra("device_addr");
                            if (profilestate == 1) {
                                BluetoothEventRedirector.this.mHfAdapter = BluetoothHfAdapter.getInstance(context);
                            } else if (profilestate == 2 && BluetoothEventRedirector.this.mHfAdapter != null) {
                                BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_RequestCallAudio(false);
                                BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_ResetUtility();
                                BluetoothEventRedirector.this.mHfAdapter = null;
                            }
                        } else if (profilename != null && profilename.equals(Profile.Bluetooth_A2DP_SINK)) {
                            if (profilestate == 1) {
                                if (prevstate != 15) {
                                    if (BluetoothEventRedirector.this.mAvrcpCtPlayerManage == null) {
                                        BluetoothEventRedirector.this.mAvrcpCtPlayerManage = BluetoothAvrcpCtPlayerManage.getInstance(context);
                                    }
                                    if (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility == null) {
                                        BluetoothEventRedirector.this.mAvrcpCtPLayerUtility = BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getUtility();
                                    }
                                } else if (prevstate == 15 && BluetoothEventRedirector.this.mAvrcpCtPlayerManage != null && BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getA2dpAudioStatus() == 1 && BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getA2dpSinkStateValue() != 19) {
                                    BluetoothEventRedirector.this.mAvrcpCtPlayerManage.resetAudio(0, 1);
                                }
                            } else if (profilestate == 15) {
                                if (BluetoothEventRedirector.this.mIsA2DPEnable && BluetoothEventRedirector.this.mAvrcpCtPlayerManage != null && BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getA2dpAudioStatus() == 0) {
                                    BluetoothEventRedirector.this.mAvrcpCtPlayerManage.resetAudio(1, 1);
                                }
                            } else if (profilestate == 2 && BluetoothEventRedirector.this.mAvrcpCtPlayerManage != null && BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getA2dpAudioStatus() == 1) {
                                BluetoothEventRedirector.this.mAvrcpCtPlayerManage.resetAudio(0, 1);
                            }
                            if (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility != null) {
                                BluetoothEventRedirector.this.mAvrcpCtPLayerUtility.handleA2DPStateChanged(profilestate);
                            }
                        } else if (profilename != null && profilename.equals(Profile.Bluetooth_AVRCP_CT)) {
                            if (profilestate == 1) {
                                if (BluetoothEventRedirector.this.mAvrcpCtPlayerManage == null) {
                                    BluetoothEventRedirector.this.mAvrcpCtPlayerManage = BluetoothAvrcpCtPlayerManage.getInstance(context);
                                }
                                if (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility == null) {
                                    BluetoothEventRedirector.this.mAvrcpCtPLayerUtility = BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getUtility();
                                }
                            }
                            if (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility != null) {
                                BluetoothEventRedirector.this.mAvrcpCtPLayerUtility.handleAVRCPStateChanged(profilestate);
                            }
                        }
                    } else if (action.equals(BluetoothHfAtHandler.ACTION_CALLSETUP_CHANGED)) {
                        int callSetup = intent.getIntExtra(BluetoothHfAtHandler.EXTRA_NEW_CALLSETUP_STATE, 0);
                        if (BluetoothEventRedirector.DEBUG) {
                            Log.d(BluetoothEventRedirector.TAG, "callSetup=" + callSetup);
                        }
                        if (callSetup != 0) {
                            if (BluetoothEventRedirector.this.mHfAdapter != null) {
                                BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_RequestCallAudio(true);
                            }
                            if (!(BluetoothEventRedirector.this.mHfAdapter == null || BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_GetCallValue() == 0)) {
                                BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_Hangup_WaitingCall();
                            }
                        } else if (BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_GetCallValue() == 0) {
                            if (BluetoothEventRedirector.this.mHfAdapter != null) {
                                BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_RequestCallAudio(false);
                            }
                            if (BluetoothEventRedirector.this.mIsA2DPEnable && BluetoothEventRedirector.this.mAvrcpCtPlayerManage != null && BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getA2dpAudioStatus() == 0 && BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getA2dpSinkStateValue() == 15) {
                                BluetoothEventRedirector.this.mAvrcpCtPlayerManage.resetAudio(1, 1);
                            }
                        }
                        if (BluetoothEventRedirector.this.mHfAdapter != null) {
                            BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_UpdateCallsetupValue(callSetup);
                        }
                    } else if (action.equals(BluetoothHfAtHandler.ACTION_CALL_STATE_CHANGED)) {
                        int callState = intent.getIntExtra(BluetoothHfAtHandler.EXTRA_NEW_CALL_STATE, 0);
                        if (BluetoothEventRedirector.DEBUG) {
                            Log.d(BluetoothEventRedirector.TAG, "callState=" + callState);
                        }
                        if (callState == 0) {
                            if (BluetoothEventRedirector.this.mHfAdapter != null) {
                                BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_RequestCallAudio(false);
                            }
                            if (BluetoothEventRedirector.this.mIsA2DPEnable && BluetoothEventRedirector.this.mAvrcpCtPlayerManage != null && BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getA2dpAudioStatus() == 0 && BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getA2dpSinkStateValue() == 15) {
                                BluetoothEventRedirector.this.mAvrcpCtPlayerManage.resetAudio(1, 1);
                            }
                        } else if (BluetoothEventRedirector.this.mHfAdapter != null) {
                            BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_RequestCallAudio(true);
                        }
                        if (BluetoothEventRedirector.this.mHfAdapter != null) {
                            BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_UpdateCallValue(callState);
                        }
                    } else if (action.equals(BluetoothHfAtHandler.ACTION_PHONE_NUMBER_CHANGED)) {
                        String remotePhoneNumber = intent.getStringExtra(BluetoothHfAtHandler.EXTRA_NEW_PHONE_NUMBER);
                        if (remotePhoneNumber == null || remotePhoneNumber.isEmpty()) {
                            Log.e(BluetoothEventRedirector.TAG, "remote phone number error : " + (remotePhoneNumber == null ? "null" : "empty number"));
                        } else if (BluetoothEventRedirector.this.mHfAdapter != null) {
                            BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_UpdateCallingNumber(remotePhoneNumber);
                        }
                    } else if (action.equals(BluetoothHfService.ACTION_BLUETOOTH_HF_CONNECT_FINISH)) {
                        if (BluetoothEventRedirector.this.mHfAdapter != null) {
                            BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_updateHFConnectedState(1);
                            BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_UpdateCallRelatedValues(BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_GetCallValue(), BluetoothEventRedirector.this.mHfAdapter.Bluetooth_Hf_GetCallsetupValue(), 0);
                        }
                    } else if (action.equals(BluetoothAvrcpCtService.ACTION_GET_CAPABILITY_CNF)) {
                        if (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility != null) {
                            BluetoothEventRedirector.this.mAvrcpCtPLayerUtility.handleGetCapabilityCnf(intent);
                        }
                    } else if (action.equals(BluetoothAvrcpCtService.ACTION_GET_ELEMENT_ATTRIBUTES)) {
                        if (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility != null) {
                            BluetoothEventRedirector.this.mAvrcpCtPLayerUtility.handleGetElementAttributesCnf(intent);
                        }
                    } else if (action.equals(BluetoothAvrcpCtService.ACTION_GET_PLAYER_STATUS)) {
                        if (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility != null) {
                            BluetoothEventRedirector.this.mAvrcpCtPLayerUtility.handleGePlayerStatusCnf(intent);
                        }
                        if (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility != null && BluetoothEventRedirector.this.mAvrcpCtPlayerManage != null) {
                            switch (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility.getPlaybackStatus()) {
                                case (byte) 0:
                                case (byte) 2:
                                    if (BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getA2dpAudioStatus() == 1) {
                                        BluetoothEventRedirector.this.mAvrcpCtPlayerManage.resetAudio(0, 1);
                                        return;
                                    }
                                    return;
                                case (byte) 1:
                                    if (BluetoothEventRedirector.this.mIsA2DPEnable && BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getA2dpAudioStatus() == 0) {
                                        BluetoothEventRedirector.this.mAvrcpCtPlayerManage.resetAudio(1, 1);
                                        return;
                                    }
                                    return;
                                default:
                                    return;
                            }
                        }
                    } else if (action.equals(BluetoothAvrcpCtService.ACTION_REG_NOTIFICATION_STATUS_CHANGED)) {
                        if (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility != null) {
                            BluetoothEventRedirector.this.mAvrcpCtPLayerUtility.handleRegNotificationStatusChangedCnf(intent);
                        }
                        if (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility != null && BluetoothEventRedirector.this.mAvrcpCtPlayerManage != null) {
                            switch (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility.getPlaybackStatus()) {
                                case (byte) 0:
                                case (byte) 2:
                                    if (BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getA2dpAudioStatus() == 1) {
                                        BluetoothEventRedirector.this.mAvrcpCtPlayerManage.resetAudio(0, 1);
                                        return;
                                    }
                                    return;
                                case (byte) 1:
                                    if (BluetoothEventRedirector.this.mIsA2DPEnable && BluetoothEventRedirector.this.mAvrcpCtPlayerManage.getA2dpAudioStatus() == 0) {
                                        BluetoothEventRedirector.this.mAvrcpCtPlayerManage.resetAudio(1, 1);
                                        return;
                                    }
                                    return;
                                default:
                                    return;
                            }
                        }
                    } else if (action.equals(BluetoothAvrcpCtService.ACTION_REG_NOTIFICATION_TRACK_CHANGED)) {
                        if (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility != null) {
                            BluetoothEventRedirector.this.mAvrcpCtPLayerUtility.handleRegNotificationTrackChangedCnf(intent);
                        }
                    } else if (action.equals(BluetoothAvrcpCtService.ACTION_REG_NOTIFICATION_POS_CHANGED)) {
                        if (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility != null) {
                            BluetoothEventRedirector.this.mAvrcpCtPLayerUtility.handleRegNotificationPosChangedCnf(intent);
                        }
                    } else if (action.equals(BluetoothAvrcpCtService.ACTION_REG_NOTIFICATION_ERROR)) {
                        if (BluetoothEventRedirector.this.mAvrcpCtPLayerUtility != null) {
                            BluetoothEventRedirector.this.mAvrcpCtPLayerUtility.handleRegNotificationErrorEventCnf(intent);
                        }
                    } else if (action.equals(BluetoothAvrcpCtService.ACTION_PASSTHROUGH_COMMAND_CNF) && BluetoothEventRedirector.this.mAvrcpCtPLayerUtility != null) {
                        BluetoothEventRedirector.this.mAvrcpCtPLayerUtility.handlePassthroughCmdCnf(intent);
                    }
                }
            }
        }
    }

    public BluetoothEventRedirector(LocalBluetoothManager localBluetoothManager) {
        this.mManager = localBluetoothManager;
    }

    public void start() {
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
        filter.addAction("android.bluetooth.adapter.action.DISCOVERY_STARTED");
        filter.addAction("android.bluetooth.adapter.action.DISCOVERY_FINISHED");
        filter.addAction(CachedBluetoothDevice.ACTION_DISAPPEARED);
        filter.addAction("android.bluetooth.device.action.FOUND");
        filter.addAction("android.bluetooth.device.action.NAME_CHANGED");
        filter.addAction("android.bluetooth.device.action.BOND_STATE_CHANGED");
        filter.addAction(CachedBluetoothDevice.ACTION_PAIRING_CANCEL);
        filter.addAction(LocalBluetoothProfileManager.ACTION_STATE_CHANGED);
        filter.addAction("android.bluetooth.device.action.CLASS_CHANGED");
        filter.addAction("android.bluetooth.device.action.UUID");
        filter.addAction("android.intent.action.DOCK_EVENT");
        filter.addAction(LocalBluetoothProfileManager.ACTION_PROFILE_STATE_UPDATE);
        filter.addAction(BluetoothHfAtHandler.ACTION_CALLSETUP_CHANGED);
        filter.addAction(BluetoothHfAtHandler.ACTION_CALL_STATE_CHANGED);
        filter.addAction(BluetoothHfAtHandler.ACTION_PHONE_NUMBER_CHANGED);
        filter.addAction(BluetoothHfService.ACTION_BLUETOOTH_HF_CONNECT_FINISH);
        filter.addAction(BluetoothAvrcpCtService.ACTION_GET_ELEMENT_ATTRIBUTES);
        filter.addAction(BluetoothAvrcpCtService.ACTION_GET_PLAYER_STATUS);
        filter.addAction(BluetoothAvrcpCtService.ACTION_REG_NOTIFICATION_STATUS_CHANGED);
        filter.addAction(BluetoothAvrcpCtService.ACTION_REG_NOTIFICATION_POS_CHANGED);
        filter.addAction(BluetoothAvrcpCtService.ACTION_REG_NOTIFICATION_TRACK_CHANGED);
        filter.addAction(BluetoothAvrcpCtService.ACTION_PASSTHROUGH_COMMAND_CNF);
        filter.addAction(BluetoothAvrcpCtService.ACTION_REG_NOTIFICATION_ERROR);
        filter.addAction(BluetoothAvrcpCtService.ACTION_GET_CAPABILITY_CNF);
        this.mManager.getContext().registerReceiver(this.mBroadcastReceiver, filter);
    }

    public void stop() {
        this.mManager.getContext().unregisterReceiver(this.mBroadcastReceiver);
    }

    public void resetA2dpAudio(boolean isEnable) {
        if (this.mIsA2DPEnable != isEnable) {
            this.mIsA2DPEnable = isEnable;
            if (isEnable) {
                if (this.mAvrcpCtPlayerManage != null && this.mAvrcpCtPlayerManage.getA2dpAudioStatus() == 0) {
                    this.mAvrcpCtPlayerManage.resetAudio(1, 0);
                }
            } else if (this.mAvrcpCtPlayerManage != null && this.mAvrcpCtPlayerManage.getA2dpAudioStatus() == 1) {
                this.mAvrcpCtPlayerManage.resetAudio(0, 0);
            }
        }
    }

    private String getDockedDeviceAddress(Context context) {
        Intent i = context.registerReceiver(null, new IntentFilter("android.intent.action.DOCK_EVENT"));
        if (i == null || i.getIntExtra("android.intent.extra.DOCK_STATE", 0) == 0) {
            return null;
        }
        BluetoothDevice device = (BluetoothDevice) i.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
        if (device != null) {
            return device.getAddress();
        }
        return null;
    }

    private void persistDiscoveringTimestamp() {
        Editor editor = this.mManager.getSharedPreferences().edit();
        editor.putLong(LocalBluetoothManager.SHARED_PREFERENCES_KEY_DISCOVERING_TIMESTAMP, System.currentTimeMillis());
        editor.apply();
    }
}
