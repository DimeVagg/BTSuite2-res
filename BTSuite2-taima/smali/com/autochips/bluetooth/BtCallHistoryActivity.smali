.class public Lcom/autochips/bluetooth/BtCallHistoryActivity;
.super Landroid/app/Activity;
.source "BtCallHistoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;
    }
.end annotation


# static fields
.field private static DEBUG:Z = false

.field private static final EACH_PATH_MAX_COUNT:I = 0xc8

.field private static final ID_ALLCALL_LIST:I = 0x0

.field private static final ID_DIALED_LIST:I = 0x2

.field private static final ID_MISSED_LIST:I = 0x3

.field private static final ID_RECIEVED_LIST:I = 0x1

.field private static final MSG_HANDLER_ADDCALL:I = 0x3

.field private static final MSG_HANDLE_ALL_UPDATE:I = 0x2

.field private static final MSG_HANDLE_CLEAR:I = 0x4

.field private static final MSG_HANDLE_ONESTEP_UPDATE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "BtCallHistoryActivity"

.field public static mAllCallList:Ljava/util/ArrayList;
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

.field public static mDialedList:Ljava/util/ArrayList;
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

.field public static mMissedList:Ljava/util/ArrayList;
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

.field public static mRecievedList:Ljava/util/ArrayList;
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


# instance fields
.field private final MSG_CLY_DOWNLOAD:I

.field private action_call:Lcom/autochips/bluetooth/util/ActionItem;

.field bt_callout_intent:Landroid/content/Intent;

.field private builderWarning:Landroid/app/AlertDialog$Builder;

.field private mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

.field private mAllhistoryButton:Landroid/widget/Button;

.field private mCallButton:Landroid/widget/Button;

.field private mCallHistoryList:Ljava/util/ArrayList;
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

.field private mChooseRecordType:I

.field private mClyHandler:Landroid/os/Handler;

.field private mDialedButton:Landroid/widget/Button;

.field private mDownloadLayout:Landroid/widget/LinearLayout;

.field private mDownloadPath:I

.field private mDownloadProgress:Landroid/widget/ProgressBar;

.field private mDownloadTextView:Landroid/widget/TextView;

.field private mDownloadedNum:I

.field private mEndTime:J

.field private mFirstCreate:Z

.field private mHistoryAllcallid:I

.field private mHistoryDialCallid:I

.field private mHistoryIndex:I

.field private mHistoryListClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mHistoryListView:Landroid/widget/ListView;

.field private mHistoryMissCallid:I

.field private mHistoryReceiveCallid:I

.field private mHistoryScrollListener:Landroid/widget/AbsListView$OnScrollListener;

.field private mIsSyncFinish:Z

.field private mLastDwnldAddr:Ljava/lang/String;

.field private mMissedButton:Landroid/widget/Button;

.field private mPauseButton:Landroid/widget/Button;

.field private mReceivedButton:Landroid/widget/Button;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mShowedDialedNum:I

.field private mShowedMissedNum:I

.field private mShowedReceivedNum:I

.field private mShowedRecordNum:I

.field private mStartTime:J

.field private mSupportFlag:Z

.field private mSyncButton:Landroid/widget/Button;

.field private mSyncState:Z

.field private mToast:Landroid/widget/Toast;

.field private mWaitThread:Ljava/lang/Thread;

.field private mbContinueDownload:Z

.field private running:Z

