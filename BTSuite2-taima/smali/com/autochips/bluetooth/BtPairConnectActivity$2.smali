.class Lcom/autochips/bluetooth/BtPairConnectActivity$2;
.super Ljava/lang/Object;
.source "BtPairConnectActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtPairConnectActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtPairConnectActivity;)V
    .locals 0

    .prologue
    .line 219
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 8
    .param p2, "v"    # Landroid/view/View;
    .param p3, "arg2"    # I
    .param p4, "arg3"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .local p1, "av":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    const/16 v7, 0x8

    const/4 v6, 0x1

    const/16 v5, 0xc

    .line 221
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$000()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 222
    const-string v3, "BtPairConnectActivity"

    const-string v4, "onItemClick "

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    :cond_0
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$400(Lcom/autochips/bluetooth/BtPairConnectActivity;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 225
    .local v1, "operationsInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "operations_name"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 227
    .local v2, "operations_name":Ljava/lang/String;
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    const v4, 0x7f07000f

    invoke-virtual {v3, v4}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 229
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$500(Lcom/autochips/bluetooth/BtPairConnectActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 230
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$500(Lcom/autochips/bluetooth/BtPairConnectActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 232
    :cond_1
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$600()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 233
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$600()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v3

    if-ne v3, v5, :cond_3

    .line 321
    :cond_2
    :goto_0
    return-void

    .line 237
    :cond_3
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$600()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->createBond()Z

    move-result v3

    if-nez v3, :cond_2

    .line 238
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$000()Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "BtPairConnectActivity"

    const-string v4, "createBond Error"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 242
    :cond_4
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    const v4, 0x7f070010

    invoke-virtual {v3, v4}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 244
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$500(Lcom/autochips/bluetooth/BtPairConnectActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 245
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$500(Lcom/autochips/bluetooth/BtPairConnectActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 247
    :cond_5
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v3, :cond_6

    .line 248
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v3, v7}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StopDownload(I)Z

    .line 250
    :cond_6
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mSmsSyncProxy:Lcom/autochips/bluetooth/dundt/SMSSyncManager;

    if-eqz v3, :cond_7

    .line 251
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mSmsSyncProxy:Lcom/autochips/bluetooth/dundt/SMSSyncManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/dundt/SMSSyncManager;->StopDownload()Z

    .line 253
    :cond_7
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$600()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 254
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$600()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v3

    if-ne v3, v5, :cond_2

    .line 255
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$600()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    invoke-static {v3}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->removeBond(Landroid/bluetooth/BluetoothDevice;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 256
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$000()Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "BtPairConnectActivity"

    const-string v4, "removeBond Error"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 263
    :cond_8
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    const v4, 0x7f070011

    invoke-virtual {v3, v4}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 265
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$500(Lcom/autochips/bluetooth/BtPairConnectActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 266
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$500(Lcom/autochips/bluetooth/BtPairConnectActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 269
    :cond_9
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eq v3, v6, :cond_2

    .line 273
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$600()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 274
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$600()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v3

    if-ne v3, v5, :cond_a

    .line 275
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$600()Landroid/bluetooth/BluetoothDevice;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    .line 277
    .local v0, "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v0}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->onClicked()V

    goto/16 :goto_0

    .line 283
    .end local v0    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :cond_a
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$600()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->createBond()Z

    move-result v3

    if-nez v3, :cond_b

    .line 284
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$000()Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "BtPairConnectActivity"

    const-string v4, "pair Bluetooth device Error"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 286
    :cond_b
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-static {v3, v6}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$702(Lcom/autochips/bluetooth/BtPairConnectActivity;Z)Z

    goto/16 :goto_0

    .line 291
    :cond_c
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    const v4, 0x7f070012

    invoke-virtual {v3, v4}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 292
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v3, :cond_2

    .line 296
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v3, :cond_d

    .line 297
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v3, v7}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StopDownload(I)Z

    .line 299
    :cond_d
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mSmsSyncProxy:Lcom/autochips/bluetooth/dundt/SMSSyncManager;

    if-eqz v3, :cond_e

    .line 300
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mSmsSyncProxy:Lcom/autochips/bluetooth/dundt/SMSSyncManager;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/dundt/SMSSyncManager;->StopDownload()Z

    .line 302
    :cond_e
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$600()Landroid/bluetooth/BluetoothDevice;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/bluetooth/BluetoothDevice;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 303
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$600()Landroid/bluetooth/BluetoothDevice;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    .line 305
    .restart local v0    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v0}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->disconnect()V

    goto/16 :goto_0

    .line 313
    .end local v0    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :cond_f
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    const v4, 0x7f070013

    invoke-virtual {v3, v4}, Lcom/autochips/bluetooth/BtPairConnectActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 314
    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$800(Lcom/autochips/bluetooth/BtPairConnectActivity;)V

    goto/16 :goto_0

    .line 316
    :cond_10
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$000()Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "BtPairConnectActivity"

    const-string v4, "pairconnect_return Error"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method
