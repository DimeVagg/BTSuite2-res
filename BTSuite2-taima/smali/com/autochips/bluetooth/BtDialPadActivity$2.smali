.class Lcom/autochips/bluetooth/BtDialPadActivity$2;
.super Landroid/os/Handler;
.source "BtDialPadActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtDialPadActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtDialPadActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtDialPadActivity;)V
    .locals 0

    .prologue
    .line 579
    iput-object p1, p0, Lcom/autochips/bluetooth/BtDialPadActivity$2;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 583
    const-string v4, "BTDialPadActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[MSG] handleMessage ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p1, Landroid/os/Message;->what:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 584
    iget v4, p1, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_0

    .line 621
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 622
    return-void

    .line 586
    :pswitch_0
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    .line 587
    .local v1, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 589
    .local v0, "bIncommingcall":Z
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity$2;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1000(Lcom/autochips/bluetooth/BtDialPadActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 590
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity$2;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1000(Lcom/autochips/bluetooth/BtDialPadActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 591
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity$2;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1000(Lcom/autochips/bluetooth/BtDialPadActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v4

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 592
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity$2;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1000(Lcom/autochips/bluetooth/BtDialPadActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v4

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 596
    :cond_0
    iget-object v5, p0, Lcom/autochips/bluetooth/BtDialPadActivity$2;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    monitor-enter v5

    .line 597
    :try_start_0
    const-string v4, "incommingcall"

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 598
    .local v3, "strIncommingcall":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 599
    monitor-exit v5

    goto :goto_0

    .line 615
    .end local v3    # "strIncommingcall":Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 600
    .restart local v3    # "strIncommingcall":Ljava/lang/String;
    :cond_1
    :try_start_1
    const-string v4, "true"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 601
    const/4 v0, 0x1

    .line 609
    :goto_1
    const-string v4, "callnumber"

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 611
    .local v2, "strCallnumber":Ljava/lang/String;
    if-eqz v2, :cond_2

    .line 612
    const-string v4, "BTDialPadActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "MSG_INVOKE_BT_PHONECALL_ACTIVITY  "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 613
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity$2;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v4, v0, v2}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1100(Lcom/autochips/bluetooth/BtDialPadActivity;ZLjava/lang/String;)Z

    .line 615
    :cond_2
    monitor-exit v5

    goto :goto_0

    .line 602
    .end local v2    # "strCallnumber":Ljava/lang/String;
    :cond_3
    const-string v4, "false"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 603
    const/4 v0, 0x0

    goto :goto_1

    .line 605
    :cond_4
    const-string v4, "BTDialPadActivity"

    const-string v6, "MSG_INVOKE_BT_PHONECALL_ACTIVITY invalid arg1 "

    invoke-static {v4, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 606
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 584
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
