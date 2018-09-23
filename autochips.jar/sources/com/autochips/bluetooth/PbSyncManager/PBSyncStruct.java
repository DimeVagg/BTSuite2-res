package com.autochips.bluetooth.PbSyncManager;

import android.content.SharedPreferences.Editor;

public class PBSyncStruct {
    public static final int BT_PBAP_REAL_PATH_PS_INCOMING_HIS = 4;
    public static final int BT_PBAP_REAL_PATH_PS_MISSED_HIS = 6;
    public static final int BT_PBAP_REAL_PATH_PS_OUTGOING_HIS = 2;
    public static final int BT_PBAP_REAL_PATH_PS_PB = 0;
    public static final int BT_PBAP_REAL_PATH_SIM_INCOMING_HIS = 5;
    public static final int BT_PBAP_REAL_PATH_SIM_MISSED_HIS = 7;
    public static final int BT_PBAP_REAL_PATH_SIM_OUTGOING_HIS = 3;
    public static final int BT_PBAP_REAL_PATH_SIM_PB = 1;
    public static final int BT_PBAP_SYNC_PATH_ALL_CALLHISTORY = 6;
    public static final int BT_PBAP_SYNC_PATH_ALL_PHONEBOOK = 2;
    public static final int BT_PBAP_SYNC_PATH_ALL_PHONEBOOK_CALLHISTORY = 7;
    public static final int BT_PBAP_SYNC_PATH_DIALED_CALLHISTORY = 4;
    public static final int BT_PBAP_SYNC_PATH_MISSED_CALLHISTORY = 5;
    public static final int BT_PBAP_SYNC_PATH_PHONESELF_PHONEBOOK = 0;
    public static final int BT_PBAP_SYNC_PATH_RECEIVE_CALLHISTORY = 3;
    public static final int BT_PBAP_SYNC_PATH_SIM_PHONEBOOK = 1;
    public static final int DEFAULT_CALLHISTORY_SIZE = 50;
    public static final int DEFAULT_PHONEBOOK_SIZE = 200;
    public static final int MAX_OF_PBMGR_CONNECT_CNT = 4;
    public static final int NUM_OF_BT_PBAP_SYNC_PATH = 8;
    public static final int NUM_OF_BT_REAL_PATH = 8;
    public static final int NUM_OF_PBMGR_PATH = 14;
    public static final int PBMGR_CMD_DOWNLOAD = 1;
    public static final int PBMGR_CMD_SETDEVICE = 0;
    public static final int PBMGR_COMBINED_CALLED_HISTORY = 4096;
    public static final int PBMGR_DEFAULT_DOWNLOADING_STEP = 5;
    public static final int PBMGR_DEFAULT_INDICATION_STEP = 10;
    public static final int PBMGR_DEFAULT_REDOWNLOADING_STEP = 5;
    public static final int PBMGR_DUN_CONNECT = 5;
    public static final int PBMGR_DWNLD_RST_FAIL = 1;
    public static final int PBMGR_DWNLD_RST_FILLERR = 4;
    public static final int PBMGR_DWNLD_RST_NOTSUPPORT = 3;
    public static final int PBMGR_DWNLD_RST_SUCCESS = 0;
    public static final int PBMGR_DWNLD_RST_TERMINATE = 2;
    public static final int PBMGR_DWNLD_RST_UNKNOWN = 5;
    public static final int PBMGR_HFP_CONNECT = 2;
    public static final int PBMGR_INCOMING_CALLS_HISTORY = 64;
    public static final int PBMGR_MISSED_CALLS_HISTORY = 1024;
    public static final int PBMGR_OUTGOING_CALLS_HISTORY = 256;
    public static final int PBMGR_PBAP_CONNECT = 1;
    public static final int PBMGR_PB_ROOT = 2;
    public static final int PBMGR_PHONEBOOK = 16;
    public static final int PBMGR_ROOT = 1;
    public static final int PBMGR_SIM_COMBINED_CALLED_HISTORY = 8192;
    public static final int PBMGR_SIM_INCOMING_CALLS_HISTORY = 128;
    public static final int PBMGR_SIM_MISSED_CALLS_HISTORY = 2048;
    public static final int PBMGR_SIM_OUTGONING_CALLS_HISTORY = 512;
    public static final int PBMGR_SIM_PHONEBOOK = 32;
    public static final int PBMGR_SIM_ROOT = 8;
    public static final int PBMGR_SIM_TREE = 4;
    public static final int PBMGR_SPP_CONNECT = 3;
    public static final int PBMGR_SYNC_STATE_IDLE = 0;
    public static final int PBMGR_SYNC_STATE_SYNCING = 1;
    public static final int PBMGR_UNKNOW = 0;
    public static final int PBMGR_UNKNOW_CONNECT = 0;
    public static final int PROFILE_CONNECTED = 1;
    public static final int PROFILE_NOT_CONNECT = 0;
    public static final int PROFILE_NOT_EXIST = 2;
    public static final int STATE_IDLE = 0;
    public static final int STATE_STOPING = 2;
    public static final int STATE_SYNC = 1;

    public static class PBMGRPhoneBookInfo_T {
        public boolean bGetRecNum;
        public int u4MaxIndex;
        public int u4Miss;
        public int u4RecordNum;
        public int u4StartIdx;
    }

    public static class SharedPreferencesCommitor implements Runnable {
        private Editor mSharedata;

        public SharedPreferencesCommitor(Editor sharedata) {
            this.mSharedata = sharedata;
        }

        public void run() {
            if (this.mSharedata != null) {
                this.mSharedata.commit();
            }
        }
    }
}
