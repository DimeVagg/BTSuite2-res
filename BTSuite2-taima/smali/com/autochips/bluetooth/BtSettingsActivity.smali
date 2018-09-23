.class public Lcom/autochips/bluetooth/BtSettingsActivity;
.super Landroid/app/Activity;
.source "BtSettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static DEBUG:Z = false

.field static final DEFAULT_DISCOVERABLE_TIMEOUT:I = -0x1

.field static final SHARED_PREFERENCES_KEY_DISCOVERABLE_END_TIMESTAMP:Ljava/lang/String; = "discoverable_end_timestamp"

.field private static final TAG:Ljava/lang/String; = "BtSettingsActivity"

.field private static final TIMER_BT_AUTO_CONNECT:I = 0x0

.field private static final TIMER_BT_POWER_OFF:I = 0x1

.field public static mA2dpState:I

.field private static mAvrcpConnectCount:I

.field public static mAvrcpState:I

.field public static mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

.field public static mIsHFConnected:Z

.field private static mMinPinLength:I

.field public static mPin:Ljava/lang/String;

.field private static mTask:Ljava/util/TimerTask;

.field private static mTimer:Ljava/util/Timer;

.field private static mbtOffStep:I


# instance fields
.field private final MSG_ADD_DEVICE:I

.field private editBTNameDialog:Landroid/app/Dialog;

.field private editBTPinDialog:Landroid/app/Dialog;

.field private edt_devicename:Landroid/widget/EditText;

.field private edt_pin:Landroid/widget/EditText;

.field private mAutoAnswerButton:Landroid/widget/Button;

.field private mAutoConnectButton:Landroid/widget/Button;

.field private mBluetoothIsDiscovery:Z

.field private mCurName:Ljava/lang/String;

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

.field private mEditNameButton:Landroid/widget/ImageButton;

.field private mEditNameTv:Landroid/widget/TextView;

.field private mEditPinButton:Landroid/widget/ImageButton;

.field private mEditPinTv:Landroid/widget/TextView;

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

.field private mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

.field private mOpenBluetooth:Z

