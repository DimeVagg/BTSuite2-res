.class public Lcom/autochips/bluetooth/BtPairConnectActivity;
.super Landroid/app/Activity;
.source "BtPairConnectActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final DEBUG:Z

.field private static final TAG:Ljava/lang/String; = "BtPairConnectActivity"

.field private static mSelectedDevice:Landroid/bluetooth/BluetoothDevice;


# instance fields
.field private arr:[Ljava/lang/String;

.field private arr1:[Ljava/lang/String;

.field private arr2:[Ljava/lang/String;

.field private arr3:[Ljava/lang/String;

.field private mIsUnregisterReceiver:Z

.field private mIsconnect:Z

.field private mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

.field private mOperationsArrayAdapter:Landroid/widget/SimpleAdapter;

.field private mOperationsClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mOperationsList:Ljava/util/ArrayList;
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

.field private mOperationsView:Landroid/widget/ListView;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mRemoteAddr:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 69
    sget-boolean v0, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugAll:Z

    sget-boolean v1, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugSettings:Z

    and-int/2addr v0, v1

    sput-boolean v0, Lcom/autochips/bluetooth/BtPairConnectActivity;->DEBUG:Z

    .line 83
    const/4 v0, 0x0

    sput-object v0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 67
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 77
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "Pair"

    aput-object v1, v0, v2

    const-string v1, "Connect"

    aput-object v1, v0, v3

    const-string v1, "Return"

    aput-object v1, v0, v4

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr1:[Ljava/lang/String;

    .line 78
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "unPair"

    aput-object v1, v0, v2

    const-string v1, "Connect"

    aput-object v1, v0, v3

    const-string v1, "Return"

    aput-object v1, v0, v4

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr2:[Ljava/lang/String;

    .line 79
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "unPair"

    aput-object v1, v0, v2

    const-string v1, "disConnect"

    aput-object v1, v0, v3

    const-string v1, "Return"

    aput-object v1, v0, v4

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr3:[Ljava/lang/String;

    .line 80
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr1:[Ljava/lang/String;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr:[Ljava/lang/String;

    .line 82
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mRemoteAddr:Ljava/lang/String;

    .line 85
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mIsUnregisterReceiver:Z

    .line 86
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mIsconnect:Z

    .line 89
    new-instance v0, Lcom/autochips/bluetooth/BtPairConnectActivity$1;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtPairConnectActivity$1;-><init>(Lcom/autochips/bluetooth/BtPairConnectActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 219
    new-instance v0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtPairConnectActivity$2;-><init>(Lcom/autochips/bluetooth/BtPairConnectActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method

.method private DestroyActivity()V
    .locals 2

    .prologue
    .line 425
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mIsUnregisterReceiver:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 426
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 427
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mIsUnregisterReceiver:Z

    .line 429
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsView:Landroid/widget/ListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 430
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairConnectActivity;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string v0, "BtPairConnectActivity"

    const-string v1, "Destroy Activity "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    :cond_1
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->finish()V

    .line 432
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 67
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairConnectActivity;->DEBUG:Z

    return v0
.end method

.method static synthetic access$100(Lcom/autochips/bluetooth/BtPairConnectActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairConnectActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairConnectActivity;->handleBondChanged(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$200(Lcom/autochips/bluetooth/BtPairConnectActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairConnectActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairConnectActivity;->handleConnectChanged(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$300(Lcom/autochips/bluetooth/BtPairConnectActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairConnectActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtPairConnectActivity;->onBluetoothPairingRequest(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$400(Lcom/autochips/bluetooth/BtPairConnectActivity;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairConnectActivity;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/autochips/bluetooth/BtPairConnectActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairConnectActivity;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    return-object v0
.end method

.method static synthetic access$600()Landroid/bluetooth/BluetoothDevice;
    .locals 1

    .prologue
    .line 67
    sget-object v0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    return-object v0
.end method

.method static synthetic access$702(Lcom/autochips/bluetooth/BtPairConnectActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairConnectActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 67
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mIsconnect:Z

    return p1
.end method

.method static synthetic access$800(Lcom/autochips/bluetooth/BtPairConnectActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtPairConnectActivity;

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->DestroyActivity()V

    return-void
.end method

.method private handleBondChanged(Landroid/content/Intent;)V
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v6, 0x0

    .line 325
    const-string v3, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    .line 326
    .local v2, "device":Landroid/bluetooth/BluetoothDevice;
    const-string v3, "android.bluetooth.device.extra.BOND_STATE"

    const/high16 v4, -0x80000000

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 327
    .local v0, "bondState":I
    sget-boolean v3, Lcom/autochips/bluetooth/BtPairConnectActivity;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "BtPairConnectActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ACTION_BOND_STATE_CHANGED "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    :cond_0
    const/16 v3, 0xc

    if-ne v0, v3, :cond_2

    .line 329
    sget-object v3, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 330
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsList:Ljava/util/ArrayList;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    const-string v4, "operations_name"

    const v5, 0x7f070010

    invoke-virtual {p0, v5}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsArrayAdapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v3}, Landroid/widget/SimpleAdapter;->notifyDataSetChanged()V

    .line 332
    iget-boolean v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mIsconnect:Z

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 333
    iput-boolean v6, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mIsconnect:Z

    .line 334
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v3, v4}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v1

    .line 336
    .local v1, "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v1}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->onClicked()V

    .line 348
    .end local v1    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :cond_1
    :goto_0
    return-void

    .line 341
    :cond_2
    const/16 v3, 0xa

    if-ne v0, v3, :cond_1

    .line 342
    sget-object v3, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 343
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsList:Ljava/util/ArrayList;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    const-string v4, "operations_name"

    const v5, 0x7f07000f

    invoke-virtual {p0, v5}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsArrayAdapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v3}, Landroid/widget/SimpleAdapter;->notifyDataSetChanged()V

    .line 345
    iput-boolean v6, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mIsconnect:Z

    goto :goto_0
.end method

.method private handleConnectChanged(Landroid/content/Intent;)V
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 351
    const-string v2, "device_addr"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 352
    .local v0, "addr":Ljava/lang/String;
    const-string v2, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    invoke-virtual {p1, v2, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 353
    .local v1, "profilestate":I
    sget-boolean v2, Lcom/autochips/bluetooth/BtPairConnectActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BtPairConnectActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " handleConnectChanged "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 354
    :cond_0
    if-ne v1, v5, :cond_2

    .line 355
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    sget-object v3, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 356
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsList:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    const-string v3, "operations_name"

    const v4, 0x7f070012

    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsArrayAdapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v2}, Landroid/widget/SimpleAdapter;->notifyDataSetChanged()V

    .line 365
    :cond_1
    :goto_0
    return-void

    .line 359
    :cond_2
    if-ne v1, v6, :cond_1

    .line 360
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v2

    sget-object v3, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 361
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsList:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    const-string v3, "operations_name"

    const v4, 0x7f070011

    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsArrayAdapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v2}, Landroid/widget/SimpleAdapter;->notifyDataSetChanged()V

    goto :goto_0
.end method

.method private onBluetoothCallSetupChange(Landroid/content/Intent;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 408
    const-string v1, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_CALLSETUP_STATE"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 409
    .local v0, "btPhoneCallState":I
    sget-boolean v1, Lcom/autochips/bluetooth/BtPairConnectActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BtPairConnectActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onBluetoothCallSetupChange"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 410
    :cond_0
    if-nez v0, :cond_2

    .line 420
    :cond_1
    :goto_0
    return-void

    .line 412
    :cond_2
    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 414
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->DestroyActivity()V

    goto :goto_0

    .line 415
    :cond_3
    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 417
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->DestroyActivity()V

    goto :goto_0
.end method

.method private onBluetoothPairingRequest(Landroid/content/Intent;)V
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/high16 v4, -0x80000000

    const/4 v3, 0x1

    .line 368
    const-string v2, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    sput-object v2, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 371
    const-string v2, "android.bluetooth.device.extra.PAIRING_VARIANT"

    invoke-virtual {p1, v2, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 378
    .local v1, "type":I
    if-nez v1, :cond_1

    .line 379
    const-string v2, "PAIRPIN1"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "=================="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/autochips/bluetooth/BtSettingsActivity;->mPin:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    sget-object v2, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    sget-object v3, Lcom/autochips/bluetooth/BtSettingsActivity;->mPin:Ljava/lang/String;

    invoke-static {v3}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->convertPinToBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothDevice;->setPin([B)Z

    .line 400
    :cond_0
    :goto_0
    return-void

    .line 381
    :cond_1
    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 382
    const-string v2, "android.bluetooth.device.extra.PAIRING_KEY"

    invoke-virtual {p1, v2, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 384
    .local v0, "passkey":I
    sget-object v2, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothDevice;->setPairingConfirmation(Z)Z

    goto :goto_0

    .line 385
    .end local v0    # "passkey":I
    :cond_2
    const/4 v2, 0x3

    if-ne v1, v2, :cond_3

    .line 386
    sget-object v2, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothDevice;->setPairingConfirmation(Z)Z

    goto :goto_0

    .line 387
    :cond_3
    if-ne v1, v3, :cond_4

    .line 388
    const-string v2, "PAIRPIN2"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "=================="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/autochips/bluetooth/BtSettingsActivity;->mPin:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    sget-object v2, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    sget-object v3, Lcom/autochips/bluetooth/BtSettingsActivity;->mPin:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v2, v3}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->setPasskey(Landroid/bluetooth/BluetoothDevice;I)Z

    goto :goto_0

    .line 392
    :cond_4
    const/4 v2, 0x4

    if-eq v1, v2, :cond_0

    .line 394
    const/4 v2, 0x6

    if-ne v1, v2, :cond_5

    .line 396
    sget-object v2, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v2}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->setRemoteOutOfBandData(Landroid/bluetooth/BluetoothDevice;)Z

    goto :goto_0

    .line 398
    :cond_5
    sget-boolean v2, Lcom/autochips/bluetooth/BtPairConnectActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BtPairConnectActivity"

    const-string v3, "Incorrect pairing type received"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 216
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 113
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 114
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairConnectActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 115
    const-string v0, "BtPairConnectActivity"

    const-string v1, "+++ onCreate +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    :cond_0
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getIntent()Landroid/content/Intent;

    move-result-object v8

    .line 118
    .local v8, "intent":Landroid/content/Intent;
    const-string v0, "deviceName"

    invoke-virtual {v8, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 119
    .local v6, "deviceName":Ljava/lang/String;
    const v0, 0x7f03000a

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->setContentView(I)V

    .line 120
    invoke-virtual {p0, v6}, Lcom/autochips/bluetooth/BtPairConnectActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 122
    const-string v0, "deviceAddr"

    invoke-virtual {v8, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mRemoteAddr:Ljava/lang/String;

    .line 124
    const v0, 0x7f0a0055

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsView:Landroid/widget/ListView;

    .line 125
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsList:Ljava/util/ArrayList;

    .line 127
    new-instance v0, Landroid/widget/SimpleAdapter;

    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsList:Ljava/util/ArrayList;

    const v3, 0x7f030016

    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v5, "operations_name"

    aput-object v5, v4, v1

    const/4 v1, 0x1

    new-array v5, v1, [I

    const/4 v1, 0x0

    const v12, 0x7f0a009a

    aput v12, v5, v1

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsArrayAdapter:Landroid/widget/SimpleAdapter;

    .line 129
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsArrayAdapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 130
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 133
    invoke-static {p0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    .line 134
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    if-nez v0, :cond_2

    .line 137
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairConnectActivity;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string v0, "BtPairConnectActivity"

    const-string v1, "Bluetooth is not available, mLocalManager is null "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    :cond_1
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->finish()V

    .line 141
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 142
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mRemoteAddr:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    sput-object v0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    .line 143
    sget-object v0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v0

    const/16 v1, 0xc

    if-ne v0, v1, :cond_5

    sget-boolean v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_5

    .line 144
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    sget-object v1, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0, v1}, Landroid/bluetooth/BluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 145
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr3:[Ljava/lang/String;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr:[Ljava/lang/String;

    .line 154
    :goto_0
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    const/4 v0, 0x3

    if-ge v7, v0, :cond_b

    .line 155
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 156
    .local v10, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v11, ""

    .line 157
    .local v11, "name":Ljava/lang/String;
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr:[Ljava/lang/String;

    aget-object v0, v0, v7

    const-string v1, "unPair"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 158
    const v0, 0x7f070010

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 168
    :cond_3
    :goto_2
    const-string v0, "operations_name"

    invoke-virtual {v10, v0, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsList:Ljava/util/ArrayList;

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 147
    .end local v7    # "i":I
    .end local v10    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v11    # "name":Ljava/lang/String;
    :cond_4
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr2:[Ljava/lang/String;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr:[Ljava/lang/String;

    goto :goto_0

    .line 149
    :cond_5
    sget-object v0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mSelectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v0

    const/16 v1, 0xc

    if-ne v0, v1, :cond_6

    sget-boolean v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    const/4 v1, 0x1

    if-eq v0, v1, :cond_6

    .line 150
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr2:[Ljava/lang/String;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr:[Ljava/lang/String;

    goto :goto_0

    .line 152
    :cond_6
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr1:[Ljava/lang/String;

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr:[Ljava/lang/String;

    goto :goto_0

    .line 159
    .restart local v7    # "i":I
    .restart local v10    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v11    # "name":Ljava/lang/String;
    :cond_7
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr:[Ljava/lang/String;

    aget-object v0, v0, v7

    const-string v1, "Pair"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 160
    const v0, 0x7f07000f

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    goto :goto_2

    .line 161
    :cond_8
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr:[Ljava/lang/String;

    aget-object v0, v0, v7

    const-string v1, "disConnect"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 162
    const v0, 0x7f070012

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    goto :goto_2

    .line 163
    :cond_9
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr:[Ljava/lang/String;

    aget-object v0, v0, v7

    const-string v1, "Connect"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 164
    const v0, 0x7f070011

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    goto :goto_2

    .line 165
    :cond_a
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->arr:[Ljava/lang/String;

    aget-object v0, v0, v7

    const-string v1, "Return"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 166
    const v0, 0x7f070013

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    goto :goto_2

    .line 171
    .end local v10    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v11    # "name":Ljava/lang/String;
    :cond_b
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mOperationsArrayAdapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v0}, Landroid/widget/SimpleAdapter;->notifyDataSetChanged()V

    .line 173
    .end local v7    # "i":I
    :cond_c
    new-instance v9, Landroid/content/IntentFilter;

    invoke-direct {v9}, Landroid/content/IntentFilter;-><init>()V

    .line 174
    .local v9, "intentFilter":Landroid/content/IntentFilter;
    const-string v0, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v9, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 175
    const-string v0, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v9, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 176
    const-string v0, "android.bluetooth.device.action.PAIRING_REQUEST"

    invoke-virtual {v9, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 177
    const-string v0, "android.bluetooth.device.action.BOND_STATE_CHANGED"

    invoke-virtual {v9, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 179
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0, v9}, Lcom/autochips/bluetooth/BtPairConnectActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 180
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mIsUnregisterReceiver:Z

    .line 182
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 202
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairConnectActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 203
    const-string v0, "BtPairConnectActivity"

    const-string v1, "+++ onDestroy +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    :cond_0
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mIsUnregisterReceiver:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 207
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtPairConnectActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 208
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtPairConnectActivity;->mIsUnregisterReceiver:Z

    .line 211
    :cond_1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 212
    return-void
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 194
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 195
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairConnectActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 196
    const-string v0, "BtPairConnectActivity"

    const-string v1, "+++ onPause +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    :cond_0
    return-void
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 186
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 187
    sget-boolean v0, Lcom/autochips/bluetooth/BtPairConnectActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 188
    const-string v0, "BtPairConnectActivity"

    const-string v1, "+++ onStart +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    :cond_0
    return-void
.end method
