package com.autochips.bluetooth;

public class SettingsBtStatus {
    public static final int CONNECTION_STATUS_ACTIVE = 0;
    public static final int CONNECTION_STATUS_CONNECTED = 1;
    public static final int CONNECTION_STATUS_CONNECTING = 3;
    public static final int CONNECTION_STATUS_DISCONNECTED = 2;
    public static final int CONNECTION_STATUS_DISCONNECTING = 4;
    public static final int CONNECTION_STATUS_UNKNOWN = 5;
    private static final String TAG = "SettingsBtStatus";

    public static final int getConnectionStatusSummary(int connectionStatus) {
        return 0;
    }

    public static final boolean isConnectionStatusConnected(int connectionStatus) {
        return connectionStatus == 0 || connectionStatus == 1;
    }

    public static final boolean isConnectionStatusBusy(int connectionStatus) {
        return connectionStatus == 3 || connectionStatus == 4;
    }

    public static final int getPairingStatusSummary(int bondState) {
        return 0;
    }
}
