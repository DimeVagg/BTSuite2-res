.class public Lcom/autochips/bluetooth/MainBluetoothActivity;
.super Landroid/app/ActivityGroup;
.source "MainBluetoothActivity.java"

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;


# static fields
.field static final BT_MAIN_ACTIVITY_CREATE:I = 0x0

.field static final BT_MAIN_ACTIVITY_DESTROY:I = 0x5

.field static final BT_MAIN_ACTIVITY_NOT_CREATE:I = 0xff

.field static final BT_MAIN_ACTIVITY_PAUSE:I = 0x2

.field static final BT_MAIN_ACTIVITY_RESUME:I = 0x3

.field static final BT_MAIN_ACTIVITY_START:I = 0x1

.field static final BT_MAIN_ACTIVITY_STOP:I = 0x4

.field private static DEBUG:Z = false

.field private static final TAB_DIALER_STRING:Ljava/lang/String; = "bluetooth_dialer"

.field private static final TAB_HISTORY_STRING:Ljava/lang/String; = "bluetooth_callhistory"

.field public static final TAB_INDEX_BT_DIALER:I = 0x0

.field public static final TAB_INDEX_BT_HISTORY:I = 0x2

.field public static final TAB_INDEX_BT_MUSIC:I = 0x3

.field public static final TAB_INDEX_BT_PAIREDHISTORY:I = 0x4

.field public static final TAB_INDEX_BT_PHONEBOOK:I = 0x1

.field public static final TAB_INDEX_BT_RETURN:I = 0x6

.field public static final TAB_INDEX_BT_SETTINGS:I = 0x5

.field public static final TAB_INDEX_BT_SMS:I = 0x3

.field private static final TAB_MUSIC_STRING:Ljava/lang/String; = "bluetooth_music"

.field private static final TAB_PAIREDHISTORY_STRING:Ljava/lang/String; = "bluetooth_pairedhistory"

.field private static final TAB_PHONEBOOK_STRING:Ljava/lang/String; = "bluetooth_phonebook"

.field private static final TAB_RETURN_STRING:Ljava/lang/String; = "bluetooth_return"

.field private static final TAB_SETTINGS_STRING:Ljava/lang/String; = "bluetooth_settings"

.field private static final TAB_SMS_STRING:Ljava/lang/String; = "bluetooth_sms"

.field private static final TAG:Ljava/lang/String; = "MainBluetoothActivity"

.field public static mActivityState:I

.field public static mTabHost:Lcom/autochips/bluetooth/MyTabHost;


# instance fields
.field private btn_back:Landroid/widget/Button;

.field private btn_home:Landroid/widget/Button;

.field private height:I

.field private final mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field public mLastTab:I

.field private mToast:Landroid/widget/Toast;

