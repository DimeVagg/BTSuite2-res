.class public Lcom/autochips/bluetooth/BtPairedHistoryActivity;
.super Landroid/app/Activity;
.source "BtPairedHistoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;
    }
.end annotation


# static fields
.field private static final ACTION_ACC_OFF:Ljava/lang/String; = "xy.android.acc.off"

.field public static final ACTION_ACC_ON:Ljava/lang/String; = "xy.android.acc.on"

.field private static final ADDRESS_LENGTH:I = 0x11

.field private static final CHECKCONSTATUSBR:Ljava/lang/String; = "xy.com.autochips.bluetooth.bt.statuscheck"

.field private static DEBUG:Z = false

.field static final DEFAULT_DISCOVERABLE_TIMEOUT:I = -0x1

.field static final SHARED_PREFERENCES_KEY_DISCOVERABLE_END_TIMESTAMP:Ljava/lang/String; = "discoverable_end_timestamp"

.field private static final TAG:Ljava/lang/String; = "BtPairedHistoryActivity"

.field private static final TIMER_BT_AUTO_CONNECT:I = 0x0

.field private static final TIMER_BT_POWER_OFF:I = 0x1

.field public static bAccoff:Z

.field public static mA2dpState:I

.field public static mAvrcpState:I

.field private static mBluetoothState:I

.field public static mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

.field public static mIsHFConnected:Z

.field private static mMinPinLength:I

.field public static mNeedDldClyWhenConnect:Z

.field public static mNeedDldPbWhenConnect:Z

.field public static mPin:Ljava/lang/String;

.field private static mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

.field private static mTask:Ljava/util/TimerTask;

.field private static mTimer:Ljava/util/Timer;

.field private static mbtOffStep:I

.field private static mbtOffTime:I


# instance fields
.field private final MSG_ADD_DEVICE:I

.field private builderWarning:Landroid/app/AlertDialog$Builder;

.field private editBTNameDialog:Landroid/app/Dialog;

.field private edt_devicename:Landroid/widget/EditText;

.field private edt_pin:Landroid/widget/EditText;

.field private mBluetoothIsDiscovery:Z

.field private mConnectButton:Landroid/widget/ImageButton;

.field private mCurName:Ljava/lang/String;

.field private mDeviceClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mDeviceClickListenerPaired:Landroid/widget/AdapterView$OnItemClickListener;

.field private mDeviceIndex:I

.field private mDeviceIndexPaired:I

.field private mDeviceList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private mDeviceListPaired:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private mDeviceListView:Landroid/widget/ListView;

.field private mDeviceListViewPaired:Landroid/widget/ListView;

.field private mDisconnectButton:Landroid/widget/ImageButton;

.field private mIsAutoAnswer:Z

.field private mIsAutoConnect:Z

.field private mIsScaning:Z

.field private mLastConnectedDeviceAddr:Ljava/lang/String;

.field private mListDeviceMacs:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mListDeviceMacsPaired:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

.field private mOpenBluetooth:Z

.field private mOpenBluetoothButton:Landroid/widget/Button;

.field private mPairedDevicesArrayAdapter:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

.field private mPairedDevicesArrayAdapterPaired:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mScanButton:Landroid/widget/ImageButton;

.field private mScanLayout:Landroid/widget/LinearLayout;

.field private mSettingHandler:Landroid/os/Handler;

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

.field private mUnpairButton:Landroid/widget/ImageButton;

.field private mVisibleButton:Landroid/widget/ToggleButton;

.field private paired_devices_btn_b:Landroid/widget/ImageButton;

.field private paired_devices_btn_t:Landroid/widget/ImageButton;

.field private paired_devices_title:Landroid/widget/TextView;

.field private usable_devices_title:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 94
    sget-boolean v0, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugAll:Z

    sget-boolean v1, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugSettings:Z

    and-int/2addr v0, v1

    sput-boolean v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    .line 102
    sput-boolean v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    .line 103
    sput-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 104
    sput-boolean v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldPbWhenConnect:Z

    .line 105
    sput-boolean v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldClyWhenConnect:Z

    .line 106
    sput-boolean v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->bAccoff:Z

    .line 109
    sput-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 124
    const/16 v0, 0xc

    sput v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mBluetoothState:I

    .line 125
    const-string v0, "0000"

    sput-object v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPin:Ljava/lang/String;

    .line 126
    const/4 v0, 0x4

    sput v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mMinPinLength:I

    .line 143
    sput v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mA2dpState:I

    .line 144
    sput v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mAvrcpState:I

    .line 150
    sput-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTimer:Ljava/util/Timer;

    .line 151
    sput-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTask:Ljava/util/TimerTask;

    .line 153
    sput v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mbtOffStep:I

    .line 154
    sput v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mbtOffTime:I

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 92
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 114
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mListDeviceMacs:Ljava/util/Set;

    .line 119
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mListDeviceMacsPaired:Ljava/util/Set;

    .line 122
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetooth:Z

    .line 123
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mBluetoothIsDiscovery:Z

    .line 127
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mCurName:Ljava/lang/String;

    .line 129
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsAutoAnswer:Z

    .line 130
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsAutoConnect:Z

    .line 131
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLastConnectedDeviceAddr:Ljava/lang/String;

    .line 133
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->edt_devicename:Landroid/widget/EditText;

    .line 134
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->edt_pin:Landroid/widget/EditText;

    .line 136
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_title:Landroid/widget/TextView;

    .line 137
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->usable_devices_title:Landroid/widget/TextView;

    .line 139
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_b:Landroid/widget/ImageButton;

    .line 140
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_t:Landroid/widget/ImageButton;

    .line 145
    iput v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->MSG_ADD_DEVICE:I

    .line 146
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsScaning:Z

    .line 152
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTaskList:Ljava/util/HashMap;

    .line 160
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    .line 162
    new-instance v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;-><init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 304
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    .line 305
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mScanButton:Landroid/widget/ImageButton;

    .line 306
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mUnpairButton:Landroid/widget/ImageButton;

    .line 307
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectButton:Landroid/widget/ImageButton;

    .line 308
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDisconnectButton:Landroid/widget/ImageButton;

    .line 309
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    .line 310
    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mScanLayout:Landroid/widget/LinearLayout;

    .line 313
    new-instance v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;-><init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSettingHandler:Landroid/os/Handler;

    .line 1102
    new-instance v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$7;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$7;-><init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 1114
    new-instance v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$8;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$8;-><init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceClickListenerPaired:Landroid/widget/AdapterView$OnItemClickListener;

    .line 1717
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 92
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    return v0
.end method

