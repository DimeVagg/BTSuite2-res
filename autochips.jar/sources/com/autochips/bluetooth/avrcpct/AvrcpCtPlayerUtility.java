package com.autochips.bluetooth.avrcpct;

import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.inputsource.HDMI;
import java.util.Comparator;
import java.util.PriorityQueue;
import java.util.Timer;
import java.util.TimerTask;

public class AvrcpCtPlayerUtility {
    private static final byte AVRCP_ERRCODE_RESERVED = (byte) 6;
    private static final int CMD_PRIORITY_1 = 1;
    private static final int CMD_PRIORITY_2 = 2;
    private static final int CMD_PRIORITY_3 = 3;
    private static final int CMD_PRIORITY_4 = 4;
    private static final int CMD_PRIORITY_5 = 5;
    private static final int CMD_PRIORITY_6 = 6;
    private static final int CMD_PRIORITY_7 = 7;
    private static final int CMD_PRIORITY_8 = 8;
    private static final int CMD_PRIORITY_9 = 9;
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugMusic);
    private static final byte EVENT_ADDRESSED_PLAYERS_CHANGED = (byte) 11;
    private static final byte EVENT_AVAILABLE_PLAYERS_CHANGED = (byte) 10;
    private static final byte EVENT_BATT_STATUS_CHANGED = (byte) 6;
    private static final byte EVENT_NOW_PLAYING_CONTENT_CHANGED = (byte) 9;
    private static final byte EVENT_PLAYBACK_POS_CHANGED = (byte) 5;
    private static final byte EVENT_PLAYBACK_STATUS_CHANGED = (byte) 1;
    private static final byte EVENT_PLAYER_APPLICATION_SETTING_CHANGED = (byte) 8;
    private static final byte EVENT_RESERVED = (byte) 15;
    private static final byte EVENT_SYSTEM_STATUS_CHANGED = (byte) 7;
    private static final byte EVENT_TRACK_CHANGED = (byte) 2;
    private static final byte EVENT_TRACK_REACHED_END = (byte) 3;
    private static final byte EVENT_TRACK_REACHED_START = (byte) 4;
    private static final byte EVENT_UIDS_CHANGED = (byte) 12;
    private static final byte EVENT_VOLUME_CHANGED = (byte) 13;
    private static final int MEIDA_ATTR_ALBUM = 3;
    private static final int MEIDA_ATTR_ARTIST = 2;
    private static final int MEIDA_ATTR_GENRE = 6;
    private static final int MEIDA_ATTR_NUM_OF_ALBUM = 4;
    private static final int MEIDA_ATTR_PLAYING_TIME_MS = 7;
    private static final int MEIDA_ATTR_RESERVED = -1;
    private static final int MEIDA_ATTR_TITLE = 1;
    private static final int MEIDA_ATTR_TOTAL_NUM = 5;
    private static Comparator<bt_music_avrcp_request> OrderIsdn = new C00191();
    private static final String TAG = "AvrcpCtPlayerUtility";
    private static boolean mIsForeground = false;
    private final int TIMER_GET_PLYAER_STATE = 0;
    private final Context mContext;
    private int mGetMediaInfoNum = 1;
    private boolean mIsRequestBusy = false;
    private boolean mIsTgNotSupport_getElemAtt = false;
    private boolean mIsTgNotSupport_getItemAtt = false;
    private boolean mIsTgNotSupport_getPlayState = false;
    private boolean mIsTgNotSupport_regPlaybackState = false;
    private boolean mIsTgNotSupport_regPosChanged = false;
    private boolean mIsTgNotSupport_regTrackChanged = false;
    private int mLatestCmdIndex = 0;
    private String mMediaAlbum = null;
    private String mMediaArtist = null;
    private int mMediaPlayingTime = 0;
    private String mMediaTitle = null;
    private int mMediaTotalTime = 0;
    private int mPassthroughNum = 1;
    private byte mPlaybackStatus = (byte) 0;
    private final BluetoothAvrcpCtPlayerManage mPlayerManager;
    private int mRemoteNotifyEvent = 0;
    private PriorityQueue<bt_music_avrcp_request> mRequestQueue = null;
    private TimerTask mTask = null;
    private Timer mTimer = null;
    private Intent m_media_data_intent = null;
    private Intent m_playback_data_intent = null;
    private int mgetElementAttributesCount = 0;
    private int mgetPlayerStatusCount = 0;
    private boolean mneedGetElementAttributesInPlaying = true;
    private int mpassthroughCmdCnfCount = 0;
    private int mregPlaybackStatusChangedCount = 0;
    private int mregPosChangedCount = 0;
    private int mregTrackChangedCount = 0;

    /* renamed from: com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility$1 */
    static class C00191 implements Comparator<bt_music_avrcp_request> {
        C00191() {
        }

        public int compare(bt_music_avrcp_request o1, bt_music_avrcp_request o2) {
            if (o1.mpriority > o2.mpriority) {
                return 1;
            }
            if (o1.mpriority < o2.mpriority) {
                return -1;
            }
            if (o1.mpriority2 > o2.mpriority2) {
                return 1;
            }
            if (o1.mpriority2 < o2.mpriority2) {
                return -1;
            }
            return 0;
        }
    }

    /* renamed from: com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility$2 */
    class C00202 extends TimerTask {
        C00202() {
        }

        public void run() {
            if (AvrcpCtPlayerUtility.this.mIsTgNotSupport_getPlayState || !AvrcpCtPlayerUtility.this.mIsTgNotSupport_regPosChanged || AvrcpCtPlayerUtility.this.mPlayerManager == null) {
                AvrcpCtPlayerUtility.this.stopBTMusicTimer();
            } else if (1 != AvrcpCtPlayerUtility.this.mPlayerManager.getAvrcpStateValue() || 15 != AvrcpCtPlayerUtility.this.mPlayerManager.getA2dpSinkStateValue()) {
                AvrcpCtPlayerUtility.this.stopBTMusicTimer();
            } else if (!AvrcpCtPlayerUtility.this.mIsRequestBusy) {
                AvrcpCtPlayerUtility.this.inQueue(AvrcpCtPlayerUtility.this.mRequestQueue, 7, null);
                if (AvrcpCtPlayerUtility.this.mRequestQueue.peek() != null && AvrcpCtPlayerUtility.this.sendRequest((bt_music_avrcp_request) AvrcpCtPlayerUtility.this.mRequestQueue.poll())) {
                    AvrcpCtPlayerUtility.this.mIsRequestBusy = true;
                }
            }
        }
    }

    public class bt_music_avrcp_request {
        public String mBT_Addr;
        public int mcmd_index;
        public int mpriority;
        public int mpriority2;

        public bt_music_avrcp_request(int cmd_index, String BT_Addr, int priority, int priority2) {
            this.mcmd_index = cmd_index;
            this.mBT_Addr = BT_Addr;
            this.mpriority = priority;
            this.mpriority2 = priority2;
        }
    }

    private void resetParameter() {
        this.mMediaTitle = null;
        this.mMediaArtist = null;
        this.mMediaAlbum = null;
        this.mMediaTotalTime = 0;
        this.mMediaPlayingTime = 0;
        this.mPlaybackStatus = (byte) 0;
        this.mpassthroughCmdCnfCount = 0;
        this.mgetElementAttributesCount = 0;
        this.mgetPlayerStatusCount = 0;
        this.mregTrackChangedCount = 0;
        this.mregPosChangedCount = 0;
        this.mregPlaybackStatusChangedCount = 0;
        this.mIsRequestBusy = false;
        this.mPassthroughNum = 1;
        this.mGetMediaInfoNum = 1;
        this.mRemoteNotifyEvent = 0;
        this.mneedGetElementAttributesInPlaying = true;
        this.mIsTgNotSupport_getElemAtt = false;
        this.mIsTgNotSupport_getItemAtt = false;
        this.mIsTgNotSupport_getPlayState = false;
        this.mIsTgNotSupport_regPlaybackState = false;
        this.mIsTgNotSupport_regTrackChanged = false;
        this.mIsTgNotSupport_regPosChanged = false;
        this.m_media_data_intent.removeExtra(BluetoothAvrcpCtPlayerManage.MEDIA_TITLE);
        this.m_media_data_intent.removeExtra(BluetoothAvrcpCtPlayerManage.MEDIA_ARTIST);
        this.m_media_data_intent.removeExtra(BluetoothAvrcpCtPlayerManage.MEDIA_ALBUM);
        this.m_playback_data_intent.removeExtra(BluetoothAvrcpCtPlayerManage.MEDIA_LENGTH);
        this.m_playback_data_intent.removeExtra(BluetoothAvrcpCtPlayerManage.MEDIA_POSITION);
        this.m_playback_data_intent.removeExtra(BluetoothAvrcpCtPlayerManage.PLAYBACK_STATUS);
        this.mLatestCmdIndex = 0;
        if (this.mRequestQueue != null) {
            this.mRequestQueue.clear();
        }
    }

    public AvrcpCtPlayerUtility(Context c, BluetoothAvrcpCtPlayerManage playerManager) {
        this.mContext = c;
        this.mPlayerManager = playerManager;
        this.mRequestQueue = new PriorityQueue(1, OrderIsdn);
        if (this.mRequestQueue != null) {
            this.mRequestQueue.clear();
        } else if (DEBUG) {
            Log.d(TAG, "new mRequestQueue fail");
        }
        this.m_media_data_intent = new Intent(BluetoothAvrcpCtPlayerManage.ACTION_MEDIA_DATA_UPDATE);
        this.m_playback_data_intent = new Intent(BluetoothAvrcpCtPlayerManage.ACTION_PLAYBACK_DATA_UPDATE);
    }

    public void handleA2DPStateChanged(int state) {
        switch (state) {
            case 1:
                this.mPlaybackStatus = (byte) 2;
                updatePlaybackStatus(this.mPlaybackStatus);
                return;
            case 2:
                this.mPlaybackStatus = (byte) 0;
                updatePlaybackStatus(this.mPlaybackStatus);
                return;
            case 15:
                this.mPlaybackStatus = (byte) 1;
                updatePlaybackStatus(this.mPlaybackStatus);
                return;
            default:
                return;
        }
    }

    public void handleAVRCPStateChanged(int state) {
        switch (state) {
            case 1:
                sendCommand(11);
                return;
            case 2:
                resetParameter();
                return;
            default:
                return;
        }
    }

    public void handleGetCapabilityCnf(Intent intent) {
        char result = intent.getCharExtra(BluetoothAvrcpCtService.RESULT, BluetoothAvrcpCtService.BT_AVRCP_RESULT_SUCCESS);
        byte count = intent.getByteExtra(BluetoothAvrcpCtService.COUNT, (byte) 0);
        int notifyEvent = 0;
        if (result == BluetoothAvrcpCtService.BT_AVRCP_RESULT_SUCCESS && count > (byte) 0) {
            for (byte i = (byte) 0; i < count; i = (byte) (i + 1)) {
                notifyEvent |= 1 << intent.getByteExtra(BluetoothAvrcpCtService.EVENTS_SUPPORTED[i], EVENT_RESERVED);
            }
        }
        this.mRemoteNotifyEvent = notifyEvent;
        if (this.mRemoteNotifyEvent > 0) {
            if (DEBUG) {
                Log.d(TAG, "handleGetCapabilityCnf = " + Integer.toString(this.mRemoteNotifyEvent));
            }
            if ((this.mRemoteNotifyEvent & 2) == 0) {
                this.mIsTgNotSupport_regPlaybackState = true;
            } else {
                inQueue(this.mRequestQueue, 8, null);
            }
            if ((this.mRemoteNotifyEvent & 4) == 0) {
                this.mIsTgNotSupport_regTrackChanged = true;
            } else {
                inQueue(this.mRequestQueue, 9, null);
            }
            if ((this.mRemoteNotifyEvent & 32) == 0) {
                this.mIsTgNotSupport_regPosChanged = true;
            } else {
                inQueue(this.mRequestQueue, 10, null);
            }
            inQueue(this.mRequestQueue, 6, null);
            if ((byte) 1 == this.mPlaybackStatus && this.mIsTgNotSupport_regPosChanged) {
                startBTMusicTimer(0);
            }
        } else {
            if (DEBUG) {
                Log.d(TAG, "handleGetCapabilityCnf:remote not support event notify");
            }
            this.mRemoteNotifyEvent = 0;
            this.mIsTgNotSupport_regPlaybackState = true;
            this.mIsTgNotSupport_regTrackChanged = true;
            this.mIsTgNotSupport_regPosChanged = true;
        }
        if (this.mRequestQueue.peek() != null && !sendRequest((bt_music_avrcp_request) this.mRequestQueue.poll())) {
        }
    }

    public void handleGetElementAttributesCnf(Intent intent) {
        if (DEBUG) {
            Log.d(TAG, "ACTION_GET_ELEMENT_ATTRIBUTES");
        }
        char result = intent.getCharExtra(BluetoothAvrcpCtService.RESULT, BluetoothAvrcpCtService.BT_AVRCP_RESULT_SUCCESS);
        if (result == BluetoothAvrcpCtService.BT_AVRCP_RESULT_SUCCESS) {
            byte count = intent.getByteExtra(BluetoothAvrcpCtService.COUNT, (byte) 0);
            if (count > (byte) 0) {
                this.mgetElementAttributesCount = 0;
                for (byte i = (byte) 0; i < count; i = (byte) (i + 1)) {
                    int attribute_id = intent.getIntExtra(BluetoothAvrcpCtService.ATTRIBUTE_ID[i], -1);
                    String value = intent.getStringExtra(BluetoothAvrcpCtService.VALUE[i]);
                    switch (attribute_id) {
                        case 1:
                            this.mMediaTitle = value;
                            break;
                        case 2:
                            this.mMediaArtist = value;
                            break;
                        case 3:
                            this.mMediaAlbum = value;
                            break;
                        default:
                            if (!DEBUG) {
                                break;
                            }
                            Log.d(TAG, "Avrcp getElementAttributes useless attributes");
                            break;
                    }
                }
                this.m_media_data_intent.putExtra(BluetoothAvrcpCtPlayerManage.MEDIA_TITLE, this.mMediaTitle);
                this.m_media_data_intent.putExtra(BluetoothAvrcpCtPlayerManage.MEDIA_ARTIST, this.mMediaArtist);
                this.m_media_data_intent.putExtra(BluetoothAvrcpCtPlayerManage.MEDIA_ALBUM, this.mMediaAlbum);
                if (this.mContext != null) {
                    this.mContext.sendBroadcast(this.m_media_data_intent);
                }
            } else {
                if (DEBUG) {
                    Log.d(TAG, "Avrcp getElementAttributes, attributes count = 0, try again, total twice");
                }
                if (this.mgetElementAttributesCount >= 1 || this.mIsTgNotSupport_getElemAtt || this.mIsTgNotSupport_regTrackChanged) {
                    this.mIsTgNotSupport_getElemAtt = true;
                } else {
                    inQueue(this.mRequestQueue, 6, null);
                    this.mgetElementAttributesCount = 1;
                }
            }
        } else {
            byte error_code = intent.getByteExtra(BluetoothAvrcpCtService.ERROR_CODE, (byte) 6);
            if (DEBUG) {
                Log.e(TAG, "Avrcp getElementAttributes, result:" + result + ",error_code:" + error_code);
            }
            if (result == BluetoothAvrcpCtService.BT_AVRCP_RESULT_INTERNAL_ERROR) {
                if (DEBUG) {
                    Log.e(TAG, "Avrcp getElementAttributes, BT_AVRCP_RESULT_INTERNAL_ERROR");
                }
                if (this.mgetElementAttributesCount < 1 && !this.mIsTgNotSupport_getElemAtt && !this.mIsTgNotSupport_regTrackChanged) {
                    inQueue(this.mRequestQueue, 6, null);
                    this.mgetElementAttributesCount++;
                } else if (this.mgetElementAttributesCount == 1) {
                    this.mgetElementAttributesCount++;
                    this.mneedGetElementAttributesInPlaying = true;
                    if (DEBUG) {
                        Log.e(TAG, "Avrcp getElementAttributes, mneedGetElementAttributesInPlaying = true");
                    }
                } else {
                    this.mgetElementAttributesCount = 0;
                    this.mIsTgNotSupport_getElemAtt = true;
                }
            } else {
                this.mIsTgNotSupport_getElemAtt = true;
            }
        }
        if (this.mRequestQueue.peek() != null && !sendRequest((bt_music_avrcp_request) this.mRequestQueue.poll())) {
        }
    }

    public void handleGePlayerStatusCnf(Intent intent) {
        if (DEBUG) {
            Log.d(TAG, "ACTION_GET_PLAYER_STATUS");
        }
        this.mIsRequestBusy = false;
        char result = intent.getCharExtra(BluetoothAvrcpCtService.RESULT, BluetoothAvrcpCtService.BT_AVRCP_RESULT_SUCCESS);
        if (result == BluetoothAvrcpCtService.BT_AVRCP_RESULT_SUCCESS) {
            this.mgetPlayerStatusCount = 0;
            int trackTime = intent.getIntExtra(BluetoothAvrcpCtService.SONG_LENGTH, -1);
            int playTime = intent.getIntExtra(BluetoothAvrcpCtService.SONG_POSITION, -1);
            byte play_status = intent.getByteExtra(BluetoothAvrcpCtService.PLAY_STATUS, (byte) -1);
            if (trackTime != 0 || playTime != 0 || play_status != (byte) 0) {
                this.mMediaPlayingTime = playTime;
                this.mPlaybackStatus = play_status;
                if (trackTime != this.mMediaTotalTime) {
                    this.mMediaTotalTime = trackTime;
                    if (!this.mIsTgNotSupport_getElemAtt && this.mIsTgNotSupport_regTrackChanged) {
                        inQueue(this.mRequestQueue, 6, null);
                    }
                }
                this.m_playback_data_intent.putExtra(BluetoothAvrcpCtPlayerManage.MEDIA_LENGTH, this.mMediaTotalTime);
                this.m_playback_data_intent.putExtra(BluetoothAvrcpCtPlayerManage.MEDIA_POSITION, this.mMediaPlayingTime);
                this.m_playback_data_intent.putExtra(BluetoothAvrcpCtPlayerManage.PLAYBACK_STATUS, this.mPlaybackStatus);
                if (this.mContext != null) {
                    this.mContext.sendBroadcast(this.m_playback_data_intent);
                }
            } else {
                return;
            }
        }
        byte error_code = intent.getByteExtra(BluetoothAvrcpCtService.ERROR_CODE, (byte) 6);
        if (DEBUG) {
            Log.e(TAG, "Avrcp getPlayerStatus,result:" + result + ",error_code:" + error_code);
        }
        if (result != BluetoothAvrcpCtService.BT_AVRCP_RESULT_INTERNAL_ERROR) {
            this.mIsTgNotSupport_getPlayState = true;
        } else if (this.mgetPlayerStatusCount >= 1 || this.mIsTgNotSupport_getPlayState || this.mIsTgNotSupport_regTrackChanged) {
            this.mIsTgNotSupport_getPlayState = true;
            this.mgetPlayerStatusCount = 0;
        } else {
            inQueue(this.mRequestQueue, 7, null);
            this.mgetPlayerStatusCount++;
        }
        if (this.mRequestQueue.peek() != null && sendRequest((bt_music_avrcp_request) this.mRequestQueue.poll())) {
        }
    }

    public void handleRegNotificationStatusChangedCnf(Intent intent) {
        if (DEBUG) {
            Log.d(TAG, "ACTION_REG_NOTIFICATION_STATUS_CHANGED");
        }
        if (intent.getCharExtra(BluetoothAvrcpCtService.RESULT, BluetoothAvrcpCtService.BT_AVRCP_RESULT_SUCCESS) == BluetoothAvrcpCtService.BT_AVRCP_RESULT_SUCCESS) {
            byte play_status = intent.getByteExtra(BluetoothAvrcpCtService.PLAY_STATUS, (byte) -1);
            byte is_interim = intent.getByteExtra(BluetoothAvrcpCtService.IS_INTERIM, (byte) 1);
            if (DEBUG) {
                Log.d(TAG, "Avrcp playback status: " + play_status + ", is_interim: " + is_interim);
            }
            if (is_interim == (byte) 0) {
                this.mPlaybackStatus = play_status;
                if (play_status == (byte) 1 && !this.mIsTgNotSupport_getElemAtt) {
                    inQueue(this.mRequestQueue, 6, null);
                }
                if (play_status == (byte) 1 && !this.mIsTgNotSupport_getPlayState) {
                    inQueue(this.mRequestQueue, 7, null);
                }
                inQueue(this.mRequestQueue, 8, null);
                this.m_playback_data_intent.putExtra(BluetoothAvrcpCtPlayerManage.PLAYBACK_STATUS, this.mPlaybackStatus);
                if (this.mContext != null) {
                    this.mContext.sendBroadcast(this.m_playback_data_intent);
                }
            } else if (is_interim == (byte) 1) {
                this.mregPlaybackStatusChangedCount = 0;
            }
        } else {
            byte error_code = intent.getByteExtra(BluetoothAvrcpCtService.ERROR_CODE, (byte) 6);
            if (DEBUG) {
                Log.e(TAG, "Avrcp playback status changed, error_code " + error_code);
            }
        }
        if (this.mRequestQueue.peek() != null && !sendRequest((bt_music_avrcp_request) this.mRequestQueue.poll())) {
        }
    }

    public void handleRegNotificationTrackChangedCnf(Intent intent) {
        if (DEBUG) {
            Log.d(TAG, "ACTION_REG_NOTIFICATION_TRACK_CHANGED");
        }
        if (intent.getCharExtra(BluetoothAvrcpCtService.RESULT, BluetoothAvrcpCtService.BT_AVRCP_RESULT_SUCCESS) == BluetoothAvrcpCtService.BT_AVRCP_RESULT_SUCCESS) {
            long identifier = intent.getLongExtra(BluetoothAvrcpCtService.IDENTIFIER, 0);
            byte is_interim = intent.getByteExtra(BluetoothAvrcpCtService.IS_INTERIM, (byte) 1);
            if (DEBUG) {
                Log.d(TAG, "Avrcp playing track changed, identifier " + identifier + ", is_interim " + is_interim);
            }
            if (is_interim == (byte) 0) {
                if (!(this.mIsTgNotSupport_getElemAtt || this.mIsTgNotSupport_regTrackChanged)) {
                    inQueue(this.mRequestQueue, 6, null);
                }
                if (!(this.mIsTgNotSupport_getPlayState || this.mIsTgNotSupport_regTrackChanged)) {
                    inQueue(this.mRequestQueue, 7, null);
                }
                inQueue(this.mRequestQueue, 9, null);
            } else if (is_interim == (byte) 1) {
                this.mregTrackChangedCount = 0;
            }
        } else {
            byte error_code = intent.getByteExtra(BluetoothAvrcpCtService.ERROR_CODE, (byte) 6);
            if (DEBUG) {
                Log.e(TAG, "Avrcp track changed, error_code " + error_code);
            }
        }
        if (this.mRequestQueue.peek() != null && !sendRequest((bt_music_avrcp_request) this.mRequestQueue.poll())) {
        }
    }

    public void handleRegNotificationPosChangedCnf(Intent intent) {
        if (DEBUG) {
            Log.d(TAG, "ACTION_REG_NOTIFICATION_POS_CHANGED");
        }
        if (intent.getCharExtra(BluetoothAvrcpCtService.RESULT, BluetoothAvrcpCtService.BT_AVRCP_RESULT_SUCCESS) == BluetoothAvrcpCtService.BT_AVRCP_RESULT_SUCCESS) {
            this.mMediaPlayingTime = intent.getIntExtra(BluetoothAvrcpCtService.SONG_POSITION, -1);
            byte is_interim = intent.getByteExtra(BluetoothAvrcpCtService.IS_INTERIM, (byte) 1);
            if (DEBUG) {
                Log.d(TAG, "Avrcp playing position changed, is_interim " + is_interim);
            }
            if (this.mIsTgNotSupport_getPlayState || !this.mIsTgNotSupport_regTrackChanged) {
                if (is_interim != (byte) 0) {
                    if (!(this.mIsTgNotSupport_getPlayState || this.mIsTgNotSupport_regTrackChanged || this.mIsTgNotSupport_regPosChanged || this.mPlayerManager.getPosChangedEventStatus() == 1)) {
                        inQueue(this.mRequestQueue, 10, null);
                    }
                    this.m_playback_data_intent.putExtra(BluetoothAvrcpCtPlayerManage.MEDIA_POSITION, this.mMediaPlayingTime);
                    if (this.mContext != null) {
                        this.mContext.sendBroadcast(this.m_playback_data_intent);
                    }
                    if (!this.mIsTgNotSupport_getPlayState && (this.mMediaTotalTime == 0 || this.mPlaybackStatus != (byte) 1)) {
                        inQueue(this.mRequestQueue, 7, null);
                    }
                } else {
                    this.mregPosChangedCount = 0;
                }
            } else if (is_interim != (byte) 0) {
                this.mregPosChangedCount = 0;
            } else {
                inQueue(this.mRequestQueue, 10, null);
                this.m_playback_data_intent.putExtra(BluetoothAvrcpCtPlayerManage.MEDIA_POSITION, this.mMediaPlayingTime);
                if (this.mContext != null) {
                    this.mContext.sendBroadcast(this.m_playback_data_intent);
                }
                inQueue(this.mRequestQueue, 7, null);
            }
        } else {
            byte error_code = intent.getByteExtra(BluetoothAvrcpCtService.ERROR_CODE, (byte) 6);
            if (DEBUG) {
                Log.e(TAG, "Avrcp playing position changed, error_code " + error_code);
            }
        }
        if (this.mRequestQueue.peek() != null && !sendRequest((bt_music_avrcp_request) this.mRequestQueue.poll())) {
        }
    }

    public void handleRegNotificationErrorEventCnf(Intent intent) {
        char result = intent.getCharExtra(BluetoothAvrcpCtService.RESULT, BluetoothAvrcpCtService.BT_AVRCP_RESULT_ERROR);
        byte error_code = intent.getByteExtra(BluetoothAvrcpCtService.ERROR_CODE, (byte) 6);
        byte event_id = intent.getByteExtra(BluetoothAvrcpCtService.EVENT_ID, (byte) 0);
        if (DEBUG) {
            Log.e(TAG, "ACTION_REG_NOTIFICATION_ERROR, result:0x" + result + ", error_code:" + error_code + ", event_id:" + event_id);
        }
        if (result != BluetoothAvrcpCtService.BT_AVRCP_RESULT_INTERNAL_ERROR) {
            if (DEBUG) {
                Log.e(TAG, "ACTION_REG_NOTIFICATION_ERROR, mLatestCmdIndex:" + this.mLatestCmdIndex);
            }
            switch (this.mLatestCmdIndex) {
                case 8:
                    if (DEBUG) {
                        Log.e(TAG, "ACTION_REG_NOTIFICATION_ERROR, mIsTgNotSupport_regPlaybackState = true");
                    }
                    this.mIsTgNotSupport_regPlaybackState = true;
                    break;
                case 9:
                    if (DEBUG) {
                        Log.e(TAG, "ACTION_REG_NOTIFICATION_ERROR, mIsTgNotSupport_regTrackChanged = true");
                    }
                    this.mIsTgNotSupport_regTrackChanged = true;
                    break;
                case 10:
                    if (DEBUG) {
                        Log.e(TAG, "ACTION_REG_NOTIFICATION_ERROR, mIsTgNotSupport_regPosChanged = true");
                    }
                    this.mIsTgNotSupport_regPosChanged = true;
                    if ((byte) 1 == this.mPlaybackStatus && this.mIsTgNotSupport_regPosChanged) {
                        startBTMusicTimer(0);
                        break;
                    }
                default:
                    break;
            }
        }
        if (DEBUG) {
            Log.e(TAG, "ACTION_REG_NOTIFICATION_ERROR, BT_AVRCP_RESULT_INTERNAL_ERROR, event_id:" + event_id);
        }
        switch (event_id) {
            case (byte) 1:
                if (this.mregPlaybackStatusChangedCount < 1 && ((!this.mIsTgNotSupport_getElemAtt || !this.mIsTgNotSupport_getPlayState) && !this.mIsTgNotSupport_regPlaybackState && this.mPlayerManager.getTrackChangedEventStatus() != 1)) {
                    inQueue(this.mRequestQueue, 8, null);
                    this.mregPlaybackStatusChangedCount = 1;
                    break;
                }
                if (DEBUG) {
                    Log.e(TAG, "ACTION_REG_NOTIFICATION_ERROR, Playback Changed Event, 2nd !!!");
                }
                this.mregPlaybackStatusChangedCount = 0;
                this.mIsTgNotSupport_regPlaybackState = true;
                break;
                break;
            case (byte) 2:
                if (this.mregTrackChangedCount < 1 && ((!this.mIsTgNotSupport_getElemAtt || !this.mIsTgNotSupport_getPlayState) && !this.mIsTgNotSupport_regTrackChanged && this.mPlayerManager.getTrackChangedEventStatus() != 1)) {
                    inQueue(this.mRequestQueue, 9, null);
                    this.mregTrackChangedCount = 1;
                    break;
                }
                if (DEBUG) {
                    Log.e(TAG, "ACTION_REG_NOTIFICATION_ERROR, Track Changed Event, 2nd !!!");
                }
                this.mregTrackChangedCount = 0;
                this.mIsTgNotSupport_regTrackChanged = true;
                break;
                break;
            case (byte) 5:
                if (this.mregPosChangedCount < 1 && !this.mIsTgNotSupport_getPlayState && !this.mIsTgNotSupport_regTrackChanged && !this.mIsTgNotSupport_regPosChanged && this.mPlayerManager.getPosChangedEventStatus() != 1) {
                    inQueue(this.mRequestQueue, 10, null);
                    this.mregPosChangedCount = 1;
                    break;
                }
                if (DEBUG) {
                    Log.e(TAG, "ACTION_REG_NOTIFICATION_ERROR, Pos Changed Event, 2nd !!!");
                }
                this.mIsTgNotSupport_regPosChanged = true;
                this.mregPosChangedCount = 0;
                break;
                break;
        }
        if (this.mRequestQueue.peek() != null && !sendRequest((bt_music_avrcp_request) this.mRequestQueue.poll())) {
        }
    }

    public void handlePassthroughCmdCnf(Intent intent) {
        if (DEBUG) {
            Log.d(TAG, "ACTION_PASSTHROUGH_COMMAND_CNF");
        }
        this.mIsRequestBusy = false;
        this.mpassthroughCmdCnfCount++;
        if (this.mpassthroughCmdCnfCount == 2) {
            this.mpassthroughCmdCnfCount = 0;
        }
        int keyValue = intent.getIntExtra(BluetoothAvrcpCtService.KEY_VALUE, HDMI.RCP_KEY_INVAILD);
        if (intent.getByteExtra(BluetoothAvrcpCtService.IS_PRESS, (byte) 1) == (byte) 0) {
            switch (keyValue) {
                case 69:
                    this.mPlaybackStatus = EVENT_TRACK_REACHED_START;
                    break;
                case 70:
                    this.mPlaybackStatus = EVENT_TRACK_REACHED_END;
                    break;
            }
        }
        if (this.mRequestQueue.peek() != null && !sendRequest((bt_music_avrcp_request) this.mRequestQueue.poll())) {
        }
    }

    public int getRemoteNotifyEvent() {
        return this.mRemoteNotifyEvent;
    }

    public void sendCommand(int cmd) {
        String btAddr = null;
        if (this.mPlayerManager != null) {
            btAddr = this.mPlayerManager.getA2dpAddr();
        }
        inQueue(this.mRequestQueue, cmd, btAddr);
        if (this.mRequestQueue.peek() != null && !sendRequest((bt_music_avrcp_request) this.mRequestQueue.poll())) {
        }
    }

    public void onMusicPlayerStateChanged(boolean isForeground) {
        mIsForeground = isForeground;
        if (isForeground) {
            if (this.mRemoteNotifyEvent > 0) {
                sendCommand(6);
                if (15 == this.mPlayerManager.getA2dpSinkStateValue()) {
                    startBTMusicTimer(0);
                }
            }
        } else if (this.mRemoteNotifyEvent > 0 && 15 == this.mPlayerManager.getA2dpSinkStateValue()) {
            stopBTMusicTimer();
        }
    }

    public byte getPlaybackStatus() {
        return this.mPlaybackStatus;
    }

    private boolean getPlayerCapability(byte capability_id) {
        if (DEBUG) {
            Log.d(TAG, "getPlayerCapability");
        }
        return this.mPlayerManager.getCapabilities(capability_id);
    }

    private boolean getElementAttributes(long identifier) {
        if (DEBUG) {
            Log.d(TAG, "getElementAttributes");
        }
        return this.mPlayerManager.getElementAttributes(identifier, EVENT_TRACK_REACHED_END, new int[]{1, 2, 3});
    }

    private boolean getPlayerStatus() {
        if (DEBUG) {
            Log.d(TAG, "getPlayerStatus");
        }
        return this.mPlayerManager.getPlayerStatus();
    }

    private boolean registerNotification(byte event_id, int playback_interval) {
        return this.mPlayerManager.registerNotificationReq(event_id, playback_interval);
    }

    private boolean inQueue(PriorityQueue<bt_music_avrcp_request> Q, int cmd_index, String BT_Addr) {
        if (DEBUG) {
            Log.i(TAG, "inQueue" + cmd_index);
        }
        if (Q == null) {
            return false;
        }
        int i;
        bt_music_avrcp_request q;
        switch (cmd_index) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                i = this.mPassthroughNum;
                this.mPassthroughNum = i + 1;
                q = new bt_music_avrcp_request(cmd_index, BT_Addr, 5, i);
                if (q != null) {
                    return Q.offer(q);
                }
                return false;
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
                i = this.mGetMediaInfoNum;
                this.mGetMediaInfoNum = i + 1;
                q = new bt_music_avrcp_request(cmd_index, BT_Addr, 6, i);
                if (q != null) {
                    return Q.offer(q);
                }
                return false;
            case 11:
                i = this.mGetMediaInfoNum;
                this.mGetMediaInfoNum = i + 1;
                q = new bt_music_avrcp_request(cmd_index, BT_Addr, 9, i);
                if (q != null) {
                    return Q.offer(q);
                }
                return false;
            default:
                if (DEBUG) {
                    Log.i(TAG, "inQueue unknown cmd_index");
                }
                return false;
        }
    }

    private boolean sendRequest(bt_music_avrcp_request q) {
        if (DEBUG) {
            Log.d(TAG, "sendRequest, cmd_index:" + q.mcmd_index);
        }
        this.mLatestCmdIndex = q.mcmd_index;
        boolean ret;
        switch (q.mcmd_index) {
            case 1:
                if (BluetoothAdapter.getDefaultAdapter() != null && BluetoothAdapter.getDefaultAdapter().isDiscovering()) {
                    BluetoothAdapter.getDefaultAdapter().cancelDiscovery();
                }
                if (this.mIsRequestBusy) {
                    return false;
                }
                ret = this.mPlayerManager.play(q.mBT_Addr);
                if (ret) {
                    if (DEBUG) {
                        Log.d(TAG, "sendRequest(): play success");
                    }
                    this.mIsRequestBusy = true;
                    return ret;
                } else if (!DEBUG) {
                    return ret;
                } else {
                    Log.d(TAG, "sendRequest(): play fail");
                    return ret;
                }
            case 2:
                if (BluetoothAdapter.getDefaultAdapter() != null && BluetoothAdapter.getDefaultAdapter().isDiscovering()) {
                    BluetoothAdapter.getDefaultAdapter().cancelDiscovery();
                }
                if (this.mIsRequestBusy) {
                    return false;
                }
                ret = this.mPlayerManager.pause(q.mBT_Addr);
                if (ret) {
                    if (DEBUG) {
                        Log.d(TAG, "sendRequest(): pause success");
                    }
                    this.mIsRequestBusy = true;
                    return ret;
                } else if (!DEBUG) {
                    return ret;
                } else {
                    Log.d(TAG, "sendRequest(): pause fail");
                    return ret;
                }
            case 3:
                if (BluetoothAdapter.getDefaultAdapter() != null && BluetoothAdapter.getDefaultAdapter().isDiscovering()) {
                    BluetoothAdapter.getDefaultAdapter().cancelDiscovery();
                }
                if (this.mIsRequestBusy) {
                    return false;
                }
                ret = this.mPlayerManager.backward(q.mBT_Addr);
                if (ret) {
                    if (DEBUG) {
                        Log.d(TAG, "sendRequest(): backward success");
                    }
                    this.mIsRequestBusy = true;
                    return ret;
                } else if (!DEBUG) {
                    return ret;
                } else {
                    Log.d(TAG, "sendRequest(): backward fail");
                    return ret;
                }
            case 4:
                if (BluetoothAdapter.getDefaultAdapter() != null && BluetoothAdapter.getDefaultAdapter().isDiscovering()) {
                    BluetoothAdapter.getDefaultAdapter().cancelDiscovery();
                }
                if (this.mIsRequestBusy) {
                    return false;
                }
                ret = this.mPlayerManager.forward(q.mBT_Addr);
                if (ret) {
                    if (DEBUG) {
                        Log.d(TAG, "sendRequest(): forward success");
                    }
                    this.mIsRequestBusy = true;
                    return ret;
                } else if (!DEBUG) {
                    return ret;
                } else {
                    Log.d(TAG, "sendRequest(): forward fail");
                    return ret;
                }
            case 5:
                if (BluetoothAdapter.getDefaultAdapter() != null && BluetoothAdapter.getDefaultAdapter().isDiscovering()) {
                    BluetoothAdapter.getDefaultAdapter().cancelDiscovery();
                }
                if (this.mIsRequestBusy) {
                    return false;
                }
                ret = this.mPlayerManager.stop(q.mBT_Addr);
                if (ret) {
                    if (DEBUG) {
                        Log.d(TAG, "sendRequest(): stop success");
                    }
                    this.mIsRequestBusy = true;
                    return ret;
                } else if (!DEBUG) {
                    return ret;
                } else {
                    Log.d(TAG, "sendRequest(): stop fail");
                    return ret;
                }
            case 6:
                return getElementAttributes(0);
            case 7:
                return getPlayerStatus();
            case 8:
                return registerNotification((byte) 1, 0);
            case 9:
                return registerNotification((byte) 2, 0);
            case 10:
                return registerNotification(EVENT_PLAYBACK_POS_CHANGED, 1);
            case 11:
                return getPlayerCapability(EVENT_TRACK_REACHED_END);
            default:
                if (DEBUG) {
                    Log.e(TAG, "sendRequest, unknown cmd_index");
                }
                return false;
        }
    }

    private void startBTMusicTimer(int timer_type) {
        if (this.mTimer == null) {
            this.mTimer = new Timer();
            if (timer_type == 0) {
                this.mTask = new C00202();
                this.mTimer.schedule(this.mTask, 300, 1000);
            }
        } else if (DEBUG) {
            Log.w(TAG, "startBTMusicTimer: already start!");
        }
    }

    private void stopBTMusicTimer() {
        if (this.mTask != null) {
            this.mTask.cancel();
            this.mTask = null;
        }
        if (this.mTimer != null) {
            this.mTimer.cancel();
            this.mTimer.purge();
            this.mTimer = null;
        }
    }

    private void updatePlaybackStatus(byte playState) {
        if (DEBUG) {
            Log.d(TAG, "updatePlaybackStatus,music=" + playState);
        }
        if (playState == (byte) 1) {
            if (!this.mIsTgNotSupport_getPlayState && this.mIsTgNotSupport_regPosChanged) {
                startBTMusicTimer(0);
            }
        } else if (!this.mIsTgNotSupport_getPlayState && this.mIsTgNotSupport_regPosChanged) {
            stopBTMusicTimer();
        }
    }
}
