.class public Lcom/autochips/bluetooth/BluetoothReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothReceiver.java"


# static fields
.field private static final A2DPSINK_SERVICE_CLASS:Ljava/lang/String; = "com.autochips.bluetooth.a2dpsink.BluetoothA2dpSinkService"

.field private static final AVRCPCT_SERVICE_CLASS:Ljava/lang/String; = "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService"

.field private static final CHECKCONSTATUSBR:Ljava/lang/String; = "xy.com.autochips.bluetooth.bt.statuscheck"

.field private static DEBUG:Z = false

.field private static final DUNDT_SERVICE_CLASS:Ljava/lang/String; = "com.autochips.bluetooth.dundt.BluetoothDunDtService"

.field private static final GALAXYBT_CON:Ljava/lang/String; = "com.android.galaxy.bt.connected"

.field private static final GALAXYBT_DISC:Ljava/lang/String; = "com.android.galaxy.bt.disconnected"

.field private static final HF_SERVICE_CLASS:Ljava/lang/String; = "com.autochips.bluetooth.hf.BluetoothHfService"

.field private static final HID_SERVICE_CLASS:Ljava/lang/String; = "com.autochips.bluetooth.hid.BluetoothHidService"

.field private static final MAX_FORCECON_TIMES:I = 0x1

.field public static final MSG_PROFILE_STATE_UPDATE:I = 0x2710

.field private static final PBAPCLIENT_SERVICE_CLASS:Ljava/lang/String; = "com.autochips.bluetooth.pbapclient.BluetoothPbapClientService"

.field private static final PBSYNC_SERVICE_CLASS:Ljava/lang/String; = "com.autochips.bluetooth.PbSyncManager.PBSyncManagerService"

.field private static final SMSSYNC_SERVICE_CLASS:Ljava/lang/String; = "com.autochips.bluetooth.dundt.SmsSyncManagerService"

.field private static final TAG:Ljava/lang/String; = "BluetoothReceiver"

.field private static final TIMER_AUTO_CONNECT:I = 0x0

.field private static final TIMER_REG_RESUME:I = 0x1

.field private static final TIMER_TURNING_OFF:I = 0x2

.field public static volatile bTDBAdapter:Lcom/autochips/bluetooth/util/BTDBAdapter;

.field public static volatile mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

.field public static mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

.field private static mHandler:Landroid/os/Handler;

.field public static mHfConnectedDeviceAddr:Ljava/lang/String;

.field private static volatile mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

.field public static volatile mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

.field public static volatile mSmsSyncProxy:Lcom/autochips/bluetooth/dundt/SMSSyncManager;

.field public static volatile m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

.field public static volatile m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

.field public static mbHfConnected:Z

.field public static mbInRds:Z

.field public static mbPoweron:Z


# instance fields
.field private BtPairedHistorycheckHandler:Landroid/os/Handler;

.field private BtPairedHistorycheckrunnable:Ljava/lang/Runnable;

.field private bootcontext:Landroid/content/Context;

.field private checkCallState:Landroid/content/Context;

.field private checkCallStateHandler:Landroid/os/Handler;

.field private checkCallStaterunnable:Ljava/lang/Runnable;

.field private checkcontext:Landroid/content/Context;

.field private forceconnect_times:I

.field private incomingcall:Z

.field private mCheckTask:Ljava/util/TimerTask;

.field private mCheckTimer:Ljava/util/Timer;

.field private mTask:Ljava/util/TimerTask;

.field private mTaskList:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/TimerTask;",
            ">;"
        }
    .end annotation
.end field

.field private mTimeoff:I

.field private mTimer:Ljava/util/Timer;

.field private mToast:Landroid/widget/Toast;

