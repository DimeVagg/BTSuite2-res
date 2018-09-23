.class public Lcom/autochips/bluetooth/BtPhonebookActivity;
.super Landroid/app/Activity;
.source "BtPhonebookActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;
    }
.end annotation


# static fields
.field private static DEBUG:Z = false

.field private static final MSG_HANDLE_ALL_UPDATE:I = 0x2

.field private static final MSG_HANDLE_CLEAR:I = 0x4

.field private static final MSG_HANDLE_DEL_SEARCH:I = 0x5

.field private static final MSG_HANDLE_ONESTEP_UPDATE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "BtPhonebookActivity"


# instance fields
.field private final MSG_PB_DOWNLOAD:I

.field private action_call:Lcom/autochips/bluetooth/util/ActionItem;

.field bt_callout_intent:Landroid/content/Intent;

.field private builderWarning:Landroid/app/AlertDialog$Builder;

.field private mAdapter:Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

.field private mDownloadLayout:Landroid/widget/LinearLayout;

.field private mDownloadPath:I

.field private mDownloadProgress:Landroid/widget/ProgressBar;

.field private mDownloadTextView:Landroid/widget/TextView;

.field private mDownloadedNum:I

.field private mEndTime:J

.field private mFirstCreate:Z

.field private mIsSyncFinish:Z

.field private mLastDwnldAddr:Ljava/lang/String;

.field private mLastSearch:Ljava/lang/String;

.field private mPBHandler:Landroid/os/Handler;

.field private mPBList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mPhoneBookListClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mPhoneBookScrollListener:Landroid/widget/AbsListView$OnScrollListener;

.field private mPhonebookId:I

.field private mPhonebookIndex:I

.field private mPhonebookListView:Landroid/widget/ListView;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSearchEdit:Landroid/text/Editable;

.field private volatile mSearchFlag:Z

.field private mSearchText:Landroid/widget/EditText;

.field private mShowedRecordNum:I

.field private mStartTime:J

.field private mSupportFlag:Z

.field private mSyncState:Z

.field private mToast:Landroid/widget/Toast;

.field private mWaitThread:Ljava/lang/Thread;

.field private mbContinueDownload:Z

.field private running:Z

