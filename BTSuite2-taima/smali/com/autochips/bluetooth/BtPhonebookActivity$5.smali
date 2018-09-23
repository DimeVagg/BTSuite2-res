.class Lcom/autochips/bluetooth/BtPhonebookActivity$5;
.super Ljava/lang/Object;
.source "BtPhonebookActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/BtPhonebookActivity;->showUpdateDialog()V
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
    .line 768
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$5;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v3, 0x0

    .line 771
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetSyncState()I

    move-result v1

    if-nez v1, :cond_0

    .line 772
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$5;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1, v3}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1402(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z

    .line 773
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$5;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2702(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I

    .line 774
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$5;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1500(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    .line 775
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$5;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v2, 0x7f0a0069

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 776
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 777
    .local v0, "message":Landroid/os/Message;
    const/4 v1, 0x4

    iput v1, v0, Landroid/os/Message;->what:I

    .line 778
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$5;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 779
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$5;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1, v3}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1900(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)V

    .line 785
    .end local v0    # "message":Landroid/os/Message;
    :goto_0
    return-void

    .line 781
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$5;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v2, 0x7f070025

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
