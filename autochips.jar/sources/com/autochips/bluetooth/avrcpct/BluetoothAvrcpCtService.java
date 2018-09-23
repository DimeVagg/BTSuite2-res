package com.autochips.bluetooth.avrcpct;

import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothProfileManager.Profile;
import android.bluetooth.IBluetoothAvrcpCt;
import android.bluetooth.IBluetoothAvrcpCt.Stub;
import android.cbm.CBManager;
import android.cbm.CBManager.OnActionListener;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.IBinder;
import android.os.IBinder.DeathRecipient;
import android.os.RemoteException;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.LocalBluetoothProfileManager;
import com.autochips.bluetooth.LocalBluetoothProfileManager.BTProfile;
import com.autochips.bluetooth.a2dpsink.BluetoothA2dpSinkService;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;
import java.io.ByteArrayOutputStream;
import java.util.HashMap;
import java.util.Timer;
import java.util.TimerTask;

public class BluetoothAvrcpCtService extends Service {
    public static final String ACTION_BROWSE_CHANGED = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.BROWSE_CHANGED";
    public static final String ACTION_BTMUSIC_ACTION_MANAGE = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.ACTION_BTMUSIC_ACTION_MANAGE";
    public static final String ACTION_BTMUSIC_INTERACTIVE = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.ACTION_BTMUSIC_INTERACTIVE";
    public static final String ACTION_GET_CAPABILITY_CNF = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.GET_CAPABILITY_CNF";
    public static final String ACTION_GET_ELEMENT_ATTRIBUTES = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.GET_ELEMENT_ATTRIBUTES";
    public static final String ACTION_GET_ITEM_ATTRIBUTES = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.GET_ITEM_ATTRIBUTES";
    public static final String ACTION_GET_PLAYER_STATUS = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.GET_PLAYER_STATUS";
    public static final String ACTION_INFORM_DISPLAYABLE_CHARSET_CNF = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.INFORM_DISPLAYABLE_CHARSET_CNF";
    public static final String ACTION_PASSTHROUGH_COMMAND_CNF = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.PASSTHROUGH_COMMAND_CNF";
    public static final String ACTION_REG_NOTIFICATION_ERROR = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.REG_NOTIFICATION_ERROR";
    public static final String ACTION_REG_NOTIFICATION_POS_CHANGED = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.REG_NOTIFICATION_POS_CHANGED";
    public static final String ACTION_REG_NOTIFICATION_STATUS_CHANGED = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.REG_NOTIFICATION_STATUS_CHANGED";
    public static final String ACTION_REG_NOTIFICATION_TRACK_CHANGED = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.REG_NOTIFICATION_TRACK_CHANGED";
    public static final String[] ATTRIBUTE_ID = new String[]{"com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.ATTRIBUTE_ID_0", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.ATTRIBUTE_ID_1", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.ATTRIBUTE_ID_2", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.ATTRIBUTE_ID_3", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.ATTRIBUTE_ID_4", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.ATTRIBUTE_ID_5", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.ATTRIBUTE_ID_6", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.ATTRIBUTE_ID_7", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.ATTRIBUTE_ID_8", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.ATTRIBUTE_ID_9"};
    public static final int AUDIO_RELEASE = 0;
    public static final int AUDIO_REQUEST = 1;
    public static final int AVRCP_KEY_BACKWARD = 76;
    public static final int AVRCP_KEY_FORWARD = 75;
    public static final int AVRCP_KEY_PAUSE = 70;
    public static final int AVRCP_KEY_PLAY = 68;
    public static final int AVRCP_KEY_STOP = 69;
    public static final int AVRCP_KEY_VOLUME_DOWN = 66;
    public static final int AVRCP_KEY_VOLUME_UP = 65;
    public static final String BROWSE_STATE = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.BROWSE_STATE";
    public static final int BTMUSIC_AUDIO_OFF = 0;
    public static final int BTMUSIC_AUDIO_ON = 1;
    public static final char BT_AVRCP_RESULT_ERROR = 'ခ';
    public static final char BT_AVRCP_RESULT_INTERNAL_ERROR = 'ဃ';
    public static final char BT_AVRCP_RESULT_INVALID_ROLE = 'ဂ';
    public static final char BT_AVRCP_RESULT_SUCCESS = 'က';
    public static final String BWS_MTU = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.BWS_MTU";
    public static final String CAPABILITY_ID = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.CAPABILITY_ID";
    public static final String CHARSET = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.CHARSET";
    public static final String COMMAND_BTMUSIC_ACTION_SET = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.COMMAND_BTMUSIC_ACTION_SET";
    public static final String COUNT = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.COUNT";
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugMusic);
    public static final String ERROR_CODE = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.ERROR_CODE";
    public static final String[] EVENTS_SUPPORTED = new String[]{"com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_0", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_1", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_2", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_3", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_4", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_5", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_6", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_7", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_8", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_9", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_10", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_11", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_12", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_13", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_14", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_15", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_16", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_17", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_18", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENTS_19"};
    public static final String EVENT_ID = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EVENT_ID";
    public static final String EXTRA_BTMUSIC_DEVICE = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.BTMUSIC_DEVICE";
    public static final String EXTRA_BTMUSIC_INTERACTIVE = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EXTRA_BTMUSIC_INTERACTIVE";
    private static final byte FAIL = (byte) 1;
    public static final String IDENTIFIER = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.IDENTIFIER";
    public static final String IS_INTERIM = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.IS_INTERIM";
    public static final String IS_PRESS = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.IS_PRESS";
    public static final String KEY_VALUE = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.KEY_VALUE";
    public static final int MAX_ATTRIBUTES_NUM = 10;
    private static final byte OK = (byte) 0;
    public static final String PASSTHROUGH_KEY = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.PASSTHROUGH_KEY";
    public static final int PAUSED = 2;
    public static final int PAUSING = 3;
    public static final int PLAYING = 1;
    public static final String PLAY_STATUS = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.PLAY_STATUS";
    public static final String REMOTE_DEVICE_ADDR = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.REMOTE_DEVICE_ADDR";
    public static final String REMOTE_TG_FEATURE = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.REMOTE_TG_FEATURE";
    public static final String REMOTE_TG_VERSION = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.REMOTE_TG_VERSION";
    public static final String RESULT = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.RESULT";
    public static final String SONG_LENGTH = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.SONG_LENGTH";
    public static final String SONG_POSITION = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.SONG_POSITION";
    public static final int STOPPED = 0;
    public static final int STOPPING = 4;
    public static final String TAG = "BluetoothAvrcpCtService";
    private static final int TASK_A2DP_AUDIO_CHECK = 2;
    private static final int TASK_A2DP_PAUSE_CHECK = 1;
    private static final int TASK_A2DP_PLAY_CHECK = 0;
    public static final String[] VALUE = new String[]{"com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.VALUE_0", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.VALUE_1", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.VALUE_2", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.VALUE_3", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.VALUE_4", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.VALUE_5", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.VALUE_6", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.VALUE_7", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.VALUE_8", "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.VALUE_9"};
    public static volatile int mAudioState = 0;
    public static int mAvrcpCtState = 2;
    private static volatile CBManager mCBM = null;
    public static int mPlaybackStatus = 0;
    public static int posChangedEventStatus = 0;
    public static int trackChangedEventStatus = 0;
    Intent avrcp_browse_state_changed_intent = new Intent(ACTION_BROWSE_CHANGED);
    Intent avrcp_btmusic_interaction_intent = new Intent(ACTION_BTMUSIC_INTERACTIVE);
    Intent avrcp_get_capability_cnf_intent = new Intent(ACTION_GET_CAPABILITY_CNF);
    Intent avrcp_get_element_attributes_cnf_intent = new Intent(ACTION_GET_ELEMENT_ATTRIBUTES);
    Intent avrcp_get_item_attributes_cnf_intent = new Intent(ACTION_GET_ITEM_ATTRIBUTES);
    Intent avrcp_get_player_status_cnf_intent = new Intent(ACTION_GET_PLAYER_STATUS);
    Intent avrcp_inform_displayable_charset_cnf_intent = new Intent(ACTION_INFORM_DISPLAYABLE_CHARSET_CNF);
    Intent avrcp_passthrough_command_cnf_intent = new Intent(ACTION_PASSTHROUGH_COMMAND_CNF);
    Intent avrcp_reg_noification_error_cnf_intent = new Intent(ACTION_REG_NOTIFICATION_ERROR);
    Intent avrcp_reg_notification_playback_changed_cnf_intent = new Intent(ACTION_REG_NOTIFICATION_STATUS_CHANGED);
    Intent avrcp_reg_notification_pos_changed_cnf_intent = new Intent(ACTION_REG_NOTIFICATION_POS_CHANGED);
    Intent avrcp_reg_notification_track_changed_cnf_intent = new Intent(ACTION_REG_NOTIFICATION_TRACK_CHANGED);
    private BluetoothAdapter mAdapter;
    private final Stub mAvrcpCtBinder = new C00232();
    public int mAvrcpCtBrowseState = 18;
    private final IBluetoothAvrcpCtPlayerManage.Stub mAvrcpCtPlayerManageBinder = new C00243();
    private OnActionListener mCBMActionListener = new C00254();
    private volatile boolean mIsForeground = false;
    private AvrcpCtListener mListener;
    private Object mLock = new Object();
    private int mNativeData;
    private final BroadcastReceiver mReceiver = new C00221();
    private TimerTask mTask = null;
    private HashMap<Integer, TimerTask> mTaskList = null;
    private int mTaskTimeout = 0;
    private Timer mTimer = null;
    public int playbackChangedEventStatus = 0;
    public String remoteAvrcpTgAddr = null;
    public BluetoothDevice remoteAvrcpTgDevice = null;
    public char remoteAvrcpTgVersion = '\u0000';
    Intent update_state_intent = new Intent(LocalBluetoothProfileManager.ACTION_PROFILE_STATE_UPDATE);

    /* renamed from: com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService$1 */
    class C00221 extends BroadcastReceiver {
        C00221() {
        }

        public void onReceive(Context context, Intent intent) {
            String action = null;
            if (intent != null) {
                action = intent.getAction();
            } else {
                BluetoothAvrcpCtService.this.errorLog("mReceiver, intent = null");
            }
            if (BluetoothAvrcpCtService.mAvrcpCtState == 1 && BluetoothAvrcpCtService.ACTION_BTMUSIC_INTERACTIVE.equals(action)) {
                switch (intent.getIntExtra(BluetoothAvrcpCtService.EXTRA_BTMUSIC_INTERACTIVE, 0)) {
                    case 68:
                        if (BluetoothAvrcpCtService.this.remoteAvrcpTgAddr != null) {
                            BluetoothAvrcpCtService.this.play(BluetoothAvrcpCtService.this.remoteAvrcpTgAddr);
                            return;
                        }
                        return;
                    case 70:
                        if (BluetoothAvrcpCtService.this.remoteAvrcpTgAddr != null) {
                            BluetoothAvrcpCtService.this.pause(BluetoothAvrcpCtService.this.remoteAvrcpTgAddr);
                            return;
                        }
                        return;
                    default:
                        return;
                }
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService$2 */
    class C00232 extends Stub {
        C00232() {
        }

        public BluetoothDevice getTarget() {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtBinder:  getTarget(), mAvrcpCtState = " + BluetoothAvrcpCtService.mAvrcpCtState);
            if (BluetoothAvrcpCtService.mAvrcpCtState == 1) {
                return BluetoothAvrcpCtService.this.remoteAvrcpTgDevice;
            }
            return null;
        }

        public int getState() {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtBinder:  getState(), mAvrcpCtState = " + BluetoothAvrcpCtService.mAvrcpCtState);
            return BluetoothAvrcpCtService.mAvrcpCtState;
        }

        public BluetoothDevice getConnectedDevice() {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtBinder:  getConnectedDevice(), mAvrcpCtState = " + BluetoothAvrcpCtService.mAvrcpCtState);
            if (BluetoothAvrcpCtService.mAvrcpCtState == 1) {
                return BluetoothAvrcpCtService.this.remoteAvrcpTgDevice;
            }
            return null;
        }

        public void connect(BluetoothDevice device) {
            BluetoothAvrcpCtService.this.printLog("connect to " + device.getAddress());
            String BT_Addr = device.getAddress();
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtBinder:  connect(), addr = " + BT_Addr);
            BluetoothAvrcpCtService.this.connectTarget(BT_Addr);
        }

        public void disconnect() {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtBinder: disconnect()");
            BluetoothAvrcpCtService.this.disconnectTarget();
        }

        public boolean isConnected(BluetoothDevice device) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtBinder:  isConnected()");
            if (BluetoothAvrcpCtService.this.remoteAvrcpTgDevice == device) {
                return true;
            }
            return false;
        }
    }

    /* renamed from: com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService$3 */
    class C00243 extends IBluetoothAvrcpCtPlayerManage.Stub {
        C00243() {
        }

        public boolean playPause(String BT_Addr) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder:  playPause()");
            return BluetoothAvrcpCtService.this.pause(BT_Addr);
        }

        public boolean playContinue(String BT_Addr) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder:  playContinue()");
            return BluetoothAvrcpCtService.this.play(BT_Addr);
        }

        public boolean playForward(String BT_Addr) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder:  playForward()");
            return BluetoothAvrcpCtService.this.forward(BT_Addr);
        }

        public boolean playBackward(String BT_Addr) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder: playBackward()");
            return BluetoothAvrcpCtService.this.backward(BT_Addr);
        }