.field private toast_btv:Landroid/widget/Toast;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 104
    sget-boolean v0, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugAll:Z

    sget-boolean v1, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugSettings:Z

    and-int/2addr v0, v1

    sput-boolean v0, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    .line 126
    sput-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    .line 127
    sput-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    .line 128
    sput-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    .line 129
    sput-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    .line 130
    sput-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mSmsSyncProxy:Lcom/autochips/bluetooth/dundt/SMSSyncManager;

    .line 133
    const-string v0, ""

    sput-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mHfConnectedDeviceAddr:Ljava/lang/String;

    .line 134
    sput-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    .line 135
    sput-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    .line 136
    sput-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 137
    sput-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbInRds:Z

    .line 138
    sput-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    .line 151
    sput-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 101
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 144
    iput v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTimeoff:I

    .line 145
    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTimer:Ljava/util/Timer;

    .line 146
    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTask:Ljava/util/TimerTask;

    .line 147
    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mCheckTimer:Ljava/util/Timer;

    .line 148
    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mCheckTask:Ljava/util/TimerTask;

    .line 149
    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTaskList:Ljava/util/HashMap;

    .line 154
    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->toast_btv:Landroid/widget/Toast;

    .line 155
    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->checkcontext:Landroid/content/Context;

    .line 156
    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->bootcontext:Landroid/content/Context;

    .line 157
    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->checkCallState:Landroid/content/Context;

    .line 158
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->incomingcall:Z

    .line 159
    iput v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->forceconnect_times:I

    .line 528
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->checkCallStateHandler:Landroid/os/Handler;

    .line 529
    new-instance v0, Lcom/autochips/bluetooth/BluetoothReceiver$2;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BluetoothReceiver$2;-><init>(Lcom/autochips/bluetooth/BluetoothReceiver;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->checkCallStaterunnable:Ljava/lang/Runnable;

    .line 586
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->BtPairedHistorycheckHandler:Landroid/os/Handler;

    .line 587
    new-instance v0, Lcom/autochips/bluetooth/BluetoothReceiver$3;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BluetoothReceiver$3;-><init>(Lcom/autochips/bluetooth/BluetoothReceiver;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->BtPairedHistorycheckrunnable:Ljava/lang/Runnable;

    return-void
.end method

.method private BluetoothHfCallout(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 3
    .param p1, "PhoneNumber"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 369
    sget-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    if-nez v1, :cond_1

    .line 370
    invoke-direct {p0, p2}, Lcom/autochips/bluetooth/BluetoothReceiver;->showConnectTipDialog(Landroid/content/Context;)V

    .line 390
    :cond_0
    :goto_0
    return v0

    .line 373
    :cond_1
    sget-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-nez v1, :cond_2

    .line 374
    invoke-direct {p0, p2}, Lcom/autochips/bluetooth/BluetoothReceiver;->showConnectTipDialog(Landroid/content/Context;)V

    goto :goto_0

    .line 377
    :cond_2
    if-eqz p1, :cond_0

    .line 379
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 380
    const v1, 0x7f07004a

    invoke-direct {p0, p2, v1}, Lcom/autochips/bluetooth/BluetoothReceiver;->showToast(Landroid/content/Context;I)V

    .line 381
    sget-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BluetoothReceiver"

    const-string v2, "BluetoothHfCallout return PhoneNumber is empty"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 384
    :cond_3
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-nez v1, :cond_4

    .line 385
    sget-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BluetoothReceiver"

    const-string v2, "BluetoothHfCallout return m_hfadpter is null"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 388
    :cond_4
    sget-boolean v0, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v0, :cond_5

    const-string v0, "BluetoothReceiver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BluetoothHfCallout"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    :cond_5
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v0, p1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_DialNumber(Ljava/lang/String;)V

    .line 390
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private SelectCallPhone(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 283
    const-string v1, "selectPhoneNumber"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 284
    .local v0, "strPhone":Ljava/lang/String;
    const-string v1, "BluetoothReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SelectCallPhone ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 285
    invoke-direct {p0, v0, p2}, Lcom/autochips/bluetooth/BluetoothReceiver;->BluetoothHfCallout(Ljava/lang/String;Landroid/content/Context;)Z

    .line 286
    return-void
.end method

.method static synthetic access$000()Lcom/autochips/bluetooth/LocalBluetoothManager;
    .locals 1

    .prologue
    .line 101
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    return-object v0
.end method

.method static synthetic access$100(Lcom/autochips/bluetooth/BluetoothReceiver;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BluetoothReceiver;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->checkAutoConnectSetting(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$200(Lcom/autochips/bluetooth/BluetoothReceiver;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BluetoothReceiver;

    .prologue
    .line 101
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->checkCallState:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/autochips/bluetooth/BluetoothReceiver;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BluetoothReceiver;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->doCheckCall(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$400(Lcom/autochips/bluetooth/BluetoothReceiver;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BluetoothReceiver;

    .prologue
    .line 101
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->checkcontext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$500(Lcom/autochips/bluetooth/BluetoothReceiver;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BluetoothReceiver;

    .prologue
    .line 101
    iget v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTimeoff:I

    return v0
.end method

.method static synthetic access$512(Lcom/autochips/bluetooth/BluetoothReceiver;I)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BluetoothReceiver;
    .param p1, "x1"    # I

    .prologue
    .line 101
    iget v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTimeoff:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTimeoff:I

    return v0
.end method

.method static synthetic access$600(Lcom/autochips/bluetooth/BluetoothReceiver;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BluetoothReceiver;
    .param p1, "x1"    # I

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->stopTimer(I)V

    return-void
.end method

.method private checkAutoConnectSetting(Landroid/content/Context;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 906
    const-string v8, "preConnectedDevice_data"

    invoke-virtual {p1, v8, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 907
    .local v6, "sharedataAdd":Landroid/content/SharedPreferences;
    const-string v8, "BTADDR"

    const-string v9, ""

    invoke-interface {v6, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 908
    .local v2, "LastConnectedDeviceAddr":Ljava/lang/String;
    const-string v8, "bt.setting.autoconnect"

    invoke-virtual {p1, v8, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 909
    .local v7, "sharedataAuto":Landroid/content/SharedPreferences;
    const-string v8, "IS_BT_AUTO_CONNECT"

    invoke-interface {v7, v8, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 912
    .local v0, "IsAutoConnect":Z
    const-string v8, "bt_disconnect_state"

    invoke-virtual {p1, v8, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 913
    .local v4, "disconnectshare":Landroid/content/SharedPreferences;
    const-string v8, "BT_STATE"

    invoke-interface {v4, v8, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 915
    .local v1, "IsdisConnect":I
    const-string v8, "BluetoothReceiver"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "checkAutoConnectSetting..IsdisConnect = ."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 917
    sget-boolean v8, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v8, :cond_0

    const-string v8, "BluetoothReceiver"

    const-string v9, "checkAutoConnectSetting..."

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 918
    :cond_0
    iget v8, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->forceconnect_times:I

    if-ge v8, v11, :cond_1

    .line 919
    iget v8, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->forceconnect_times:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->forceconnect_times:I

    .line 920
    const/4 v0, 0x1

    .line 922
    :cond_1
    if-ne v0, v11, :cond_5

    if-eqz v2, :cond_5

    const-string v8, ""

    invoke-virtual {v2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_5

    if-nez v1, :cond_5

    .line 925
    const/4 v5, 0x0

    .line 927
    .local v5, "lastConnectDevice":Landroid/bluetooth/BluetoothDevice;
    sget-boolean v8, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v8, :cond_2

    const-string v8, "BluetoothReceiver"

    const-string v9, "Will auto connect preconnected device!"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 928
    :cond_2
    sget-object v8, Lcom/autochips/bluetooth/BluetoothReceiver;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    if-eqz v8, :cond_3

    .line 929
    sget-object v8, Lcom/autochips/bluetooth/BluetoothReceiver;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v8}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v8

    invoke-virtual {v8, v2}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v5

    .line 930
    :cond_3
    if-eqz v5, :cond_5

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v8

    const/16 v9, 0xc

    if-ne v8, v9, :cond_5

    .line 932
    invoke-static {p1, v5}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v3

    .line 934
    .local v3, "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v3}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->isConnected()Z

    move-result v8

    if-nez v8, :cond_5

    .line 935
    sget-boolean v8, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v8, :cond_4

    const-string v8, "BluetoothReceiver"

    const-string v9, "Auto connecting last connecated device"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 936
    :cond_4
    invoke-virtual {v3}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->connect()V

    .line 940
    .end local v3    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    .end local v5    # "lastConnectDevice":Landroid/bluetooth/BluetoothDevice;
    :cond_5
    return-void
.end method

.method private checkBluetoothUp()V
    .locals 1

    .prologue
    .line 882
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v0, :cond_0

    .line 888
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->startTimer(I)V

    .line 903
    :cond_0
    return-void
.end method

.method private doCheckCall(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 502
    if-eqz p1, :cond_0

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-nez v2, :cond_1

    .line 504
    :cond_0
    const-string v2, "BluetoothReceiver"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "context="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",m_HandsfreeAdpter="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 527
    :goto_0
    return-void

    .line 507
    :cond_1
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 508
    .local v1, "intentPhoneCall":Landroid/content/Intent;
    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-eqz v2, :cond_3

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallingNumber()Ljava/lang/String;

    move-result-object v2

    const-string v3, "4008015015"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallingNumber()Ljava/lang/String;

    move-result-object v2

    const-string v3, "075787801111"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 510
    :cond_2
    const-class v2, Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-virtual {v1, p1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 513
    :goto_1
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 514
    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-eqz v2, :cond_4

    .line 515
    const-string v2, "PhoneNumber"

    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallingNumber()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 519
    :goto_2
    const-string v2, "PhoneName"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 520
    const-string v3, "isIncomingCall"

    iget-boolean v2, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->incomingcall:Z

    if-eqz v2, :cond_5

    const-string v2, "true"

    :goto_3
    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 521
    const-string v2, "isHFInitiated"

    const-string v3, "false"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 523
    :try_start_0
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 524
    :catch_0
    move-exception v0

    .line 525
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const-string v2, "BluetoothReceiver"

    const-string v3, "bluetooth main activity start failure"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 512
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :cond_3
    const-class v2, Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-virtual {v1, p1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    goto :goto_1

    .line 517
    :cond_4
    const-string v2, "PhoneNumber"

    const-string v3, "unkown"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2

    .line 520
    :cond_5
    const-string v2, "false"

    goto :goto_3
.end method

.method private handleAdapterStateUpdate(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x4

    .line 444
    const-string v1, "android.bluetooth.adapter.extra.STATE"

    const/high16 v2, -0x80000000

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 445
    .local v0, "btState":I
    sget-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BluetoothReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleAdapterStateUpdate state="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    :cond_0
    packed-switch v0, :pswitch_data_0

    .line 466
    :cond_1
    :goto_0
    :pswitch_0
    return-void

    .line 448
    :pswitch_1
    const/4 v1, 0x1

    invoke-direct {p0, p2, v1}, Lcom/autochips/bluetooth/BluetoothReceiver;->setServicestate(Landroid/content/Context;Z)V

    goto :goto_0

    .line 451
    :pswitch_2
    const/4 v1, 0x0

    sput-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    .line 452
    invoke-direct {p0, p2}, Lcom/autochips/bluetooth/BluetoothReceiver;->sendDisconnected(Landroid/content/Context;)V

    .line 453
    const-string v1, ""

    sput-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mHfConnectedDeviceAddr:Ljava/lang/String;

    .line 454
    sput-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 455
    sput-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    .line 458
    invoke-static {}, Lcom/autochips/bluetooth/MainBluetoothActivity;->getCurrentTabIndex()I

    move-result v1

    if-eq v1, v4, :cond_1

    .line 459
    invoke-static {v4}, Lcom/autochips/bluetooth/MainBluetoothActivity;->switchTab(I)V

    goto :goto_0

    .line 446
    nop

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private handleBootCompleted(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 9
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    .line 469
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v7

    .line 470
    .local v7, "btAdapter":Landroid/bluetooth/BluetoothAdapter;
    invoke-direct {p0, p2}, Lcom/autochips/bluetooth/BluetoothReceiver;->setBtDebugLogLevel(Landroid/content/Context;)V

    .line 472
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 473
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x7f060000

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/bluetooth/BluetoothAdapter;->setPclFile(Ljava/io/InputStream;)V

    .line 474
    invoke-direct {p0, p2, v2}, Lcom/autochips/bluetooth/BluetoothReceiver;->setServicestate(Landroid/content/Context;Z)V

    .line 476
    :cond_0
    invoke-static {p2}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v8

    .line 477
    .local v8, "localManager":Lcom/autochips/bluetooth/LocalBluetoothManager;
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "xy_bt_powered"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v6

    .line 478
    .local v6, "bpowered":I
    if-eqz v8, :cond_2

    if-eqz v6, :cond_2

    .line 479
    invoke-virtual {v8}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothState()I

    move-result v0

    const/16 v1, 0xc

    if-eq v0, v1, :cond_2

    .line 480
    sget-boolean v0, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string v0, "BluetoothReceiver"

    const-string v1, "set BluetoothAdapter.STATE_ON"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 481
    :cond_1
    invoke-virtual {v8, v2}, Lcom/autochips/bluetooth/LocalBluetoothManager;->setBluetoothEnabled(Z)V

    .line 484
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mCheckTimer:Ljava/util/Timer;

    if-nez v0, :cond_3

    .line 485
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mCheckTimer:Ljava/util/Timer;

    .line 487
    :cond_3
    new-instance v0, Lcom/autochips/bluetooth/BluetoothReceiver$1;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BluetoothReceiver$1;-><init>(Lcom/autochips/bluetooth/BluetoothReceiver;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mCheckTask:Ljava/util/TimerTask;

    .line 498
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mCheckTimer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mCheckTask:Ljava/util/TimerTask;

    const-wide/16 v2, 0x7530

    const-wide/32 v4, 0xea60

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 499
    return-void
.end method

.method private handleCallStateUpdate(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x0

    .line 537
    const-string v3, "com.autochips.bluetooth.hf.BluetoothHfUtility.extra.callState"

    invoke-virtual {p1, v3, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 538
    .local v2, "phoneCallState":I
    iput-object p2, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->checkCallState:Landroid/content/Context;

    .line 540
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-nez v3, :cond_1

    .line 541
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "BluetoothReceiver"

    const-string v4, "Warn:HF not connect, return!"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 584
    :cond_0
    :goto_0
    return-void

    .line 545
    :cond_1
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v3, :cond_2

    const-string v3, "BluetoothReceiver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleCallStateUpdate:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 546
    :cond_2
    const/4 v3, 0x2

    if-ne v2, v3, :cond_3

    .line 548
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->incomingcall:Z

    .line 557
    :goto_1
    iget-object v3, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->checkCallStateHandler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->checkCallStaterunnable:Ljava/lang/Runnable;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 558
    const-string v3, "BluetoothReceiver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "m_HandsfreeAdpter.Bluetooth_Hf_GetCallingNumber() = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallingNumber()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 559
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-eqz v3, :cond_6

    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallingNumber()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 561
    iget-object v3, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->checkCallStateHandler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->checkCallStaterunnable:Ljava/lang/Runnable;

    const-wide/16 v5, 0x3e8

    invoke-virtual {v3, v4, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 549
    :cond_3
    const/4 v3, 0x3

    if-eq v2, v3, :cond_4

    const/4 v3, 0x4

    if-ne v2, v3, :cond_5

    .line 552
    :cond_4
    iput-boolean v6, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->incomingcall:Z

    goto :goto_1

    .line 554
    :cond_5
    const-string v3, "BluetoothReceiver"

    const-string v4, "unknow phoneCallState"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 564
    :cond_6
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 565
    .local v1, "intentPhoneCall":Landroid/content/Intent;
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-eqz v3, :cond_8

    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallingNumber()Ljava/lang/String;

    move-result-object v3

    const-string v4, "4008015015"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallingNumber()Ljava/lang/String;

    move-result-object v3

    const-string v4, "075787801111"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 567
    :cond_7
    const-class v3, Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-virtual {v1, p2, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 570
    :goto_2
    const/high16 v3, 0x10000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 571
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-eqz v3, :cond_9

    .line 572
    const-string v3, "PhoneNumber"

    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallingNumber()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 576
    :goto_3
    const-string v3, "PhoneName"

    const-string v4, ""

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 577
    const-string v4, "isIncomingCall"

    iget-boolean v3, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->incomingcall:Z

    if-eqz v3, :cond_a

    const-string v3, "true"

    :goto_4
    invoke-virtual {v1, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 578
    const-string v3, "isHFInitiated"

    const-string v4, "false"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 580
    :try_start_0
    invoke-virtual {p2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 581
    :catch_0
    move-exception v0

    .line 582
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const-string v3, "BluetoothReceiver"

    const-string v4, "bluetooth main activity start failure"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 569
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :cond_8
    const-class v3, Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-virtual {v1, p2, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    goto :goto_2

    .line 574
    :cond_9
    const-string v3, "PhoneNumber"

    const-string v4, "unkown"

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_3

    .line 577
    :cond_a
    const-string v3, "false"

    goto :goto_4
.end method

.method private handleHDMIAction(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 17
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 731
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 732
    .local v1, "action":Ljava/lang/String;
    const-string v14, "autochips.intent.action.GET_CONNECT_STATE"

    invoke-virtual {v1, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 734
    const/4 v6, 0x0

    .line 735
    .local v6, "hidConnected":Z
    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    if-eqz v14, :cond_0

    .line 737
    :try_start_0
    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    invoke-virtual {v14}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->isConnected()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    .line 743
    :cond_0
    sget-boolean v14, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v14, :cond_1

    const-string v14, "BluetoothReceiver"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "HDMI.ACTION_MHLHID_GET_CONNECT_STATE"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 744
    :cond_1
    new-instance v13, Landroid/content/Intent;

    const-string v14, "autochips.intent.action.CONNECT_STATE"

    invoke-direct {v13, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 745
    .local v13, "stateIntent":Landroid/content/Intent;
    const-string v14, "HidConnectState"

    invoke-virtual {v13, v14, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 746
    if-eqz p2, :cond_2

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 834
    .end local v6    # "hidConnected":Z
    .end local v13    # "stateIntent":Landroid/content/Intent;
    :cond_2
    :goto_0
    return-void

    .line 738
    .restart local v6    # "hidConnected":Z
    :catch_0
    move-exception v4

    .line 739
    .local v4, "e":Landroid/os/RemoteException;
    invoke-virtual {v4}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 748
    .end local v4    # "e":Landroid/os/RemoteException;
    .end local v6    # "hidConnected":Z
    :cond_3
    const-string v14, "autochips.intent.action.GET_RESOLUTION"

    invoke-virtual {v1, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_8

    .line 750
    sget-boolean v14, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v14, :cond_4

    const-string v14, "BluetoothReceiver"

    const-string v15, "HDMI.ACTION_MHLHID_GET_RESOLUTION"

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 751
    :cond_4
    const/4 v6, 0x0

    .line 752
    .restart local v6    # "hidConnected":Z
    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    if-eqz v14, :cond_5

    .line 754
    :try_start_1
    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    invoke-virtual {v14}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->isConnected()Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v6

    .line 760
    :cond_5
    if-eqz v6, :cond_7

    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    if-eqz v14, :cond_7

    .line 761
    const/4 v10, 0x0

    .line 762
    .local v10, "resolution":I
    const/4 v2, 0x0

    .line 764
    .local v2, "addr":Ljava/lang/String;
    :try_start_2
    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    invoke-virtual {v14}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->getConnectedAddr()Ljava/lang/String;
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v2

    .line 769
    const-string v14, "BT_MHLHID_RESOLUTION"

    const/4 v15, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v14, v15}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v12

    .line 770
    .local v12, "sharedata":Landroid/content/SharedPreferences;
    const/4 v14, 0x0

    invoke-interface {v12, v2, v14}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v10

    .line 771
    sget-boolean v14, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v14, :cond_6

    const-string v14, "BluetoothReceiver"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ","

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 772
    :cond_6
    new-instance v11, Landroid/content/Intent;

    const-string v14, "autochips.intent.action.RESOLUTION"

    invoke-direct {v11, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 773
    .local v11, "resolutionIntent":Landroid/content/Intent;
    const-string v14, "PhoneResolution"

    invoke-virtual {v11, v14, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 774
    if-eqz p2, :cond_2

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    .line 755
    .end local v2    # "addr":Ljava/lang/String;
    .end local v10    # "resolution":I
    .end local v11    # "resolutionIntent":Landroid/content/Intent;
    .end local v12    # "sharedata":Landroid/content/SharedPreferences;
    :catch_1
    move-exception v4

    .line 756
    .restart local v4    # "e":Landroid/os/RemoteException;
    invoke-virtual {v4}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 765
    .end local v4    # "e":Landroid/os/RemoteException;
    .restart local v2    # "addr":Ljava/lang/String;
    .restart local v10    # "resolution":I
    :catch_2
    move-exception v4

    .line 766
    .restart local v4    # "e":Landroid/os/RemoteException;
    invoke-virtual {v4}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 776
    .end local v2    # "addr":Ljava/lang/String;
    .end local v4    # "e":Landroid/os/RemoteException;
    .end local v10    # "resolution":I
    :cond_7
    new-instance v13, Landroid/content/Intent;

    const-string v14, "autochips.intent.action.CONNECT_STATE"

    invoke-direct {v13, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 777
    .restart local v13    # "stateIntent":Landroid/content/Intent;
    const-string v14, "HidConnectState"

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 778
    if-eqz p2, :cond_2

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 781
    .end local v6    # "hidConnected":Z
    .end local v13    # "stateIntent":Landroid/content/Intent;
    :cond_8
    const-string v14, "autochips.intent.action.NOTIFY_RESOLUTION"

    invoke-virtual {v1, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_c

    .line 782
    const/4 v6, 0x0

    .line 783
    .restart local v6    # "hidConnected":Z
    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    if-eqz v14, :cond_9

    .line 785
    :try_start_3
    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    invoke-virtual {v14}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->isConnected()Z
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_3

    move-result v6

    .line 791
    :cond_9
    if-eqz v6, :cond_b

    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    if-eqz v14, :cond_b

    .line 792
    const/4 v10, 0x0

    .line 793
    .restart local v10    # "resolution":I
    const/4 v2, 0x0

    .line 795
    .restart local v2    # "addr":Ljava/lang/String;
    :try_start_4
    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    invoke-virtual {v14}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->getConnectedAddr()Ljava/lang/String;
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_4

    move-result-object v2

    .line 800
    const-string v14, "BT_MHLHID_RESOLUTION"

    const/4 v15, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v14, v15}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v14

    invoke-interface {v14}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    .line 801
    .local v5, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v14, "PhoneResolution"

    const/4 v15, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v10

    .line 802
    sget-boolean v14, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v14, :cond_a

    const-string v14, "BluetoothReceiver"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ","

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 803
    :cond_a
    invoke-interface {v5, v2, v10}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 804
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_0

    .line 786
    .end local v2    # "addr":Ljava/lang/String;
    .end local v5    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v10    # "resolution":I
    :catch_3
    move-exception v4

    .line 787
    .restart local v4    # "e":Landroid/os/RemoteException;
    invoke-virtual {v4}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 796
    .end local v4    # "e":Landroid/os/RemoteException;
    .restart local v2    # "addr":Ljava/lang/String;
    .restart local v10    # "resolution":I
    :catch_4
    move-exception v4

    .line 797
    .restart local v4    # "e":Landroid/os/RemoteException;
    invoke-virtual {v4}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 806
    .end local v2    # "addr":Ljava/lang/String;
    .end local v4    # "e":Landroid/os/RemoteException;
    .end local v10    # "resolution":I
    :cond_b
    new-instance v13, Landroid/content/Intent;

    const-string v14, "autochips.intent.action.CONNECT_STATE"

    invoke-direct {v13, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 807
    .restart local v13    # "stateIntent":Landroid/content/Intent;
    const-string v14, "HidConnectState"

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 808
    if-eqz p2, :cond_2

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 811
    .end local v6    # "hidConnected":Z
    .end local v13    # "stateIntent":Landroid/content/Intent;
    :cond_c
    const-string v14, "autochips.intent.action.MOUSE_DATA"

    invoke-virtual {v1, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_d

    .line 812
    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    if-eqz v14, :cond_2

    .line 813
    const-string v14, "ButtonDown"

    const/4 v15, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    .line 814
    .local v3, "bButton":Z
    const-string v14, "CoordinateX"

    const/4 v15, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    .line 815
    .local v8, "iX":I
    const-string v14, "CoordinateY"

    const/4 v15, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    .line 817
    .local v9, "iY":I
    :try_start_5
    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    invoke-virtual {v14, v3, v8, v9}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->sendMouseData(ZII)Z
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_5

    goto/16 :goto_0

    .line 818
    :catch_5
    move-exception v4

    .line 819
    .restart local v4    # "e":Landroid/os/RemoteException;
    invoke-virtual {v4}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 823
    .end local v3    # "bButton":Z
    .end local v4    # "e":Landroid/os/RemoteException;
    .end local v8    # "iX":I
    .end local v9    # "iY":I
    :cond_d
    const-string v14, "autochips.intent.action.CONTROL_DATA"

    invoke-virtual {v1, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 824
    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    if-eqz v14, :cond_2

    .line 825
    const-string v14, "HIDCmd"

    const/4 v15, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    .line 827
    .local v7, "iCmd":I
    :try_start_6
    sget-object v14, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    invoke-virtual {v14, v7}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->sendControlData(I)Z
    :try_end_6
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_6

    goto/16 :goto_0

    .line 828
    :catch_6
    move-exception v4

    .line 829
    .restart local v4    # "e":Landroid/os/RemoteException;
    invoke-virtual {v4}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0
.end method

.method private handleLinkModeChanged(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 714
    sget-boolean v2, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BluetoothReceiver"

    const-string v3, "ACTION_LINK_MODE_CHANGED"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 715
    :cond_0
    const-string v2, "android.bluetooth.adapter.extra.LINK_MODE"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 716
    .local v1, "linkmode":I
    if-nez v1, :cond_2

    .line 718
    sget-boolean v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v2, :cond_2

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mHfConnectedDeviceAddr:Ljava/lang/String;

    const-string v3, ""

    if-eq v2, v3, :cond_2

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v2, :cond_2

    .line 719
    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v2, :cond_1

    .line 720
    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StopDownload(I)Z

    .line 723
    :cond_1
    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {p2, v2}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    .line 725
    .local v0, "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v0}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->disconnect()V

    .line 728
    .end local v0    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :cond_2
    return-void
.end method

.method private handleProfileStateUpdate(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 13
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v12, 0x4

    const/4 v11, 0x0

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 598
    const-string v6, "android.bluetooth.profilemanager.extra.ATCPROFILE"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    .line 599
    .local v3, "profilename":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    const-string v6, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/4 v7, 0x2

    invoke-virtual {p1, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 600
    .local v4, "profilestate":I
    if-nez v3, :cond_1

    .line 601
    const-string v6, "BluetoothReceiver"

    const-string v7, "profilename == null. return."

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 711
    :cond_0
    :goto_0
    return-void

    .line 604
    :cond_1
    const-string v6, "BluetoothReceiver"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "profilename:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 605
    const-string v6, "BluetoothReceiver"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "profilestate:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 607
    sget-object v6, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_HF:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v3, v6}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 608
    const-string v6, "device_addr"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 609
    .local v0, "addr":Ljava/lang/String;
    sparse-switch v4, :sswitch_data_0

    goto :goto_0

    .line 622
    :sswitch_0
    sget-boolean v6, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v6, :cond_2

    const-string v6, "BluetoothReceiver"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "hf connected, addr="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 623
    :cond_2
    const v6, 0x7f070047

    invoke-direct {p0, p2, v6}, Lcom/autochips/bluetooth/BluetoothReceiver;->showToast(Landroid/content/Context;I)V

    .line 624
    sput-boolean v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    .line 625
    sput-boolean v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    .line 626
    invoke-direct {p0, p2}, Lcom/autochips/bluetooth/BluetoothReceiver;->sendConnected(Landroid/content/Context;)V

    .line 627
    sput-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mHfConnectedDeviceAddr:Ljava/lang/String;

    .line 628
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v6

    invoke-virtual {v6, v0}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v6

    sput-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 629
    invoke-direct {p0, v11}, Lcom/autochips/bluetooth/BluetoothReceiver;->stopTimer(I)V

    .line 630
    iput-object p2, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->checkcontext:Landroid/content/Context;

    .line 631
    iget-object v6, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->BtPairedHistorycheckHandler:Landroid/os/Handler;

    iget-object v7, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->BtPairedHistorycheckrunnable:Ljava/lang/Runnable;

    const-wide/16 v8, 0x7d0

    invoke-virtual {v6, v7, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    .line 611
    :sswitch_1
    invoke-static {p2}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v6

    sput-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    .line 612
    invoke-static {p2}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v6

    sput-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    .line 613
    invoke-direct {p0}, Lcom/autochips/bluetooth/BluetoothReceiver;->checkBluetoothUp()V

    goto/16 :goto_0

    .line 616
    :sswitch_2
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-eqz v6, :cond_0

    .line 617
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->close()V

    .line 618
    sput-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    goto/16 :goto_0

    .line 634
    :sswitch_3
    sget-boolean v6, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v6, :cond_3

    const-string v6, "BluetoothReceiver"

    const-string v7, "hf disconnected"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 635
    :cond_3
    sput-boolean v11, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    .line 636
    invoke-direct {p0, p2}, Lcom/autochips/bluetooth/BluetoothReceiver;->sendDisconnected(Landroid/content/Context;)V

    .line 637
    const-string v6, ""

    sput-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mHfConnectedDeviceAddr:Ljava/lang/String;

    .line 638
    sput-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 641
    invoke-static {}, Lcom/autochips/bluetooth/MainBluetoothActivity;->getCurrentTabIndex()I

    move-result v6

    if-eq v6, v12, :cond_0

    .line 642
    invoke-static {v12}, Lcom/autochips/bluetooth/MainBluetoothActivity;->switchTab(I)V

    goto/16 :goto_0

    .line 647
    .end local v0    # "addr":Ljava/lang/String;
    :cond_4
    sget-object v6, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_AVRCP_CT:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v3, v6}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 648
    packed-switch v4, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 650
    :pswitch_1
    invoke-static {p2}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    move-result-object v6

    sput-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    .line 651
    invoke-direct {p0}, Lcom/autochips/bluetooth/BluetoothReceiver;->checkBluetoothUp()V

    .line 652
    invoke-direct {p0, v10}, Lcom/autochips/bluetooth/BluetoothReceiver;->startTimer(I)V

    goto/16 :goto_0

    .line 655
    :pswitch_2
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v6, :cond_0

    .line 656
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->close()V

    .line 657
    sput-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    goto/16 :goto_0

    .line 662
    :cond_5
    sget-object v6, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_PBAP_Client:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v3, v6}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 663
    packed-switch v4, :pswitch_data_1

    :pswitch_3
    goto/16 :goto_0

    .line 665
    :pswitch_4
    invoke-static {p2}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    move-result-object v6

    sput-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    .line 666
    invoke-direct {p0}, Lcom/autochips/bluetooth/BluetoothReceiver;->checkBluetoothUp()V

    goto/16 :goto_0

    .line 669
    :pswitch_5
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v6, :cond_0

    .line 670
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->close()V

    .line 671
    sput-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    goto/16 :goto_0

    .line 676
    :cond_6
    sget-object v6, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_HID:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v3, v6}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 677
    sparse-switch v4, :sswitch_data_1

    .line 697
    :cond_7
    :goto_1
    const/4 v2, 0x0

    .line 698
    .local v2, "hidConnected":Z
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    if-eqz v6, :cond_8

    .line 700
    :try_start_0
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->isConnected()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 706
    :cond_8
    new-instance v5, Landroid/content/Intent;

    const-string v6, "autochips.intent.action.CONNECT_STATE"

    invoke-direct {v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 707
    .local v5, "stateIntent":Landroid/content/Intent;
    const-string v6, "HidConnectState"

    invoke-virtual {v5, v6, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 708
    invoke-virtual {p2, v5}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 679
    .end local v2    # "hidConnected":Z
    .end local v5    # "stateIntent":Landroid/content/Intent;
    :sswitch_4
    invoke-static {p2}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    move-result-object v6

    sput-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    .line 680
    invoke-direct {p0}, Lcom/autochips/bluetooth/BluetoothReceiver;->checkBluetoothUp()V

    goto :goto_1

    .line 683
    :sswitch_5
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    if-eqz v6, :cond_7

    .line 684
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->close()V

    .line 685
    sput-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    goto :goto_1

    .line 689
    :sswitch_6
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    if-eqz v6, :cond_7

    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    const/16 v7, 0xa

    invoke-virtual {v6, v7}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->startHIDSendThread(I)Z

    goto :goto_1

    .line 693
    :sswitch_7
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    if-eqz v6, :cond_7

    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->stopHIDSendThread()V

    goto :goto_1

    .line 701
    .restart local v2    # "hidConnected":Z
    :catch_0
    move-exception v1

    .line 702
    .local v1, "e":Landroid/os/RemoteException;
    invoke-virtual {v1}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 609
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_3
        0xb -> :sswitch_1
        0xd -> :sswitch_2
    .end sparse-switch

    .line 648
    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch

    .line 663
    :pswitch_data_1
    .packed-switch 0xb
        :pswitch_4
        :pswitch_3
        :pswitch_5
    .end packed-switch

    .line 677
    :sswitch_data_1
    .sparse-switch
        0x1 -> :sswitch_6
        0x2 -> :sswitch_7
        0xb -> :sswitch_4
        0xd -> :sswitch_5
    .end sparse-switch
.end method

.method private handleRDSAction(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 837
    const-string v1, "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.EXTRA_BTMUSIC_INTERACTIVE"

    invoke-virtual {p1, v1, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 838
    .local v0, "param":I
    sget-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BluetoothReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "RDS param="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 839
    :cond_0
    const/16 v1, 0xf

    if-ne v0, v1, :cond_2

    .line 840
    const/4 v1, 0x1

    sput-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mbInRds:Z

    .line 844
    :cond_1
    :goto_0
    return-void

    .line 841
    :cond_2
    if-nez v0, :cond_1

    .line 842
    sput-boolean v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mbInRds:Z

    goto :goto_0
.end method

.method private onBluetoothPairingRequest(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 9
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/high16 v8, -0x80000000

    const/4 v7, 0x1

    .line 1021
    const-string v4, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    .line 1024
    .local v2, "remoteDevice":Landroid/bluetooth/BluetoothDevice;
    const-string v4, "android.bluetooth.device.extra.PAIRING_VARIANT"

    invoke-virtual {p1, v4, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 1027
    .local v3, "type":I
    sget-boolean v4, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v4, :cond_0

    const-string v4, "BluetoothReceiver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[Pair] Device : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", type = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1029
    :cond_0
    if-nez v3, :cond_2

    .line 1030
    invoke-direct {p0, p2}, Lcom/autochips/bluetooth/BluetoothReceiver;->readDeviceNamePin(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 1031
    .local v0, "Pin":Ljava/lang/String;
    invoke-static {v0}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->convertPinToBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/bluetooth/BluetoothDevice;->setPin([B)Z

    .line 1051
    .end local v0    # "Pin":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 1032
    :cond_2
    const/4 v4, 0x2

    if-ne v3, v4, :cond_3

    .line 1033
    const-string v4, "android.bluetooth.device.extra.PAIRING_KEY"

    invoke-virtual {p1, v4, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 1035
    .local v1, "passkey":I
    invoke-virtual {v2, v7}, Landroid/bluetooth/BluetoothDevice;->setPairingConfirmation(Z)Z

    goto :goto_0

    .line 1036
    .end local v1    # "passkey":I
    :cond_3
    const/4 v4, 0x3

    if-ne v3, v4, :cond_4

    .line 1037
    invoke-virtual {v2, v7}, Landroid/bluetooth/BluetoothDevice;->setPairingConfirmation(Z)Z

    goto :goto_0

    .line 1038
    :cond_4
    if-ne v3, v7, :cond_5

    .line 1040
    invoke-direct {p0, p2}, Lcom/autochips/bluetooth/BluetoothReceiver;->readDeviceNamePin(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 1042
    .restart local v0    # "Pin":Ljava/lang/String;
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v2, v4}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->setPasskey(Landroid/bluetooth/BluetoothDevice;I)Z

    goto :goto_0

    .line 1043
    .end local v0    # "Pin":Ljava/lang/String;
    :cond_5
    const/4 v4, 0x4

    if-eq v3, v4, :cond_1

    .line 1045
    const/4 v4, 0x6

    if-ne v3, v4, :cond_6

    .line 1047
    invoke-static {v2}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->setRemoteOutOfBandData(Landroid/bluetooth/BluetoothDevice;)Z

    goto :goto_0

    .line 1049
    :cond_6
    sget-boolean v4, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v4, :cond_1

    const-string v4, "BluetoothReceiver"

    const-string v5, "Incorrect pairing type received"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private onekeyCallPhone(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 289
    const-string v1, "onekeynumber"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 290
    .local v0, "strPhone":Ljava/lang/String;
    const-string v1, "BluetoothReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "strPhone ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    invoke-direct {p0, v0, p2}, Lcom/autochips/bluetooth/BluetoothReceiver;->BluetoothHfCallout(Ljava/lang/String;Landroid/content/Context;)Z

    .line 292
    return-void
.end method

.method private onekeyCallPhoneName(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 12
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v11, 0x1

    .line 295
    const/4 v4, 0x0

    .line 297
    .local v4, "s2":Ljava/lang/String;
    :try_start_0
    const-string v8, "onekeyname"

    invoke-virtual {p1, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 298
    .local v6, "strPhoneName":Ljava/lang/String;
    const-string v8, "BluetoothReceiver"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "strPhoneName ="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    const-string v8, "UTF-8"

    invoke-virtual {v6, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 300
    .local v0, "converttoBytes":[B
    new-instance v5, Ljava/lang/String;

    const-string v8, "UTF-8"

    invoke-direct {v5, v0, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v4    # "s2":Ljava/lang/String;
    .local v5, "s2":Ljava/lang/String;
    move-object v4, v5

    .line 304
    .end local v0    # "converttoBytes":[B
    .end local v5    # "s2":Ljava/lang/String;
    .end local v6    # "strPhoneName":Ljava/lang/String;
    .restart local v4    # "s2":Ljava/lang/String;
    :goto_0
    if-nez v4, :cond_0

    .line 333
    :goto_1
    return-void

    .line 301
    :catch_0
    move-exception v1

    .line 302
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 305
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    sget-object v8, Lcom/autochips/bluetooth/BluetoothReceiver;->bTDBAdapter:Lcom/autochips/bluetooth/util/BTDBAdapter;

    if-nez v8, :cond_1

    .line 306
    invoke-static {}, Lcom/autochips/bluetooth/util/BTDBAdapter;->getInstance()Lcom/autochips/bluetooth/util/BTDBAdapter;

    move-result-object v8

    sput-object v8, Lcom/autochips/bluetooth/BluetoothReceiver;->bTDBAdapter:Lcom/autochips/bluetooth/util/BTDBAdapter;

    .line 307
    :cond_1
    sget-object v8, Lcom/autochips/bluetooth/BluetoothReceiver;->bTDBAdapter:Lcom/autochips/bluetooth/util/BTDBAdapter;

    invoke-virtual {v8, p2}, Lcom/autochips/bluetooth/util/BTDBAdapter;->setContext(Landroid/content/Context;)V

    .line 308
    sget-object v8, Lcom/autochips/bluetooth/BluetoothReceiver;->bTDBAdapter:Lcom/autochips/bluetooth/util/BTDBAdapter;

    invoke-virtual {v8}, Lcom/autochips/bluetooth/util/BTDBAdapter;->open()Lcom/autochips/bluetooth/util/BTDBAdapter;

    .line 309
    sget-object v8, Lcom/autochips/bluetooth/BluetoothReceiver;->bTDBAdapter:Lcom/autochips/bluetooth/util/BTDBAdapter;

    invoke-virtual {v8}, Lcom/autochips/bluetooth/util/BTDBAdapter;->loadPhonebookTable()V

    .line 310
    sget-object v8, Lcom/autochips/bluetooth/BluetoothReceiver;->bTDBAdapter:Lcom/autochips/bluetooth/util/BTDBAdapter;

    invoke-virtual {v8, v4}, Lcom/autochips/bluetooth/util/BTDBAdapter;->getTelbyName(Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    .line 311
    .local v7, "strPhoneNum":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    sget-object v8, Lcom/autochips/bluetooth/BluetoothReceiver;->bTDBAdapter:Lcom/autochips/bluetooth/util/BTDBAdapter;

    invoke-virtual {v8}, Lcom/autochips/bluetooth/util/BTDBAdapter;->close()V

    .line 312
    const-string v8, "BluetoothReceiver"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "strPhoneNum.size()  ="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    if-ge v8, v11, :cond_2

    .line 315
    invoke-direct {p0, p2}, Lcom/autochips/bluetooth/BluetoothReceiver;->showNoPepoleDialog(Landroid/content/Context;)V

    goto :goto_1

    .line 317
    :cond_2
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    if-ne v8, v11, :cond_3

    .line 319
    const/4 v8, 0x0

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    const-string v9, "PHONENumber"

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-direct {p0, v8, p2}, Lcom/autochips/bluetooth/BluetoothReceiver;->BluetoothHfCallout(Ljava/lang/String;Landroid/content/Context;)Z

    goto :goto_1

    .line 323
    :cond_3
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    if-ge v2, v8, :cond_4

    .line 325
    const-string v9, "BluetoothReceiver"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "strPhoneNum ="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    const-string v11, "PHONENumber"

    invoke-interface {v8, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v9, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    const-string v9, "BluetoothReceiver"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "strPhoneName ="

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    const-string v11, "PHONEName"

    invoke-interface {v8, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v9, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 323
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 328
    :cond_4
    new-instance v3, Landroid/content/Intent;

    const-class v8, Lcom/autochips/bluetooth/YikaActivity;

    invoke-direct {v3, p2, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 329
    .local v3, "intentNum":Landroid/content/Intent;
    const-string v8, "SelectPhone"

    check-cast v7, Ljava/io/Serializable;

    .end local v7    # "strPhoneNum":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual {v3, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 330
    const/high16 v8, 0x10000000

    invoke-virtual {v3, v8}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 331
    invoke-virtual {p2, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_1
.end method

.method private readDeviceNamePin(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 1055
    const-string v2, "device_name_data"

    invoke-virtual {p1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1059
    .local v1, "sharedata":Landroid/content/SharedPreferences;
    const-string v2, "device_pin_data"

    invoke-virtual {p1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1060
    const-string v2, "PIN"

    const-string v3, "0000"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1061
    .local v0, "Pin":Ljava/lang/String;
    return-object v0
.end method

.method public static resetBluetoothAdapter(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 1013
    invoke-static {p0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v0

    sput-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    .line 1014
    invoke-static {p0}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    sput-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    .line 1015
    invoke-static {p0}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    move-result-object v0

    sput-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    .line 1016
    invoke-static {p0}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    move-result-object v0

    sput-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    .line 1017
    invoke-static {p0}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    move-result-object v0

    sput-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    .line 1018
    return-void
.end method

.method private sendConnected(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 173
    new-instance v1, Landroid/content/Intent;

    const-string v3, "com.android.galaxy.bt.connected"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 174
    .local v1, "sendIntent":Landroid/content/Intent;
    invoke-virtual {p1, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 175
    const-string v3, "bt_disconnect_state"

    invoke-virtual {p1, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 176
    .local v2, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v3, "BT_STATE"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 177
    new-instance v0, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v0, v2}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 179
    .local v0, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v3, Ljava/lang/Thread;

    invoke-direct {v3, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 180
    return-void
.end method

.method private sendDisconnected(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 169
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.galaxy.bt.disconnected"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 170
    .local v0, "sendIntent":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 171
    return-void
.end method

.method private sendMsg(ILjava/lang/Object;)V
    .locals 4
    .param p1, "what"    # I
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 1068
    const/4 v0, 0x0

    .line 1069
    .local v0, "msg":Landroid/os/Message;
    sget-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BluetoothReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendMsg("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1070
    :cond_0
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_2

    .line 1071
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 1072
    iput p1, v0, Landroid/os/Message;->what:I

    .line 1073
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1074
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1079
    :cond_1
    :goto_0
    return-void

    .line 1077
    :cond_2
    sget-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "BluetoothReceiver"

    const-string v2, "mHandler is null"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private setBtDebugLogLevel(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 847
    const-string v3, "BT_Debug_Log_Level"

    invoke-virtual {p1, v3, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 848
    .local v2, "sharedata":Landroid/content/SharedPreferences;
    const-string v3, "file_exsit"

    invoke-interface {v2, v3, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 849
    .local v1, "file_exsit":Z
    if-nez v1, :cond_2

    .line 850
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "BluetoothReceiver"

    const-string v4, "file not exsit!"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 851
    :cond_0
    const-string v3, "BT_Debug_Log_Level"

    invoke-virtual {p1, v3, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 852
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v3, "file_exsit"

    invoke-interface {v0, v3, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 853
    const-string v3, "debug_all"

    sget-boolean v4, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugAll:Z

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 854
    const-string v3, "debug_music"

    sget-boolean v4, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugMusic:Z

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 855
    const-string v3, "debug_settings"

    sget-boolean v4, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugSettings:Z

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 856
    const-string v3, "debug_pb"

    sget-boolean v4, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugPB:Z

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 857
    const-string v3, "debug_sms"

    sget-boolean v4, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugSMS:Z

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 858
    const-string v3, "debug_hf"

    sget-boolean v4, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugHF:Z

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 859
    const-string v3, "debug_spp"

    sget-boolean v4, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugSPP:Z

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 860
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 879
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_1
    :goto_0
    return-void

    .line 862
    :cond_2
    const-string v3, "debug_all"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugAll:Z

    .line 863
    const-string v3, "debug_music"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugMusic:Z

    .line 864
    const-string v3, "debug_settings"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugSettings:Z

    .line 865
    const-string v3, "debug_pb"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugPB:Z

    .line 866
    const-string v3, "debug_sms"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugSMS:Z

    .line 867
    const-string v3, "debug_hf"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugHF:Z

    .line 868
    const-string v3, "debug_spp"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugSPP:Z

    .line 869
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v3, :cond_1

    .line 870
    const-string v3, "BluetoothReceiver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mDebugAll = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-boolean v5, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugAll:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 871
    const-string v3, "BluetoothReceiver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mDebugMusic = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-boolean v5, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugMusic:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 872
    const-string v3, "BluetoothReceiver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mDebugSettings = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-boolean v5, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugSettings:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 873
    const-string v3, "BluetoothReceiver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mDebugPB = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-boolean v5, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugPB:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 874
    const-string v3, "BluetoothReceiver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mDebugSMS = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-boolean v5, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugSMS:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 875
    const-string v3, "BluetoothReceiver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mDebugHF = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-boolean v5, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugHF:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 876
    const-string v3, "BluetoothReceiver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mDebugSPP = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-boolean v5, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugSPP:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method public static declared-synchronized setHandler(Landroid/os/Handler;)V
    .locals 2
    .param p0, "handler"    # Landroid/os/Handler;

    .prologue
    .line 1065
    const-class v0, Lcom/autochips/bluetooth/BluetoothReceiver;

    monitor-enter v0

    :try_start_0
    sput-object p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1066
    monitor-exit v0

    return-void

    .line 1065
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private setServicestate(Landroid/content/Context;Z)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "isEnable"    # Z

    .prologue
    .line 421
    if-eqz p2, :cond_0

    .line 422
    const-string v0, "com.autochips.bluetooth.hf.BluetoothHfService"

    invoke-direct {p0, p1, v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->startService(Landroid/content/Context;Ljava/lang/String;)V

    .line 423
    const-string v0, "com.autochips.bluetooth.pbapclient.BluetoothPbapClientService"

    invoke-direct {p0, p1, v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->startService(Landroid/content/Context;Ljava/lang/String;)V

    .line 424
    const-string v0, "com.autochips.bluetooth.a2dpsink.BluetoothA2dpSinkService"

    invoke-direct {p0, p1, v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->startService(Landroid/content/Context;Ljava/lang/String;)V

    .line 425
    const-string v0, "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService"

    invoke-direct {p0, p1, v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->startService(Landroid/content/Context;Ljava/lang/String;)V

    .line 426
    const-string v0, "com.autochips.bluetooth.PbSyncManager.PBSyncManagerService"

    invoke-direct {p0, p1, v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->startService(Landroid/content/Context;Ljava/lang/String;)V

    .line 427
    const-string v0, "com.autochips.bluetooth.hid.BluetoothHidService"

    invoke-direct {p0, p1, v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->startService(Landroid/content/Context;Ljava/lang/String;)V

    .line 441
    :goto_0
    return-void

    .line 432
    :cond_0
    const-string v0, "com.autochips.bluetooth.PbSyncManager.PBSyncManagerService"

    invoke-direct {p0, p1, v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->stopService(Landroid/content/Context;Ljava/lang/String;)V

    .line 433
    const-string v0, "com.autochips.bluetooth.hf.BluetoothHfService"

    invoke-direct {p0, p1, v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->stopService(Landroid/content/Context;Ljava/lang/String;)V

    .line 434
    const-string v0, "com.autochips.bluetooth.pbapclient.BluetoothPbapClientService"

    invoke-direct {p0, p1, v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->stopService(Landroid/content/Context;Ljava/lang/String;)V

    .line 435
    const-string v0, "com.autochips.bluetooth.a2dpsink.BluetoothA2dpSinkService"

    invoke-direct {p0, p1, v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->stopService(Landroid/content/Context;Ljava/lang/String;)V

    .line 436
    const-string v0, "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService"

    invoke-direct {p0, p1, v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->stopService(Landroid/content/Context;Ljava/lang/String;)V

    .line 437
    const-string v0, "com.autochips.bluetooth.hid.BluetoothHidService"

    invoke-direct {p0, p1, v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->stopService(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private showConnectTipDialog(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 360
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->toast_btv:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 366
    :goto_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->toast_btv:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 367
    return-void

    .line 363
    :cond_0
    const-string v0, ""

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->toast_btv:Landroid/widget/Toast;

    .line 364
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->toast_btv:Landroid/widget/Toast;

    const v1, 0x7f0700af

    invoke-virtual {v0, v1}, Landroid/widget/Toast;->setText(I)V

    goto :goto_0
.end method

.method private showNoPepoleDialog(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 351
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->toast_btv:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 357
    :goto_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->toast_btv:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 358
    return-void

    .line 354
    :cond_0
    const-string v0, ""

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->toast_btv:Landroid/widget/Toast;

    .line 355
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->toast_btv:Landroid/widget/Toast;

    const v1, 0x7f0700d4

    invoke-virtual {v0, v1}, Landroid/widget/Toast;->setText(I)V

    goto :goto_0
.end method

.method private showToast(Landroid/content/Context;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resid"    # I

    .prologue
    .line 162
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mToast:Landroid/widget/Toast;

    if-nez v0, :cond_0

    .line 163
    const-string v0, ""

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mToast:Landroid/widget/Toast;

    .line 165
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0, p2}, Landroid/widget/Toast;->setText(I)V

    .line 166
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 167
    return-void
.end method

.method private startService(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "serviceClass"    # Ljava/lang/String;

    .prologue
    .line 395
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 400
    :goto_0
    return-void

    .line 397
    :catch_0
    move-exception v0

    .line 398
    .local v0, "ex":Ljava/lang/ClassNotFoundException;
    const-string v1, "BluetoothReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "start service for class["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] fail:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private startService(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "serviceClass"    # Ljava/lang/String;
    .param p3, "extraName"    # Ljava/lang/String;
    .param p4, "extraValue"    # Ljava/lang/String;

    .prologue
    .line 413
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 418
    :goto_0
    return-void

    .line 415
    :catch_0
    move-exception v0

    .line 416
    .local v0, "ex":Ljava/lang/ClassNotFoundException;
    const-string v1, "BluetoothReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "start service for class["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] fail:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private startTimer(I)V
    .locals 6
    .param p1, "timer_type"    # I

    .prologue
    const-wide/16 v2, 0x3e8

    .line 943
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTimer:Ljava/util/Timer;

    if-nez v0, :cond_0

    .line 944
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTimer:Ljava/util/Timer;

    .line 946
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTaskList:Ljava/util/HashMap;

    if-nez v0, :cond_1

    .line 947
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTaskList:Ljava/util/HashMap;

    .line 950
    :cond_1
    sget-boolean v0, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v0, :cond_2

    const-string v0, "BluetoothReceiver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "startTimer:timer_type = "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 952
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTaskList:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_6

    .line 954
    if-nez p1, :cond_5

    .line 955
    const/4 v0, 0x0

    iput v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTimeoff:I

    .line 956
    new-instance v0, Lcom/autochips/bluetooth/BluetoothReceiver$4;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BluetoothReceiver$4;-><init>(Lcom/autochips/bluetooth/BluetoothReceiver;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTask:Ljava/util/TimerTask;

    .line 971
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTimer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTask:Ljava/util/TimerTask;

    const-wide/16 v4, 0x2710

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 989
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTaskList:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTask:Ljava/util/TimerTask;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 993
    :cond_4
    :goto_1
    return-void

    .line 973
    :cond_5
    const/4 v0, 0x1

    if-ne v0, p1, :cond_3

    .line 974
    new-instance v0, Lcom/autochips/bluetooth/BluetoothReceiver$5;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BluetoothReceiver$5;-><init>(Lcom/autochips/bluetooth/BluetoothReceiver;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTask:Ljava/util/TimerTask;

    .line 986
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTimer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTask:Ljava/util/TimerTask;

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto :goto_0

    .line 991
    :cond_6
    sget-boolean v0, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v0, :cond_4

    const-string v0, "BluetoothReceiver"

    const-string v1, "startTimer: already start!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private stopService(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "serviceClass"    # Ljava/lang/String;

    .prologue
    .line 404
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 409
    :goto_0
    return-void

    .line 406
    :catch_0
    move-exception v0

    .line 407
    .local v0, "ex":Ljava/lang/ClassNotFoundException;
    const-string v1, "BluetoothReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "stop service for class["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] fail:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private stopTimer(I)V
    .locals 5
    .param p1, "timer_type"    # I

    .prologue
    const/4 v4, 0x0

    .line 997
    sget-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BluetoothReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "stopTimer: timer_type = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 999
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTaskList:Ljava/util/HashMap;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTaskList:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1000
    iget-object v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTaskList:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/TimerTask;

    .line 1001
    .local v0, "task":Ljava/util/TimerTask;
    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 1002
    iget-object v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTaskList:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1003
    iget-object v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTaskList:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 1004
    iget-object v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTimer:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    .line 1005
    iget-object v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTimer:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->purge()I

    .line 1006
    iput-object v4, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTimer:Ljava/util/Timer;

    .line 1007
    iput-object v4, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->mTaskList:Ljava/util/HashMap;

    .line 1010
    .end local v0    # "task":Ljava/util/TimerTask;
    :cond_1
    return-void
.end method


# virtual methods
.method public convert(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "utfString"    # Ljava/lang/String;

    .prologue
    .line 336
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 337
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v0, -0x1

    .line 338
    .local v0, "i":I
    const/4 v1, 0x0

    .line 339
    .local v1, "pos":I
    :cond_0
    :goto_0
    const-string v3, "\\u"

    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_1

    .line 341
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    add-int/lit8 v3, v0, 0x5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 344
    add-int/lit8 v1, v0, 0x6

    .line 345
    add-int/lit8 v3, v0, 0x2

    add-int/lit8 v4, v0, 0x6

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 348
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v10, 0x0

    .line 184
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, "action":Ljava/lang/String;
    sget-boolean v7, Lcom/autochips/bluetooth/BluetoothReceiver;->DEBUG:Z

    if-eqz v7, :cond_0

    const-string v7, "BluetoothReceiver"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "BluetoothReceiver receive action:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    :cond_0
    const-string v7, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 188
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->handleAdapterStateUpdate(Landroid/content/Intent;Landroid/content/Context;)V

    .line 280
    :cond_1
    :goto_0
    return-void

    .line 190
    :cond_2
    const-string v7, "xy.android.acc.on"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 191
    iput v10, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->forceconnect_times:I

    goto :goto_0

    .line 193
    :cond_3
    const-string v7, "xy.xbtheadset.phonelink.totop"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 194
    sget-boolean v7, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v7, :cond_1

    .line 195
    sget-object v7, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v7, :cond_1

    .line 196
    new-instance v5, Landroid/content/Intent;

    const-string v7, "xy.kill.mediaapp"

    invoke-direct {v5, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 197
    .local v5, "plintent":Landroid/content/Intent;
    const-string v7, "pkgname"

    const-string v8, "com.autochips.bluetooth"

    invoke-virtual {v5, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 198
    invoke-virtual {p1, v5}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    .line 205
    .end local v5    # "plintent":Landroid/content/Intent;
    :cond_4
    const-string v7, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 206
    iput-object p1, p0, Lcom/autochips/bluetooth/BluetoothReceiver;->bootcontext:Landroid/content/Context;

    .line 208
    const-string v7, "bt_disconnect_state"

    invoke-virtual {p1, v7, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    .line 209
    .local v6, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v7, "BT_STATE"

    invoke-interface {v6, v7, v10}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 211
    new-instance v3, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v3, v6}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 213
    .local v3, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v7, Ljava/lang/Thread;

    invoke-direct {v7, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v7}, Ljava/lang/Thread;->start()V

    .line 217
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->handleBootCompleted(Landroid/content/Intent;Landroid/content/Context;)V

    goto :goto_0

    .line 220
    .end local v3    # "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    .end local v6    # "sharedata":Landroid/content/SharedPreferences$Editor;
    :cond_5
    const-string v7, "android.bluetooth.profilemanager.action.DISABLE_PROFILES"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 221
    invoke-direct {p0, p1, v10}, Lcom/autochips/bluetooth/BluetoothReceiver;->setServicestate(Landroid/content/Context;Z)V

    goto :goto_0

    .line 224
    :cond_6
    const-string v7, "com.autochips.bluetooth.hf.BluetoothHfUtility.action.callStateChange"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 225
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->handleCallStateUpdate(Landroid/content/Intent;Landroid/content/Context;)V

    goto :goto_0

    .line 228
    :cond_7
    const-string v7, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 229
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->handleProfileStateUpdate(Landroid/content/Intent;Landroid/content/Context;)V

    .line 230
    const/16 v7, 0x2710

    invoke-direct {p0, v7, p2}, Lcom/autochips/bluetooth/BluetoothReceiver;->sendMsg(ILjava/lang/Object;)V

    goto :goto_0

    .line 233
    :cond_8
    const-string v7, "android.bluetooth.adapter.action.LINK_MODE_CHANGED"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 234
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->handleLinkModeChanged(Landroid/content/Intent;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 237
    :cond_9
    const-string v7, "autochips.intent.action.GET_CONNECT_STATE"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 238
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->handleHDMIAction(Landroid/content/Intent;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 239
    :cond_a
    const-string v7, "autochips.intent.action.GET_RESOLUTION"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 240
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->handleHDMIAction(Landroid/content/Intent;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 241
    :cond_b
    const-string v7, "autochips.intent.action.NOTIFY_RESOLUTION"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 242
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->handleHDMIAction(Landroid/content/Intent;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 243
    :cond_c
    const-string v7, "autochips.intent.action.MOUSE_DATA"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 244
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->handleHDMIAction(Landroid/content/Intent;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 245
    :cond_d
    const-string v7, "autochips.intent.action.CONTROL_DATA"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 246
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->handleHDMIAction(Landroid/content/Intent;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 248
    :cond_e
    const-string v7, "com.xyauto.action.onekeyphonenum"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 250
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->onekeyCallPhone(Landroid/content/Intent;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 252
    :cond_f
    const-string v7, "com.xyauto.action.onekeyphonename"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 254
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->onekeyCallPhoneName(Landroid/content/Intent;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 256
    :cond_10
    const-string v7, "com.xyauto.action.checkincallstatus"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_11

    .line 258
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->doCheckCall(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 260
    :cond_11
    const-string v7, "com.xyauto.selectPhoneNumber"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_12

    .line 262
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->SelectCallPhone(Landroid/content/Intent;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 265
    :cond_12
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    const-string v8, "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.ACTION_BTMUSIC_INTERACTIVE"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 266
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->handleRDSAction(Landroid/content/Intent;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 267
    :cond_13
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    const-string v8, "autochips.intent.action.QB_POWEROFF"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_14

    .line 268
    sput-boolean v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mbInRds:Z

    goto/16 :goto_0

    .line 270
    :cond_14
    const-string v7, "android.bluetooth.device.action.PAIRING_REQUEST"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 271
    invoke-direct {p0, p2, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->onBluetoothPairingRequest(Landroid/content/Intent;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 273
    :cond_15
    const-string v7, "SOSActivity.action.BROADCAST"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 274
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 275
    .local v1, "b":Landroid/os/Bundle;
    const-string v7, "XYSOSPHONENUM"

    invoke-virtual {v1, v7}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 276
    .local v2, "calloutNumber":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v7, v2

    if-ge v4, v7, :cond_16

    .line 277
    const-string v7, "BluetoothReceiver"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Callout Number["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "] =   "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v2, v4

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 278
    :cond_16
    aget-object v7, v2, v10

    invoke-direct {p0, v7, p1}, Lcom/autochips/bluetooth/BluetoothReceiver;->BluetoothHfCallout(Ljava/lang/String;Landroid/content/Context;)Z

    goto/16 :goto_0
.end method
