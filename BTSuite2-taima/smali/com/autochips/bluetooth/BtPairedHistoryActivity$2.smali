.class Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;
.super Landroid/os/Handler;
.source "BtPairedHistoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtPairedHistoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V
    .locals 0

    .prologue
    .line 313
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 317
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v5, "BtPairedHistoryActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[MSG] handleMessage ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p1, Landroid/os/Message;->what:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    :cond_0
    iget v5, p1, Landroid/os/Message;->what:I

    sparse-switch v5, :sswitch_data_0

    .line 356
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 357
    return-void

    .line 320
    :sswitch_0
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1600(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    .line 322
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v6

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothAdapter;->getState()I

    move-result v6

    invoke-static {v5, v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V

    .line 323
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 325
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v5

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v4

    .line 328
    .local v4, "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 329
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 330
    .local v0, "device":Landroid/bluetooth/BluetoothDevice;
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1700(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/Set;

    move-result-object v5

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 331
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v5, "BtPairedHistoryActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "paired devices contains "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    :cond_3
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 333
    .local v3, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "remote_device_name"

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    sget-boolean v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    if-eqz v5, :cond_4

    sget-object v5, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 336
    const-string v5, "remote_connect_status"

    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f070017

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    :goto_2
    const-string v5, "remote_device_macaddr"

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1400(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 344
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1700(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/Set;

    move-result-object v5

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 339
    :cond_4
    const-string v5, "remote_connect_status"

    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f070015

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 347
    .end local v0    # "device":Landroid/bluetooth/BluetoothDevice;
    .end local v3    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_5
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1800(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    move-result-object v5

    invoke-virtual {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0

    .line 352
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v4    # "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    :sswitch_1
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/content/Intent;

    .line 353
    .local v2, "intent":Landroid/content/Intent;
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v5, v2}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1900(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 318
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x2710 -> :sswitch_1
    .end sparse-switch
.end method
