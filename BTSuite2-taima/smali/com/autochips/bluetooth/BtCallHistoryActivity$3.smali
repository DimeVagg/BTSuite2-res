.class Lcom/autochips/bluetooth/BtCallHistoryActivity$3;
.super Landroid/os/Handler;
.source "BtCallHistoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtCallHistoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V
    .locals 0

    .prologue
    .line 501
    iput-object p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 504
    invoke-static {}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$500()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 505
    const-string v0, "BtCallHistoryActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[MSG] handleMessage ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 508
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 523
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 524
    return-void

    .line 510
    :pswitch_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3102(Lcom/autochips/bluetooth/BtCallHistoryActivity;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 511
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v0, :cond_1

    .line 512
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1702(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)Z

    .line 513
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1800(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V

    .line 514
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v1, 0x6

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1502(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 515
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->SetRemoteDevice(Landroid/bluetooth/BluetoothDevice;I)Z

    .line 518
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v1

    iget-object v2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StartDownload(IZ)Z

    goto :goto_0

    .line 508
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