.field private uiHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x1

    sput-boolean v0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 89
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 141
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSupportFlag:Z

    .line 145
    iput v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->MSG_CLY_DOWNLOAD:I

    .line 146
    iput-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mWaitThread:Ljava/lang/Thread;

    .line 148
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mbContinueDownload:Z

    .line 154
    iput v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryAllcallid:I

    .line 155
    iput v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryReceiveCallid:I

    .line 156
    iput v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryDialCallid:I

    .line 157
    iput v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryMissCallid:I

    .line 162
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mFirstCreate:Z

    .line 166
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSyncState:Z

    .line 176
    const-string v0, ""

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mLastDwnldAddr:Ljava/lang/String;

    .line 181
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mIsSyncFinish:Z

    .line 183
    iput-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    .line 185
    new-instance v0, Lcom/autochips/bluetooth/util/ActionItem;

    invoke-direct {v0}, Lcom/autochips/bluetooth/util/ActionItem;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->action_call:Lcom/autochips/bluetooth/util/ActionItem;

    .line 187
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.autochips.bluetooth.BtDialPadActivity.action.BLUETOOTH_CALLOUT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->bt_callout_intent:Landroid/content/Intent;

    .line 189
    new-instance v0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;-><init>(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->uiHandler:Landroid/os/Handler;

    .line 260
    new-instance v0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;-><init>(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 501
    new-instance v0, Lcom/autochips/bluetooth/BtCallHistoryActivity$3;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity$3;-><init>(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mClyHandler:Landroid/os/Handler;

    .line 941
    new-instance v0, Lcom/autochips/bluetooth/BtCallHistoryActivity$6;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity$6;-><init>(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 999
    new-instance v0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;-><init>(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    .line 1557
    return-void
.end method

.method private DownloadHistory(Z)V
    .locals 7
    .param p1, "bContinue"    # Z

    .prologue
    const/16 v6, 0xc8

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1149
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mStartTime:J

    .line 1150
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-nez v0, :cond_1

    .line 1211
    :cond_0
    :goto_0
    return-void

    .line 1153
    :cond_1
    sget-boolean v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-ne v5, v0, :cond_3

    .line 1154
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceivedButton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1155
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedButton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1156
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedButton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1157
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllhistoryButton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1158
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSyncButton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1159
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1160
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0200bb

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1163
    iput v4, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedRecordNum:I

    .line 1164
    iput v4, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    .line 1165
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetSyncState()I

    move-result v0

    if-nez v0, :cond_2

    .line 1166
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadTextView:Landroid/widget/TextView;

    const v1, 0x7f070023

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1170
    :goto_1
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1172
    iput-boolean v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSyncState:Z

    .line 1174
    iput-boolean v4, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mIsSyncFinish:Z

    .line 1175
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mLastDwnldAddr:Ljava/lang/String;

    .line 1193
    iput-boolean v4, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mIsSyncFinish:Z

    .line 1194
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->WriteSyncState()V

    .line 1195
    const/4 v0, 0x6

    iput v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadPath:I

    .line 1196
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    iget v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadPath:I

    invoke-virtual {v0, v1, v2}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->SetRemoteDevice(Landroid/bluetooth/BluetoothDevice;I)Z

    .line 1198
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v1, 0x3

    invoke-virtual {v0, v1, v6}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->SetDownloadMaxCnt(II)V

    .line 1201
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v1, 0x4

    invoke-virtual {v0, v1, v6}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->SetDownloadMaxCnt(II)V

    .line 1204
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v1, 0x5

    invoke-virtual {v0, v1, v6}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->SetDownloadMaxCnt(II)V

    .line 1207
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    iget v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadPath:I

    invoke-virtual {v0, v1, p1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StartDownload(IZ)Z

    goto/16 :goto_0

    .line 1168
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadTextView:Landroid/widget/TextView;

    const v1, 0x7f070026

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 1209
    :cond_3
    sget-boolean v0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtCallHistoryActivity"

    const-string v1, "connect bluetooth first"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method private ReadSyncState()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 1549
    const-string v1, "CLY_SyncState"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1550
    .local v0, "sharedata":Landroid/content/SharedPreferences;
    const-string v1, "BTADDR"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mLastDwnldAddr:Ljava/lang/String;

    .line 1551
    const-string v1, "CallHistorySyncState"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mIsSyncFinish:Z

    .line 1552
    iget-boolean v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mIsSyncFinish:Z

    if-eqz v1, :cond_0

    .line 1553
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSupportFlag:Z

    .line 1555
    :cond_0
    return-void
.end method

.method private SetCurrentListButton(I)V
    .locals 7
    .param p1, "select"    # I

    .prologue
    const v6, 0x7f02007f

    const v5, 0x7f02007d

    const v4, 0x7f02007b

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 1676
    packed-switch p1, :pswitch_data_0

    .line 1722
    :goto_0
    return-void

    .line 1678
    :pswitch_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceivedButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1679
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1680
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1681
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllhistoryButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    .line 1684
    :pswitch_1
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceivedButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1685
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceivedButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f02007c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1687
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1688
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1690
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1691
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1693
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllhistoryButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    .line 1696
    :pswitch_2
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceivedButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1697
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceivedButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1699
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1700
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f02007e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1702
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1703
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1705
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllhistoryButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    goto/16 :goto_0

    .line 1708
    :pswitch_3
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceivedButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1709
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceivedButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1711
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1712
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1714
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedButton:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1715
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020080

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1717
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllhistoryButton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    goto/16 :goto_0

    .line 1676
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private WriteSyncState()V
    .locals 4

    .prologue
    .line 1539
    const-string v2, "CLY_SyncState"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1540
    .local v1, "sharedata":Landroid/content/SharedPreferences$Editor;
    const-string v2, "BTADDR"

    iget-object v3, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mLastDwnldAddr:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1541
    const-string v2, "CallHistorySyncState"

    iget-boolean v3, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mIsSyncFinish:Z

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1543
    new-instance v0, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;

    invoke-direct {v0, v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;-><init>(Landroid/content/SharedPreferences$Editor;)V

    .line 1545
    .local v0, "commitor":Lcom/autochips/bluetooth/PbSyncManager/PBSyncStruct$SharedPreferencesCommitor;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 1546
    return-void
.end method

.method static synthetic access$000(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->loadAllCallFirstPageData()V

    return-void
.end method

.method static synthetic access$100(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->SetCurrentListButton(I)V

    return-void
.end method

.method static synthetic access$1000(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedDialedNum:I

    return v0
.end method

.method static synthetic access$1002(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedDialedNum:I

    return p1
.end method

.method static synthetic access$1012(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedDialedNum:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedDialedNum:I

    return v0
.end method

.method static synthetic access$1100(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedMissedNum:I

    return v0
.end method

.method static synthetic access$1102(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedMissedNum:I

    return p1
.end method

.method static synthetic access$1112(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedMissedNum:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedMissedNum:I

    return v0
.end method

.method static synthetic access$1202(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryAllcallid:I

    return p1
.end method

.method static synthetic access$1208(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryAllcallid:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryAllcallid:I

    return v0
.end method

.method static synthetic access$1300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSupportFlag:Z

    return v0
.end method

.method static synthetic access$1402(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 89
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSupportFlag:Z

    return p1
.end method

.method static synthetic access$1500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadPath:I

    return v0
.end method

.method static synthetic access$1502(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadPath:I

    return p1
.end method

.method static synthetic access$1600(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSyncState:Z

    return v0
.end method

.method static synthetic access$1602(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 89
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSyncState:Z

    return p1
.end method

.method static synthetic access$1700(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mIsSyncFinish:Z

    return v0
.end method

.method static synthetic access$1702(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 89
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mIsSyncFinish:Z

    return p1
.end method

.method static synthetic access$1800(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->WriteSyncState()V

    return-void
.end method

.method static synthetic access$1900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceivedButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllhistoryButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSyncButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/autochips/bluetooth/BtCallHistoryActivity;)J
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-wide v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mEndTime:J

    return-wide v0
.end method

.method static synthetic access$2702(Lcom/autochips/bluetooth/BtCallHistoryActivity;J)J
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # J

    .prologue
    .line 89
    iput-wide p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mEndTime:J

    return-wide p1
.end method

.method static synthetic access$2800(Lcom/autochips/bluetooth/BtCallHistoryActivity;)J
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-wide v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mStartTime:J

    return-wide v0
.end method

.method static synthetic access$2900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->uiHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$300(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->handleFirstPageDataView(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$3000(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DownloadHistory(Z)V

    return-void
.end method

.method static synthetic access$3102(Lcom/autochips/bluetooth/BtCallHistoryActivity;Ljava/lang/Thread;)Ljava/lang/Thread;
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # Ljava/lang/Thread;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mWaitThread:Ljava/lang/Thread;

    return-object p1
.end method

.method static synthetic access$3200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mbContinueDownload:Z

    return v0
.end method

.method static synthetic access$3300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    return v0
.end method

.method static synthetic access$3302(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    return p1
.end method

.method static synthetic access$3402(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryDialCallid:I

    return p1
.end method

.method static synthetic access$3408(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryDialCallid:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryDialCallid:I

    return v0
.end method

.method static synthetic access$3502(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryMissCallid:I

    return p1
.end method

.method static synthetic access$3508(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryMissCallid:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryMissCallid:I

    return v0
.end method

.method static synthetic access$3602(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryReceiveCallid:I

    return p1
.end method

.method static synthetic access$3608(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryReceiveCallid:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryReceiveCallid:I

    return v0
.end method

.method static synthetic access$3702(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    return p1
.end method

.method static synthetic access$400(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->handleUpdateDownloadNum(I)V

    return-void
.end method

.method static synthetic access$500()Z
    .locals 1

    .prologue
    .line 89
    sget-boolean v0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    return v0
.end method

.method static synthetic access$600(Lcom/autochips/bluetooth/BtCallHistoryActivity;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->handleAddOneRecord(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedRecordNum:I

    return v0
.end method

.method static synthetic access$702(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedRecordNum:I

    return p1
.end method

.method static synthetic access$712(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedRecordNum:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedRecordNum:I

    return v0
.end method

.method static synthetic access$800(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    return v0
.end method

.method static synthetic access$802(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    return p1
.end method

.method static synthetic access$900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedReceivedNum:I

    return v0
.end method

.method static synthetic access$902(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedReceivedNum:I

    return p1
.end method

.method static synthetic access$912(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtCallHistoryActivity;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedReceivedNum:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedReceivedNum:I

    return v0
.end method

.method private enablePasueButtonshowDownloadStoped()V
    .locals 3

    .prologue
    .line 712
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    if-eqz v0, :cond_0

    .line 713
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 714
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0200db

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 719
    return-void

    .line 717
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "pause button can not found"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private enablePasueButtonshowDownloading()V
    .locals 3

    .prologue
    .line 702
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    if-eqz v0, :cond_0

    .line 703
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 704
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0200dc

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 709
    return-void

    .line 707
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "pause button can not found"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private handleAddOneRecord(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "type"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "tel"    # Ljava/lang/String;
    .param p4, "calltime"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1214
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-nez v1, :cond_1

    .line 1262
    :cond_0
    :goto_0
    return-void

    .line 1217
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1218
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p2, :cond_2

    const-string v1, ""

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1219
    :cond_2
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p3}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetNameByTelExectly(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1222
    const-string v1, ""

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1223
    const v1, 0x7f070091

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getString(I)Ljava/lang/String;

    move-result-object p2

    .line 1226
    :cond_3
    const-string v1, "item_history_name"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1227
    const-string v1, "item_history_number"

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1228
    const-string v1, "item_history_time"

    invoke-virtual {v0, v1, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1229
    if-nez p1, :cond_5

    .line 1230
    const-string v1, "btn_call_history_img"

    const v2, 0x7f0200cb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1231
    iput v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    .line 1232
    iget v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->SetCurrentListButton(I)V

    .line 1236
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->loadDialedFirstPageData()V

    .line 1238
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListView:Landroid/widget/ListView;

    invoke-virtual {v1, v3, v3}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    .line 1260
    :cond_4
    :goto_1
    sget-object v1, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllCallList:Ljava/util/ArrayList;

    invoke-virtual {v1, v3, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 1239
    :cond_5
    if-ne v4, p1, :cond_6

    .line 1240
    const-string v1, "btn_call_history_img"

    const v2, 0x7f0200c9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1241
    iput v4, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    .line 1242
    iget v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->SetCurrentListButton(I)V

    .line 1246
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->loadReceivedFirstPageData()V

    .line 1248
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListView:Landroid/widget/ListView;

    invoke-virtual {v1, v3, v3}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    goto :goto_1

    .line 1249
    :cond_6
    if-ne v5, p1, :cond_4

    .line 1250
    const-string v1, "btn_call_history_img"

    const v2, 0x7f0200ca

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1251
    const/4 v1, 0x3

    iput v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    .line 1252
    iget v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->SetCurrentListButton(I)V

    .line 1256
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->loadMissedFirstPageData()V

    .line 1258
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListView:Landroid/widget/ListView;

    invoke-virtual {v1, v3, v3}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    goto :goto_1
.end method

.method private handleFirstPageDataView(I)I
    .locals 13
    .param p1, "iOneStepCount"    # I

    .prologue
    const/4 v8, 0x0

    .line 1265
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v9, :cond_0

    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-nez v9, :cond_1

    .line 1325
    :cond_0
    :goto_0
    return v8

    .line 1269
    :cond_1
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1270
    .local v6, "record":Ljava/util/List;, "Ljava/util/List<Lcom/autochips/bluetooth/PbSyncManager/PBRecord;>;"
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v10}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v10

    iget v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadPath:I

    invoke-virtual {v9, v10, v11}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecCnt(Ljava/lang/String;I)I

    move-result v2

    .line 1272
    .local v2, "iCount":I
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    iget v10, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadPath:I

    iget v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedRecordNum:I

    invoke-virtual {v9, v10, v11, p1, v6}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecord(IIILjava/util/List;)Z

    move-result v0

    .line 1274
    .local v0, "bRes":Z
    if-eqz v0, :cond_e

    .line 1275
    iget v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedRecordNum:I

    add-int/2addr v9, p1

    iput v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedRecordNum:I

    .line 1276
    iget v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    add-int/2addr v9, p1

    iput v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    .line 1277
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadTextView:Landroid/widget/TextView;

    const v10, 0x7f070023

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    iget v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v8

    invoke-virtual {p0, v10, v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1278
    sget-boolean v8, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v8, :cond_2

    .line 1279
    const-string v8, "BtCallHistoryActivity"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "mShowedRecordNum = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedRecordNum:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " iOneStepCount = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1282
    :cond_2
    sget-boolean v8, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v8, :cond_3

    .line 1283
    const-string v8, "BtCallHistoryActivity"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "download callhistory iCount = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " get record size = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1285
    :cond_3
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v8

    if-ge v1, v8, :cond_d

    .line 1286
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1288
    .local v3, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v8}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getName()Ljava/lang/String;

    move-result-object v4

    .line 1289
    .local v4, "name":Ljava/lang/String;
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v8, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v8}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v8}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v10, v8}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetNameByTelExectly(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1292
    .local v5, "pbName":Ljava/lang/String;
    const-string v8, ""

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7

    .line 1293
    move-object v4, v5

    .line 1299
    :cond_4
    :goto_2
    const-string v8, "item_history_name"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget v10, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryAllcallid:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryAllcallid:I

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ". "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1300
    const-string v9, "item_history_number"

    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v8}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v9, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1301
    const-string v9, "item_history_time"

    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v8}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getCalltime()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v9, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1302
    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v8}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getType()I

    move-result v7

    .line 1303
    .local v7, "type":I
    const/16 v8, 0x40

    if-eq v7, v8, :cond_5

    const/16 v8, 0x80

    if-ne v7, v8, :cond_9

    .line 1305
    :cond_5
    const-string v8, "btn_call_history_img"

    const v9, 0x7f0200c9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v3, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1316
    :cond_6
    :goto_3
    sget-object v8, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllCallList:Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1317
    iget-object v8, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1285
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_1

    .line 1294
    .end local v7    # "type":I
    :cond_7
    if-eqz v4, :cond_8

    const-string v8, ""

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_8

    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v8}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 1296
    :cond_8
    const v8, 0x7f070091

    invoke-virtual {p0, v8}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_2

    .line 1307
    .restart local v7    # "type":I
    :cond_9
    const/16 v8, 0x100

    if-eq v7, v8, :cond_a

    const/16 v8, 0x200

    if-ne v7, v8, :cond_b

    .line 1309
    :cond_a
    const-string v8, "btn_call_history_img"

    const v9, 0x7f0200cb

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v3, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 1311
    :cond_b
    const/16 v8, 0x400

    if-eq v7, v8, :cond_c

    const/16 v8, 0x800

    if-ne v7, v8, :cond_6

    .line 1313
    :cond_c
    const-string v8, "btn_call_history_img"

    const v9, 0x7f0200ca

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v3, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 1319
    .end local v3    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "pbName":Ljava/lang/String;
    .end local v7    # "type":I
    :cond_d
    iget-object v8, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v8}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1325
    .end local v1    # "i":I
    :goto_4
    iget v8, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedRecordNum:I

    goto/16 :goto_0

    .line 1321
    :cond_e
    const-string v8, "BtCallHistoryActivity"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "[phonebook] GetRecord error, startIdx = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedRecordNum:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", count = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4
.end method

.method private handleUpdateDownloadNum(I)V
    .locals 5
    .param p1, "iOneStepCount"    # I

    .prologue
    .line 1329
    iget v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    .line 1330
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadTextView:Landroid/widget/TextView;

    const v1, 0x7f070024

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1331
    return-void
.end method

.method private loadAllCallFirstPageData()V
    .locals 13

    .prologue
    .line 1334
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 1335
    sget-object v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllCallList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 1336
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1337
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v9, :cond_0

    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-nez v9, :cond_1

    .line 1390
    :cond_0
    :goto_0
    return-void

    .line 1341
    :cond_1
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 1344
    .local v7, "record":Ljava/util/List;, "Ljava/util/List<Lcom/autochips/bluetooth/PbSyncManager/PBRecord;>;"
    const/4 v5, 0x6

    .line 1345
    .local v5, "path":I
    const/16 v1, 0xa

    .line 1346
    .local v1, "firstpageCount":I
    const/4 v9, 0x1

    iput v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryAllcallid:I

    .line 1347
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v10}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10, v5}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecCnt(Ljava/lang/String;I)I

    move-result v9

    iput v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    .line 1349
    iget v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    if-ge v9, v1, :cond_2

    .line 1350
    iget v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    .line 1351
    :cond_2
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v10, 0x0

    invoke-virtual {v9, v5, v10, v1, v7}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecord(IIILjava/util/List;)Z

    move-result v0

    .line 1352
    .local v0, "bRes":Z
    sget-boolean v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v9, :cond_3

    .line 1353
    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "download All call iCount = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " record.size() = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1355
    :cond_3
    if-eqz v0, :cond_0

    .line 1356
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v9

    if-ge v2, v9, :cond_d

    .line 1357
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1358
    .local v3, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getName()Ljava/lang/String;

    move-result-object v4

    .line 1359
    .local v4, "name":Ljava/lang/String;
    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v9}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v11, v9}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetNameByTelExectly(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1362
    .local v6, "pbName":Ljava/lang/String;
    const-string v9, ""

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_7

    .line 1363
    move-object v4, v6

    .line 1368
    :cond_4
    :goto_2
    const-string v9, "item_history_name"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryAllcallid:I

    add-int/lit8 v12, v11, 0x1

    iput v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryAllcallid:I

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ". "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1369
    const-string v10, "item_history_number"

    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1370
    const-string v10, "item_history_time"

    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getCalltime()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1371
    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getType()I

    move-result v8

    .line 1372
    .local v8, "type":I
    const/16 v9, 0x40

    if-eq v8, v9, :cond_5

    const/16 v9, 0x80

    if-ne v8, v9, :cond_9

    .line 1374
    :cond_5
    const-string v9, "btn_call_history_img"

    const v10, 0x7f0200c9

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v3, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1382
    :cond_6
    :goto_3
    sget-object v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllCallList:Ljava/util/ArrayList;

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1356
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 1364
    .end local v8    # "type":I
    :cond_7
    if-eqz v4, :cond_8

    const-string v9, ""

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_8

    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 1366
    :cond_8
    const v9, 0x7f070091

    invoke-virtual {p0, v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_2

    .line 1375
    .restart local v8    # "type":I
    :cond_9
    const/16 v9, 0x100

    if-eq v8, v9, :cond_a

    const/16 v9, 0x200

    if-ne v8, v9, :cond_b

    .line 1377
    :cond_a
    const-string v9, "btn_call_history_img"

    const v10, 0x7f0200cb

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v3, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 1378
    :cond_b
    const/16 v9, 0x400

    if-eq v8, v9, :cond_c

    const/16 v9, 0x800

    if-ne v8, v9, :cond_6

    .line 1380
    :cond_c
    const-string v9, "btn_call_history_img"

    const v10, 0x7f0200ca

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v3, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 1384
    .end local v3    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "pbName":Ljava/lang/String;
    .end local v8    # "type":I
    :cond_d
    iput v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedRecordNum:I

    .line 1385
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    sget-object v10, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllCallList:Ljava/util/ArrayList;

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1386
    sget-boolean v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v9, :cond_e

    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "loadAllCallFirstPageData mCallHistoryList size = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1388
    :cond_e
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0
.end method

.method private loadDialedFirstPageData()V
    .locals 13

    .prologue
    .line 1490
    sget-boolean v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v9, :cond_0

    const-string v9, "BtCallHistoryActivity"

    const-string v10, "loadDialedFirstPageData()"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1491
    :cond_0
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 1492
    sget-object v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 1493
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1494
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v9, :cond_1

    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-nez v9, :cond_2

    .line 1536
    :cond_1
    :goto_0
    return-void

    .line 1498
    :cond_2
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1502
    .local v8, "record":Ljava/util/List;, "Ljava/util/List<Lcom/autochips/bluetooth/PbSyncManager/PBRecord;>;"
    const/4 v6, 0x4

    .line 1503
    .local v6, "path":I
    const/16 v1, 0xa

    .line 1504
    .local v1, "firstpageCount":I
    const/4 v9, 0x1

    iput v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryDialCallid:I

    .line 1505
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v10}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10, v6}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecCnt(Ljava/lang/String;I)I

    move-result v3

    .line 1507
    .local v3, "iCount":I
    sget-boolean v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v9, :cond_3

    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "dialed call iCount = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1508
    :cond_3
    if-ge v3, v1, :cond_4

    .line 1509
    move v1, v3

    .line 1510
    :cond_4
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v10, 0x0

    invoke-virtual {v9, v6, v10, v1, v8}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecord(IIILjava/util/List;)Z

    move-result v0

    .line 1511
    .local v0, "bRes":Z
    sget-boolean v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v9, :cond_5

    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "download Dialed call iCount = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " record.size() = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1513
    :cond_5
    if-eqz v0, :cond_1

    .line 1514
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    if-ge v2, v9, :cond_9

    .line 1515
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1516
    .local v4, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getName()Ljava/lang/String;

    move-result-object v5

    .line 1517
    .local v5, "name":Ljava/lang/String;
    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v9}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v11, v9}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetNameByTelExectly(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1520
    .local v7, "pbName":Ljava/lang/String;
    const-string v9, ""

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_7

    .line 1521
    move-object v5, v7

    .line 1526
    :cond_6
    :goto_2
    const-string v9, "item_history_name"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryDialCallid:I

    add-int/lit8 v12, v11, 0x1

    iput v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryDialCallid:I

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ". "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1527
    const-string v10, "item_history_number"

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1528
    const-string v10, "item_history_time"

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getCalltime()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1529
    const-string v9, "btn_call_history_img"

    const v10, 0x7f0200cb

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1530
    sget-object v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedList:Ljava/util/ArrayList;

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1514
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 1522
    :cond_7
    if-eqz v5, :cond_8

    const-string v9, ""

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_8

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 1524
    :cond_8
    const v9, 0x7f070091

    invoke-virtual {p0, v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_2

    .line 1532
    .end local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "name":Ljava/lang/String;
    .end local v7    # "pbName":Ljava/lang/String;
    :cond_9
    iput v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedDialedNum:I

    .line 1533
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    sget-object v10, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedList:Ljava/util/ArrayList;

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1534
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0
.end method

.method private loadMissedFirstPageData()V
    .locals 13

    .prologue
    .line 1443
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 1444
    sget-object v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 1445
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1446
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v9, :cond_0

    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-nez v9, :cond_1

    .line 1487
    :cond_0
    :goto_0
    return-void

    .line 1450
    :cond_1
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1454
    .local v8, "record":Ljava/util/List;, "Ljava/util/List<Lcom/autochips/bluetooth/PbSyncManager/PBRecord;>;"
    const/4 v6, 0x5

    .line 1455
    .local v6, "path":I
    const/16 v1, 0xa

    .line 1456
    .local v1, "firstpageCount":I
    const/4 v9, 0x1

    iput v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryMissCallid:I

    .line 1457
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v10}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10, v6}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecCnt(Ljava/lang/String;I)I

    move-result v3

    .line 1459
    .local v3, "iCount":I
    if-ge v3, v1, :cond_2

    .line 1460
    move v1, v3

    .line 1461
    :cond_2
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v10, 0x0

    invoke-virtual {v9, v6, v10, v1, v8}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecord(IIILjava/util/List;)Z

    move-result v0

    .line 1462
    .local v0, "bRes":Z
    sget-boolean v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v9, :cond_3

    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "download Missed call iCount = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " record.size() = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1464
    :cond_3
    if-eqz v0, :cond_0

    .line 1465
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    if-ge v2, v9, :cond_7

    .line 1466
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1467
    .local v4, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getName()Ljava/lang/String;

    move-result-object v5

    .line 1468
    .local v5, "name":Ljava/lang/String;
    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v9}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v11, v9}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetNameByTelExectly(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1471
    .local v7, "pbName":Ljava/lang/String;
    const-string v9, ""

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_5

    .line 1472
    move-object v5, v7

    .line 1477
    :cond_4
    :goto_2
    const-string v9, "item_history_name"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryMissCallid:I

    add-int/lit8 v12, v11, 0x1

    iput v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryMissCallid:I

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ". "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1478
    const-string v10, "item_history_number"

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1479
    const-string v10, "item_history_time"

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getCalltime()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1480
    const-string v9, "btn_call_history_img"

    const v10, 0x7f0200ca

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1481
    sget-object v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedList:Ljava/util/ArrayList;

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1465
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 1473
    :cond_5
    if-eqz v5, :cond_6

    const-string v9, ""

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 1475
    :cond_6
    const v9, 0x7f070091

    invoke-virtual {p0, v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_2

    .line 1483
    .end local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "name":Ljava/lang/String;
    .end local v7    # "pbName":Ljava/lang/String;
    :cond_7
    iput v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedMissedNum:I

    .line 1484
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    sget-object v10, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedList:Ljava/util/ArrayList;

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1485
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0
.end method

.method private loadReceivedFirstPageData()V
    .locals 13

    .prologue
    .line 1393
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 1394
    sget-object v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mRecievedList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 1395
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1397
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v9, :cond_0

    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-nez v9, :cond_1

    .line 1440
    :cond_0
    :goto_0
    return-void

    .line 1401
    :cond_1
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1405
    .local v8, "record":Ljava/util/List;, "Ljava/util/List<Lcom/autochips/bluetooth/PbSyncManager/PBRecord;>;"
    const/4 v6, 0x3

    .line 1406
    .local v6, "path":I
    const/16 v1, 0xa

    .line 1407
    .local v1, "firstpageCount":I
    const/4 v9, 0x1

    iput v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryReceiveCallid:I

    .line 1408
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v10}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10, v6}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecCnt(Ljava/lang/String;I)I

    move-result v3

    .line 1410
    .local v3, "iCount":I
    if-ge v3, v1, :cond_2

    .line 1411
    move v1, v3

    .line 1412
    :cond_2
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v10, 0x0

    invoke-virtual {v9, v6, v10, v1, v8}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecord(IIILjava/util/List;)Z

    move-result v0

    .line 1413
    .local v0, "bRes":Z
    sget-boolean v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v9, :cond_3

    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "download Received call iCount = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " record.size() = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1415
    :cond_3
    if-eqz v0, :cond_0

    .line 1416
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    if-ge v2, v9, :cond_7

    .line 1417
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1418
    .local v4, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getName()Ljava/lang/String;

    move-result-object v5

    .line 1419
    .local v5, "name":Ljava/lang/String;
    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v9}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v11, v9}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetNameByTelExectly(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1422
    .local v7, "pbName":Ljava/lang/String;
    const-string v9, ""

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_5

    .line 1423
    move-object v5, v7

    .line 1428
    :cond_4
    :goto_2
    const-string v9, "item_history_name"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryReceiveCallid:I

    add-int/lit8 v12, v11, 0x1

    iput v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryReceiveCallid:I

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ". "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1429
    const-string v10, "item_history_number"

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1430
    const-string v10, "item_history_time"

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getCalltime()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1431
    const-string v9, "btn_call_history_img"

    const v10, 0x7f0200c9

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1432
    sget-object v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mRecievedList:Ljava/util/ArrayList;

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1416
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 1424
    :cond_5
    if-eqz v5, :cond_6

    const-string v9, ""

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 1426
    :cond_6
    const v9, 0x7f070091

    invoke-virtual {p0, v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_2

    .line 1434
    .end local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "name":Ljava/lang/String;
    .end local v7    # "pbName":Ljava/lang/String;
    :cond_7
    iput v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mShowedReceivedNum:I

    .line 1435
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    sget-object v10, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mRecievedList:Ljava/util/ArrayList;

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1436
    sget-boolean v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v9, :cond_8

    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "loadReceivedFirstPageData mCallHistoryList size = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1438
    :cond_8
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0
.end method

.method private sendCLYMsg(ILjava/lang/Object;)V
    .locals 4
    .param p1, "what"    # I
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 1725
    const/4 v0, 0x0

    .line 1726
    .local v0, "msg":Landroid/os/Message;
    sget-boolean v1, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BtCallHistoryActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[PBSync] sendCLYMsg("

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

    .line 1727
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mClyHandler:Landroid/os/Handler;

    if-eqz v1, :cond_1

    .line 1728
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mClyHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 1729
    iput p1, v0, Landroid/os/Message;->what:I

    .line 1730
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1731
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mClyHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1736
    :goto_0
    return-void

    .line 1734
    :cond_1
    const-string v1, "BtCallHistoryActivity"

    const-string v2, "[SMS]mClyHandler is null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private showToast(I)V
    .locals 3
    .param p1, "resid"    # I

    .prologue
    .line 1141
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mToast:Landroid/widget/Toast;

    if-nez v0, :cond_0

    .line 1142
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, ""

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mToast:Landroid/widget/Toast;

    .line 1144
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0, p1}, Landroid/widget/Toast;->setText(I)V

    .line 1145
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1146
    return-void
.end method

.method private showUpdateDialog()V
    .locals 3

    .prologue
    .line 733
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    if-nez v0, :cond_0

    .line 734
    new-instance v0, Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    .line 736
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f0700d2

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 737
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const/high16 v1, 0x7f070000

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 738
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f0200ef

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 739
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f070088

    new-instance v2, Lcom/autochips/bluetooth/BtCallHistoryActivity$4;

    invoke-direct {v2, p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity$4;-><init>(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 760
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f070089

    new-instance v2, Lcom/autochips/bluetooth/BtCallHistoryActivity$5;

    invoke-direct {v2, p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity$5;-><init>(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 765
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->builderWarning:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 766
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 11
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v10, 0x7f07004a

    const v9, 0x7f070026

    const/4 v6, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 769
    sget-boolean v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-nez v5, :cond_1

    .line 770
    sget-boolean v5, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v5, :cond_0

    const-string v5, "BtCallHistoryActivity"

    const-string v6, "[BTSuite2]onClick:no connect bluetooth device!!!"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 938
    :cond_0
    :goto_0
    return-void

    .line 774
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 827
    :pswitch_1
    iput v8, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    .line 828
    iput v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    .line 829
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    iget v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    invoke-virtual {v5, v6}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->setSelect(I)V

    .line 830
    iget v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    invoke-direct {p0, v5}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->SetCurrentListButton(I)V

    .line 831
    sget-object v5, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mRecievedList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-nez v5, :cond_a

    .line 832
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->loadReceivedFirstPageData()V

    .line 839
    :goto_1
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListView:Landroid/widget/ListView;

    invoke-virtual {v5, v7, v7}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    .line 840
    sget-boolean v5, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v5, :cond_0

    const-string v5, "BtCallHistoryActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Received count = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 779
    :pswitch_2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 781
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-boolean v5, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v5, :cond_2

    const-string v5, "BtCallHistoryActivity"

    const-string v6, "onItemClick "

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 782
    :cond_2
    iget-boolean v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSupportFlag:Z

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v5, v8, :cond_3

    iget v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-le v5, v6, :cond_4

    .line 785
    :cond_3
    invoke-direct {p0, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->showToast(I)V

    goto :goto_0

    .line 789
    :cond_4
    sget-boolean v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mbInRds:Z

    if-eqz v5, :cond_6

    .line 790
    sget-boolean v5, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v5, :cond_5

    const-string v5, "BtCallHistoryActivity"

    const-string v6, "Bluetooth RDS exist"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 791
    :cond_5
    const v5, 0x7f07005f

    invoke-direct {p0, v5}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->showToast(I)V

    goto/16 :goto_0

    .line 795
    :cond_6
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    iget v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    check-cast v0, Ljava/util/HashMap;

    .line 796
    .restart local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "item_history_name"

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 797
    .local v2, "object":Ljava/lang/Object;
    if-eqz v2, :cond_7

    .line 798
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 802
    .local v3, "pbname":Ljava/lang/String;
    :goto_2
    const-string v5, "item_history_number"

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 803
    if-eqz v2, :cond_8

    .line 804
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 809
    .local v4, "pbnumber":Ljava/lang/String;
    :goto_3
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 810
    invoke-direct {p0, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->showToast(I)V

    goto/16 :goto_0

    .line 800
    .end local v3    # "pbname":Ljava/lang/String;
    .end local v4    # "pbnumber":Ljava/lang/String;
    :cond_7
    const-string v3, ""

    .restart local v3    # "pbname":Ljava/lang/String;
    goto :goto_2

    .line 806
    :cond_8
    const-string v4, ""

    .restart local v4    # "pbnumber":Ljava/lang/String;
    goto :goto_3

    .line 813
    :cond_9
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->ReadSyncState()V

    .line 822
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->bt_callout_intent:Landroid/content/Intent;

    const-string v6, "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_CALLOUT_NAME"

    invoke-virtual {v5, v6, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 823
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->bt_callout_intent:Landroid/content/Intent;

    const-string v6, "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_CALLOUT_NUMBER"

    invoke-virtual {v5, v6, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 824
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->bt_callout_intent:Landroid/content/Intent;

    invoke-virtual {p0, v5}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 834
    .end local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "object":Ljava/lang/Object;
    .end local v3    # "pbname":Ljava/lang/String;
    .end local v4    # "pbnumber":Ljava/lang/String;
    :cond_a
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 835
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    sget-object v6, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mRecievedList:Ljava/util/ArrayList;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 836
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_1

    .line 843
    :pswitch_3
    iput v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    .line 844
    iput v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    .line 845
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    iget v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    invoke-virtual {v5, v6}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->setSelect(I)V

    .line 846
    iget v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    invoke-direct {p0, v5}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->SetCurrentListButton(I)V

    .line 847
    sget-object v5, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-nez v5, :cond_b

    .line 848
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->loadDialedFirstPageData()V

    .line 855
    :goto_4
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListView:Landroid/widget/ListView;

    invoke-virtual {v5, v7, v7}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    .line 856
    sget-boolean v5, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v5, :cond_0

    const-string v5, "BtCallHistoryActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Dial count = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 850
    :cond_b
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 851
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    sget-object v6, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedList:Ljava/util/ArrayList;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 852
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto :goto_4

    .line 859
    :pswitch_4
    const/4 v5, 0x3

    iput v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    .line 860
    iput v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    .line 861
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    iget v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    invoke-virtual {v5, v6}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->setSelect(I)V

    .line 862
    iget v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    invoke-direct {p0, v5}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->SetCurrentListButton(I)V

    .line 863
    sget-object v5, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-nez v5, :cond_c

    .line 864
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->loadMissedFirstPageData()V

    .line 871
    :goto_5
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListView:Landroid/widget/ListView;

    invoke-virtual {v5, v7, v7}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    .line 872
    sget-boolean v5, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v5, :cond_0

    const-string v5, "BtCallHistoryActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Missed count = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 866
    :cond_c
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 867
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    sget-object v6, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedList:Ljava/util/ArrayList;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 868
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto :goto_5

    .line 875
    :pswitch_5
    iput v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    .line 876
    iput v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    .line 877
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    iget v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    invoke-virtual {v5, v6}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->setSelect(I)V

    .line 878
    iget v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    invoke-direct {p0, v5}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->SetCurrentListButton(I)V

    .line 879
    sget-object v5, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllCallList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-nez v5, :cond_d

    .line 880
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->loadAllCallFirstPageData()V

    .line 887
    :goto_6
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListView:Landroid/widget/ListView;

    invoke-virtual {v5, v7, v7}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    .line 888
    sget-boolean v5, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v5, :cond_0

    const-string v5, "BtCallHistoryActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "All history count = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 882
    :cond_d
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 883
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    sget-object v6, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllCallList:Ljava/util/ArrayList;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 884
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto :goto_6

    .line 892
    :pswitch_6
    iget v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadedNum:I

    if-nez v5, :cond_f

    .line 893
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetSyncState()I

    move-result v5

    if-nez v5, :cond_e

    .line 894
    iput v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mChooseRecordType:I

    .line 895
    iput v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    .line 896
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    iget v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    invoke-virtual {v5, v6}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->setSelect(I)V

    .line 897
    iput v8, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryAllcallid:I

    .line 898
    iput v8, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryDialCallid:I

    .line 899
    iput v8, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryMissCallid:I

    .line 900
    iput v8, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryReceiveCallid:I

    .line 901
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallButton:Landroid/widget/Button;

    invoke-virtual {v5, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 902
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 903
    .local v1, "message":Landroid/os/Message;
    const/4 v5, 0x4

    iput v5, v1, Landroid/os/Message;->what:I

    .line 904
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v5, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 905
    invoke-direct {p0, v7}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DownloadHistory(Z)V

    goto/16 :goto_0

    .line 907
    .end local v1    # "message":Landroid/os/Message;
    :cond_e
    invoke-direct {p0, v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->showToast(I)V

    goto/16 :goto_0

    .line 911
    :cond_f
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->showUpdateDialog()V

    goto/16 :goto_0

    .line 915
    :pswitch_7
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetSyncState()I

    move-result v5

    if-eqz v5, :cond_10

    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetSyncPath()I

    move-result v5

    if-ne v5, v6, :cond_10

    .line 918
    invoke-direct {p0, v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->showToast(I)V

    goto/16 :goto_0

    .line 921
    :cond_10
    iget-boolean v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSyncState:Z

    if-ne v8, v5, :cond_11

    .line 922
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {v5, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 923
    iget-object v5, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f020085

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 925
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v5, :cond_0

    .line 926
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v6, 0x6

    invoke-virtual {v5, v6}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StopDownload(I)Z

    goto/16 :goto_0

    .line 931
    :cond_11
    invoke-direct {p0, v8}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DownloadHistory(Z)V

    goto/16 :goto_0

    .line 774
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a001e
        :pswitch_1
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_2
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x4

    const/4 v6, 0x1

    const/4 v2, 0x0

    .line 535
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 537
    iput v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryIndex:I

    .line 538
    iput-boolean v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mFirstCreate:Z

    .line 540
    const v0, 0x7f030003

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->setContentView(I)V

    .line 542
    const v0, 0x7f0a0023

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallButton:Landroid/widget/Button;

    .line 543
    const v0, 0x7f0a0025

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    .line 544
    const v0, 0x7f0a0024

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSyncButton:Landroid/widget/Button;

    .line 545
    const v0, 0x7f0a001e

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceivedButton:Landroid/widget/Button;

    .line 546
    const v0, 0x7f0a001f

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedButton:Landroid/widget/Button;

    .line 547
    const v0, 0x7f0a0020

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedButton:Landroid/widget/Button;

    .line 548
    const v0, 0x7f0a0021

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllhistoryButton:Landroid/widget/Button;

    .line 549
    const v0, 0x7f0a0022

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListView:Landroid/widget/ListView;

    .line 550
    const v0, 0x7f0a0026

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadLayout:Landroid/widget/LinearLayout;

    .line 551
    const v0, 0x7f0a0027

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadProgress:Landroid/widget/ProgressBar;

    .line 552
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 553
    const v0, 0x7f0a0028

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDownloadTextView:Landroid/widget/TextView;

    .line 555
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    .line 556
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mRecievedList:Ljava/util/ArrayList;

    .line 557
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedList:Ljava/util/ArrayList;

    .line 558
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedList:Ljava/util/ArrayList;

    .line 559
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllCallList:Ljava/util/ArrayList;

    .line 561
    new-instance v0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    iget-object v3, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    const v4, 0x7f030014

    new-array v5, v8, [Ljava/lang/String;

    const-string v1, "item_history_name"

    aput-object v1, v5, v2

    const-string v1, "item_history_number"

    aput-object v1, v5, v6

    const/4 v1, 0x2

    const-string v2, "item_history_time"

    aput-object v2, v5, v1

    const/4 v1, 0x3

    const-string v2, "btn_call_history_img"

    aput-object v2, v5, v1

    new-array v6, v8, [I

    fill-array-data v6, :array_0

    move-object v1, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v6}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;-><init>(Lcom/autochips/bluetooth/BtCallHistoryActivity;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    .line 571
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAdapter:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 572
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 573
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 575
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceivedButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 576
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 577
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 578
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllhistoryButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 579
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSyncButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 580
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 581
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallButton:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 584
    new-instance v7, Landroid/content/IntentFilter;

    invoke-direct {v7}, Landroid/content/IntentFilter;-><init>()V

    .line 585
    .local v7, "intentFilter":Landroid/content/IntentFilter;
    const-string v0, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_finish"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 586
    const-string v0, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_onestep"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 587
    const-string v0, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_stop"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 588
    const-string v0, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.startdownload_position"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 590
    const-string v0, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS_CHANGE"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 591
    const-string v0, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 592
    const-string v0, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_NEW_CALL"

    invoke-virtual {v7, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 593
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0, v7}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 595
    return-void

    .line 561
    :array_0
    .array-data 4
        0x7f0a0094
        0x7f0a0095
        0x7f0a0096
        0x7f0a0097
    .end array-data
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 728
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 729
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 730
    return-void
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 604
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 605
    sget-boolean v0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtCallHistoryActivity"

    const-string v1, "+++ onPause +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 606
    :cond_0
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->WriteSyncState()V

    .line 607
    return-void
.end method

.method protected onResume()V
    .locals 9

    .prologue
    const v8, 0x7f020085

    const/4 v7, 0x4

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 611
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 612
    sget-boolean v2, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BtCallHistoryActivity"

    const-string v3, "+++ onResume +++"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 614
    :cond_0
    sget-boolean v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v2, :cond_1

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-nez v2, :cond_4

    .line 615
    :cond_1
    sget-boolean v2, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v2, :cond_2

    .line 616
    const-string v2, "BtCallHistoryActivity"

    const-string v3, "connect bluetooth first"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 619
    :cond_2
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 620
    .local v1, "message":Landroid/os/Message;
    iput v7, v1, Landroid/os/Message;->what:I

    .line 621
    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 622
    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 623
    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 625
    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListView:Landroid/widget/ListView;

    invoke-virtual {v2, v4}, Landroid/widget/ListView;->setEnabled(Z)V

    .line 626
    iput-boolean v4, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mFirstCreate:Z

    .line 699
    .end local v1    # "message":Landroid/os/Message;
    :cond_3
    :goto_0
    return-void

    .line 630
    :cond_4
    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mHistoryListView:Landroid/widget/ListView;

    invoke-virtual {v2, v5}, Landroid/widget/ListView;->setEnabled(Z)V

    .line 632
    const/4 v0, 0x0

    .line 633
    .local v0, "aboutToDownload":Z
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->ReadSyncState()V

    .line 634
    iget-boolean v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mIsSyncFinish:Z

    if-eqz v2, :cond_5

    .line 635
    iput-boolean v4, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mFirstCreate:Z

    .line 636
    sput-boolean v4, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldClyWhenConnect:Z

    .line 664
    :cond_5
    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v2, :cond_6

    if-nez v0, :cond_6

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mLastDwnldAddr:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 666
    :cond_6
    sget-boolean v2, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v2, :cond_7

    const-string v2, "BtCallHistoryActivity"

    const-string v3, "onResume() clear records in listview!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 667
    :cond_7
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 668
    .restart local v1    # "message":Landroid/os/Message;
    iput v7, v1, Landroid/os/Message;->what:I

    .line 669
    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 697
    .end local v1    # "message":Landroid/os/Message;
    :cond_8
    :goto_1
    iput-boolean v4, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mFirstCreate:Z

    .line 698
    sget-boolean v2, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v2, :cond_3

    const-string v2, "BtCallHistoryActivity"

    const-string v3, "onResume end"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 670
    :cond_9
    iget-boolean v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mIsSyncFinish:Z

    if-eqz v2, :cond_c

    .line 671
    sget-boolean v2, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v2, :cond_a

    const-string v2, "BtCallHistoryActivity"

    const-string v3, "onResume() download finish, no need Syncing!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 672
    :cond_a
    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 673
    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mPauseButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 675
    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_b

    .line 676
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 677
    .restart local v1    # "message":Landroid/os/Message;
    iput v6, v1, Landroid/os/Message;->what:I

    .line 678
    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 680
    .end local v1    # "message":Landroid/os/Message;
    :cond_b
    iput-boolean v4, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mFirstCreate:Z

    goto/16 :goto_0

    .line 683
    :cond_c
    sget-boolean v2, Lcom/autochips/bluetooth/BtCallHistoryActivity;->DEBUG:Z

    if-eqz v2, :cond_d

    const-string v2, "BtCallHistoryActivity"

    const-string v3, "onResume() download not finish, show have downloaded Record!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 685
    :cond_d
    iget-boolean v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mSyncState:Z

    if-ne v5, v2, :cond_e

    .line 686
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->enablePasueButtonshowDownloading()V

    .line 691
    :goto_2
    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mCallHistoryList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_8

    .line 692
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 693
    .restart local v1    # "message":Landroid/os/Message;
    iput v6, v1, Landroid/os/Message;->what:I

    .line 694
    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_1

    .line 688
    .end local v1    # "message":Landroid/os/Message;
    :cond_e
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->enablePasueButtonshowDownloadStoped()V

    goto :goto_2
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outstate"    # Landroid/os/Bundle;

    .prologue
    .line 531
    return-void
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 599
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 600
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 723
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 724
    return-void
.end method