        public boolean playStop(String BT_Addr) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder: playStop()");
            return BluetoothAvrcpCtService.this.stop(BT_Addr);
        }

        public boolean playFastForward(String BT_Addr) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder: playFastForward()");
            return BluetoothAvrcpCtService.this.fastForward(BT_Addr);
        }

        public boolean playRewind(String BT_Addr) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder: playRewind()");
            return BluetoothAvrcpCtService.this.rewind(BT_Addr);
        }

        public boolean playgetElementAttributes(long identifier, byte count, int[] attributes) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder: playgetElementAttributes()");
            return BluetoothAvrcpCtService.this.getElementAttributes(identifier, count, attributes);
        }

        public boolean playgetPlayerStatus() {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder: playgetPlayerStatus()");
            return BluetoothAvrcpCtService.this.getPlayerStatus();
        }

        public boolean playregisterNotificationReq(byte event_id, int playback_interval) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder: playregisterNotificationReq()");
            return BluetoothAvrcpCtService.this.registerNotificationReq(event_id, playback_interval);
        }

        public boolean playgetItemAttributes(byte scope, long uid, char uid_counter, byte count, int[] attributeIds) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder: playgetItemAttributes()");
            return BluetoothAvrcpCtService.this.getItemAttributes(scope, uid, uid_counter, count, attributeIds);
        }

        public boolean playinformDisplaybaleCharset(byte count, char charset_id) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder: playinformDisplaybaleCharset()");
            return BluetoothAvrcpCtService.this.informDisplayableCharset(count, charset_id);
        }

        public boolean playgetCapabilities(byte capability_id) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder: playgetCapabilities()");
            return BluetoothAvrcpCtService.this.getCapabilities(capability_id);
        }

        public int playresetAudio(int on_off, int release) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder:  playresetAudio()");
            return BluetoothAvrcpCtService.this.audioManage(on_off, release);
        }

        public void playregResume(boolean appResume) {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder:  playregResume()");
            BluetoothAvrcpCtService.this.regResume(appResume);
        }

        public int playonResume() {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder:  playonResume()");
            return BluetoothAvrcpCtService.this.notifyResume();
        }

        public void playonRevoke() {
            BluetoothAvrcpCtService.this.printLog("mAvrcpCtPlayerManagerBinder:  playonRevoke()");
            BluetoothAvrcpCtService.this.notifyRevoke();
        }

        public int getA2dpSinkState() {
            return BluetoothA2dpSinkService.mA2dpSinkState;
        }

        public String getA2dpSourceAddr() {
            return BluetoothA2dpSinkService.mA2dpSourceAddr;
        }

        public int getAvrcpctState() {
            return BluetoothAvrcpCtService.mAvrcpCtState;
        }

        public int getTrackChangedEventStatus() {
            return BluetoothAvrcpCtService.trackChangedEventStatus;
        }

        public int getPosChangedEventStatus() {
            return BluetoothAvrcpCtService.posChangedEventStatus;
        }

        public void regClientBinder(IBinder cb) {
            try {
                cb.linkToDeath(new AvpClientDeathHandler(cb), 0);
            } catch (RemoteException e) {
                Log.d(BluetoothAvrcpCtService.TAG, "regClientBinder could not link to " + cb + " binder death.");
            }
        }

        public int getA2dpAudioStatus() {
            return BluetoothAvrcpCtService.mAudioState;
        }
    }

    /* renamed from: com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService$4 */
    class C00254 implements OnActionListener {
        C00254() {
        }

        public int onAction(int command, int param1, int param2) {
            int ret = 0;
            BluetoothAvrcpCtService.this.printLog("onAction:cmd = " + command);
            switch (command) {
                case 2:
                    try {
                        ret = BluetoothAvrcpCtService.this.audioManage(0, 1);
                        break;
                    } catch (IllegalStateException ex) {
                        BluetoothAvrcpCtService.this.printLog("ERROR:CBManager exception:" + ex);
                        break;
                    }
                case 3:
                    try {
                        ret = BluetoothAvrcpCtService.this.audioManage(1, 0);
                    } catch (IllegalStateException ex2) {
                        BluetoothAvrcpCtService.this.printLog("ERROR:CBManager exception:" + ex2);
                    }
                    if (BluetoothAvrcpCtService.this.avrcp_btmusic_interaction_intent.getIntExtra(BluetoothAvrcpCtService.EXTRA_BTMUSIC_INTERACTIVE, 0) == 15) {
                        BluetoothAvrcpCtService.this.avrcp_btmusic_interaction_intent.putExtra(BluetoothAvrcpCtService.EXTRA_BTMUSIC_INTERACTIVE, 0);
                        BluetoothAvrcpCtService.this.sendBroadcast(BluetoothAvrcpCtService.this.avrcp_btmusic_interaction_intent, "android.permission.BLUETOOTH");
                        break;
                    }
                    break;
                case 4:
                    try {
                        ret = BluetoothAvrcpCtService.this.audioManage(0, 0);
                    } catch (IllegalStateException ex22) {
                        BluetoothAvrcpCtService.this.printLog("ERROR:CBManager exception:" + ex22);
                    }
                    if (param2 != 13) {
                        if (param2 == 15) {
                            BluetoothAvrcpCtService.this.avrcp_btmusic_interaction_intent.putExtra(BluetoothAvrcpCtService.EXTRA_BTMUSIC_INTERACTIVE, param2);
                            BluetoothAvrcpCtService.this.sendBroadcast(BluetoothAvrcpCtService.this.avrcp_btmusic_interaction_intent, "android.permission.BLUETOOTH");
                            break;
                        }
                    }
                    BluetoothA2dpSinkService a2dpSinkService = BluetoothA2dpSinkService.getInstance();
                    if (!(a2dpSinkService == null || BluetoothA2dpSinkService.mA2dpSourceAddr == null)) {
                        a2dpSinkService.disconnectSource(BluetoothA2dpSinkService.mA2dpSourceAddr);
                        break;
                    }
                    break;
                case 5:
                    if (BluetoothAvrcpCtService.mPlaybackStatus == 1) {
                        try {
                            ret = BluetoothAvrcpCtService.this.audioManage(0, 0);
                            break;
                        } catch (IllegalStateException ex222) {
                            BluetoothAvrcpCtService.this.printLog("ERROR:CBManager exception:" + ex222);
                            break;
                        }
                    }
                    break;
                case 6:
                    if (BluetoothAvrcpCtService.mPlaybackStatus != 1) {
                        try {
                            ret = BluetoothAvrcpCtService.this.audioManage(1, 0);
                            break;
                        } catch (IllegalStateException ex2222) {
                            BluetoothAvrcpCtService.this.printLog("ERROR:CBManager exception:" + ex2222);
                            break;
                        }
                    }
                    break;
                case 7:
                    try {
                        ret = BluetoothAvrcpCtService.this.audioManage(1, 1);
                        break;
                    } catch (IllegalStateException ex22222) {
                        BluetoothAvrcpCtService.this.printLog("ERROR:CBManager exception:" + ex22222);
                        break;
                    }
                default:
                    BluetoothAvrcpCtService.this.printLog("onAction: unsupport cmd");
                    break;
            }
            BluetoothAvrcpCtService.this.printLog("onAction End!!!");
            return ret;
        }
    }

    /* renamed from: com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService$5 */
    class C00265 extends TimerTask {
        C00265() {
        }

        public void run() {
            if ((BluetoothAvrcpCtService.mPlaybackStatus != 1 || BluetoothA2dpSinkService.mA2dpSinkState == 19 || BluetoothA2dpSinkService.mA2dpSinkState == 1) && BluetoothAvrcpCtService.mAvrcpCtState == 1) {
                if (BluetoothAvrcpCtService.this.remoteAvrcpTgAddr != null) {
                    BluetoothAvrcpCtService.this.play(BluetoothAvrcpCtService.this.remoteAvrcpTgAddr);
                }
                BluetoothAvrcpCtService.this.stopTask(0);
                BluetoothAvrcpCtService.this.mTaskTimeout = 0;
            }
            BluetoothAvrcpCtService.access$912(BluetoothAvrcpCtService.this, 500);
            if (BluetoothAvrcpCtService.this.mTaskTimeout > 3000) {
                BluetoothAvrcpCtService.this.stopTask(0);
                BluetoothAvrcpCtService.this.mTaskTimeout = 0;
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService$6 */
    class C00276 extends TimerTask {
        C00276() {
        }

        public void run() {
            if (BluetoothAvrcpCtService.mPlaybackStatus != 1 || BluetoothA2dpSinkService.mA2dpSinkState == 19 || BluetoothA2dpSinkService.mA2dpSinkState == 1) {
                BluetoothAvrcpCtService.this.stopTask(1);
            } else if (BluetoothAvrcpCtService.mPlaybackStatus == 1 || BluetoothA2dpSinkService.mA2dpSinkState == 15) {
                if (BluetoothAvrcpCtService.this.remoteAvrcpTgAddr != null) {
                    BluetoothAvrcpCtService.this.pause(BluetoothAvrcpCtService.this.remoteAvrcpTgAddr);
                }
                BluetoothAvrcpCtService.this.stopTask(1);
            }
        }
    }

    /* renamed from: com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService$7 */
    class C00287 extends TimerTask {
        C00287() {
        }

        public void run() {
            if (BluetoothAvrcpCtService.mPlaybackStatus != 0 && BluetoothAvrcpCtService.mPlaybackStatus != 2 && BluetoothAvrcpCtService.mAudioState == 0 && BluetoothA2dpSinkService.mA2dpSinkState == 15) {
                BluetoothAvrcpCtService.this.audioManage(1, 1);
            }
            BluetoothAvrcpCtService.this.stopTask(2);
        }
    }

    private class AvpClientDeathHandler implements DeathRecipient {
        private IBinder mCb;

        AvpClientDeathHandler(IBinder cb) {
            this.mCb = cb;
        }

        public void binderDied() {
            BluetoothAvrcpCtService.this.printLog("AvpClientDeathHandler:binderDied");
            if (1 == BluetoothAvrcpCtService.mAudioState) {
                BluetoothAvrcpCtService.this.audioManage(0, 1);
            }
            BluetoothA2dpSinkService a2dpSinkService = BluetoothA2dpSinkService.getInstance();
            if (!(a2dpSinkService == null || BluetoothA2dpSinkService.mA2dpSourceAddr == null)) {
                a2dpSinkService.disconnectSource(BluetoothA2dpSinkService.mA2dpSourceAddr);
            }
            if (BluetoothAvrcpCtService.mAvrcpCtState == 1) {
                BluetoothAvrcpCtService.this.disconnectTarget();
            }
        }

        public IBinder getBinder() {
            return this.mCb;
        }
    }

    private class AvrcpCtListener extends Thread {
        public boolean mStopListen;

        private AvrcpCtListener() {
        }

        public void run() {
            BluetoothAvrcpCtService.this.printLog("Start listening");
            while (!this.mStopListen) {
                if (!BluetoothAvrcpCtService.this.listenIndicationNative(false)) {
                    BluetoothAvrcpCtService.this.errorLog("listen failed");
                    this.mStopListen = true;
                }
            }
            BluetoothAvrcpCtService.this.printLog("SocketListener stopped.");
        }
    }

    private static native void classInitNative();

    private native void cleanupNativeObjectNative();

    private native void disableNative();

    private native boolean enableNative();

    private native void initializeNativeObjectNative();

    private native boolean listenIndicationNative(boolean z);

    private native void wakeupListenerNative();

    public native boolean BluetoothAvrcpCtService_activateNative(byte b);

    public native boolean BluetoothAvrcpCtService_backwardNative(String str);

    public native boolean BluetoothAvrcpCtService_browseConnectNative();

    public native boolean BluetoothAvrcpCtService_browseDisconnectNative();

    public native boolean BluetoothAvrcpCtService_connectNative(String str);

    public native boolean BluetoothAvrcpCtService_deactivateNative(byte b);

    public native boolean BluetoothAvrcpCtService_disconnectNative();

    public native boolean BluetoothAvrcpCtService_fastForwardNative(String str);

    public native boolean BluetoothAvrcpCtService_forwardNative(String str);

    public native boolean BluetoothAvrcpCtService_getAudioSpectrumNative(int[] iArr);

    public native boolean BluetoothAvrcpCtService_getCapabilitiesNative(byte b);

    public native boolean BluetoothAvrcpCtService_getElementAttributesNative(long j, byte b, int[] iArr);

    public native boolean BluetoothAvrcpCtService_getItemAttributesNative(byte b, long j, char c, byte b2, int[] iArr);

    public native boolean BluetoothAvrcpCtService_getPlayStatusNative();

    public native boolean BluetoothAvrcpCtService_informDisplaybaleCharsetNative(byte b, char c);

    public native boolean BluetoothAvrcpCtService_pauseNative(String str);

    public native boolean BluetoothAvrcpCtService_playNative(String str);

    public native boolean BluetoothAvrcpCtService_regNotificationNative(byte b, int i);

    public native boolean BluetoothAvrcpCtService_rewindNative(String str);

    public native boolean BluetoothAvrcpCtService_setAudioNative(int i, boolean z);

    public native boolean BluetoothAvrcpCtService_stopNative(String str);

    static /* synthetic */ int access$912(BluetoothAvrcpCtService x0, int x1) {
        int i = x0.mTaskTimeout + x1;
        x0.mTaskTimeout = i;
        return i;
    }

    static {
        System.loadLibrary("extavrcpct_jni");
        classInitNative();
    }

    public IBinder onBind(Intent intent) {
        String action = intent.getAction();
        printLog("Enter onBind() action = " + action);
        if (IBluetoothAvrcpCt.class.getName().equals(action)) {
            printLog("Enter onBind() return mAvrcpCtBinder ");
            return this.mAvrcpCtBinder;
        }
        printLog("Enter onBind() return mAvrcpCtPlayerManageBinder ");
        return this.mAvrcpCtPlayerManageBinder;
    }

    public void onCreate() {
        printLog("onCreate()");
        this.mAdapter = BluetoothAdapter.getDefaultAdapter();
        this.remoteAvrcpTgDevice = null;
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.bluetooth.device.action.BOND_STATE_CHANGED");
        filter.addAction(LocalBluetoothProfileManager.ACTION_DISABLE_PROFILES);
        filter.addAction(ACTION_BTMUSIC_INTERACTIVE);
        registerReceiver(this.mReceiver, filter);
        localCreateService();
        if (mCBM == null) {
            mCBM = new CBManager();
            if (mCBM != null) {
                mCBM.setOnActionListener(this.mCBMActionListener);
            }
        }
    }

    public void onDestroy() {
        printLog("onDestroy()");
        super.onDestroy();
        unregisterReceiver(this.mReceiver);
        if (mCBM != null) {
            if (mAudioState == 1) {
                audioManage(0, 1);
            }
            mCBM = null;
        }
        BluetoothAvrcpCtDisable();
        cleanupNativeObjectNative();
    }

    public void onTaskRemoved(Intent rootIntent) {
        printLog("onTaskRemoved ");
        super.onTaskRemoved(rootIntent);
        stopSelf();
    }

    void localCreateService() {
        printLog("localCreateService mServerState = " + mAvrcpCtState);
        if (mAvrcpCtState != 11) {
            initializeNativeObjectNative();
            mAvrcpCtState = 10;
            if (BluetoothAvrcpCtEnable()) {
                printLog("BluetoothAvrcpCtEnable() == true");
            } else {
                printLog("BluetoothAvrcpCtEnable() == false");
            }
        }
    }

    private boolean BluetoothAvrcpCtEnable() {
        printLog("BluetoothAvrcpCtEnable()");
        boolean ret = false;
        this.mListener = new AvrcpCtListener();
        if (!enableNative()) {
            errorLog("enableNative() failed");
            this.mListener = null;
            mAvrcpCtState = 13;
            notifyProfileState(14, null, '\u0000', '\u0000');
        } else if (!BluetoothAvrcpCtService_activateNative((byte) 0)) {
            errorLog("BluetoothAvrcpCtService_activateNative() failed");
            this.mListener = null;
            mAvrcpCtState = 13;
            notifyProfileState(14, null, '\u0000', '\u0000');
            return false;
        } else {
            this.mListener.mStopListen = false;
            this.mListener.start();
            ret = true;
        }
        return ret;
    }

    private void BluetoothAvrcpCtDisable() {
        printLog("BluetoothAvrcpCtDisable()");
        if (!BluetoothAvrcpCtService_deactivateNative((byte) 0)) {
            errorLog("BluetoothAvrcpCtService_deactivateNative() failed");
            notifyProfileState(14, null, '\u0000', '\u0000');
        } else {
            notifyProfileState(13, null, '\u0000', '\u0000');
        }
        if (this.mListener != null) {
            this.mListener.mStopListen = true;
            wakeupListenerNative();
            try {
                this.mListener.join(5000);
            } catch (InterruptedException ex) {
                errorLog("mListener colose error" + ex);
            }
            disableNative();
            return;
        }
        errorLog("mListener == null");
    }

    public boolean connectTarget(String BT_Addr) {
        printLog("connectTarget" + BT_Addr);
        mAvrcpCtState = 3;
        boolean ret = BluetoothAvrcpCtService_connectNative(BT_Addr);
        if (!ret) {
            errorLog("connectTarget failure ,return value is" + ret);
        }
        return ret;
    }

    public boolean browseConnectTarget() {
        printLog("browseConnectTarget");
        boolean ret = BluetoothAvrcpCtService_browseConnectNative();
        if (null != null) {
            errorLog("browseConnectTarget fail");
            this.mAvrcpCtBrowseState = 18;
        }
        return false;
    }

    public void disconnectTarget() {
        printLog("disconnectTarget");
        mAvrcpCtState = 4;
        BluetoothAvrcpCtService_disconnectNative();
    }

    public boolean browseDisconnectTarget() {
        printLog("browseDisconnectTarget");
        boolean ret = BluetoothAvrcpCtService_browseDisconnectNative();
        if (null != null) {
            errorLog("browseDisconnectTarget fail");
        }
        return false;
    }

    public boolean pause(String BT_Addr) {
        boolean ret = false;
        if (mAvrcpCtState != 1 || BT_Addr == null || BT_Addr.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME)) {
            errorLog("AVRCP is not connected yet");
        } else {
            ret = BluetoothAvrcpCtService_pauseNative(BT_Addr);
            if (!ret) {
                errorLog("pause failure ,return value is" + ret);
            }
        }
        return ret;
    }

    public boolean play(String BT_Addr) {
        boolean ret = false;
        if (mAvrcpCtState != 1 || BT_Addr == null || BT_Addr.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME)) {
            errorLog("AVRCP is not connected yet");
        } else {
            ret = BluetoothAvrcpCtService_playNative(BT_Addr);
            if (!ret) {
                errorLog("play failure ,return value is" + ret);
            }
        }
        return ret;
    }

    public boolean forward(String BT_Addr) {
        boolean ret = false;
        if (mAvrcpCtState != 1 || BT_Addr == null || BT_Addr.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME)) {
            errorLog("AVRCP is not connected yet");
        } else {
            ret = BluetoothAvrcpCtService_forwardNative(BT_Addr);
            if (!ret) {
                errorLog("forward failure ,return value is" + ret);
            }
        }
        return ret;
    }

    public boolean backward(String BT_Addr) {
        boolean ret = false;
        if (mAvrcpCtState != 1 || BT_Addr == null || BT_Addr.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME)) {
            errorLog("AVRCP is not connected yet");
        } else {
            ret = BluetoothAvrcpCtService_backwardNative(BT_Addr);
            if (!ret) {
                errorLog("backward failure ,return value is" + ret);
            }
        }
        return ret;
    }

    public boolean stop(String BT_Addr) {
        boolean ret = false;
        if (mAvrcpCtState != 1 || BT_Addr == null || BT_Addr.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME)) {
            errorLog("AVRCP is not connected yet");
        } else {
            ret = BluetoothAvrcpCtService_stopNative(BT_Addr);
            if (!ret) {
                errorLog("stop failure ,return value is" + ret);
            }
        }
        return ret;
    }

    public boolean fastForward(String BT_Addr) {
        boolean ret = false;
        if (mAvrcpCtState != 1 || BT_Addr == null || BT_Addr.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME)) {
            errorLog("AVRCP is not connected yet");
        } else {
            ret = BluetoothAvrcpCtService_fastForwardNative(BT_Addr);
            if (!ret) {
                errorLog("fastForward failure, return value is " + ret);
            }
        }
        return ret;
    }

    public boolean rewind(String BT_Addr) {
        boolean ret = false;
        if (mAvrcpCtState != 1 || BT_Addr == null || BT_Addr.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME)) {
            errorLog("AVRCP is not connected yet");
        } else {
            ret = BluetoothAvrcpCtService_rewindNative(BT_Addr);
            if (!ret) {
                errorLog("fastForward failure, return value is " + ret);
            }
        }
        return ret;
    }

    public boolean getElementAttributes(long identifier, byte count, int[] attributes) {
        boolean ret = false;
        if (mAvrcpCtState == 1) {
            ret = BluetoothAvrcpCtService_getElementAttributesNative(identifier, count, attributes);
            if (!ret) {
                errorLog("getElementAttributes failure, return value is " + ret);
            }
        } else {
            errorLog("AVRCP is not connected yet");
        }
        return ret;
    }

    public boolean getPlayerStatus() {
        boolean ret = false;
        if (mAvrcpCtState == 1) {
            ret = BluetoothAvrcpCtService_getPlayStatusNative();
            if (!ret) {
                errorLog("getPlayerStatus fail");
            }
        } else {
            errorLog("AVRCP is not connected yet");
        }
        return ret;
    }

    public boolean registerNotificationReq(byte event_id, int playback_interval) {
        boolean ret = false;
        if (mAvrcpCtState == 1) {
            ret = BluetoothAvrcpCtService_regNotificationNative(event_id, playback_interval);
            if (!ret) {
                errorLog("registerNotificationReq fail");
            }
        } else {
            errorLog("AVRCP is not connected yet");
        }
        return ret;
    }

    public boolean getItemAttributes(byte scope, long uid, char uid_counter, byte count, int[] attributeIds) {
        if (mAvrcpCtState == 1 && this.mAvrcpCtBrowseState == 17) {
            return BluetoothAvrcpCtService_getItemAttributesNative(scope, uid, uid_counter, count, attributeIds);
        }
        if (mAvrcpCtState != 1) {
            errorLog("AVRCP is not connected yet");
            return false;
        } else if (this.mAvrcpCtBrowseState == 17) {
            return false;
        } else {
            errorLog("AVRCP Browse is not connected yet");
            return false;
        }
    }

    public boolean informDisplayableCharset(byte count, char charset_id) {
        boolean ret = false;
        if (mAvrcpCtState == 1) {
            ret = BluetoothAvrcpCtService_informDisplaybaleCharsetNative(count, charset_id);
            if (!ret) {
                errorLog("registerNotificationReq fail");
            }
        } else {
            errorLog("AVRCP is not connected yet");
        }
        return ret;
    }

    public boolean getCapabilities(byte capability_id) {
        boolean ret = false;
        if (mAvrcpCtState == 1) {
            ret = BluetoothAvrcpCtService_getCapabilitiesNative(capability_id);
            if (!ret) {
                errorLog("getCapabilities fail");
            }
        } else {
            errorLog("AVRCP is not connected yet");
        }
        return ret;
    }

    /* JADX WARNING: inconsistent code. */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private int audioManage(int r12, int r13) throws java.lang.IllegalStateException {
        /*
        r11 = this;
        r6 = -1;
        r9 = 0;
        r10 = 1;
        r3 = 0;
        r2 = 0;
        r7 = r11.mLock;
        monitor-enter(r7);
        r8 = mCBM;	 Catch:{ all -> 0x0040 }
        if (r8 == 0) goto L_0x0010;
    L_0x000c:
        r8 = mAudioState;	 Catch:{ all -> 0x0040 }
        if (r12 != r8) goto L_0x0012;
    L_0x0010:
        monitor-exit(r7);	 Catch:{ all -> 0x0040 }
    L_0x0011:
        return r6;
    L_0x0012:
        monitor-exit(r7);	 Catch:{ all -> 0x0040 }
        if (r12 != r10) goto L_0x010d;
    L_0x0015:
        r0 = android.os.Parcel.obtain();
        r4 = 0;
        r5 = 0;
        r1 = 1;
        r7 = mCBM;
        r3 = r7.query(r0);
        r4 = r0.readInt();
    L_0x0026:
        if (r4 <= 0) goto L_0x003a;
    L_0x0028:
        r5 = r0.readInt();
        switch(r5) {
            case 1: goto L_0x004a;
            case 2: goto L_0x0043;
            case 3: goto L_0x004a;
            case 15: goto L_0x0043;
            case 16: goto L_0x004a;
            default: goto L_0x002f;
        };
    L_0x002f:
        r7 = r11.mLock;
        monitor-enter(r7);
        r8 = r11.mIsForeground;	 Catch:{ all -> 0x0053 }
        if (r8 == 0) goto L_0x004c;
    L_0x0036:
        r1 = 1;
    L_0x0037:
        monitor-exit(r7);	 Catch:{ all -> 0x0053 }
    L_0x0038:
        if (r1 != 0) goto L_0x0056;
    L_0x003a:
        if (r1 != 0) goto L_0x0059;
    L_0x003c:
        r0.recycle();
        goto L_0x0011;
    L_0x0040:
        r6 = move-exception;
        monitor-exit(r7);	 Catch:{ all -> 0x0040 }
        throw r6;
    L_0x0043:
        r7 = "WARN:No permission, high priority source playing";
        r11.printLog(r7);
        r1 = 0;
        goto L_0x0038;
    L_0x004a:
        r1 = 1;
        goto L_0x0038;
    L_0x004c:
        r8 = "WARN:No permission, other source playing";
        r11.printLog(r8);	 Catch:{ all -> 0x0053 }
        r1 = 0;
        goto L_0x0037;
    L_0x0053:
        r6 = move-exception;
        monitor-exit(r7);	 Catch:{ all -> 0x0053 }
        throw r6;
    L_0x0056:
        r4 = r4 + -1;
        goto L_0x0026;
    L_0x0059:
        if (r13 != r10) goto L_0x0101;
    L_0x005b:
        r7 = mCBM;	 Catch:{ all -> 0x008b }
        r8 = mCBM;	 Catch:{ all -> 0x008b }
        r8 = 3;
        r9 = mCBM;	 Catch:{ all -> 0x008b }
        r9 = 1;
        r3 = r7.request(r8, r9, r0);	 Catch:{ all -> 0x008b }
        r2 = r0.readInt();	 Catch:{ all -> 0x008b }
        r7 = new java.lang.StringBuilder;	 Catch:{ all -> 0x008b }
        r7.<init>();	 Catch:{ all -> 0x008b }
        r8 = "audioManage:request res:";
        r7 = r7.append(r8);	 Catch:{ all -> 0x008b }
        r7 = r7.append(r2);	 Catch:{ all -> 0x008b }
        r7 = r7.toString();	 Catch:{ all -> 0x008b }
        r11.printLog(r7);	 Catch:{ all -> 0x008b }
        if (r3 != r6) goto L_0x0090;
    L_0x0083:
        r6 = new java.lang.IllegalStateException;	 Catch:{ all -> 0x008b }
        r7 = "CBM run exception!!!";
        r6.<init>(r7);	 Catch:{ all -> 0x008b }
        throw r6;	 Catch:{ all -> 0x008b }
    L_0x008b:
        r6 = move-exception;
        r0.recycle();
        throw r6;
    L_0x0090:
        r6 = -2;
        if (r3 != r6) goto L_0x00f9;
    L_0x0093:
        r6 = "WARN:CBManager no need request again!";
        r11.printLog(r6);	 Catch:{ all -> 0x008b }
    L_0x0098:
        r7 = r11.mLock;	 Catch:{ all -> 0x008b }
        monitor-enter(r7);	 Catch:{ all -> 0x008b }
        if (r2 != r10) goto L_0x00a5;
    L_0x009d:
        r6 = 1;
        r8 = 0;
        r11.BluetoothAvrcpCtService_setAudioNative(r6, r8);	 Catch:{ all -> 0x0105 }
        r6 = 1;
        mAudioState = r6;	 Catch:{ all -> 0x0105 }
    L_0x00a5:
        monitor-exit(r7);	 Catch:{ all -> 0x0105 }
        r6 = mAudioState;	 Catch:{ all -> 0x008b }
        if (r6 != r10) goto L_0x00f3;
    L_0x00aa:
        if (r13 != 0) goto L_0x00f3;
    L_0x00ac:
        r6 = new java.lang.StringBuilder;	 Catch:{ all -> 0x008b }
        r6.<init>();	 Catch:{ all -> 0x008b }
        r7 = "audioManage status ";
        r6 = r6.append(r7);	 Catch:{ all -> 0x008b }
        r7 = mPlaybackStatus;	 Catch:{ all -> 0x008b }
        r6 = r6.append(r7);	 Catch:{ all -> 0x008b }
        r7 = "avrcpstate ";
        r6 = r6.append(r7);	 Catch:{ all -> 0x008b }
        r7 = mAvrcpCtState;	 Catch:{ all -> 0x008b }
        r6 = r6.append(r7);	 Catch:{ all -> 0x008b }
        r7 = "addr ";
        r6 = r6.append(r7);	 Catch:{ all -> 0x008b }
        r7 = r11.remoteAvrcpTgAddr;	 Catch:{ all -> 0x008b }
        r6 = r6.append(r7);	 Catch:{ all -> 0x008b }
        r6 = r6.toString();	 Catch:{ all -> 0x008b }
        r11.printLog(r6);	 Catch:{ all -> 0x008b }
        r6 = com.autochips.bluetooth.a2dpsink.BluetoothA2dpSinkService.mA2dpSinkState;	 Catch:{ all -> 0x008b }
        r7 = 19;
        if (r6 == r7) goto L_0x00ea;
    L_0x00e2:
        r6 = mPlaybackStatus;	 Catch:{ all -> 0x008b }
        if (r6 == r10) goto L_0x0108;
    L_0x00e6:
        r6 = mAvrcpCtState;	 Catch:{ all -> 0x008b }
        if (r6 != r10) goto L_0x0108;
    L_0x00ea:
        r6 = r11.remoteAvrcpTgAddr;	 Catch:{ all -> 0x008b }
        if (r6 == 0) goto L_0x00f3;
    L_0x00ee:
        r6 = r11.remoteAvrcpTgAddr;	 Catch:{ all -> 0x008b }
        r11.play(r6);	 Catch:{ all -> 0x008b }
    L_0x00f3:
        r0.recycle();
    L_0x00f6:
        r6 = r3;
        goto L_0x0011;
    L_0x00f9:
        if (r2 != 0) goto L_0x0098;
    L_0x00fb:
        r6 = "WARN:CBManager reply REQ_FORBID, may be can not play!";
        r11.printLog(r6);	 Catch:{ all -> 0x008b }
        goto L_0x0098;
    L_0x0101:
        if (r13 != 0) goto L_0x0098;
    L_0x0103:
        r2 = 1;
        goto L_0x0098;
    L_0x0105:
        r6 = move-exception;
        monitor-exit(r7);	 Catch:{ all -> 0x0105 }
        throw r6;	 Catch:{ all -> 0x008b }
    L_0x0108:
        r6 = 0;
        r11.scheduleTask(r6);	 Catch:{ all -> 0x008b }
        goto L_0x00f3;
    L_0x010d:
        if (r12 != 0) goto L_0x00f6;
    L_0x010f:
        r7 = r11.mLock;
        monitor-enter(r7);
        r6 = 0;
        r8 = 1;
        r11.BluetoothAvrcpCtService_setAudioNative(r6, r8);	 Catch:{ all -> 0x0123 }
        r6 = 0;
        mAudioState = r6;	 Catch:{ all -> 0x0123 }
        monitor-exit(r7);	 Catch:{ all -> 0x0123 }
        if (r10 != r13) goto L_0x0126;
    L_0x011d:
        r6 = mCBM;
        r6.release();
        goto L_0x00f6;
    L_0x0123:
        r6 = move-exception;
        monitor-exit(r7);	 Catch:{ all -> 0x0123 }
        throw r6;
    L_0x0126:
        r6 = com.autochips.bluetooth.a2dpsink.BluetoothA2dpSinkService.mA2dpSinkState;
        r7 = 15;
        if (r6 != r7) goto L_0x00f6;
    L_0x012c:
        r6 = r11.mTaskList;
        if (r6 == 0) goto L_0x0140;
    L_0x0130:
        r6 = r11.mTaskList;
        r7 = java.lang.Integer.valueOf(r9);
        r6 = r6.get(r7);
        if (r6 == 0) goto L_0x0140;
    L_0x013c:
        r11.stopTask(r9);
        goto L_0x00f6;
    L_0x0140:
        r6 = mPlaybackStatus;
        if (r6 != r10) goto L_0x00f6;
    L_0x0144:
        r11.scheduleTask(r10);
        goto L_0x00f6;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.audioManage(int, int):int");
    }

    private void regResume(boolean appResume) {
        if (mCBM != null) {
            mCBM.config(appResume);
        }
    }

    private int notifyResume() {
        int ret = 0;
        synchronized (this.mLock) {
            this.mIsForeground = true;
        }
        if (mCBM != null) {
            ret = mCBM.appResume();
            if (-3 == ret && 15 == BluetoothA2dpSinkService.mA2dpSinkState) {
                scheduleTask(2);
            }
        }
        return ret;
    }

    private synchronized void notifyRevoke() {
        synchronized (this.mLock) {
            this.mIsForeground = false;
        }
    }

    private void scheduleTask(int task_type) {
        if (this.mTimer == null) {
            this.mTimer = new Timer();
        }
        if (this.mTaskList == null) {
            this.mTaskList = new HashMap();
        }
        printLog("scheduleTask:task_type=" + task_type);
        if (this.mTaskList.get(Integer.valueOf(task_type)) == null) {
            if (task_type == 0) {
                this.mTask = new C00265();
                this.mTimer.schedule(this.mTask, 1000, 500);
            } else if (1 == task_type) {
                this.mTask = new C00276();
                this.mTimer.schedule(this.mTask, 1000);
            } else if (2 == task_type) {
                this.mTask = new C00287();
                this.mTimer.schedule(this.mTask, 1000);
            }
            this.mTaskList.put(Integer.valueOf(task_type), this.mTask);
        } else if (DEBUG) {
            Log.w(TAG, "scheduleTask: already start!");
        }
    }

    private void stopTask(int task_type) {
        printLog("stopTask:task_type=" + task_type);
        if (this.mTaskList != null && this.mTaskList.get(Integer.valueOf(task_type)) != null) {
            ((TimerTask) this.mTaskList.get(Integer.valueOf(task_type))).cancel();
            this.mTaskList.remove(Integer.valueOf(task_type));
            if (this.mTaskList.size() == 0) {
                this.mTimer.cancel();
                this.mTimer.purge();
                this.mTimer = null;
                this.mTaskList = null;
            }
        }
    }

    public void onActivateCnf(byte index, char result) {
        printLog("onActivateCnf index:" + index + ",result:" + result);
        if (BT_AVRCP_RESULT_SUCCESS == result) {
            notifyProfileState(11, null, '\u0000', '\u0000');
        }
    }

    public void onDeactivateCnf(byte index, char result) {
        printLog("onDeactivateCnf index:" + index + ",result:" + result);
        if (BT_AVRCP_RESULT_SUCCESS == result) {
            notifyProfileState(13, null, '\u0000', '\u0000');
        }
    }

    public void onConnectInd(String addr, String device_name, int psm_value) {
        printLog("onConnectInd:" + addr);
        this.remoteAvrcpTgAddr = addr;
        this.remoteAvrcpTgDevice = BluetoothAdapter.getDefaultAdapter().getRemoteDevice(addr);
    }

    public void onConnectCnf(char result, String addr, char tgFeature, char tgVersion) {
        printLog("onConnectCnf result:" + result);
        if (BT_AVRCP_RESULT_SUCCESS == result) {
            this.remoteAvrcpTgAddr = addr;
            this.remoteAvrcpTgDevice = BluetoothAdapter.getDefaultAdapter().getRemoteDevice(addr);
            this.remoteAvrcpTgVersion = tgVersion;
            notifyProfileState(1, addr, tgFeature, tgVersion);
            return;
        }
        this.remoteAvrcpTgAddr = null;
        this.remoteAvrcpTgDevice = null;
        this.remoteAvrcpTgVersion = '\u0000';
        mAvrcpCtState = 2;
    }

    public void onDisconnectInd() {
        printLog("disconnectInd");
        this.remoteAvrcpTgVersion = '\u0000';
        trackChangedEventStatus = 0;
        posChangedEventStatus = 0;
        mPlaybackStatus = 0;
        notifyProfileState(2, this.remoteAvrcpTgAddr, '\u0000', '\u0000');
        this.remoteAvrcpTgDevice = null;
        this.remoteAvrcpTgAddr = null;
    }

    public void onDisconnectCnf(char result) {
        printLog("onDisconnectCnf:" + result);
        if (BT_AVRCP_RESULT_SUCCESS == result) {
            this.remoteAvrcpTgVersion = '\u0000';
            trackChangedEventStatus = 0;
            posChangedEventStatus = 0;
            mPlaybackStatus = 0;
            notifyProfileState(2, this.remoteAvrcpTgAddr, '\u0000', '\u0000');
            this.remoteAvrcpTgDevice = null;
            this.remoteAvrcpTgAddr = null;
        }
    }

    public void onpassThroughKeyCnf(int keyvalue, byte isPress) {
        printLog("onpassThroughKeyCnf");
        switch (keyvalue) {
            case 69:
                mPlaybackStatus = 4;
                break;
            case 70:
                mPlaybackStatus = 3;
                break;
        }
        this.avrcp_passthrough_command_cnf_intent.putExtra(KEY_VALUE, keyvalue);
        this.avrcp_passthrough_command_cnf_intent.putExtra(IS_PRESS, isPress);
        sendBroadcast(this.avrcp_passthrough_command_cnf_intent, "android.permission.BLUETOOTH");
    }

    public void onBrowseConnectCnf(byte chnl_num, byte connect_id, char result, char bws_mtu) {
        printLog("onBrowseConnectCnf:" + result);
        if (result == BT_AVRCP_RESULT_SUCCESS) {
            this.mAvrcpCtBrowseState = 17;
            this.avrcp_browse_state_changed_intent.putExtra(BROWSE_STATE, this.mAvrcpCtBrowseState);
            this.avrcp_browse_state_changed_intent.putExtra(BWS_MTU, bws_mtu);
            sendBroadcast(this.avrcp_browse_state_changed_intent, "android.permission.BLUETOOTH");
        }
    }

    public void onBrowseDisconnectCnf(byte chnl_num) {
        printLog("onBrowseDisconnectCnf");
        this.mAvrcpCtBrowseState = 18;
        this.avrcp_browse_state_changed_intent.putExtra(BROWSE_STATE, this.mAvrcpCtBrowseState);
        this.avrcp_browse_state_changed_intent.putExtra(BWS_MTU, '\u0000');
        sendBroadcast(this.avrcp_browse_state_changed_intent, "android.permission.BLUETOOTH");
    }

    public void getElementAttributesCnf(byte chnl_num, byte seq_id, char result, byte error_code, byte count, int[] attribute_id, char[] charset, String[] attribute_value) {
        printLog("getElementAttributesCnf");
        if (result != BT_AVRCP_RESULT_SUCCESS) {
            this.avrcp_get_element_attributes_cnf_intent.putExtra(RESULT, result);
            this.avrcp_get_element_attributes_cnf_intent.putExtra(ERROR_CODE, error_code);
            this.avrcp_get_element_attributes_cnf_intent.putExtra(COUNT, (byte) 0);
            sendBroadcast(this.avrcp_get_element_attributes_cnf_intent, "android.permission.BLUETOOTH");
        } else if (count > (byte) 0) {
            this.avrcp_get_element_attributes_cnf_intent.putExtra(RESULT, result);
            this.avrcp_get_element_attributes_cnf_intent.putExtra(ERROR_CODE, error_code);
            this.avrcp_get_element_attributes_cnf_intent.putExtra(COUNT, count);
            byte i = (byte) 0;
            while (i < count && i < (byte) 10) {
                String value;
                this.avrcp_get_element_attributes_cnf_intent.putExtra(ATTRIBUTE_ID[i], attribute_id[i]);
                if (charset[i] == 'j') {
                    value = attribute_value[i];
                } else {
                    value = DecodeUTF8Plus(attribute_value[i]);
                }
                printLog("getElementAttributesCnf, attribute_value" + i + ":" + value);
                this.avrcp_get_element_attributes_cnf_intent.putExtra(VALUE[i], value);
                i = (byte) (i + 1);
            }
            sendBroadcast(this.avrcp_get_element_attributes_cnf_intent, "android.permission.BLUETOOTH");
        } else {
            this.avrcp_get_element_attributes_cnf_intent.putExtra(RESULT, result);
            this.avrcp_get_element_attributes_cnf_intent.putExtra(ERROR_CODE, error_code);
            this.avrcp_get_element_attributes_cnf_intent.putExtra(COUNT, (byte) 0);
            sendBroadcast(this.avrcp_get_element_attributes_cnf_intent, "android.permission.BLUETOOTH");
        }
    }

    public void getItemAttributesCnf(byte chnl_num, byte seq_id, char result, byte error_code, byte status, byte counter, int[] attribute_id, char[] charset, String[] attribute_value) {
        printLog("getItemAttributesCnf");
        String value = null;
        if (result != BT_AVRCP_RESULT_SUCCESS) {
            this.avrcp_get_item_attributes_cnf_intent.putExtra(RESULT, result);
            this.avrcp_get_item_attributes_cnf_intent.putExtra(ERROR_CODE, error_code);
            this.avrcp_get_item_attributes_cnf_intent.putExtra(COUNT, (byte) 0);
            sendBroadcast(this.avrcp_get_item_attributes_cnf_intent, "android.permission.BLUETOOTH");
        } else if (counter > (byte) 0) {
            this.avrcp_get_item_attributes_cnf_intent.putExtra(RESULT, result);
            this.avrcp_get_item_attributes_cnf_intent.putExtra(ERROR_CODE, error_code);
            this.avrcp_get_item_attributes_cnf_intent.putExtra(COUNT, counter);
            for (byte i = (byte) 0; i < counter; i = (byte) (i + 1)) {
                this.avrcp_get_item_attributes_cnf_intent.putExtra(ATTRIBUTE_ID[i], attribute_id[i]);
                if (charset[i] == 'j') {
                    value = DecodeUTF8Plus(attribute_value[i]);
                }
                this.avrcp_get_item_attributes_cnf_intent.putExtra(VALUE[i], value);
            }
            sendBroadcast(this.avrcp_get_item_attributes_cnf_intent, "android.permission.BLUETOOTH");
        } else {
            this.avrcp_get_item_attributes_cnf_intent.putExtra(RESULT, result);
            this.avrcp_get_item_attributes_cnf_intent.putExtra(ERROR_CODE, error_code);
            this.avrcp_get_item_attributes_cnf_intent.putExtra(COUNT, (byte) 0);
            sendBroadcast(this.avrcp_get_item_attributes_cnf_intent, "android.permission.BLUETOOTH");
        }
    }

    public void getPlayerStatusCnf(byte chnl_num, byte seq_id, char result, byte error_code, int song_length, int song_position, byte play_status) {
        printLog("getPlayerStatusCnf:result= " + result);
        mPlaybackStatus = play_status;
        if (result == BT_AVRCP_RESULT_SUCCESS) {
            this.avrcp_get_player_status_cnf_intent.putExtra(RESULT, result);
            this.avrcp_get_player_status_cnf_intent.putExtra(ERROR_CODE, error_code);
            this.avrcp_get_player_status_cnf_intent.putExtra(SONG_LENGTH, song_length);
            this.avrcp_get_player_status_cnf_intent.putExtra(SONG_POSITION, song_position);
            this.avrcp_get_player_status_cnf_intent.putExtra(PLAY_STATUS, play_status);
            sendBroadcast(this.avrcp_get_player_status_cnf_intent, "android.permission.BLUETOOTH");
            return;
        }
        this.avrcp_get_player_status_cnf_intent.putExtra(RESULT, result);
        this.avrcp_get_player_status_cnf_intent.putExtra(ERROR_CODE, error_code);
        this.avrcp_get_player_status_cnf_intent.putExtra(SONG_LENGTH, 0);
        this.avrcp_get_player_status_cnf_intent.putExtra(SONG_POSITION, 0);
        this.avrcp_get_player_status_cnf_intent.putExtra(PLAY_STATUS, (byte) -1);
        sendBroadcast(this.avrcp_get_player_status_cnf_intent, "android.permission.BLUETOOTH");
    }

    public void regNotiPlaybackStatusChangedCnf(byte chnl_num, byte seq_id, char result, byte error_code, byte play_status, byte is_interim) {
        printLog("regNotiPlaybackStatusChangedCnf");
        if (result == BT_AVRCP_RESULT_SUCCESS && is_interim == (byte) 1) {
            this.playbackChangedEventStatus = 1;
        } else if (result == BT_AVRCP_RESULT_SUCCESS && is_interim == (byte) 0) {
            this.playbackChangedEventStatus = 2;
            mPlaybackStatus = play_status;
        } else if (result != BT_AVRCP_RESULT_SUCCESS) {
            this.playbackChangedEventStatus = 0;
        }
        if (result == BT_AVRCP_RESULT_SUCCESS) {
            this.avrcp_reg_notification_playback_changed_cnf_intent.putExtra(RESULT, result);
            this.avrcp_reg_notification_playback_changed_cnf_intent.putExtra(ERROR_CODE, error_code);
            this.avrcp_reg_notification_playback_changed_cnf_intent.putExtra(PLAY_STATUS, play_status);
            this.avrcp_reg_notification_playback_changed_cnf_intent.putExtra(IS_INTERIM, is_interim);
            sendBroadcast(this.avrcp_reg_notification_playback_changed_cnf_intent, "android.permission.BLUETOOTH");
            return;
        }
        this.avrcp_reg_notification_playback_changed_cnf_intent.putExtra(RESULT, result);
        this.avrcp_reg_notification_playback_changed_cnf_intent.putExtra(ERROR_CODE, error_code);
        this.avrcp_reg_notification_playback_changed_cnf_intent.putExtra(PLAY_STATUS, 0);
        this.avrcp_reg_notification_playback_changed_cnf_intent.putExtra(IS_INTERIM, is_interim);
        sendBroadcast(this.avrcp_reg_notification_playback_changed_cnf_intent, "android.permission.BLUETOOTH");
    }

    public void regNotiPosChangedCnf(byte chnl_num, byte seq_id, char result, byte error_code, int position, byte is_interim) {
        printLog("regNotiPosChangedCnf");
        if (result == BT_AVRCP_RESULT_SUCCESS && is_interim == (byte) 1) {
            posChangedEventStatus = 1;
        } else if (result == BT_AVRCP_RESULT_SUCCESS && is_interim == (byte) 0) {
            posChangedEventStatus = 2;
        } else if (result != BT_AVRCP_RESULT_SUCCESS) {
            posChangedEventStatus = 0;
        }
        if (result == BT_AVRCP_RESULT_SUCCESS) {
            this.avrcp_reg_notification_pos_changed_cnf_intent.putExtra(RESULT, result);
            this.avrcp_reg_notification_pos_changed_cnf_intent.putExtra(ERROR_CODE, error_code);
            this.avrcp_reg_notification_pos_changed_cnf_intent.putExtra(SONG_POSITION, position);
            this.avrcp_reg_notification_pos_changed_cnf_intent.putExtra(IS_INTERIM, is_interim);
            sendBroadcast(this.avrcp_reg_notification_pos_changed_cnf_intent, "android.permission.BLUETOOTH");
            return;
        }
        this.avrcp_reg_notification_pos_changed_cnf_intent.putExtra(RESULT, result);
        this.avrcp_reg_notification_pos_changed_cnf_intent.putExtra(ERROR_CODE, error_code);
        this.avrcp_reg_notification_pos_changed_cnf_intent.putExtra(SONG_POSITION, 0);
        this.avrcp_reg_notification_pos_changed_cnf_intent.putExtra(IS_INTERIM, is_interim);
        sendBroadcast(this.avrcp_reg_notification_pos_changed_cnf_intent, "android.permission.BLUETOOTH");
    }

    public void regNotiTrackChangedCnf(byte chnl_num, byte seq_id, char result, byte error_code, byte is_interim, long identifier) {
        printLog("regNotiTrackChangedCnf");
        if (result == BT_AVRCP_RESULT_SUCCESS && is_interim == (byte) 1) {
            trackChangedEventStatus = 1;
        } else if (result == BT_AVRCP_RESULT_SUCCESS && is_interim == (byte) 0) {
            trackChangedEventStatus = 2;
        } else if (result != BT_AVRCP_RESULT_SUCCESS) {
            trackChangedEventStatus = 0;
        }
        this.avrcp_reg_notification_track_changed_cnf_intent.putExtra(RESULT, result);
        this.avrcp_reg_notification_track_changed_cnf_intent.putExtra(ERROR_CODE, error_code);
        this.avrcp_reg_notification_track_changed_cnf_intent.putExtra(IS_INTERIM, is_interim);
        this.avrcp_reg_notification_track_changed_cnf_intent.putExtra(IDENTIFIER, identifier);
        sendBroadcast(this.avrcp_reg_notification_track_changed_cnf_intent, "android.permission.BLUETOOTH");
    }

    public void regNotiErrorCnf(byte chnl_num, byte seq_id, char result, byte error_code, byte event_id) {
        printLog("regNotiErrorCnf, result:" + result + "error_code:" + error_code);
        this.avrcp_reg_noification_error_cnf_intent.putExtra(RESULT, result);
        this.avrcp_reg_noification_error_cnf_intent.putExtra(ERROR_CODE, error_code);
        this.avrcp_reg_noification_error_cnf_intent.putExtra(EVENT_ID, event_id);
        sendBroadcast(this.avrcp_reg_noification_error_cnf_intent, "android.permission.BLUETOOTH");
    }

    public void informDisplayableCharsetCnf(byte chnl_num, byte seq_id, char result, byte error_code) {
        printLog("informDisplayableCharsetCnf, result:" + result + "error_code:" + error_code);
        this.avrcp_inform_displayable_charset_cnf_intent.putExtra(RESULT, result);
        this.avrcp_inform_displayable_charset_cnf_intent.putExtra(ERROR_CODE, error_code);
        sendBroadcast(this.avrcp_inform_displayable_charset_cnf_intent, "android.permission.BLUETOOTH");
    }

    public void getCapabilityCnf(byte chnl_num, byte seq_id, char result, byte error_code, byte capability_id, byte count, byte[] capabilities) {
        printLog("getCapabilityEventsCnf: result:" + result + "error_code:" + error_code);
        this.avrcp_get_capability_cnf_intent.putExtra(RESULT, result);
        this.avrcp_get_capability_cnf_intent.putExtra(ERROR_CODE, error_code);
        this.avrcp_get_capability_cnf_intent.putExtra(CAPABILITY_ID, capability_id);
        if (capability_id == (byte) 3) {
            if (result != BT_AVRCP_RESULT_SUCCESS || count <= (byte) 0) {
                this.avrcp_get_capability_cnf_intent.putExtra(COUNT, (byte) 0);
            } else {
                this.avrcp_get_capability_cnf_intent.putExtra(COUNT, count);
                for (byte i = (byte) 0; i < count; i = (byte) (i + 1)) {
                    this.avrcp_get_capability_cnf_intent.putExtra(EVENTS_SUPPORTED[i], capabilities[i]);
                }
            }
        }
        sendBroadcast(this.avrcp_get_capability_cnf_intent, "android.permission.BLUETOOTH");
    }

    private void notifyProfileState(int state, String addr, char tgFeature, char tgVersion) {
        printLog("notifyProfileState: " + state);
        mAvrcpCtState = state;
        Intent intent = new Intent(LocalBluetoothProfileManager.ACTION_PROFILE_STATE_UPDATE);
        intent.putExtra("android.bluetooth.profilemanager.extra.PROFILE", Profile.Bluetooth_AVRCP_CT);
        intent.putExtra(LocalBluetoothProfileManager.EXTRA_PROFILE, BTProfile.Bluetooth_AVRCP_CT);
        intent.putExtra(LocalBluetoothProfileManager.EXTRA_NEW_STATE, state);
        if (state == 1) {
            intent.putExtra(REMOTE_DEVICE_ADDR, addr);
            intent.putExtra(REMOTE_TG_FEATURE, tgFeature);
            intent.putExtra(REMOTE_TG_VERSION, tgVersion);
        }
        sendBroadcast(intent, "android.permission.BLUETOOTH");
        BluetoothAdapter btAdapter = BluetoothAdapter.getDefaultAdapter();
        if (state == 1) {
            btAdapter.updateConnectionState(this.remoteAvrcpTgDevice, 7, 2, 1);
        } else if (state == 2) {
            btAdapter.updateConnectionState(this.remoteAvrcpTgDevice, 7, 0, 3);
        }
    }

    private void notifyPassThroughCnf(int keyvalue) {
        printLog("notifyPassThroughCnf: " + keyvalue);
        Intent intent = new Intent(LocalBluetoothProfileManager.ACTION_PROFILE_STATE_UPDATE);
        intent.putExtra("android.bluetooth.profilemanager.extra.PROFILE", Profile.Bluetooth_AVRCP_CT);
        intent.putExtra(LocalBluetoothProfileManager.EXTRA_PROFILE, BTProfile.Bluetooth_AVRCP_CT);
        intent.putExtra(PASSTHROUGH_KEY, keyvalue);
        sendBroadcast(intent, "android.permission.BLUETOOTH");
    }

    private void printLog(String msg) {
        if (DEBUG) {
            Log.d(TAG, msg);
        }
    }

    private void errorLog(String msg) {
        if (DEBUG) {
            Log.e(TAG, msg);
        }
    }

    public static String DecodeUTF8Plus(String str) {
        ArrayIndexOutOfBoundsException e;
        if (str == null) {
            return BluetoothPbapClientPath.PBAP_ROOT_NAME;
        }
        String decodedUTF8 = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        boolean bNonUTF = false;
        try {
            byte[] bytes = str.getBytes("US-ASCII");
            if (bytes == null) {
                return BluetoothPbapClientPath.PBAP_ROOT_NAME;
            }
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            int i = 0;
            while (i < bytes.length) {
                int i2 = i + 1;
                try {
                    int u = Character.digit((char) bytes[i], 16);
                    i = i2 + 1;
                    try {
                        int l = Character.digit((char) bytes[i2], 16);
                        if (u == -1 || l == -1) {
                            bNonUTF = true;
                            i2 = i;
                            break;
                        }
                        buffer.write((char) ((u << 4) + l));
                    } catch (ArrayIndexOutOfBoundsException e2) {
                        e = e2;
                        i2 = i;
                    }
                } catch (ArrayIndexOutOfBoundsException e3) {
                    e = e3;
                }
            }
            if (bNonUTF) {
                decodedUTF8 = str;
            } else {
                decodedUTF8 = new String(buffer.toByteArray(), "UTF-8");
            }
            return decodedUTF8;
        } catch (Exception e4) {
            e4.printStackTrace();
            return str;
        }
        e.printStackTrace();
        return str;
    }
}
