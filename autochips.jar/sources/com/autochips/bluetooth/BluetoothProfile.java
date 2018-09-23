package com.autochips.bluetooth;

public class BluetoothProfile {
    public static final int BT_PROFILE_RANGE = 10000000;
    public static final int BT_PROFILE_START = 0;
    public static final int ID_A2DP = 0;
    public static final int ID_AVRCP = 1;
    public static final int ID_BIP = 2;
    public static final int ID_BPP = 3;
    public static final int ID_CHN = 4;
    public static final int ID_FTP = 5;
    public static final int ID_GAP = 6;
    public static final int ID_GOEP = 7;
    public static final int ID_HFG = 8;
    public static final int ID_HFP = 18;
    public static final int ID_HID = 9;
    public static final int ID_MAP = 10;
    public static final int ID_OPP = 11;
    public static final int ID_PAN = 15;
    public static final int ID_PBAP = 12;
    public static final int ID_PRXM = 16;
    public static final int ID_PRXR = 17;
    public static final int ID_SIMAP = 13;
    public static final int ID_SPP = 14;
    public static final int ID_TIMEC = 19;
    public static final int ID_TIMES = 20;
    public static final int[] PROFILE_START = new int[]{BT_PROFILE_RANGE, 20000000, 30000000, 40000000, 50000000, 60000000, 70000000, 80000000, 90000000, 100000000, 110000000, 120000000, 130000000, 140000000, 150000000, 160000000, 170000000, 180000000, 190000000, 200000000, 210000000};

    public static int getProfileStart(int profileId) {
        return PROFILE_START[profileId];
    }
}