.field private uiHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 94
    sget-boolean v0, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugAll:Z

    sget-boolean v1, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugPB:Z

    and-int/2addr v0, v1

    sput-boolean v0, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 92
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 117
    const-string v0, ""

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mLastSearch:Ljava/lang/String;

    .line 118
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchFlag:Z

    .line 119
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSupportFlag:Z

    .line 123
    iput v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->MSG_PB_DOWNLOAD:I

    .line 124
    iput-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mWaitThread:Ljava/lang/Thread;

    .line 126
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mbContinueDownload:Z

    .line 127
    iput-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    .line 131
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mFirstCreate:Z

    .line 135
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSyncState:Z

    .line 146
    const/4 v0, 0x1

    iput v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookId:I

    .line 150
    const-string v0, ""

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mLastDwnldAddr:Ljava/lang/String;

    .line 155
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mIsSyncFinish:Z

    .line 160
    new-instance v0, Lcom/autochips/bluetooth/util/ActionItem;

    invoke-direct {v0}, Lcom/autochips/bluetooth/util/ActionItem;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->action_call:Lcom/autochips/bluetooth/util/ActionItem;

    .line 162
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.autochips.bluetooth.BtDialPadActivity.action.BLUETOOTH_CALLOUT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->bt_callout_intent:Landroid/content/Intent;

    .line 164
    new-instance v0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtPhonebookActivity$1;-><init>(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->uiHandler:Landroid/os/Handler;

    .line 218
    new-instance v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtPhonebookActivity$2;-><init>(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 415
    new-instance v0, Lcom/autochips/bluetooth/BtPhonebookActivity$3;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtPhonebookActivity$3;-><init>(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBHandler:Landroid/os/Handler;

    .line 896
    new-instance v0, Lcom/autochips/bluetooth/BtPhonebookActivity$7;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtPhonebookActivity$7;-><init>(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhoneBookListClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 942
    new-instance v0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtPhonebookActivity$8;-><init>(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhoneBookScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    .line 1131
    return-void
.end method

.method private DownloadPhonebook(Z)V
    .locals 6
    .param p1, "bContinue"    # Z

    .prologue
    const v3, 0x7f0a006b

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1008
    sget-boolean v0, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtPhonebookActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DownloadPhonebook("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1009
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mStartTime:J

    .line 1010
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->clear()V

    .line 1011
    const-string v0, ""

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mLastSearch:Ljava/lang/String;

    .line 1012
    iput-boolean v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchFlag:Z

    .line 1013
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mbContinueDownload:Z

    .line 1014
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-nez v0, :cond_2

    .line 1044
    :cond_1
    :goto_0
    return-void

    .line 1017
    :cond_2
    sget-boolean v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-ne v5, v0, :cond_4

    .line 1018
    const v0, 0x7f0a006a

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1019
    invoke-virtual {p0, v3}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1020
    invoke-virtual {p0, v3}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0200dc

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1022
    iput v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mShowedRecordNum:I

    .line 1023
    iput v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    .line 1024
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetSyncState()I

    move-result v0

    if-nez v0, :cond_3

    .line 1025
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadTextView:Landroid/widget/TextView;

    const v1, 0x7f070024

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1029
    :goto_1
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1031
    iput-boolean v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSyncState:Z

    .line 1032
    iput-boolean v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mIsSyncFinish:Z

    .line 1033
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mLastDwnldAddr:Ljava/lang/String;

    .line 1035
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->WriteSyncState()V

    .line 1036
    const/4 v0, 0x2

    iput v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadPath:I

    .line 1037
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    iget v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadPath:I

    invoke-virtual {v0, v1, v2}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->SetRemoteDevice(Landroid/bluetooth/BluetoothDevice;I)Z

    .line 1039
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    iget v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadPath:I

    invoke-virtual {v0, v1, p1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StartDownload(IZ)Z

    goto :goto_0

    .line 1027
    :cond_3
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadTextView:Landroid/widget/TextView;

    const v1, 0x7f070025

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 1042
    :cond_4
    sget-boolean v0, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string v0, "BtPhonebookActivity"

    const-string v1, "connect bluetooth first"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method private ReadSyncState()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1123
    const-string v1, "PB_SyncState"

    invoke-virtual {p0, v1, v3}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1124
    .local v0, "sharedata":Landroid/content/SharedPreferences;
    const-string v1, "BTADDR"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mLastDwnldAddr:Ljava/lang/String;

    .line 1125
    const-string v1, "PhonebookSyncState"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mIsSyncFinish:Z

    .line 1126
    iget-boolean v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mIsSyncFinish:Z

    if-eqz v1, :cond_0

    .line 1127
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSupportFlag:Z

    .line 1129
    :cond_0
    return-void
.end method

.method private WriteSyncState()V
    .locals 4

    .prologue
    .line 1114
    const-string v2, "PB_SyncState"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1115
    .local v1, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "BTADDR"

    iget-object v3, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mLastDwnldAddr:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1116
    const-string v2, "PhonebookSyncState"

    iget-boolean v3, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mIsSyncFinish:Z

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1118
    new-instance v0, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v0, v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 1119
    .local v0, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 1120
    return-void
.end method

.method static synthetic access$000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/autochips/bluetooth/BtPhonebookActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->loadFirstPageData()V

    return-void
.end method

.method static synthetic access$1000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSupportFlag:Z

    return v0
.end method

.method static synthetic access$1002(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 92
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSupportFlag:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/autochips/bluetooth/BtPhonebookActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadPath:I

    return v0
.end method

.method static synthetic access$1102(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    iput p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadPath:I

    return p1
.end method

.method static synthetic access$1200(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/autochips/bluetooth/BtPhonebookActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSyncState:Z

    return v0
.end method

.method static synthetic access$1302(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 92
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSyncState:Z

    return p1
.end method

.method static synthetic access$1402(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 92
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mIsSyncFinish:Z

    return p1
.end method

.method static synthetic access$1500(Lcom/autochips/bluetooth/BtPhonebookActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->WriteSyncState()V

    return-void
.end method

.method static synthetic access$1600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->uiHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/autochips/bluetooth/BtPhonebookActivity;)J
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-wide v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mEndTime:J

    return-wide v0
.end method

.method static synthetic access$1702(Lcom/autochips/bluetooth/BtPhonebookActivity;J)J
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # J

    .prologue
    .line 92
    iput-wide p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mEndTime:J

    return-wide p1
.end method

.method static synthetic access$1800(Lcom/autochips/bluetooth/BtPhonebookActivity;)J
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-wide v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mStartTime:J

    return-wide v0
.end method

.method static synthetic access$1900(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->DownloadPhonebook(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->handleFirstPageDataView(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$2002(Lcom/autochips/bluetooth/BtPhonebookActivity;Ljava/lang/Thread;)Ljava/lang/Thread;
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # Ljava/lang/Thread;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mWaitThread:Ljava/lang/Thread;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/autochips/bluetooth/BtPhonebookActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mbContinueDownload:Z

    return v0
.end method

.method static synthetic access$2200(Lcom/autochips/bluetooth/BtPhonebookActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchFlag:Z

    return v0
.end method

.method static synthetic access$2202(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 92
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchFlag:Z

    return p1
.end method

.method static synthetic access$2300(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mLastSearch:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2302(Lcom/autochips/bluetooth/BtPhonebookActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mLastSearch:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2400(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$2500(Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 92
    invoke-static {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->isInteger(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$2600(Lcom/autochips/bluetooth/BtPhonebookActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->showToast(I)V

    return-void
.end method

.method static synthetic access$2702(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    iput p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookId:I

    return p1
.end method

.method static synthetic access$2708(Lcom/autochips/bluetooth/BtPhonebookActivity;)I
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookId:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookId:I

    return v0
.end method

.method static synthetic access$2802(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    iput p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookIndex:I

    return p1
.end method

.method static synthetic access$300(Lcom/autochips/bluetooth/BtPhonebookActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->handleUpdateDownloadNum(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/autochips/bluetooth/BtPhonebookActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mShowedRecordNum:I

    return v0
.end method

.method static synthetic access$402(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    iput p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mShowedRecordNum:I

    return p1
.end method

.method static synthetic access$412(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    iget v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mShowedRecordNum:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mShowedRecordNum:I

    return v0
.end method

.method static synthetic access$500(Lcom/autochips/bluetooth/BtPhonebookActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    return v0
.end method

.method static synthetic access$502(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # I

    .prologue
    .line 92
    iput p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    return p1
.end method

.method static synthetic access$600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$700(Lcom/autochips/bluetooth/BtPhonebookActivity;)Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mAdapter:Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    return-object v0
.end method

.method static synthetic access$800(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/text/Editable;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchEdit:Landroid/text/Editable;

    return-object v0
.end method

.method static synthetic access$802(Lcom/autochips/bluetooth/BtPhonebookActivity;Landroid/text/Editable;)Landroid/text/Editable;
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPhonebookActivity;
    .param p1, "x1"    # Landroid/text/Editable;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchEdit:Landroid/text/Editable;

    return-object p1
.end method

.method static synthetic access$900()Z
    .locals 1

    .prologue
    .line 92
    sget-boolean v0, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    return v0
.end method

.method private enablePasueButtonshowDownloadStoped()V
    .locals 3

    .prologue
    .line 752
    const v1, 0x7f0a006b

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 753
    .local v0, "button":Landroid/widget/Button;
    if-eqz v0, :cond_0

    .line 754
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 755
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0200db

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 760
    return-void

    .line 758
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "pause button can not found"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private enablePasueButtonshowDownloading()V
    .locals 3

    .prologue
    .line 741
    const v1, 0x7f0a006b

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 742
    .local v0, "button":Landroid/widget/Button;
    if-eqz v0, :cond_0

    .line 743
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 744
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0200dc

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 749
    return-void

    .line 747
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "pause button can not found"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private handleFirstPageDataView(I)I
    .locals 11
    .param p1, "iOneStepCount"    # I

    .prologue
    const/4 v8, 0x2

    const/4 v10, 0x1

    const/4 v6, 0x0

    .line 1047
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v5, :cond_0

    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-nez v5, :cond_1

    :cond_0
    move v5, v6

    .line 1074
    :goto_0
    return v5

    .line 1050
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1051
    .local v4, "record":Ljava/util/List;, "Ljava/util/List<Lcom/autochips/bluetooth/PbSyncManager/PBRecord;>;"
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v7, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v7}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7, v8}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecCnt(Ljava/lang/String;I)I

    move-result v2

    .line 1053
    .local v2, "iCount":I
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    iget v7, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mShowedRecordNum:I

    invoke-virtual {v5, v8, v7, p1, v4}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecord(IIILjava/util/List;)Z

    move-result v0

    .line 1055
    .local v0, "bRes":Z
    if-eqz v0, :cond_6

    .line 1056
    iget v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mShowedRecordNum:I

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    add-int/2addr v5, v7

    iput v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mShowedRecordNum:I

    .line 1057
    iget v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    add-int/2addr v5, v7

    iput v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    .line 1058
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadTextView:Landroid/widget/TextView;

    const v7, 0x7f070024

    new-array v8, v10, [Ljava/lang/Object;

    iget v9, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v6

    invoke-virtual {p0, v7, v8}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1059
    sget-boolean v5, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v5, :cond_2

    const-string v5, "BtPhonebookActivity"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mShowedRecordNum = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mShowedRecordNum:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " iOneStepCount = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1060
    :cond_2
    sget-boolean v5, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v5, :cond_3

    const-string v5, "BtPhonebookActivity"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "download phonebook iCount = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " get record size = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1061
    :cond_3
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ge v1, v5, :cond_4

    .line 1062
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1063
    .local v3, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v7, "item_phonebook_name"

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v7, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1064
    const-string v7, "item_phonebook_number"

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v7, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1065
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBList:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1061
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1067
    .end local v3    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchText:Landroid/widget/EditText;

    const v7, 0x7f070090

    new-array v8, v10, [Ljava/lang/Object;

    iget v9, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v6

    invoke-virtual {p0, v7, v8}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 1068
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mAdapter:Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1074
    .end local v1    # "i":I
    :cond_5
    :goto_2
    iget v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mShowedRecordNum:I

    goto/16 :goto_0

    .line 1070
    :cond_6
    sget-boolean v5, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v5, :cond_5

    const-string v5, "BtPhonebookActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[phonebook] GetRecord error, startIdx = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mShowedRecordNum:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", count = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method private handleUpdateDownloadNum(I)V
    .locals 6
    .param p1, "iOneStepCount"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1078
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecCnt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    .line 1080
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadTextView:Landroid/widget/TextView;

    const v1, 0x7f070024

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1081
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchText:Landroid/widget/EditText;

    const v1, 0x7f070090

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 1082
    return-void
.end method

.method private static isInteger(Ljava/lang/String;)Z
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 590
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 591
    const/4 v1, 0x1

    .line 593
    :goto_0
    return v1

    .line 592
    :catch_0
    move-exception v0

    .line 593
    .local v0, "e":Ljava/lang/NumberFormatException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private loadFirstPageData()V
    .locals 11

    .prologue
    const/4 v7, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 1085
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 1086
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mAdapter:Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1087
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v5, :cond_0

    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-nez v5, :cond_1

    .line 1111
    :cond_0
    :goto_0
    return-void

    .line 1091
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1092
    .local v4, "record":Ljava/util/List;, "Ljava/util/List<Lcom/autochips/bluetooth/PbSyncManager/PBRecord;>;"
    const/16 v1, 0xa

    .line 1093
    .local v1, "firstpageCount":I
    iput v10, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookId:I

    .line 1094
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v7}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecCnt(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    .line 1096
    iget v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    if-ge v5, v1, :cond_2

    .line 1097
    iget v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    .line 1098
    :cond_2
    iput v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mShowedRecordNum:I

    .line 1099
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v5, v7, v9, v1, v4}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecord(IIILjava/util/List;)Z

    move-result v0

    .line 1100
    .local v0, "bRes":Z
    if-eqz v0, :cond_0

    .line 1101
    sget-boolean v5, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v5, :cond_3

    const-string v5, "BtPhonebookActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "download phonebook iCount = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " record.size() = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1102
    :cond_3
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_4

    .line 1103
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1104
    .local v3, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v6, "item_phonebook_name"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget v7, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookId:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookId:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ". "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1105
    const-string v6, "item_phonebook_number"

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1106
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBList:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1102
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1108
    .end local v3    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchText:Landroid/widget/EditText;

    const v6, 0x7f070090

    new-array v7, v10, [Ljava/lang/Object;

    iget v8, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-virtual {p0, v6, v7}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 1109
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mAdapter:Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0
.end method

.method private sendPBMsg(ILjava/lang/Object;)V
    .locals 4
    .param p1, "what"    # I
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 1249
    const/4 v0, 0x0

    .line 1250
    .local v0, "msg":Landroid/os/Message;
    sget-boolean v1, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BtPhonebookActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[PBSync] sendPBMsg("

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

    .line 1251
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBHandler:Landroid/os/Handler;

    if-eqz v1, :cond_1

    .line 1252
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 1253
    iput p1, v0, Landroid/os/Message;->what:I

    .line 1254
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1255
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1260
    :goto_0
    return-void

    .line 1258
    :cond_1
    const-string v1, "BtPhonebookActivity"

    const-string v2, "[PB]mPBHandler is null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private showToast(I)V
    .locals 3
    .param p1, "resid"    # I

    .prologue
    .line 1000
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mToast:Landroid/widget/Toast;

    if-nez v0, :cond_0

    .line 1001
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, ""

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mToast:Landroid/widget/Toast;

    .line 1003
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0, p1}, Landroid/widget/Toast;->setText(I)V

    .line 1004
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1005
    return-void
.end method

.method private showUpdateDialog()V
    .locals 3

    .prologue
    .line 762
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    if-nez v0, :cond_0

    .line 763
    new-instance v0, Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    .line 765
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f0700d1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 766
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const/high16 v1, 0x7f070000

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 767
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f0200ef

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 768
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f070088

    new-instance v2, Lcom/autochips/bluetooth/BtPhonebookActivity$5;

    invoke-direct {v2, p0}, Lcom/autochips/bluetooth/BtPhonebookActivity$5;-><init>(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 787
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f070089

    new-instance v2, Lcom/autochips/bluetooth/BtPhonebookActivity$6;

    invoke-direct {v2, p0}, Lcom/autochips/bluetooth/BtPhonebookActivity$6;-><init>(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 792
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 793
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 11
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v10, 0x7f0a0069

    const v9, 0x7f070025

    const/4 v8, 0x4

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 797
    sget-boolean v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-nez v4, :cond_1

    .line 798
    sget-boolean v4, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v4, :cond_0

    const-string v4, "BtPhonebookActivity"

    const-string v5, "[BTSuite2]onClick:no connect bluetooth device!!!"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 882
    :cond_0
    :goto_0
    return-void

    .line 802
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    goto :goto_0

    .line 806
    :pswitch_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 808
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-boolean v4, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v4, :cond_2

    const-string v4, "BtPhonebookActivity"

    const-string v5, "onItemClick "

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 809
    :cond_2
    iget-boolean v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSupportFlag:Z

    if-eqz v4, :cond_3

    iget v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookIndex:I

    if-ltz v4, :cond_3

    iget-object v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v4, v7, :cond_3

    iget v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookIndex:I

    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v4, v5, :cond_4

    .line 810
    :cond_3
    const v4, 0x7f07004a

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtPhonebookActivity;->showToast(I)V

    goto :goto_0

    .line 814
    :cond_4
    sget-boolean v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mbInRds:Z

    if-eqz v4, :cond_6

    .line 815
    sget-boolean v4, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v4, :cond_5

    const-string v4, "BtPhonebookActivity"

    const-string v5, "Bluetooth RDS exist"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 816
    :cond_5
    const v4, 0x7f07005f

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtPhonebookActivity;->showToast(I)V

    goto :goto_0

    .line 819
    :cond_6
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBList:Ljava/util/ArrayList;

    iget v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookIndex:I

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    check-cast v0, Ljava/util/HashMap;

    .line 820
    .restart local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "item_phonebook_name"

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 821
    .local v2, "pbname":Ljava/lang/String;
    const-string v4, "item_phonebook_number"

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 823
    .local v3, "pbnumber":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 827
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->ReadSyncState()V

    .line 829
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->bt_callout_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_CALLOUT_NAME"

    invoke-virtual {v4, v5, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 830
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->bt_callout_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_CALLOUT_NUMBER"

    invoke-virtual {v4, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 831
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->bt_callout_intent:Landroid/content/Intent;

    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/BtPhonebookActivity;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 834
    .end local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "pbname":Ljava/lang/String;
    .end local v3    # "pbnumber":Ljava/lang/String;
    :pswitch_1
    iget v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadedNum:I

    if-nez v4, :cond_8

    .line 835
    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetSyncState()I

    move-result v4

    if-nez v4, :cond_7

    .line 836
    iput-boolean v6, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mIsSyncFinish:Z

    .line 837
    iput v7, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookId:I

    .line 838
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->WriteSyncState()V

    .line 839
    invoke-virtual {p0, v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setEnabled(Z)V

    .line 840
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 841
    .local v1, "message":Landroid/os/Message;
    iput v8, v1, Landroid/os/Message;->what:I

    .line 842
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v4, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 843
    invoke-direct {p0, v6}, Lcom/autochips/bluetooth/BtPhonebookActivity;->DownloadPhonebook(Z)V

    goto/16 :goto_0

    .line 845
    .end local v1    # "message":Landroid/os/Message;
    :cond_7
    invoke-direct {p0, v9}, Lcom/autochips/bluetooth/BtPhonebookActivity;->showToast(I)V

    goto/16 :goto_0

    .line 849
    :cond_8
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->showUpdateDialog()V

    goto/16 :goto_0

    .line 853
    :pswitch_2
    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetSyncState()I

    move-result v4

    if-eqz v4, :cond_9

    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetSyncPath()I

    move-result v4

    const/4 v5, 0x6

    if-ne v4, v5, :cond_9

    .line 856
    invoke-direct {p0, v9}, Lcom/autochips/bluetooth/BtPhonebookActivity;->showToast(I)V

    goto/16 :goto_0

    .line 859
    :cond_9
    iget-boolean v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSyncState:Z

    if-ne v7, v4, :cond_a

    .line 861
    const v4, 0x7f0a006b

    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setEnabled(Z)V

    .line 862
    const v4, 0x7f0a006b

    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020091

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 864
    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v4, :cond_0

    .line 865
    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StopDownload(I)Z

    goto/16 :goto_0

    .line 869
    :cond_a
    iput-boolean v6, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mIsSyncFinish:Z

    .line 870
    iput v7, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookId:I

    .line 871
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->WriteSyncState()V

    .line 872
    invoke-virtual {p0, v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setEnabled(Z)V

    .line 873
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 874
    .restart local v1    # "message":Landroid/os/Message;
    iput v8, v1, Landroid/os/Message;->what:I

    .line 875
    iget-object v4, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v4, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 876
    invoke-direct {p0, v6}, Lcom/autochips/bluetooth/BtPhonebookActivity;->DownloadPhonebook(Z)V

    goto/16 :goto_0

    .line 802
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0069
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 446
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 448
    const v0, 0x7f03000c

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->setContentView(I)V

    .line 450
    iput v8, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookIndex:I

    .line 452
    iput-boolean v9, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mFirstCreate:Z

    .line 454
    const v0, 0x7f0a0067

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchText:Landroid/widget/EditText;

    .line 456
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 458
    const v0, 0x7f0a0069

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 459
    const v0, 0x7f0a006a

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 460
    const v0, 0x7f0a006b

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 464
    const v0, 0x7f0a006c

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadLayout:Landroid/widget/LinearLayout;

    .line 465
    const v0, 0x7f0a006d

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadProgress:Landroid/widget/ProgressBar;

    .line 466
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v8}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 467
    const v0, 0x7f0a006e

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mDownloadTextView:Landroid/widget/TextView;

    .line 469
    const v0, 0x7f0a0068

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookListView:Landroid/widget/ListView;

    .line 471
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBList:Ljava/util/ArrayList;

    .line 482
    new-instance v0, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    iget-object v3, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBList:Ljava/util/ArrayList;

    const v4, 0x7f030017

    new-array v5, v2, [Ljava/lang/String;

    const-string v1, "item_phonebook_name"

    aput-object v1, v5, v8

    const-string v1, "item_phonebook_number"

    aput-object v1, v5, v9

    new-array v6, v2, [I

    fill-array-data v6, :array_0

    move-object v1, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v6}, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;-><init>(Lcom/autochips/bluetooth/BtPhonebookActivity;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mAdapter:Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    .line 488
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mAdapter:Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 489
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhoneBookListClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 490
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhoneBookScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 491
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchText:Landroid/widget/EditText;

    const v1, 0x7f070090

    new-array v2, v9, [Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 492
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mAdapter:Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 494
    new-instance v7, Landroid/content/IntentFilter;

    invoke-direct {v7}, Landroid/content/IntentFilter;-><init>()V

    .line 495
    .local v7, "intentFilter":Landroid/content/IntentFilter;
    const-string v0, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_finish"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 496
    const-string v0, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_onestep"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 497
    const-string v0, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_stop"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 498
    const-string v0, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.startdownload_position"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 501
    const-string v0, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 502
    const-string v0, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 503
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0, v7}, Lcom/autochips/bluetooth/BtPhonebookActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 505
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchText:Landroid/widget/EditText;

    new-instance v1, Lcom/autochips/bluetooth/BtPhonebookActivity$4;

    invoke-direct {v1, p0}, Lcom/autochips/bluetooth/BtPhonebookActivity$4;-><init>(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 586
    return-void

    .line 482
    :array_0
    .array-data 4
        0x7f0a009d
        0x7f0a009e
    .end array-data
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 599
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 600
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 601
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 892
    const/4 v0, 0x0

    return v0
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 629
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 630
    sget-boolean v1, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BtPhonebookActivity"

    const-string v2, "+++ onPause +++"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 631
    :cond_0
    const-string v1, "input_method"

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 632
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getApplicationWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 635
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->WriteSyncState()V

    .line 636
    return-void
.end method

.method protected onResume()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x2

    const/4 v6, 0x1

    const v4, 0x7f0a006b

    const/4 v5, 0x0

    .line 640
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 641
    sget-boolean v2, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BtPhonebookActivity"

    const-string v3, "+++ onResume +++"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 642
    :cond_0
    sget-boolean v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v2, :cond_1

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-nez v2, :cond_4

    .line 643
    :cond_1
    sget-boolean v2, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v2, :cond_2

    const-string v2, "BtPhonebookActivity"

    const-string v3, "connect bluetooth first"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 644
    :cond_2
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 645
    .local v1, "message":Landroid/os/Message;
    iput v8, v1, Landroid/os/Message;->what:I

    .line 646
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 647
    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 648
    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020091

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 650
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookListView:Landroid/widget/ListView;

    invoke-virtual {v2, v5}, Landroid/widget/ListView;->setEnabled(Z)V

    .line 651
    iput-boolean v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mFirstCreate:Z

    .line 738
    .end local v1    # "message":Landroid/os/Message;
    :cond_3
    :goto_0
    return-void

    .line 663
    :cond_4
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPhonebookListView:Landroid/widget/ListView;

    invoke-virtual {v2, v6}, Landroid/widget/ListView;->setEnabled(Z)V

    .line 664
    const/4 v0, 0x0

    .line 665
    .local v0, "aboutToDownload":Z
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->ReadSyncState()V

    .line 666
    iget-boolean v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mIsSyncFinish:Z

    if-eqz v2, :cond_5

    .line 667
    iput-boolean v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mFirstCreate:Z

    .line 668
    sput-boolean v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldPbWhenConnect:Z

    .line 699
    :cond_5
    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v2, :cond_6

    if-nez v0, :cond_6

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mLastDwnldAddr:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 701
    :cond_6
    sget-boolean v2, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v2, :cond_7

    const-string v2, "BtPhonebookActivity"

    const-string v3, "onResume() clear records in listview!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 702
    :cond_7
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 703
    .restart local v1    # "message":Landroid/os/Message;
    iput v8, v1, Landroid/os/Message;->what:I

    .line 704
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 736
    .end local v1    # "message":Landroid/os/Message;
    :cond_8
    :goto_1
    iput-boolean v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mFirstCreate:Z

    .line 737
    sget-boolean v2, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v2, :cond_3

    const-string v2, "BtPhonebookActivity"

    const-string v3, "onResume end"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 705
    :cond_9
    iget-boolean v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mIsSyncFinish:Z

    if-eqz v2, :cond_c

    .line 706
    sget-boolean v2, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v2, :cond_a

    const-string v2, "BtPhonebookActivity"

    const-string v3, "onResume() download finish, no need Syncing!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 707
    :cond_a
    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 708
    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020091

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 710
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->clear()V

    .line 711
    const-string v2, ""

    iput-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mLastSearch:Ljava/lang/String;

    .line 712
    iput-boolean v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSearchFlag:Z

    .line 713
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_b

    .line 714
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 715
    .restart local v1    # "message":Landroid/os/Message;
    iput v7, v1, Landroid/os/Message;->what:I

    .line 716
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 718
    .end local v1    # "message":Landroid/os/Message;
    :cond_b
    iput-boolean v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mFirstCreate:Z

    goto/16 :goto_0

    .line 721
    :cond_c
    sget-boolean v2, Lcom/autochips/bluetooth/BtPhonebookActivity;->DEBUG:Z

    if-eqz v2, :cond_d

    const-string v2, "BtPhonebookActivity"

    const-string v3, "onResume() download not finish, show have downloaded Record!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 723
    :cond_d
    iget-boolean v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mSyncState:Z

    if-ne v6, v2, :cond_e

    .line 724
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->enablePasueButtonshowDownloading()V

    .line 729
    :goto_2
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->mPBList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_8

    .line 730
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 731
    .restart local v1    # "message":Landroid/os/Message;
    iput v7, v1, Landroid/os/Message;->what:I

    .line 732
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_1

    .line 726
    .end local v1    # "message":Landroid/os/Message;
    :cond_e
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->enablePasueButtonshowDownloadStoped()V

    goto :goto_2
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outstate"    # Landroid/os/Bundle;

    .prologue
    .line 442
    return-void
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 619
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 620
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 624
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 625
    return-void
.end method
