.class Lcom/autochips/bluetooth/BtPhonebookActivity$3;
.super Landroid/os/Handler;
.source "BtPhonebookActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtPhonebookActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtPhonebookActivity;)V
    .locals 0

    .prologue
    .line 415
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$3;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 419
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "BtPhonebookActivity"

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

    .line 420
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 434
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 435
    return-void

    .line 422
    :pswitch_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$3;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2002(Lcom/autochips/bluetooth/BtPhonebookActivity;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 423
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v0, :cond_1

    .line 424
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$3;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1402(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z

    .line 425
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$3;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1500(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    .line 426
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$3;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1102(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I

    .line 427
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$3;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1100(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->SetRemoteDevice(Landroid/bluetooth/BluetoothDevice;I)Z

    .line 430
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$3;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1100(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v1

    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$3;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2100(Lcom/autochips/bluetooth/BtPhonebookActivity;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StartDownload(IZ)Z

    goto :goto_0

    .line 420
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