.method static synthetic access$100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->onBluetoothPairingRequest(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->handleHfConnectStateChanged(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapter:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mListDeviceMacs:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->checkBluetoothStatus()V

    return-void
.end method

.method static synthetic access$1700(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mListDeviceMacsPaired:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapterPaired:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->handleMsgProfileStateUpdate(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$200(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->handleStateChanged(I)V

    return-void
.end method

.method static synthetic access$2000(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->edt_devicename:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->edt_pin:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$2200()I
    .locals 1

    .prologue
    .line 92
    sget v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mMinPinLength:I

    return v0
.end method

.method static synthetic access$2300(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 92
    invoke-direct {p0, p1, p2}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->writeDeviceNamePin(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2400(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->readDeviceNamePin()V

    return-void
.end method

.method static synthetic access$2500(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mCurName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Landroid/app/Dialog;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->editBTNameDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->writedisconnectState(I)V

    return-void
.end method

.method static synthetic access$2800(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndex:I

    return v0
.end method

.method static synthetic access$2802(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    iput p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndex:I

    return p1
.end method

.method static synthetic access$2900(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndexPaired:I

    return v0
.end method

.method static synthetic access$2902(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    iput p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndexPaired:I

    return p1
.end method

.method static synthetic access$300(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mScanLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$3000(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->checkAutoConnectSetting()V

    return-void
.end method

.method static synthetic access$3100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->stopBTSettingTimer(I)V

    return-void
.end method

.method static synthetic access$3200()I
    .locals 1

    .prologue
    .line 92
    sget v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mbtOffStep:I

    return v0
.end method

.method static synthetic access$3202(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 92
    sput p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mbtOffStep:I

    return p0
.end method

.method static synthetic access$3208()I
    .locals 2

    .prologue
    .line 92
    sget v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mbtOffStep:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mbtOffStep:I

    return v0
.end method

.method static synthetic access$3210()I
    .locals 2

    .prologue
    .line 92
    sget v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mbtOffStep:I

    add-int/lit8 v1, v0, -0x1

    sput v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mbtOffStep:I

    return v0
.end method

.method static synthetic access$3300()I
    .locals 1

    .prologue
    .line 92
    sget v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mbtOffTime:I

    return v0
.end method

.method static synthetic access$3302(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 92
    sput p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mbtOffTime:I

    return p0
.end method

.method static synthetic access$3312(I)I
    .locals 1
    .param p0, "x0"    # I

    .prologue
    .line 92
    sget v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mbtOffTime:I

    add-int/2addr v0, p0

    sput v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mbtOffTime:I

    return v0
.end method

.method static synthetic access$400(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->handleModeChanged(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->handleBondChanged(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$600(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->handleunpairsuccess(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$700(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    .prologue
    .line 92
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->reFreshBluetoothList()V

    return-void
.end method

.method static synthetic access$800(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->updateBluetoothUI(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairedHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->startBTSettingTimer(I)V

    return-void
.end method

.method private buildEditNameDialog(Landroid/content/Context;)V
    .locals 4
    .param p1, "contxt"    # Landroid/content/Context;

    .prologue
    .line 949
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 950
    .local v1, "factory":Landroid/view/LayoutInflater;
    const v2, 0x7f030007

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 951
    .local v0, "editBTNameView":Landroid/view/View;
    new-instance v2, Landroid/app/Dialog;

    invoke-direct {v2, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->editBTNameDialog:Landroid/app/Dialog;

    .line 952
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->editBTNameDialog:Landroid/app/Dialog;

    if-nez v2, :cond_1

    .line 953
    sget-boolean v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BtPairedHistoryActivity"

    const-string v3, "buildEditNameDialog failure!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 990
    :cond_0
    :goto_0
    return-void

    .line 956
    :cond_1
    const v2, 0x7f0a003c

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->edt_devicename:Landroid/widget/EditText;

    .line 957
    const v2, 0x7f0a003f

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->edt_pin:Landroid/widget/EditText;

    .line 959
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->editBTNameDialog:Landroid/app/Dialog;

    invoke-virtual {v2, v0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 960
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->editBTNameDialog:Landroid/app/Dialog;

    const v3, 0x7f070087

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->setTitle(I)V

    .line 961
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->editBTNameDialog:Landroid/app/Dialog;

    const v3, 0x7f0a0040

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    new-instance v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity$3;

    invoke-direct {v3, p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$3;-><init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 984
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->editBTNameDialog:Landroid/app/Dialog;

    const v3, 0x7f0a0041

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    new-instance v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity$4;

    invoke-direct {v3, p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$4;-><init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method

.method private checkAutoConnectSetting()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 554
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->readLastConnectedDeviceData()V

    .line 555
    const-string v4, "bt_disconnect_state"

    invoke-virtual {p0, v4, v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 556
    .local v2, "disconnectshare":Landroid/content/SharedPreferences;
    const-string v4, "BT_STATE"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 557
    .local v0, "IsdisConnect":I
    iget-boolean v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsAutoConnect:Z

    const/4 v5, 0x1

    if-ne v4, v5, :cond_3

    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLastConnectedDeviceAddr:Ljava/lang/String;

    const-string v5, ""

    if-eq v4, v5, :cond_3

    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLastConnectedDeviceAddr:Ljava/lang/String;

    if-eqz v4, :cond_3

    sget-boolean v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    if-nez v4, :cond_3

    if-nez v0, :cond_3

    .line 561
    const/4 v3, 0x0

    .line 562
    .local v3, "lastConnectDevice":Landroid/bluetooth/BluetoothDevice;
    sget-boolean v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v4, :cond_0

    const-string v4, "BtPairedHistoryActivity"

    const-string v5, "Will auto connect preconnected device"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 563
    :cond_0
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    if-eqz v4, :cond_1

    .line 564
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v4

    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLastConnectedDeviceAddr:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    .line 566
    :cond_1
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v4

    const/16 v5, 0xc

    if-ne v4, v5, :cond_3

    .line 568
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v1

    .line 570
    .local v1, "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v1}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->isConnected()Z

    move-result v4

    if-nez v4, :cond_3

    .line 571
    sget-boolean v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v4, :cond_2

    const-string v4, "BtPairedHistoryActivity"

    const-string v5, "Auto connecting last connecated device"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 572
    :cond_2
    invoke-virtual {v1}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->onClicked()V

    .line 576
    .end local v1    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    .end local v3    # "lastConnectDevice":Landroid/bluetooth/BluetoothDevice;
    :cond_3
    return-void
.end method

.method private checkBluetoothAddress(Ljava/lang/String;)Z
    .locals 5
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x11

    const/4 v2, 0x0

    .line 658
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v3, v4, :cond_1

    .line 678
    :cond_0
    :goto_0
    return v2

    .line 661
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v4, :cond_4

    .line 662
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 663
    .local v0, "c":C
    rem-int/lit8 v3, v1, 0x3

    packed-switch v3, :pswitch_data_0

    .line 661
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 666
    :pswitch_0
    const/16 v3, 0x30

    if-lt v0, v3, :cond_3

    const/16 v3, 0x39

    if-le v0, v3, :cond_2

    :cond_3
    const/16 v3, 0x41

    if-lt v0, v3, :cond_0

    const/16 v3, 0x46

    if-gt v0, v3, :cond_0

    goto :goto_2

    .line 672
    :pswitch_1
    const/16 v3, 0x3a

    if-ne v0, v3, :cond_0

    goto :goto_2

    .line 678
    .end local v0    # "c":C
    :cond_4
    const/4 v2, 0x1

    goto :goto_0

    .line 663
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private checkBluetoothStatus()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1022
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1023
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetooth:Z

    .line 1024
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    const v1, 0x7f07000b

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 1025
    sput-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    .line 1026
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, v3}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1027
    invoke-direct {p0, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setBtnEnable(Z)V

    .line 1037
    :goto_0
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->readAutoConnectData()V

    .line 1038
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->readAutoAnswerData()V

    .line 1039
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtPairedHistoryActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AutoConnect= "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsAutoConnect:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " IsAutoAnswer ="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsAutoAnswer:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1040
    :cond_0
    return-void

    .line 1029
    :cond_1
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetooth:Z

    .line 1030
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    const v1, 0x7f07000a

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 1031
    sput-boolean v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    .line 1032
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, v2}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1033
    invoke-direct {p0, v2}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setBtnEnable(Z)V

    goto :goto_0
.end method

.method private checkIfAbnormal()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 1963
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1964
    const/4 v0, 0x0

    .line 1965
    .local v0, "IsHfConnected":Z
    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-nez v2, :cond_1

    .line 1969
    .end local v0    # "IsHfConnected":Z
    :cond_0
    :goto_0
    return v1

    .line 1966
    .restart local v0    # "IsHfConnected":Z
    :cond_1
    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_isConnected()Z

    move-result v0

    .line 1967
    sget-boolean v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-ne v0, v2, :cond_0

    .line 1969
    .end local v0    # "IsHfConnected":Z
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private doDiscovery()V
    .locals 2

    .prologue
    .line 646
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtPairedHistoryActivity"

    const-string v1, "doDiscovery()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 649
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 655
    :goto_0
    return-void

    .line 653
    :cond_1
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->startDiscovery()Z

    goto :goto_0
.end method

.method private handleBondChanged(Landroid/content/Intent;)V
    .locals 9
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1309
    const-string v6, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p1, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    .line 1310
    .local v2, "device":Landroid/bluetooth/BluetoothDevice;
    if-nez v2, :cond_1

    .line 1412
    :cond_0
    :goto_0
    return-void

    .line 1313
    :cond_1
    const-string v6, "android.bluetooth.device.extra.BOND_STATE"

    const/high16 v7, -0x80000000

    invoke-virtual {p1, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 1315
    .local v1, "bondState":I
    const/4 v0, 0x0

    .line 1316
    .local v0, "bFound":Z
    sget-boolean v6, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v6, :cond_2

    const-string v6, "BtPairedHistoryActivity"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " ACTION_BOND_STATE_CHANGED "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1317
    :cond_2
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    .line 1318
    .local v5, "strBTRemoteAddr":Ljava/lang/String;
    if-nez v5, :cond_3

    .line 1319
    const-string v6, "BtPairedHistoryActivity"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " strBTRemoteAddr == null "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1323
    :cond_3
    const/16 v6, 0xc

    if-ne v1, v6, :cond_d

    .line 1324
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1325
    .local v4, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "remote_device_name"

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1326
    sget-object v6, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v6, :cond_5

    sget-object v6, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 1328
    const-string v6, "remote_connect_status"

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f070017

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1332
    :goto_1
    const-string v6, "remote_device_macaddr"

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1333
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v3, v6, :cond_6

    .line 1334
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    const-string v7, "remote_device_macaddr"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1335
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1333
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1330
    .end local v3    # "i":I
    :cond_5
    const-string v6, "remote_connect_status"

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f070015

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 1338
    .restart local v3    # "i":I
    :cond_6
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1339
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mListDeviceMacsPaired:Ljava/util/Set;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1340
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapterPaired:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1342
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndexPaired:I

    .line 1343
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapterPaired:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1345
    const/4 v3, 0x0

    :goto_3
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v3, v6, :cond_a

    .line 1346
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    const-string v7, "remote_device_macaddr"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 1347
    sget-boolean v6, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    if-eqz v6, :cond_7

    sget-boolean v6, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    const/4 v7, 0x1

    if-ne v6, v7, :cond_b

    sget-object v6, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v6, :cond_b

    .line 1349
    :cond_7
    sget-boolean v6, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v6, :cond_8

    const-string v6, "BtPairedHistoryActivity"

    const-string v7, "  update bondState ,paired"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1350
    :cond_8
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1351
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapter:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1356
    :cond_9
    :goto_4
    const/4 v0, 0x1

    .line 1360
    :cond_a
    const/4 v6, -0x1

    iput v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndex:I

    .line 1361
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapter:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    iget v7, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndex:I

    invoke-virtual {v6, v7}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->setSelect(I)V

    .line 1362
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapter:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1364
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectButton:Landroid/widget/ImageButton;

    invoke-virtual {p0, v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->onClick(Landroid/view/View;)V

    goto/16 :goto_0

    .line 1354
    :cond_b
    sget-boolean v6, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v6, :cond_9

    const-string v6, "BtPairedHistoryActivity"

    const-string v7, " already connected ,don\'t need update bondState"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 1345
    :cond_c
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 1378
    .end local v3    # "i":I
    .end local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_d
    const/16 v6, 0xa

    if-ne v1, v6, :cond_0

    .line 1379
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_5
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v3, v6, :cond_e

    .line 1380
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    const-string v7, "remote_device_macaddr"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f

    .line 1382
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1383
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapterPaired:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1384
    const/4 v0, 0x1

    .line 1388
    :cond_e
    const/4 v3, 0x0

    :goto_6
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v3, v6, :cond_10

    .line 1389
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    const-string v7, "remote_device_macaddr"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1388
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 1379
    :cond_f
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 1395
    :cond_10
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1396
    .restart local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "remote_device_name"

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1397
    const-string v6, "remote_connect_status"

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f070014

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1398
    const-string v6, "remote_device_macaddr"

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1399
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1400
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mListDeviceMacs:Ljava/util/Set;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1401
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapter:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0
.end method

.method private handleHfConnectStateChanged(Landroid/content/Intent;)V
    .locals 11
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 1455
    const-string v5, "device_addr"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1456
    .local v0, "addr":Ljava/lang/String;
    const-string v5, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    invoke-virtual {p1, v5, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 1459
    .local v3, "profilestate":I
    sget-boolean v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v5, :cond_0

    const-string v5, "BtPairedHistoryActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " handleHfConnectStateChanged  state ="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1461
    :cond_0
    if-ne v3, v8, :cond_3

    .line 1462
    sput-boolean v8, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    .line 1463
    sput-boolean v8, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldPbWhenConnect:Z

    .line 1464
    sput-boolean v8, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldClyWhenConnect:Z

    .line 1465
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v4

    .line 1466
    .local v4, "remoteDevice":Landroid/bluetooth/BluetoothDevice;
    sput-object v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 1467
    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->writeLastConnectedDeviceData(Ljava/lang/String;)V

    .line 1468
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_1

    .line 1469
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string v6, "remote_device_macaddr"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1471
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string v6, "remote_connect_status"

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f070017

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1473
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapterPaired:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1558
    .end local v2    # "i":I
    .end local v4    # "remoteDevice":Landroid/bluetooth/BluetoothDevice;
    :cond_1
    :goto_1
    return-void

    .line 1468
    .restart local v2    # "i":I
    .restart local v4    # "remoteDevice":Landroid/bluetooth/BluetoothDevice;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1499
    .end local v2    # "i":I
    .end local v4    # "remoteDevice":Landroid/bluetooth/BluetoothDevice;
    :cond_3
    if-ne v3, v10, :cond_5

    .line 1500
    sput-boolean v9, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    .line 1501
    const/4 v5, 0x0

    sput-object v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 1502
    sput-boolean v9, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldPbWhenConnect:Z

    .line 1503
    sput-boolean v9, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldClyWhenConnect:Z

    .line 1504
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v4

    .line 1505
    .restart local v4    # "remoteDevice":Landroid/bluetooth/BluetoothDevice;
    invoke-virtual {v4}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v1

    .line 1506
    .local v1, "bondstate":I
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v2, v5, :cond_1

    .line 1507
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string v6, "remote_device_macaddr"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1508
    const/16 v5, 0xa

    if-eq v1, v5, :cond_4

    .line 1509
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string v6, "remote_connect_status"

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f070015

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1511
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapterPaired:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto :goto_1

    .line 1506
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1538
    .end local v1    # "bondstate":I
    .end local v2    # "i":I
    .end local v4    # "remoteDevice":Landroid/bluetooth/BluetoothDevice;
    :cond_5
    const/16 v5, 0xd

    if-ne v3, v5, :cond_7

    .line 1539
    const-string v5, "BtPairedHistoryActivity"

    const-string v6, " handleHfConnectStateChanged STATE_DISABLED"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1540
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectButton:Landroid/widget/ImageButton;

    if-eqz v5, :cond_6

    .line 1541
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectButton:Landroid/widget/ImageButton;

    invoke-virtual {v5, v9}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1544
    :cond_6
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDisconnectButton:Landroid/widget/ImageButton;

    if-eqz v5, :cond_1

    .line 1545
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectButton:Landroid/widget/ImageButton;

    invoke-virtual {v5, v9}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto :goto_1

    .line 1548
    :cond_7
    const/16 v5, 0xb

    if-ne v3, v5, :cond_1

    .line 1549
    const-string v5, "BtPairedHistoryActivity"

    const-string v6, " handleHfConnectStateChanged STATE_ENABLED"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1550
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectButton:Landroid/widget/ImageButton;

    if-eqz v5, :cond_8

    .line 1551
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectButton:Landroid/widget/ImageButton;

    invoke-virtual {v5, v8}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1554
    :cond_8
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDisconnectButton:Landroid/widget/ImageButton;

    if-eqz v5, :cond_1

    .line 1555
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectButton:Landroid/widget/ImageButton;

    invoke-virtual {v5, v8}, Landroid/widget/ImageButton;->setEnabled(Z)V

    goto/16 :goto_1
.end method

.method private handleModeChanged(I)V
    .locals 3
    .param p1, "mode"    # I

    .prologue
    .line 1270
    const-string v0, "BtPairedHistoryActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[handleModeChanged]mode = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1271
    const/16 v0, 0x17

    if-ne p1, v0, :cond_1

    .line 1272
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setDiscoveryModeStatus(Z)V

    .line 1279
    :cond_0
    :goto_0
    return-void

    .line 1274
    :cond_1
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetooth:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getState()I

    move-result v0

    const/16 v1, 0xc

    if-ne v0, v1, :cond_0

    .line 1276
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setDiscoveryModeStatus(Z)V

    goto :goto_0
.end method

.method private handleMsgProfileStateUpdate(Landroid/content/Intent;)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/16 v5, 0xf

    const/4 v4, 0x1

    const/4 v3, 0x2

    .line 1415
    const-string v2, "android.bluetooth.profilemanager.extra.ATCPROFILE"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    .line 1417
    .local v0, "profilename":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    if-nez v0, :cond_1

    .line 1451
    :cond_0
    :goto_0
    return-void

    .line 1418
    :cond_1
    sget-object v2, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_HF:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v0, v2}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1419
    const-string v2, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 1420
    .local v1, "profilestate":I
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->handleHfConnectStateChanged(Landroid/content/Intent;)V

    .line 1421
    if-ne v1, v4, :cond_0

    .line 1422
    sget-boolean v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BtPairedHistoryActivity"

    const-string v3, "hf connected"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1424
    .end local v1    # "profilestate":I
    :cond_2
    sget-object v2, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_A2DP_SINK:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v0, v2}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1426
    const-string v2, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 1427
    .restart local v1    # "profilestate":I
    if-ne v1, v4, :cond_3

    .line 1428
    sput v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mA2dpState:I

    .line 1429
    sget-boolean v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BtPairedHistoryActivity"

    const-string v3, "a2dp connected"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1430
    :cond_3
    if-ne v1, v3, :cond_4

    .line 1431
    sput v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mA2dpState:I

    .line 1432
    sget-boolean v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BtPairedHistoryActivity"

    const-string v3, "a2dp disconnected"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1433
    :cond_4
    if-ne v1, v5, :cond_0

    .line 1434
    sput v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mA2dpState:I

    .line 1435
    sget-boolean v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BtPairedHistoryActivity"

    const-string v3, "a2dp playing "

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1437
    .end local v1    # "profilestate":I
    :cond_5
    sget-object v2, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_AVRCP_CT:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v0, v2}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1439
    const-string v2, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 1440
    .restart local v1    # "profilestate":I
    if-ne v1, v4, :cond_6

    .line 1441
    sput v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mAvrcpState:I

    .line 1442
    sget-boolean v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BtPairedHistoryActivity"

    const-string v3, "avrcp connected"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1443
    :cond_6
    if-ne v1, v3, :cond_7

    .line 1444
    sput v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mAvrcpState:I

    .line 1445
    sget-boolean v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BtPairedHistoryActivity"

    const-string v3, "avrcp disconnected"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1446
    :cond_7
    const/16 v2, 0xb

    if-eq v1, v2, :cond_8

    const/16 v2, 0xd

    if-ne v1, v2, :cond_0

    .line 1448
    :cond_8
    sput v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mAvrcpState:I

    goto/16 :goto_0
.end method

.method private handleStateChanged(I)V
    .locals 11
    .param p1, "state"    # I

    .prologue
    const v10, 0x7f07000b

    const v9, 0x7f07000a

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 1136
    sget-boolean v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v4, :cond_0

    const-string v4, "BtPairedHistoryActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "handleStateChanged:state->"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1137
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 1255
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v4, v9}, Landroid/widget/Button;->setText(I)V

    .line 1256
    sput-boolean v7, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    .line 1257
    iput-boolean v7, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetooth:Z

    .line 1258
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1259
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    invoke-virtual {v4, v7}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1261
    invoke-direct {p0, v7}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setBtnEnable(Z)V

    .line 1266
    :cond_1
    :goto_0
    sput p1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mBluetoothState:I

    .line 1267
    return-void

    .line 1139
    :pswitch_0
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v4, v9}, Landroid/widget/Button;->setText(I)V

    .line 1140
    iput-boolean v7, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetooth:Z

    .line 1141
    sput-boolean v7, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    .line 1142
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1143
    invoke-direct {p0, v8}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setXybtPowerStatus(Z)V

    .line 1144
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    invoke-virtual {v4, v7}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1146
    invoke-direct {p0, v7}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setBtnEnable(Z)V

    .line 1149
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListView:Landroid/widget/ListView;

    invoke-virtual {v4, v7}, Landroid/widget/ListView;->setEnabled(Z)V

    goto :goto_0

    .line 1152
    :pswitch_1
    sget-object v4, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/MyTabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v4

    invoke-virtual {v4, v8}, Landroid/widget/TabWidget;->setEnabled(Z)V

    .line 1153
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v4, v10}, Landroid/widget/Button;->setText(I)V

    .line 1154
    invoke-direct {p0, v8}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setXybtPowerStatus(Z)V

    .line 1155
    sput-boolean v8, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    .line 1156
    iput-boolean v8, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetooth:Z

    .line 1157
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1158
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    invoke-virtual {v4, v8}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1160
    invoke-direct {p0, v8}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setBtnEnable(Z)V

    .line 1163
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListView:Landroid/widget/ListView;

    invoke-virtual {v4, v8}, Landroid/widget/ListView;->setEnabled(Z)V

    .line 1164
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 1166
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v4

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v3

    .line 1169
    .local v3, "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v4

    if-lez v4, :cond_6

    .line 1170
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 1171
    .local v0, "device":Landroid/bluetooth/BluetoothDevice;
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mListDeviceMacsPaired:Ljava/util/Set;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 1172
    sget-boolean v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v4, :cond_3

    const-string v4, "BtPairedHistoryActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "paired devices contains "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1173
    :cond_3
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1174
    .local v2, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "remote_device_name"

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1175
    sget-boolean v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    if-eqz v4, :cond_4

    sget-object v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1177
    const-string v4, "remote_connect_status"

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f070017

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1183
    :goto_2
    const-string v4, "remote_device_macaddr"

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1184
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1185
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mListDeviceMacsPaired:Ljava/util/Set;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 1180
    :cond_4
    const-string v4, "remote_connect_status"

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f070015

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 1188
    .end local v0    # "device":Landroid/bluetooth/BluetoothDevice;
    .end local v2    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_5
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapterPaired:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1203
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    :cond_6
    sget-boolean v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v4, :cond_7

    const-string v4, "BtPairedHistoryActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "state-on:mBluetoothIsDiscovery = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mBluetoothIsDiscovery:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1204
    :cond_7
    iget-boolean v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mBluetoothIsDiscovery:Z

    if-eqz v4, :cond_8

    invoke-direct {p0, v8}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setBluetoothDiscoverability(Z)V

    .line 1205
    :cond_8
    sget-boolean v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    if-nez v4, :cond_1

    invoke-direct {p0, v7}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->startBTSettingTimer(I)V

    goto/16 :goto_0

    .line 1208
    :pswitch_2
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v4, v10}, Landroid/widget/Button;->setText(I)V

    .line 1209
    sput-boolean v8, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    .line 1210
    iput-boolean v8, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetooth:Z

    .line 1211
    invoke-direct {p0, v7}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setXybtPowerStatus(Z)V

    .line 1212
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1213
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    invoke-virtual {v4, v7}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1215
    invoke-direct {p0, v7}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setBtnEnable(Z)V

    .line 1218
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListView:Landroid/widget/ListView;

    invoke-virtual {v4, v7}, Landroid/widget/ListView;->setEnabled(Z)V

    goto/16 :goto_0

    .line 1221
    :pswitch_3
    sget-object v4, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/MyTabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v4

    invoke-virtual {v4, v8}, Landroid/widget/TabWidget;->setEnabled(Z)V

    .line 1222
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v4, v9}, Landroid/widget/Button;->setText(I)V

    .line 1223
    sput-boolean v7, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    .line 1224
    iput-boolean v7, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetooth:Z

    .line 1225
    invoke-direct {p0, v7}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setXybtPowerStatus(Z)V

    .line 1226
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1227
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    invoke-virtual {v4, v7}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1229
    invoke-direct {p0, v7}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setBtnEnable(Z)V

    .line 1232
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListView:Landroid/widget/ListView;

    invoke-virtual {v4, v7}, Landroid/widget/ListView;->setEnabled(Z)V

    .line 1234
    sput-boolean v7, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    .line 1235
    const/4 v4, 0x0

    sput-object v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 1236
    sput-boolean v7, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldPbWhenConnect:Z

    .line 1237
    sput-boolean v7, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldClyWhenConnect:Z

    .line 1238
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 1239
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mListDeviceMacs:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->clear()V

    .line 1240
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapter:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0

    .line 1137
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_3
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private handleunpairsuccess(Landroid/content/Intent;)V
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1282
    const-string v4, "name"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1283
    .local v2, "strBTRemoteAddr":Ljava/lang/String;
    const-string v4, "mac"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1284
    .local v3, "strBTRemoteName":Ljava/lang/String;
    if-eqz v2, :cond_0

    if-nez v3, :cond_2

    .line 1285
    :cond_0
    const-string v4, "BtPairedHistoryActivity"

    const-string v5, " strBTRemoteAddr == null "

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1307
    :cond_1
    :goto_0
    return-void

    .line 1288
    :cond_2
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_3

    .line 1289
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    const-string v5, "remote_device_macaddr"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1290
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1291
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapterPaired:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1295
    :cond_3
    const/4 v0, 0x0

    :goto_2
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_5

    .line 1296
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    const-string v5, "remote_device_macaddr"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1295
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1288
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1300
    :cond_5
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1301
    .local v1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "remote_device_name"

    invoke-virtual {v1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1302
    const-string v4, "remote_connect_status"

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f070014

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1303
    const-string v4, "remote_device_macaddr"

    invoke-virtual {v1, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1304
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1305
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mListDeviceMacs:Ljava/util/Set;

    invoke-interface {v4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1306
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapter:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto :goto_0
.end method

.method private initBluetoothDeviceList()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 505
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    if-nez v5, :cond_1

    .line 552
    :cond_0
    :goto_0
    return-void

    .line 508
    :cond_1
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 510
    .local v0, "btAdapter":Landroid/bluetooth/BluetoothAdapter;
    if-eqz v0, :cond_0

    .line 514
    sget-boolean v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v5, :cond_7

    .line 515
    sget-boolean v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v5, :cond_2

    const-string v5, "BtPairedHistoryActivity"

    const-string v6, "BluetoothReceiver has a connected device"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    :cond_2
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mHfConnectedDeviceAddr:Ljava/lang/String;

    if-eqz v5, :cond_3

    .line 517
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mHfConnectedDeviceAddr:Ljava/lang/String;

    invoke-virtual {v0, v5}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v5

    sput-object v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 520
    :cond_3
    sget-object v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v5, :cond_4

    .line 521
    sput-boolean v7, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    .line 522
    sput-boolean v7, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldPbWhenConnect:Z

    .line 523
    sput-boolean v7, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldClyWhenConnect:Z

    .line 530
    :cond_4
    :goto_1
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v4

    .line 531
    .local v4, "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    sget-boolean v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v5, :cond_5

    const-string v5, "BtPairedHistoryActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "paird Devices count = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 533
    :cond_5
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v5

    if-lez v5, :cond_0

    .line 534
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .line 535
    .local v1, "device":Landroid/bluetooth/BluetoothDevice;
    sget-boolean v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v5, :cond_6

    const-string v5, "BtPairedHistoryActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "paired devices contains "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 536
    :cond_6
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 537
    .local v3, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "remote_device_name"

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 538
    sget-boolean v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    if-eqz v5, :cond_8

    sget-object v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 539
    const-string v5, "remote_connect_status"

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f070017

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 545
    :goto_3
    const-string v5, "remote_device_macaddr"

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 546
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 547
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mListDeviceMacsPaired:Ljava/util/Set;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 526
    .end local v1    # "device":Landroid/bluetooth/BluetoothDevice;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    :cond_7
    const/4 v5, 0x0

    sput-boolean v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    goto/16 :goto_1

    .line 542
    .restart local v1    # "device":Landroid/bluetooth/BluetoothDevice;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v4    # "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    :cond_8
    const-string v5, "remote_connect_status"

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f070015

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 549
    .end local v1    # "device":Landroid/bluetooth/BluetoothDevice;
    .end local v3    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_9
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapterPaired:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0
.end method

.method private invokePairConnectActivity(Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)Z
    .locals 3
    .param p1, "deviceName"    # Ljava/lang/String;
    .param p2, "SelectedDevice"    # Landroid/bluetooth/BluetoothDevice;

    .prologue
    .line 1704
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1705
    .local v0, "intentPairConnect":Landroid/content/Intent;
    const-class v2, Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 1706
    const-string v2, "deviceName"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1707
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v1

    .line 1708
    .local v1, "remoteAddr":Ljava/lang/String;
    const-string v2, "deviceAddr"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1710
    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->startActivity(Landroid/content/Intent;)V

    .line 1712
    const/4 v2, 0x1

    return v2
.end method

.method private onBluetoothPairingRequest(Landroid/content/Intent;)V
    .locals 8
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/high16 v7, -0x80000000

    const/4 v6, 0x1

    .line 1562
    const-string v3, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .line 1565
    .local v1, "remoteDevice":Landroid/bluetooth/BluetoothDevice;
    const-string v3, "android.bluetooth.device.extra.PAIRING_VARIANT"

    invoke-virtual {p1, v3, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 1569
    .local v2, "type":I
    sget-boolean v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "BtPairedHistoryActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[Pair] Device : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", type = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1571
    :cond_0
    if-nez v2, :cond_2

    .line 1572
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->readDeviceNamePin()V

    .line 1573
    sget-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPin:Ljava/lang/String;

    invoke-static {v3}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->convertPinToBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/bluetooth/BluetoothDevice;->setPin([B)Z

    .line 1593
    :cond_1
    :goto_0
    return-void

    .line 1574
    :cond_2
    const/4 v3, 0x2

    if-ne v2, v3, :cond_3

    .line 1575
    const-string v3, "android.bluetooth.device.extra.PAIRING_KEY"

    invoke-virtual {p1, v3, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 1577
    .local v0, "passkey":I
    invoke-virtual {v1, v6}, Landroid/bluetooth/BluetoothDevice;->setPairingConfirmation(Z)Z

    goto :goto_0

    .line 1578
    .end local v0    # "passkey":I
    :cond_3
    const/4 v3, 0x3

    if-ne v2, v3, :cond_4

    .line 1579
    invoke-virtual {v1, v6}, Landroid/bluetooth/BluetoothDevice;->setPairingConfirmation(Z)Z

    goto :goto_0

    .line 1580
    :cond_4
    if-ne v2, v6, :cond_5

    .line 1582
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->readDeviceNamePin()V

    .line 1584
    sget-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPin:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v1, v3}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->setPasskey(Landroid/bluetooth/BluetoothDevice;I)Z

    goto :goto_0

    .line 1585
    :cond_5
    const/4 v3, 0x4

    if-eq v2, v3, :cond_1

    .line 1587
    const/4 v3, 0x6

    if-ne v2, v3, :cond_6

    .line 1589
    invoke-static {v1}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->setRemoteOutOfBandData(Landroid/bluetooth/BluetoothDevice;)Z

    goto :goto_0

    .line 1591
    :cond_6
    sget-boolean v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v3, :cond_1

    const-string v3, "BtPairedHistoryActivity"

    const-string v4, "Incorrect pairing type received"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private reFreshBluetoothList()V
    .locals 7

    .prologue
    .line 480
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    if-nez v3, :cond_1

    .line 501
    :cond_0
    :goto_0
    return-void

    .line 483
    :cond_1
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    .line 485
    .local v0, "btAdapter":Landroid/bluetooth/BluetoothAdapter;
    if-eqz v0, :cond_0

    .line 488
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v2

    .line 489
    .local v2, "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    sget-boolean v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v3, :cond_2

    const-string v3, "BtPairedHistoryActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "paird Devices count = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 490
    :cond_2
    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 491
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_4

    .line 492
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    const-string v4, "remote_device_macaddr"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mHfConnectedDeviceAddr:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 493
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    const-string v4, "remote_connect_status"

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f070017

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 491
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 496
    :cond_3
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    const-string v4, "remote_connect_status"

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f070015

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 499
    :cond_4
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapterPaired:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0
.end method

.method private readAutoAnswerData()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1697
    const-string v1, "bt.setting.autoanswer"

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1699
    .local v0, "sharedata":Landroid/content/SharedPreferences;
    const-string v1, "IS_BT_AUTO_ANSWER"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsAutoAnswer:Z

    .line 1700
    return-void
.end method

.method private readAutoConnectData()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1679
    const-string v1, "bt.setting.autoconnect"

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1681
    .local v0, "sharedata":Landroid/content/SharedPreferences;
    const-string v1, "IS_BT_AUTO_CONNECT"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsAutoConnect:Z

    .line 1682
    return-void
.end method

.method private readDeviceNamePin()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1656
    const-string v2, "device_name_data"

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1658
    .local v1, "sharedata":Landroid/content/SharedPreferences;
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothAdapter;->getName()Ljava/lang/String;

    move-result-object v0

    .line 1659
    .local v0, "devicename":Ljava/lang/String;
    const-string v2, "DEVICENAME"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mCurName:Ljava/lang/String;

    .line 1660
    const-string v2, "device_pin_data"

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1662
    const-string v2, "PIN"

    const-string v3, "0000"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPin:Ljava/lang/String;

    .line 1663
    return-void
.end method

.method private readLastConnectedDeviceData()V
    .locals 3

    .prologue
    .line 1638
    const-string v1, "preConnectedDevice_data"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1640
    .local v0, "sharedata":Landroid/content/SharedPreferences;
    const-string v1, "BTADDR"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLastConnectedDeviceAddr:Ljava/lang/String;

    .line 1641
    return-void
.end method

.method private sendSettingMsg(ILjava/lang/Object;)V
    .locals 4
    .param p1, "what"    # I
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 1817
    const/4 v0, 0x0

    .line 1818
    .local v0, "msg":Landroid/os/Message;
    sget-boolean v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BtPairedHistoryActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[Setting] sendSettingMsg("

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

    .line 1819
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSettingHandler:Landroid/os/Handler;

    if-eqz v1, :cond_2

    .line 1820
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSettingHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 1821
    iput p1, v0, Landroid/os/Message;->what:I

    .line 1822
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1823
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSettingHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1828
    :cond_1
    :goto_0
    return-void

    .line 1826
    :cond_2
    sget-boolean v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "BtPairedHistoryActivity"

    const-string v2, "[Setting]mSettingHandler is null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private setBluetoothDiscoverability(Z)V
    .locals 5
    .param p1, "isVisible"    # Z

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1070
    if-eqz p1, :cond_2

    .line 1071
    const/4 v0, -0x1

    .line 1073
    .local v0, "timeout":I
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "xy_bt_isVisible"

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1075
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    const/16 v2, 0x17

    invoke-virtual {v1, v2, v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->setScanMode(II)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1077
    invoke-direct {p0, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setDiscoveryModeStatus(Z)V

    .line 1078
    sget-boolean v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BtPairedHistoryActivity"

    const-string v2, "setScanMode : true"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1090
    .end local v0    # "timeout":I
    :cond_0
    :goto_0
    return-void

    .line 1080
    .restart local v0    # "timeout":I
    :cond_1
    invoke-direct {p0, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setDiscoveryModeStatus(Z)V

    .line 1081
    sget-boolean v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BtPairedHistoryActivity"

    const-string v2, "setScanMode : false 1"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1085
    .end local v0    # "timeout":I
    :cond_2
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "xy_bt_isVisible"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1086
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    const/16 v2, 0x15

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/LocalBluetoothManager;->setScanMode(I)Z

    .line 1087
    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setDiscoveryModeStatus(Z)V

    .line 1088
    sget-boolean v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BtPairedHistoryActivity"

    const-string v2, "setScanMode : false 2"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private setBtnEnable(Z)V
    .locals 1
    .param p1, "benable"    # Z

    .prologue
    .line 1016
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mScanButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1017
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mUnpairButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1018
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1019
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDisconnectButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1020
    return-void
.end method

.method private setDiscoveryModeStatus(Z)V
    .locals 2
    .param p1, "isDiscovery"    # Z

    .prologue
    .line 1093
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mBluetoothIsDiscovery:Z

    .line 1094
    if-eqz p1, :cond_0

    .line 1095
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 1099
    :goto_0
    return-void

    .line 1097
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setChecked(Z)V

    goto :goto_0
.end method

.method private setXybtPowerStatus(Z)V
    .locals 3
    .param p1, "onoffsta"    # Z

    .prologue
    const/4 v2, 0x1

    .line 1126
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->bAccoff:Z

    if-nez v0, :cond_0

    .line 1127
    if-ne p1, v2, :cond_1

    .line 1128
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "xy_bt_powered"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1134
    :cond_0
    :goto_0
    return-void

    .line 1131
    :cond_1
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "xy_bt_powered"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_0
.end method

.method private showUpdateDialog()V
    .locals 3

    .prologue
    .line 992
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    if-nez v0, :cond_0

    .line 993
    new-instance v0, Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    .line 995
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f0700d3

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 996
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const/high16 v1, 0x7f070000

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 997
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f0200ef

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 998
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f070088

    new-instance v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity$5;

    invoke-direct {v2, p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$5;-><init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1008
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f070089

    new-instance v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity$6;

    invoke-direct {v2, p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$6;-><init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1013
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1014
    return-void
.end method

.method private startBTSettingTimer(I)V
    .locals 6
    .param p1, "timer_type"    # I

    .prologue
    .line 1831
    sget-object v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTimer:Ljava/util/Timer;

    if-nez v0, :cond_0

    .line 1832
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    sput-object v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTimer:Ljava/util/Timer;

    .line 1834
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTaskList:Ljava/util/HashMap;

    if-nez v0, :cond_1

    .line 1835
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTaskList:Ljava/util/HashMap;

    .line 1837
    :cond_1
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v0, :cond_2

    const-string v0, "BtPairedHistoryActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startBTSettingTimer:timer_type = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1838
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTaskList:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_6

    .line 1839
    if-nez p1, :cond_5

    .line 1840
    new-instance v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$9;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$9;-><init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    sput-object v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTask:Ljava/util/TimerTask;

    .line 1855
    sget-object v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTimer:Ljava/util/Timer;

    sget-object v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTask:Ljava/util/TimerTask;

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 1939
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTaskList:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTask:Ljava/util/TimerTask;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1943
    :cond_4
    :goto_1
    return-void

    .line 1856
    :cond_5
    const/4 v0, 0x1

    if-ne v0, p1, :cond_3

    .line 1857
    new-instance v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$10;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$10;-><init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    sput-object v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTask:Ljava/util/TimerTask;

    .line 1935
    const/4 v0, 0x0

    sput v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mbtOffTime:I

    .line 1936
    sget-object v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTimer:Ljava/util/Timer;

    sget-object v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTask:Ljava/util/TimerTask;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x12c

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    goto :goto_0

    .line 1941
    :cond_6
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v0, :cond_4

    const-string v0, "BtPairedHistoryActivity"

    const-string v1, "startBTSettingTimer: already start!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private stopBTSettingTimer(I)V
    .locals 5
    .param p1, "timer_type"    # I

    .prologue
    const/4 v4, 0x0

    .line 1947
    sget-boolean v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BtPairedHistoryActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "stopBTSettingTimer: timer_type = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1949
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTaskList:Ljava/util/HashMap;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTaskList:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1950
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTaskList:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/TimerTask;

    .line 1951
    .local v0, "task":Ljava/util/TimerTask;
    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 1952
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTaskList:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1953
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTaskList:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 1954
    sget-object v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTimer:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    .line 1955
    sget-object v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTimer:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->purge()I

    .line 1956
    sput-object v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTimer:Ljava/util/Timer;

    .line 1957
    iput-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mTaskList:Ljava/util/HashMap;

    .line 1960
    .end local v0    # "task":Ljava/util/TimerTask;
    :cond_1
    return-void
.end method

.method private updateBluetoothUI(I)V
    .locals 3
    .param p1, "on_off"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1043
    if-ne v1, p1, :cond_1

    .line 1044
    sget-object v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/MyTabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TabWidget;->setEnabled(Z)V

    .line 1045
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1046
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1048
    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setBtnEnable(Z)V

    .line 1051
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListView:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEnabled(Z)V

    .line 1065
    :cond_0
    :goto_0
    return-void

    .line 1053
    :cond_1
    if-nez p1, :cond_0

    .line 1054
    sget-object v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/MyTabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/TabWidget;->setEnabled(Z)V

    .line 1055
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mScanLayout:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1056
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1057
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, v2}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1059
    invoke-direct {p0, v2}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setBtnEnable(Z)V

    .line 1062
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListView:Landroid/widget/ListView;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setEnabled(Z)V

    goto :goto_0
.end method

.method private writeAutoAnswerData(Z)V
    .locals 4
    .param p1, "isAutoAnswer"    # Z

    .prologue
    .line 1685
    const-string v2, "bt.setting.autoanswer"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1687
    .local v1, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "IS_BT_AUTO_ANSWER"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1691
    new-instance v0, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v0, v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 1693
    .local v0, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 1694
    return-void
.end method

.method private writeAutoConnectData(Z)V
    .locals 4
    .param p1, "isAutoConnect"    # Z

    .prologue
    .line 1667
    const-string v2, "bt.setting.autoconnect"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1669
    .local v1, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "IS_BT_AUTO_CONNECT"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1673
    new-instance v0, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v0, v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 1675
    .local v0, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 1676
    return-void
.end method

.method private writeDeviceNamePin(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "devicename"    # Ljava/lang/String;
    .param p2, "pin"    # Ljava/lang/String;

    .prologue
    .line 1645
    const-string v2, "device_name_data"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1647
    .local v1, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "DEVICENAME"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1648
    const-string v2, "PIN"

    invoke-interface {v1, v2, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1650
    new-instance v0, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v0, v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 1652
    .local v0, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 1653
    return-void
.end method

.method private writeLastConnectedDeviceData(Ljava/lang/String;)V
    .locals 4
    .param p1, "BT_ADDR"    # Ljava/lang/String;

    .prologue
    .line 1626
    const-string v2, "preConnectedDevice_data"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1628
    .local v1, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "BTADDR"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1632
    new-instance v0, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v0, v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 1634
    .local v0, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 1635
    return-void
.end method

.method private writedisconnectState(I)V
    .locals 5
    .param p1, "state"    # I

    .prologue
    .line 683
    const-string v2, "BtPairedHistoryActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "writedisconnectState..state = ."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 684
    const-string v2, "bt_disconnect_state"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 686
    .local v1, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "BT_STATE"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 687
    new-instance v0, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v0, v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 689
    .local v0, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 690
    return-void
.end method


# virtual methods
.method public cancelDiscovery()V
    .locals 1

    .prologue
    .line 1810
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1811
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 1813
    :cond_0
    return-void
.end method

.method public connectAvrcp(Landroid/content/Intent;)V
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x1

    .line 1611
    const-string v3, "device_addr"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1612
    .local v1, "addr":Ljava/lang/String;
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 1614
    .local v0, "AVRCPConnectDevice":Landroid/bluetooth/BluetoothDevice;
    sget v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mAvrcpState:I

    if-eq v3, v4, :cond_1

    sget v3, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    if-eq v3, v4, :cond_1

    if-eqz v0, :cond_1

    .line 1617
    sget-boolean v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v3, :cond_0

    .line 1618
    const-string v3, "BtPairedHistoryActivity"

    const-string v4, "connectAvrcp"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1619
    :cond_0
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v2

    .line 1621
    .local v2, "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    sget-object v3, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_AVRCP_CT:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v2, v3}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->connect(Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;)V

    .line 1623
    .end local v2    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :cond_1
    return-void
.end method

.method public disConnectAvrcp(Landroid/content/Intent;)V
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x1

    .line 1596
    const-string v3, "device_addr"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1597
    .local v1, "addr":Ljava/lang/String;
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 1599
    .local v0, "AVRCPConnectDevice":Landroid/bluetooth/BluetoothDevice;
    sget v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mAvrcpState:I

    if-eq v3, v4, :cond_0

    sget v3, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    if-ne v3, v4, :cond_2

    :cond_0
    if-eqz v0, :cond_2

    .line 1602
    sget-boolean v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v3, :cond_1

    .line 1603
    const-string v3, "BtPairedHistoryActivity"

    const-string v4, "disConnectAvrcp"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1604
    :cond_1
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v2

    .line 1606
    .local v2, "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    sget-object v3, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_AVRCP_CT:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v2, v3}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->disconnect(Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;)V

    .line 1608
    .end local v2    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :cond_2
    return-void
.end method

.method public getScanStatus()Z
    .locals 1

    .prologue
    .line 1801
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1802
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsScaning:Z

    .line 1806
    :goto_0
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsScaning:Z

    return v0

    .line 1804
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsScaning:Z

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 9
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v8, -0x1

    const/16 v6, 0x8

    const v7, 0x7f0200d9

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 692
    const/4 v2, 0x0

    .line 693
    .local v2, "deviceInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v0, ""

    .line 694
    .local v0, "address":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 944
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 698
    :pswitch_1
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListViewPaired:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getVisibility()I

    move-result v3

    if-nez v3, :cond_1

    .line 699
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListViewPaired:Landroid/widget/ListView;

    invoke-virtual {v3, v6}, Landroid/widget/ListView;->setVisibility(I)V

    .line 700
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_t:Landroid/widget/ImageButton;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0200d8

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 704
    :cond_1
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListViewPaired:Landroid/widget/ListView;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setVisibility(I)V

    .line 705
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_t:Landroid/widget/ImageButton;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 711
    :pswitch_2
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListView:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getVisibility()I

    move-result v3

    if-nez v3, :cond_2

    .line 712
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListView:Landroid/widget/ListView;

    invoke-virtual {v3, v6}, Landroid/widget/ListView;->setVisibility(I)V

    .line 713
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_b:Landroid/widget/ImageButton;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0200d8

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 717
    :cond_2
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListView:Landroid/widget/ListView;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setVisibility(I)V

    .line 718
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_b:Landroid/widget/ImageButton;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 725
    :pswitch_3
    iget-boolean v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetooth:Z

    if-eqz v5, :cond_4

    .line 726
    sget-boolean v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v3, :cond_3

    const-string v3, "BtPairedHistoryActivity"

    const-string v4, "set BluetoothAdapter.STATE_OFF"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 727
    :cond_3
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->showUpdateDialog()V

    goto :goto_0

    .line 730
    :cond_4
    sget-boolean v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v5, :cond_5

    const-string v5, "BtPairedHistoryActivity"

    const-string v6, "set BluetoothAdapter.STATE_ON"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 731
    :cond_5
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v5, v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->setBluetoothEnabled(Z)V

    .line 732
    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->writedisconnectState(I)V

    .line 733
    iget-boolean v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mBluetoothIsDiscovery:Z

    invoke-direct {p0, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setBluetoothDiscoverability(Z)V

    goto/16 :goto_0

    .line 740
    :pswitch_4
    iget-boolean v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mBluetoothIsDiscovery:Z

    if-nez v5, :cond_6

    :goto_1
    invoke-direct {p0, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setBluetoothDiscoverability(Z)V

    goto/16 :goto_0

    :cond_6
    move v3, v4

    goto :goto_1

    .line 767
    :pswitch_5
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListViewPaired:Landroid/widget/ListView;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setVisibility(I)V

    .line 768
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_t:Landroid/widget/ImageButton;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 770
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_0

    iget v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndexPaired:I

    if-ltz v3, :cond_0

    .line 772
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    iget v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndexPaired:I

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "deviceInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    check-cast v2, Ljava/util/HashMap;

    .line 773
    .restart local v2    # "deviceInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "remote_device_macaddr"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "address":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 774
    .restart local v0    # "address":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->checkBluetoothAddress(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 777
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    sput-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 778
    iget v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndexPaired:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndexPaired:I

    .line 780
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 781
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 783
    :cond_7
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v3, :cond_8

    .line 784
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v3, v6}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StopDownload(I)Z

    .line 786
    :cond_8
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mSmsSyncProxy:Lcom/autochips/bluetooth/dundt/SMSSyncManager;

    if-eqz v3, :cond_9

    .line 787
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mSmsSyncProxy:Lcom/autochips/bluetooth/dundt/SMSSyncManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/dundt/SMSSyncManager;->StopDownload()Z

    .line 789
    :cond_9
    sget-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v3, :cond_0

    .line 790
    sget-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v3

    const/16 v5, 0xc

    if-ne v3, v5, :cond_0

    .line 791
    sget-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v3}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->removeBond(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v3

    if-nez v3, :cond_a

    .line 792
    sget-boolean v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "BtPairedHistoryActivity"

    const-string v4, "removeBond Error"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 796
    :cond_a
    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->writedisconnectState(I)V

    goto/16 :goto_0

    .line 808
    :pswitch_6
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListViewPaired:Landroid/widget/ListView;

    invoke-virtual {v5, v4}, Landroid/widget/ListView;->setVisibility(I)V

    .line 809
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_t:Landroid/widget/ImageButton;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 811
    const-string v5, "BtPairedHistoryActivity"

    const-string v6, "==============btn connect================"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 812
    iget v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndexPaired:I

    if-ne v5, v8, :cond_c

    iget v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndex:I

    if-eq v5, v8, :cond_c

    iget v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndex:I

    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_c

    .line 813
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    iget v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndex:I

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "deviceInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    check-cast v2, Ljava/util/HashMap;

    .line 814
    .restart local v2    # "deviceInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "remote_device_macaddr"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "address":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 815
    .restart local v0    # "address":Ljava/lang/String;
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    sput-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 817
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 818
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 820
    :cond_b
    sget-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v3, :cond_0

    .line 821
    sget-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v3

    const/16 v4, 0xc

    if-eq v3, v4, :cond_0

    .line 826
    sget-object v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->createBond()Z

    move-result v3

    if-nez v3, :cond_0

    .line 827
    sget-boolean v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "BtPairedHistoryActivity"

    const-string v4, "createBond Error"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 832
    :cond_c
    iget v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndexPaired:I

    if-eq v5, v8, :cond_0

    .line 833
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_0

    .line 834
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    iget v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndexPaired:I

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "deviceInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    check-cast v2, Ljava/util/HashMap;

    .line 835
    .restart local v2    # "deviceInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "remote_device_macaddr"

    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "address":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 836
    .restart local v0    # "address":Ljava/lang/String;
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v5

    sput-object v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 839
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v5

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v5

    if-eqz v5, :cond_d

    .line 840
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v5

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 843
    :cond_d
    sget-boolean v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    if-eq v5, v3, :cond_0

    .line 848
    sget-object v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v5, :cond_10

    .line 849
    sget-object v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v5

    const/16 v6, 0xc

    if-ne v5, v6, :cond_e

    .line 850
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v3, v4}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v1

    .line 853
    .local v1, "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v1}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->onClicked()V

    goto/16 :goto_0

    .line 860
    .end local v1    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :cond_e
    sget-object v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothDevice;->createBond()Z

    move-result v5

    if-nez v5, :cond_f

    .line 861
    sget-boolean v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "BtPairedHistoryActivity"

    const-string v4, "pair Bluetooth device Error"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 863
    :cond_f
    sput-boolean v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    .line 864
    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->writedisconnectState(I)V

    goto/16 :goto_0

    .line 868
    :cond_10
    sget-boolean v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "BtPairedHistoryActivity"

    const-string v4, "device null"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 877
    :pswitch_7
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListViewPaired:Landroid/widget/ListView;

    invoke-virtual {v5, v4}, Landroid/widget/ListView;->setVisibility(I)V

    .line 878
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_t:Landroid/widget/ImageButton;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 880
    sget-boolean v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    if-ne v4, v3, :cond_0

    iget v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndexPaired:I

    if-ltz v4, :cond_0

    .line 881
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    iget v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceIndexPaired:I

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "deviceInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    check-cast v2, Ljava/util/HashMap;

    .line 882
    .restart local v2    # "deviceInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "remote_device_macaddr"

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "address":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 883
    .restart local v0    # "address":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->checkBluetoothAddress(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 887
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v4

    sput-object v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 888
    sget-boolean v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    if-eqz v4, :cond_0

    .line 893
    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v4, :cond_11

    .line 894
    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v4, v6}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StopDownload(I)Z

    .line 896
    :cond_11
    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mSmsSyncProxy:Lcom/autochips/bluetooth/dundt/SMSSyncManager;

    if-eqz v4, :cond_12

    .line 897
    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mSmsSyncProxy:Lcom/autochips/bluetooth/dundt/SMSSyncManager;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/dundt/SMSSyncManager;->StopDownload()Z

    .line 899
    :cond_12
    sget-object v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    sget-object v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v4, v5}, Landroid/bluetooth/BluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 900
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    sget-object v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v4, v5}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v1

    .line 902
    .restart local v1    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v1}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->disconnect()V

    .line 903
    invoke-direct {p0, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->writedisconnectState(I)V

    goto/16 :goto_0

    .line 917
    .end local v1    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :pswitch_8
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListView:Landroid/widget/ListView;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setVisibility(I)V

    .line 918
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_b:Landroid/widget/ImageButton;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 921
    iget-boolean v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetooth:Z

    if-eqz v3, :cond_15

    .line 922
    sget-boolean v3, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v3, :cond_13

    .line 923
    const-string v3, "BtPairedHistoryActivity"

    const-string v4, "bluetooth startScanning"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 925
    :cond_13
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v3, :cond_14

    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->getA2dpSinkStateValue()I

    move-result v3

    const/16 v4, 0xf

    if-ne v3, v4, :cond_14

    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->getA2dpAddr()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_14

    .line 928
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->getA2dpAddr()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->pause(Ljava/lang/String;)Z

    .line 930
    :cond_14
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->doDiscovery()V

    goto/16 :goto_0

    .line 932
    :cond_15
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v5, "Open Bluetooth first"

    invoke-static {v3, v5, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 694
    :pswitch_data_0
    .packed-switch 0x7f0a0057
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_8
        :pswitch_6
        :pswitch_7
        :pswitch_5
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v4, 0x7f030013

    const/4 v12, 0x2

    const/4 v11, 0x3

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 362
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 363
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtPairedHistoryActivity"

    const-string v1, "+++ onCreate +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    :cond_0
    const v0, 0x7f03000b

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setContentView(I)V

    .line 368
    const v0, 0x7f0a0060

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListView:Landroid/widget/ListView;

    .line 369
    const v0, 0x7f0a005c

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListViewPaired:Landroid/widget/ListView;

    .line 372
    const v0, 0x7f0a0057

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    .line 373
    const v0, 0x7f0a0058

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ToggleButton;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    .line 374
    const v0, 0x7f0a0061

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mScanButton:Landroid/widget/ImageButton;

    .line 375
    const v0, 0x7f0a0064

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mUnpairButton:Landroid/widget/ImageButton;

    .line 376
    const v0, 0x7f0a0062

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectButton:Landroid/widget/ImageButton;

    .line 378
    const v0, 0x7f0a005f

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_b:Landroid/widget/ImageButton;

    .line 379
    const v0, 0x7f0a005b

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_t:Landroid/widget/ImageButton;

    .line 381
    const v0, 0x7f0a0063

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDisconnectButton:Landroid/widget/ImageButton;

    .line 382
    const v0, 0x7f0a0065

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mScanLayout:Landroid/widget/LinearLayout;

    .line 384
    const v0, 0x7f0a005a

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_title:Landroid/widget/TextView;

    .line 385
    const v0, 0x7f0a005e

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->usable_devices_title:Landroid/widget/TextView;

    .line 387
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    .line 389
    new-instance v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceList:Ljava/util/ArrayList;

    new-array v5, v11, [Ljava/lang/String;

    const-string v1, "remote_device_name"

    aput-object v1, v5, v9

    const-string v1, "remote_connect_status"

    aput-object v1, v5, v10

    const-string v1, "remote_device_macaddr"

    aput-object v1, v5, v12

    new-array v6, v11, [I

    fill-array-data v6, :array_0

    move-object v1, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;-><init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapter:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    .line 398
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapter:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 399
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 401
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    .line 402
    new-instance v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListPaired:Ljava/util/ArrayList;

    new-array v5, v11, [Ljava/lang/String;

    const-string v1, "remote_device_name"

    aput-object v1, v5, v9

    const-string v1, "remote_connect_status"

    aput-object v1, v5, v10

    const-string v1, "remote_device_macaddr"

    aput-object v1, v5, v12

    new-array v6, v11, [I

    fill-array-data v6, :array_1

    move-object v1, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;-><init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapterPaired:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    .line 410
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListViewPaired:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mPairedDevicesArrayAdapterPaired:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 411
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceListViewPaired:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDeviceClickListenerPaired:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 415
    invoke-static {p0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    .line 416
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    if-nez v0, :cond_1

    .line 417
    const-string v0, "Bluetooth is not available"

    invoke-static {p0, v0, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 419
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->finish()V

    .line 476
    :goto_0
    return-void

    .line 423
    :cond_1
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->checkBluetoothStatus()V

    .line 424
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->initBluetoothDeviceList()V

    .line 425
    const-string v0, "PAIR"

    const-string v1, "===================registerReceiver====================="

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 426
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mOpenBluetoothButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 427
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mVisibleButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, p0}, Landroid/widget/ToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 428
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mScanButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 429
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mUnpairButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 430
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 431
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mDisconnectButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 433
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_title:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 434
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->usable_devices_title:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 436
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_t:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 437
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->paired_devices_btn_b:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 440
    new-instance v8, Landroid/content/IntentFilter;

    invoke-direct {v8}, Landroid/content/IntentFilter;-><init>()V

    .line 441
    .local v8, "intentFilter":Landroid/content/IntentFilter;
    const-string v0, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 442
    const-string v0, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 443
    const-string v0, "android.bluetooth.adapter.action.SCAN_MODE_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 444
    const-string v0, "android.bluetooth.device.action.BOND_STATE_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 445
    const-string v0, "android.bluetooth.device.action.FOUND"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 446
    const-string v0, "android.bluetooth.device.action.PAIRING_REQUEST"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 447
    const-string v0, "android.bluetooth.device.action.NAME_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 448
    const-string v0, "android.bluetooth.adapter.action.DISCOVERY_STARTED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 449
    const-string v0, "android.bluetooth.adapter.action.DISCOVERY_FINISHED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 450
    const-string v0, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.CALLSETUP_STATE_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 451
    const-string v0, "xy.android.bt.unpair.success"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 452
    const-string v0, "xy.com.autochips.bluetooth.bt.statuscheck"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 453
    const-string v0, "xy.android.acc.off"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 454
    const-string v0, "xy.android.acc.on"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 455
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0, v8}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 458
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->checkIfAbnormal()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 459
    const-string v0, "BtPairedHistoryActivity"

    const-string v1, "Bluetooth reseting"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    sput-boolean v9, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldPbWhenConnect:Z

    .line 461
    sput-boolean v9, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldClyWhenConnect:Z

    .line 462
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->resetBluetoothAdapter(Landroid/content/Context;)V

    .line 465
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mSettingHandler:Landroid/os/Handler;

    invoke-static {v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->setHandler(Landroid/os/Handler;)V

    .line 466
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "xy_bt_isVisible"

    invoke-static {v0, v1, v10}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v7

    .line 467
    .local v7, "bisVisible":I
    if-eqz v7, :cond_4

    .line 468
    iput-boolean v10, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mBluetoothIsDiscovery:Z

    .line 473
    :goto_1
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v0, :cond_3

    const-string v0, "BtPairedHistoryActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mBluetoothIsDiscovery = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mBluetoothIsDiscovery:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 474
    :cond_3
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mBluetoothIsDiscovery:Z

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->setBluetoothDiscoverability(Z)V

    goto/16 :goto_0

    .line 471
    :cond_4
    iput-boolean v9, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mBluetoothIsDiscovery:Z

    goto :goto_1

    .line 389
    nop

    :array_0
    .array-data 4
        0x7f0a008f
        0x7f0a0090
        0x7f0a0091
    .end array-data

    .line 402
    :array_1
    .array-data 4
        0x7f0a008f
        0x7f0a0090
        0x7f0a0091
    .end array-data
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 616
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 617
    const-string v0, "BtPairedHistoryActivity"

    const-string v1, "+++ onDestroy +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 621
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 624
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 625
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 627
    :cond_1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 629
    return-void
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 605
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 606
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 608
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 609
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 610
    const-string v0, "BtPairedHistoryActivity"

    const-string v1, "+++ onPause +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 611
    :cond_1
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 594
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 595
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 596
    const-string v0, "BtPairedHistoryActivity"

    const-string v1, "+++ onResume +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 598
    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->sendSettingMsg(ILjava/lang/Object;)V

    .line 600
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outstate"    # Landroid/os/Bundle;

    .prologue
    .line 590
    return-void
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 580
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 581
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 582
    const-string v0, "BtPairedHistoryActivity"

    const-string v1, "+++ onStart +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 584
    :cond_0
    return-void
.end method