.field private toast_btv:Landroid/widget/Toast;

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 69
    sget-boolean v0, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugAll:Z

    sget-boolean v1, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugSettings:Z

    and-int/2addr v0, v1

    sput-boolean v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->DEBUG:Z

    .line 90
    const/4 v0, 0x0

    sput-object v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    .line 103
    const/16 v0, 0xff

    sput v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mActivityState:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 67
    invoke-direct {p0}, Landroid/app/ActivityGroup;-><init>()V

    .line 89
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->toast_btv:Landroid/widget/Toast;

    .line 94
    iput v1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->width:I

    .line 95
    iput v1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->height:I

    .line 164
    new-instance v0, Lcom/autochips/bluetooth/MainBluetoothActivity$3;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/MainBluetoothActivity$3;-><init>(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 67
    sget-boolean v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->DEBUG:Z

    return v0
.end method

.method static synthetic access$100(Lcom/autochips/bluetooth/MainBluetoothActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/MainBluetoothActivity;

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->showPoweroffTipDialog()V

    return-void
.end method

.method static synthetic access$200(Lcom/autochips/bluetooth/MainBluetoothActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/MainBluetoothActivity;

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->showConnectTipDialog()V

    return-void
.end method

.method private composeLayout(II)Landroid/view/View;
    .locals 6
    .param p1, "nameId"    # I
    .param p2, "imageId"    # I

    .prologue
    .line 319
    const-string v4, "layout_inflater"

    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/MainBluetoothActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 320
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v4, 0x7f030010

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 321
    .local v2, "layout":Landroid/view/View;
    const v4, 0x7f0a0088

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 322
    .local v1, "iv":Landroid/widget/ImageView;
    invoke-virtual {v1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 323
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 324
    const v4, 0x7f0a0089

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 325
    .local v3, "tv":Landroid/widget/TextView;
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(I)V

    .line 326
    return-object v2
.end method

.method public static getBTMainActivityState()I
    .locals 1

    .prologue
    .line 260
    sget v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mActivityState:I

    return v0
.end method

.method public static getCurrentTabIndex()I
    .locals 2

    .prologue
    .line 252
    const/4 v0, 0x5

    .line 253
    .local v0, "index":I
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    if-eqz v1, :cond_0

    .line 254
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/MyTabHost;->getCurrentTab()I

    move-result v0

    .line 256
    :cond_0
    return v0
.end method

.method private setupBtDialerTab()V
    .locals 5

    .prologue
    .line 264
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 265
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 267
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    sget-object v2, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    const-string v3, "bluetooth_dialer"

    invoke-virtual {v2, v3}, Lcom/autochips/bluetooth/MyTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    const v3, 0x7f070001

    const v4, 0x7f020039

    invoke-direct {p0, v3, v4}, Lcom/autochips/bluetooth/MainBluetoothActivity;->composeLayout(II)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/MyTabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 270
    return-void
.end method

.method private setupBtMusicTab()V
    .locals 5

    .prologue
    .line 291
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 292
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 294
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    sget-object v2, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    const-string v3, "bluetooth_music"

    invoke-virtual {v2, v3}, Lcom/autochips/bluetooth/MyTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    const v3, 0x7f070005

    const v4, 0x7f02001e

    invoke-direct {p0, v3, v4}, Lcom/autochips/bluetooth/MainBluetoothActivity;->composeLayout(II)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/MyTabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 297
    return-void
.end method

.method private setupBtPairedHistoryTab()V
    .locals 5

    .prologue
    .line 300
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 301
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 303
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    sget-object v2, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    const-string v3, "bluetooth_pairedhistory"

    invoke-virtual {v2, v3}, Lcom/autochips/bluetooth/MyTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    const v3, 0x7f070006

    const v4, 0x7f020050

    invoke-direct {p0, v3, v4}, Lcom/autochips/bluetooth/MainBluetoothActivity;->composeLayout(II)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/MyTabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 307
    return-void
.end method

.method private setupBtSettingsTab()V
    .locals 5

    .prologue
    .line 310
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 311
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 313
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    sget-object v2, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    const-string v3, "bluetooth_settings"

    invoke-virtual {v2, v3}, Lcom/autochips/bluetooth/MyTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    const v3, 0x7f070007

    const v4, 0x7f020052

    invoke-direct {p0, v3, v4}, Lcom/autochips/bluetooth/MainBluetoothActivity;->composeLayout(II)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/MyTabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 316
    return-void
.end method

.method private setupCallHistoryTab()V
    .locals 5

    .prologue
    .line 273
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 274
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 276
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    sget-object v2, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    const-string v3, "bluetooth_callhistory"

    invoke-virtual {v2, v3}, Lcom/autochips/bluetooth/MyTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    const v3, 0x7f070003

    const v4, 0x7f02003a

    invoke-direct {p0, v3, v4}, Lcom/autochips/bluetooth/MainBluetoothActivity;->composeLayout(II)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/MyTabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 279
    return-void
.end method

.method private setupPhonebookTab()V
    .locals 5

    .prologue
    .line 282
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 283
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 285
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    sget-object v2, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    const-string v3, "bluetooth_phonebook"

    invoke-virtual {v2, v3}, Lcom/autochips/bluetooth/MyTabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    const v3, 0x7f070002

    const v4, 0x7f02004b

    invoke-direct {p0, v3, v4}, Lcom/autochips/bluetooth/MainBluetoothActivity;->composeLayout(II)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/MyTabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 288
    return-void
.end method

.method private showConnectTipDialog()V
    .locals 3

    .prologue
    .line 372
    iget-object v0, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->toast_btv:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 378
    :goto_0
    iget-object v0, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->toast_btv:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 379
    return-void

    .line 375
    :cond_0
    invoke-virtual {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0700af

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/MainBluetoothActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->toast_btv:Landroid/widget/Toast;

    goto :goto_0
.end method

.method private showPoweroffTipDialog()V
    .locals 3

    .prologue
    .line 381
    iget-object v0, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->toast_btv:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 387
    :goto_0
    iget-object v0, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->toast_btv:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 388
    return-void

    .line 384
    :cond_0
    invoke-virtual {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f070041

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/MainBluetoothActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->toast_btv:Landroid/widget/Toast;

    goto :goto_0
.end method

.method private showToast(I)V
    .locals 3
    .param p1, "resid"    # I

    .prologue
    .line 330
    iget-object v0, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mToast:Landroid/widget/Toast;

    if-nez v0, :cond_0

    .line 331
    invoke-virtual {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, ""

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mToast:Landroid/widget/Toast;

    .line 333
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0, p1}, Landroid/widget/Toast;->setText(I)V

    .line 334
    iget-object v0, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 335
    return-void
.end method

.method public static switchTab(I)V
    .locals 1
    .param p0, "tabId"    # I

    .prologue
    .line 246
    sget-object v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/MyTabHost;->getCurrentTab()I

    move-result v0

    if-eq p0, v0, :cond_0

    .line 247
    sget-object v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v0, p0}, Lcom/autochips/bluetooth/MyTabHost;->setCurrentTab(I)V

    .line 249
    :cond_0
    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 215
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 216
    .local v0, "action":I
    packed-switch v0, :pswitch_data_0

    .line 228
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/app/ActivityGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    return v2

    .line 218
    :pswitch_0
    const-string v2, "MainBluetoothActivity"

    const-string v3, "+++ onTouchEvent 1 ==+++"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    invoke-virtual {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 221
    const-string v2, "MainBluetoothActivity"

    const-string v3, "+++ onTouchEvent 2 ==+++"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    const-string v2, "input_method"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/MainBluetoothActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 223
    .local v1, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    goto :goto_0

    .line 216
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 234
    const/4 v0, 0x1

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    .line 112
    invoke-super {p0, p1}, Landroid/app/ActivityGroup;->onCreate(Landroid/os/Bundle;)V

    .line 113
    sget-boolean v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "MainBluetoothActivity"

    const-string v2, "+++ ON CREATE +++"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    :cond_0
    const v1, 0x7f03001a

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/MainBluetoothActivity;->setContentView(I)V

    .line 116
    const v1, 0x7f0a00ae

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/MainBluetoothActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/autochips/bluetooth/MyTabHost;

    sput-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    .line 117
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    if-nez v1, :cond_1

    .line 118
    const-string v1, "MainBluetoothActivity"

    const-string v2, "Cannot find tabhost. Finish."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    invoke-virtual {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->finish()V

    .line 162
    :goto_0
    return-void

    .line 122
    :cond_1
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v1, p0}, Lcom/autochips/bluetooth/MyTabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 123
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->getLocalActivityManager()Landroid/app/LocalActivityManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/MyTabHost;->setup(Landroid/app/LocalActivityManager;)V

    .line 125
    const v1, 0x7f0a00ac

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/MainBluetoothActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->btn_home:Landroid/widget/Button;

    .line 126
    iget-object v1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->btn_home:Landroid/widget/Button;

    new-instance v2, Lcom/autochips/bluetooth/MainBluetoothActivity$1;

    invoke-direct {v2, p0}, Lcom/autochips/bluetooth/MainBluetoothActivity$1;-><init>(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    const v1, 0x7f0a00ad

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/MainBluetoothActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->btn_back:Landroid/widget/Button;

    .line 135
    iget-object v1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->btn_back:Landroid/widget/Button;

    new-instance v2, Lcom/autochips/bluetooth/MainBluetoothActivity$2;

    invoke-direct {v2, p0}, Lcom/autochips/bluetooth/MainBluetoothActivity$2;-><init>(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    invoke-direct {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->setupBtDialerTab()V

    .line 142
    invoke-direct {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->setupPhonebookTab()V

    .line 143
    invoke-direct {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->setupCallHistoryTab()V

    .line 144
    invoke-direct {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->setupBtMusicTab()V

    .line 145
    invoke-direct {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->setupBtPairedHistoryTab()V

    .line 146
    invoke-direct {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->setupBtSettingsTab()V

    .line 148
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 149
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v1, "com.xy.kill.app.action.bluetooth"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 150
    iget-object v1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 152
    invoke-virtual {p0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->setTabClickListener()V

    .line 155
    sget-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v1, :cond_2

    .line 156
    const/4 v1, 0x1

    sput-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    .line 157
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v1, v3}, Lcom/autochips/bluetooth/MyTabHost;->setCurrentTab(I)V

    .line 161
    :goto_1
    sput v3, Lcom/autochips/bluetooth/MainBluetoothActivity;->mActivityState:I

    goto :goto_0

    .line 159
    :cond_2
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/MyTabHost;->setCurrentTab(I)V

    goto :goto_1
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 240
    const/4 v0, 0x5

    sput v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mActivityState:I

    .line 241
    sget-boolean v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MainBluetoothActivity"

    const-string v1, "+++  onDestroy +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    :cond_0
    invoke-super {p0}, Landroid/app/ActivityGroup;->onDestroy()V

    .line 243
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 200
    const/4 v0, 0x2

    sput v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mActivityState:I

    .line 201
    sget-boolean v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MainBluetoothActivity"

    const-string v1, "+++ onPause +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    :cond_0
    invoke-super {p0}, Landroid/app/ActivityGroup;->onPause()V

    .line 203
    return-void
.end method

.method public onRestart()V
    .locals 2

    .prologue
    .line 186
    const/4 v0, 0x1

    sput v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mActivityState:I

    .line 187
    sget-boolean v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MainBluetoothActivity"

    const-string v1, "+++  onStart +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    :cond_0
    invoke-super {p0}, Landroid/app/ActivityGroup;->onRestart()V

    .line 189
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 193
    const/4 v0, 0x3

    sput v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mActivityState:I

    .line 194
    sget-boolean v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MainBluetoothActivity"

    const-string v1, "+++ onResume +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    :cond_0
    invoke-super {p0}, Landroid/app/ActivityGroup;->onResume()V

    .line 196
    return-void
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 179
    const/4 v0, 0x1

    sput v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mActivityState:I

    .line 180
    sget-boolean v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MainBluetoothActivity"

    const-string v1, "+++  onStart +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    :cond_0
    invoke-super {p0}, Landroid/app/ActivityGroup;->onStart()V

    .line 182
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 208
    const/4 v0, 0x4

    sput v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mActivityState:I

    .line 209
    sget-boolean v0, Lcom/autochips/bluetooth/MainBluetoothActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MainBluetoothActivity"

    const-string v1, "+++  onStop +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    :cond_0
    invoke-super {p0}, Landroid/app/ActivityGroup;->onStop()V

    .line 211
    return-void
.end method

.method public onTabChanged(Ljava/lang/String;)V
    .locals 7
    .param p1, "tabId"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x4

    const/4 v3, 0x3

    const/4 v5, 0x0

    .line 342
    const-string v2, "bluetooth_dialer"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 344
    iput v5, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mLastTab:I

    .line 360
    :cond_0
    :goto_0
    const-string v2, "TABCHANGE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "==========mLastTab========:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mLastTab:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    sget-object v2, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/MyTabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/TabWidget;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_9

    .line 362
    sget-object v2, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/MyTabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a0087

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 363
    .local v1, "iv":Landroid/widget/ImageView;
    iget v2, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mLastTab:I

    if-ne v2, v0, :cond_8

    .line 364
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 361
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 345
    .end local v0    # "i":I
    .end local v1    # "iv":Landroid/widget/ImageView;
    :cond_1
    const-string v2, "bluetooth_callhistory"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 346
    const/4 v2, 0x2

    iput v2, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mLastTab:I

    goto :goto_0

    .line 347
    :cond_2
    const-string v2, "bluetooth_music"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 348
    iput v3, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mLastTab:I

    goto :goto_0

    .line 349
    :cond_3
    const-string v2, "bluetooth_sms"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 350
    iput v3, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mLastTab:I

    goto :goto_0

    .line 351
    :cond_4
    const-string v2, "bluetooth_phonebook"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 352
    const/4 v2, 0x1

    iput v2, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mLastTab:I

    goto :goto_0

    .line 353
    :cond_5
    const-string v2, "bluetooth_pairedhistory"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 354
    iput v6, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mLastTab:I

    goto :goto_0

    .line 355
    :cond_6
    const-string v2, "bluetooth_settings"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 356
    const/4 v2, 0x5

    iput v2, p0, Lcom/autochips/bluetooth/MainBluetoothActivity;->mLastTab:I

    goto/16 :goto_0

    .line 357
    :cond_7
    const-string v2, "bluetooth_return"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_0

    .line 366
    .restart local v0    # "i":I
    .restart local v1    # "iv":Landroid/widget/ImageView;
    :cond_8
    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2

    .line 369
    .end local v1    # "iv":Landroid/widget/ImageView;
    :cond_9
    return-void
.end method

.method public setTabClickListener()V
    .locals 3

    .prologue
    .line 390
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/MyTabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/TabWidget;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 391
    sget-object v1, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/MyTabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/autochips/bluetooth/MainBluetoothActivity$4;

    invoke-direct {v2, p0}, Lcom/autochips/bluetooth/MainBluetoothActivity$4;-><init>(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 390
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 483
    :cond_0
    return-void
.end method