.field private mPairedDevicesArrayAdapter:Landroid/widget/SimpleAdapter;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mToast:Landroid/widget/Toast;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 86
    const/4 v0, 0x1

    sput-boolean v0, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    .line 89
    sput-boolean v1, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsHFConnected:Z

    .line 90
    sput-object v2, Lcom/autochips/bluetooth/BtSettingsActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 106
    const-string v0, "0000"

    sput-object v0, Lcom/autochips/bluetooth/BtSettingsActivity;->mPin:Ljava/lang/String;

    .line 107
    const/4 v0, 0x4

    sput v0, Lcom/autochips/bluetooth/BtSettingsActivity;->mMinPinLength:I

    .line 120
    sput v3, Lcom/autochips/bluetooth/BtSettingsActivity;->mA2dpState:I

    .line 121
    sput v3, Lcom/autochips/bluetooth/BtSettingsActivity;->mAvrcpState:I

    .line 122
    sput v1, Lcom/autochips/bluetooth/BtSettingsActivity;->mAvrcpConnectCount:I

    .line 128
    sput-object v2, Lcom/autochips/bluetooth/BtSettingsActivity;->mTimer:Ljava/util/Timer;

    .line 129
    sput-object v2, Lcom/autochips/bluetooth/BtSettingsActivity;->mTask:Ljava/util/TimerTask;

    .line 130
    sput v1, Lcom/autochips/bluetooth/BtSettingsActivity;->mbtOffStep:I

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 84
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 100
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mListDeviceMacs:Ljava/util/Set;

    .line 103
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mOpenBluetooth:Z

    .line 104
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mBluetoothIsDiscovery:Z

    .line 108
    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mCurName:Ljava/lang/String;

    .line 110
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoAnswer:Z

    .line 111
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoConnect:Z

    .line 112
    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mLastConnectedDeviceAddr:Ljava/lang/String;

    .line 115
    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->edt_devicename:Landroid/widget/EditText;

    .line 116
    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->edt_pin:Landroid/widget/EditText;

    .line 123
    iput v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->MSG_ADD_DEVICE:I

    .line 124
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsScaning:Z

    .line 131
    new-instance v0, Lcom/autochips/bluetooth/BtSettingsActivity$1;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtSettingsActivity$1;-><init>(Lcom/autochips/bluetooth/BtSettingsActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 145
    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditNameTv:Landroid/widget/TextView;

    .line 146
    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditPinTv:Landroid/widget/TextView;

    .line 147
    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditNameButton:Landroid/widget/ImageButton;

    .line 148
    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditPinButton:Landroid/widget/ImageButton;

    .line 150
    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoConnectButton:Landroid/widget/Button;

    .line 151
    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoAnswerButton:Landroid/widget/Button;

    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 84
    sget-boolean v0, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    return v0
.end method

.method static synthetic access$100(Lcom/autochips/bluetooth/BtSettingsActivity;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtSettingsActivity;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->edt_devicename:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/autochips/bluetooth/BtSettingsActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtSettingsActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtSettingsActivity;->writeDevicePin(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/autochips/bluetooth/BtSettingsActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtSettingsActivity;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditPinTv:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/autochips/bluetooth/BtSettingsActivity;)Landroid/app/Dialog;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtSettingsActivity;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTPinDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$200(Lcom/autochips/bluetooth/BtSettingsActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtSettingsActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtSettingsActivity;->writeDeviceName(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/autochips/bluetooth/BtSettingsActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtSettingsActivity;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditNameTv:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/autochips/bluetooth/BtSettingsActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtSettingsActivity;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mCurName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$402(Lcom/autochips/bluetooth/BtSettingsActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtSettingsActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mCurName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$500(Lcom/autochips/bluetooth/BtSettingsActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtSettingsActivity;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    return-object v0
.end method

.method static synthetic access$600(Lcom/autochips/bluetooth/BtSettingsActivity;)Landroid/app/Dialog;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtSettingsActivity;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTNameDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$700(Lcom/autochips/bluetooth/BtSettingsActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtSettingsActivity;
    .param p1, "x1"    # I

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtSettingsActivity;->showToast(I)V

    return-void
.end method

.method static synthetic access$800(Lcom/autochips/bluetooth/BtSettingsActivity;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtSettingsActivity;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->edt_pin:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$900()I
    .locals 1

    .prologue
    .line 84
    sget v0, Lcom/autochips/bluetooth/BtSettingsActivity;->mMinPinLength:I

    return v0
.end method

.method private buildEditNameDialog(Landroid/content/Context;)V
    .locals 4
    .param p1, "contxt"    # Landroid/content/Context;

    .prologue
    .line 326
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 327
    .local v1, "factory":Landroid/view/LayoutInflater;
    const v2, 0x7f030006

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 328
    .local v0, "editBTNameView":Landroid/view/View;
    new-instance v2, Landroid/app/Dialog;

    invoke-direct {v2, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTNameDialog:Landroid/app/Dialog;

    .line 329
    iget-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTNameDialog:Landroid/app/Dialog;

    if-nez v2, :cond_1

    .line 330
    sget-boolean v2, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BtSettingsActivity"

    const-string v3, "buildEditNameDialog failure!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    :cond_0
    :goto_0
    return-void

    .line 333
    :cond_1
    const v2, 0x7f0a003c

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->edt_devicename:Landroid/widget/EditText;

    .line 335
    iget-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTNameDialog:Landroid/app/Dialog;

    invoke-virtual {v2, v0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 336
    iget-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTNameDialog:Landroid/app/Dialog;

    const v3, 0x7f070087

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->setTitle(I)V

    .line 337
    iget-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTNameDialog:Landroid/app/Dialog;

    const v3, 0x7f0a003d

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    new-instance v3, Lcom/autochips/bluetooth/BtSettingsActivity$2;

    invoke-direct {v3, p0}, Lcom/autochips/bluetooth/BtSettingsActivity$2;-><init>(Lcom/autochips/bluetooth/BtSettingsActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 358
    iget-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTNameDialog:Landroid/app/Dialog;

    const v3, 0x7f0a003e

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    new-instance v3, Lcom/autochips/bluetooth/BtSettingsActivity$3;

    invoke-direct {v3, p0}, Lcom/autochips/bluetooth/BtSettingsActivity$3;-><init>(Lcom/autochips/bluetooth/BtSettingsActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method

.method private buildEditPinDialog(Landroid/content/Context;)V
    .locals 4
    .param p1, "contxt"    # Landroid/content/Context;

    .prologue
    .line 367
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 368
    .local v1, "factory":Landroid/view/LayoutInflater;
    const v2, 0x7f030008

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 369
    .local v0, "editBTNameView":Landroid/view/View;
    new-instance v2, Landroid/app/Dialog;

    invoke-direct {v2, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTPinDialog:Landroid/app/Dialog;

    .line 370
    iget-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTPinDialog:Landroid/app/Dialog;

    if-nez v2, :cond_1

    .line 371
    sget-boolean v2, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BtSettingsActivity"

    const-string v3, "buildEditNameDialog failure!"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    :cond_0
    :goto_0
    return-void

    .line 374
    :cond_1
    const v2, 0x7f0a003f

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->edt_pin:Landroid/widget/EditText;

    .line 376
    iget-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTPinDialog:Landroid/app/Dialog;

    invoke-virtual {v2, v0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 377
    iget-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTPinDialog:Landroid/app/Dialog;

    const v3, 0x7f070087

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->setTitle(I)V

    .line 378
    iget-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTPinDialog:Landroid/app/Dialog;

    const v3, 0x7f0a0042

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    new-instance v3, Lcom/autochips/bluetooth/BtSettingsActivity$4;

    invoke-direct {v3, p0}, Lcom/autochips/bluetooth/BtSettingsActivity$4;-><init>(Lcom/autochips/bluetooth/BtSettingsActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 396
    iget-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTPinDialog:Landroid/app/Dialog;

    const v3, 0x7f0a0043

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    new-instance v3, Lcom/autochips/bluetooth/BtSettingsActivity$5;

    invoke-direct {v3, p0}, Lcom/autochips/bluetooth/BtSettingsActivity$5;-><init>(Lcom/autochips/bluetooth/BtSettingsActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method

.method private checkBluetoothStatus()V
    .locals 4

    .prologue
    const v3, 0x7f0200b7

    const v2, 0x7f0200b6

    .line 406
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->readAutoConnectData()V

    .line 407
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoConnect:Z

    if-eqz v0, :cond_1

    .line 408
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoConnectButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 415
    :goto_0
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->readAutoAnswerData()V

    .line 416
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoAnswer:Z

    if-eqz v0, :cond_2

    .line 417
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoAnswerButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 423
    :goto_1
    sget-boolean v0, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtSettingsActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AutoConnect= "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoConnect:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " IsAutoAnswer ="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoAnswer:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    :cond_0
    return-void

    .line 411
    :cond_1
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoConnectButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 420
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoAnswerButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1
.end method

.method private readAutoAnswerData()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 505
    const-string v1, "bt.setting.autoanswer"

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/BtSettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 507
    .local v0, "sharedata":Landroid/content/SharedPreferences;
    const-string v1, "IS_BT_AUTO_ANSWER"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoAnswer:Z

    .line 508
    return-void
.end method

.method private readAutoConnectData()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 487
    const-string v1, "bt.setting.autoconnect"

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/BtSettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 489
    .local v0, "sharedata":Landroid/content/SharedPreferences;
    const-string v1, "IS_BT_AUTO_CONNECT"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoConnect:Z

    .line 490
    return-void
.end method

.method private readDeviceName()V
    .locals 4

    .prologue
    .line 447
    const-string v2, "device_name_data"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtSettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 449
    .local v1, "sharedata":Landroid/content/SharedPreferences;
    iget-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothAdapter;->getName()Ljava/lang/String;

    move-result-object v0

    .line 450
    .local v0, "devicename":Ljava/lang/String;
    const-string v2, "DEVICENAME"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mCurName:Ljava/lang/String;

    .line 451
    return-void
.end method

.method private readDeviceNamePin()V
    .locals 4

    .prologue
    .line 469
    const-string v2, "device_name_pin_data"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtSettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 471
    .local v1, "sharedata":Landroid/content/SharedPreferences;
    iget-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothAdapter;->getName()Ljava/lang/String;

    move-result-object v0

    .line 472
    .local v0, "devicename":Ljava/lang/String;
    const-string v2, "DEVICENAME"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mCurName:Ljava/lang/String;

    .line 473
    const-string v2, "PIN"

    const-string v3, "0000"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/autochips/bluetooth/BtSettingsActivity;->mPin:Ljava/lang/String;

    .line 474
    return-void
.end method

.method private readDevicePin()V
    .locals 3

    .prologue
    .line 454
    const-string v1, "device_pin_data"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/BtSettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 455
    .local v0, "sharedata":Landroid/content/SharedPreferences;
    const-string v1, "PIN"

    const-string v2, "0000"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/autochips/bluetooth/BtSettingsActivity;->mPin:Ljava/lang/String;

    .line 456
    return-void
.end method

.method private showToast(I)V
    .locals 3
    .param p1, "resid"    # I

    .prologue
    .line 318
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mToast:Landroid/widget/Toast;

    if-nez v0, :cond_0

    .line 319
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, ""

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mToast:Landroid/widget/Toast;

    .line 321
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0, p1}, Landroid/widget/Toast;->setText(I)V

    .line 322
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 323
    return-void
.end method

.method private writeAutoAnswerData(Z)V
    .locals 4
    .param p1, "isAutoAnswer"    # Z

    .prologue
    .line 493
    const-string v2, "bt.setting.autoanswer"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtSettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 495
    .local v1, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "IS_BT_AUTO_ANSWER"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 499
    new-instance v0, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v0, v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 501
    .local v0, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 502
    return-void
.end method

.method private writeAutoConnectData(Z)V
    .locals 4
    .param p1, "isAutoConnect"    # Z

    .prologue
    .line 478
    const-string v2, "bt.setting.autoconnect"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtSettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 480
    .local v1, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "IS_BT_AUTO_CONNECT"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 481
    new-instance v0, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v0, v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 483
    .local v0, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 484
    return-void
.end method

.method private writeDeviceName(Ljava/lang/String;)V
    .locals 4
    .param p1, "devicename"    # Ljava/lang/String;

    .prologue
    .line 427
    const-string v2, "device_name_data"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtSettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 429
    .local v1, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "DEVICENAME"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 431
    new-instance v0, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v0, v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 433
    .local v0, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 434
    return-void
.end method

.method private writeDeviceNamePin(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "devicename"    # Ljava/lang/String;
    .param p2, "pin"    # Ljava/lang/String;

    .prologue
    .line 458
    const-string v2, "device_name_pin_data"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtSettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 460
    .local v1, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "DEVICENAME"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 461
    const-string v2, "PIN"

    invoke-interface {v1, v2, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 463
    new-instance v0, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v0, v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 465
    .local v0, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 466
    return-void
.end method

.method private writeDevicePin(Ljava/lang/String;)V
    .locals 4
    .param p1, "pin"    # Ljava/lang/String;

    .prologue
    .line 437
    const-string v2, "device_pin_data"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtSettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 439
    .local v1, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "PIN"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 441
    new-instance v0, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v0, v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 443
    .local v0, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 444
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v5, 0x7f0200b7

    const v4, 0x7f0200b6

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 257
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 315
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 259
    :pswitch_1
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTNameDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 260
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTNameDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 261
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->edt_devicename:Landroid/widget/EditText;

    if-nez v0, :cond_1

    .line 262
    sget-boolean v0, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtSettingsActivity"

    const-string v1, "devicename  == null or pin edit== null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 265
    :cond_1
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->readDeviceName()V

    .line 266
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->edt_devicename:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mCurName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 267
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTNameDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto :goto_0

    .line 272
    :pswitch_2
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTPinDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 273
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTPinDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 274
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->edt_pin:Landroid/widget/EditText;

    if-nez v0, :cond_2

    .line 275
    sget-boolean v0, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtSettingsActivity"

    const-string v1, "devicename  == null or pin edit== null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 278
    :cond_2
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->readDevicePin()V

    .line 279
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->edt_pin:Landroid/widget/EditText;

    sget-object v1, Lcom/autochips/bluetooth/BtSettingsActivity;->mPin:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 280
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->editBTPinDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto :goto_0

    .line 285
    :pswitch_3
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoConnect:Z

    if-nez v0, :cond_3

    .line 286
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoConnect:Z

    .line 287
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoConnectButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 294
    :goto_1
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoConnect:Z

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtSettingsActivity;->writeAutoConnectData(Z)V

    goto :goto_0

    .line 290
    :cond_3
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoConnect:Z

    .line 291
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoConnectButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    .line 297
    :pswitch_4
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoAnswer:Z

    if-ne v0, v2, :cond_5

    .line 298
    sget-boolean v0, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    if-eqz v0, :cond_4

    const-string v0, "BtSettingsActivity"

    const-string v1, "AutoAnswerToggleButton is Checked"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    :cond_4
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoAnswer:Z

    .line 300
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoAnswerButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 309
    :goto_2
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoAnswer:Z

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtSettingsActivity;->writeAutoAnswerData(Z)V

    goto/16 :goto_0

    .line 303
    :cond_5
    sget-boolean v0, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    if-eqz v0, :cond_6

    const-string v0, "BtSettingsActivity"

    const-string v1, "AutoAnswerToggleButton is not Checked"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    :cond_6
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mIsAutoAnswer:Z

    .line 305
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoAnswerButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2

    .line 257
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0077
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 155
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 156
    sget-boolean v1, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BtSettingsActivity"

    const-string v2, "+++ onCreate +++"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    :cond_0
    const v1, 0x7f03000e

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->setContentView(I)V

    .line 160
    const v1, 0x7f0a0076

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditNameTv:Landroid/widget/TextView;

    .line 161
    const v1, 0x7f0a0079

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditPinTv:Landroid/widget/TextView;

    .line 162
    const v1, 0x7f0a0077

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditNameButton:Landroid/widget/ImageButton;

    .line 163
    const v1, 0x7f0a007a

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditPinButton:Landroid/widget/ImageButton;

    .line 164
    const v1, 0x7f0a007c

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoConnectButton:Landroid/widget/Button;

    .line 165
    const v1, 0x7f0a007b

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoAnswerButton:Landroid/widget/Button;

    .line 166
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditNameTv:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditPinTv:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditNameButton:Landroid/widget/ImageButton;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditPinButton:Landroid/widget/ImageButton;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoConnectButton:Landroid/widget/Button;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoAnswerButton:Landroid/widget/Button;

    if-nez v1, :cond_2

    .line 168
    :cond_1
    const-string v1, "BtSettingsActivity"

    const-string v2, "Widget missing"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->finish()V

    .line 201
    :goto_0
    return-void

    .line 174
    :cond_2
    invoke-static {p0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v1

    iput-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    .line 175
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    if-nez v1, :cond_3

    .line 176
    const-string v1, "Bluetooth is not available"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 178
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->finish()V

    .line 181
    :cond_3
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->checkBluetoothStatus()V

    .line 183
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditNameButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditPinButton:Landroid/widget/ImageButton;

    invoke-virtual {v1, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 185
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoConnectButton:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mAutoAnswerButton:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 188
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 189
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v1, "android.bluetooth.device.action.PAIRING_REQUEST"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 190
    const-string v1, "android.bluetooth.device.action.NAME_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 191
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/autochips/bluetooth/BtSettingsActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 192
    invoke-direct {p0, p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->buildEditNameDialog(Landroid/content/Context;)V

    .line 193
    invoke-direct {p0, p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->buildEditPinDialog(Landroid/content/Context;)V

    .line 195
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->readDeviceName()V

    .line 196
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtSettingsActivity;->readDevicePin()V

    .line 197
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditNameTv:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mCurName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mEditPinTv:Landroid/widget/TextView;

    sget-object v2, Lcom/autochips/bluetooth/BtSettingsActivity;->mPin:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 241
    sget-boolean v0, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 242
    const-string v0, "BtSettingsActivity"

    const-string v1, "+++ onDestroy +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 246
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 248
    :cond_1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 250
    return-void
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 230
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 233
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 234
    sget-boolean v0, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 235
    const-string v0, "BtSettingsActivity"

    const-string v1, "+++ onPause +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    :cond_1
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 219
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 220
    sget-boolean v0, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 221
    const-string v0, "BtSettingsActivity"

    const-string v1, "+++ onResume +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outstate"    # Landroid/os/Bundle;

    .prologue
    .line 215
    return-void
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 205
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 206
    sget-boolean v0, Lcom/autochips/bluetooth/BtSettingsActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 207
    const-string v0, "BtSettingsActivity"

    const-string v1, "+++ onStart +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    :cond_0
    return-void
.end method
