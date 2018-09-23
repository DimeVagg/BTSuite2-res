.class Lcom/autochips/bluetooth/BtCallHistoryActivity$4;
.super Ljava/lang/Object;
.source "BtCallHistoryActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/BtCallHistoryActivity;->showUpdateDialog()V
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
    .line 739
    iput-object p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$4;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 742
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetSyncState()I

    move-result v1

    if-nez v1, :cond_0

    .line 743
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$4;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v1, v3}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3302(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 744
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$4;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1202(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 745
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$4;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3402(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 746
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$4;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3502(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 747
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$4;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3602(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 748
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$4;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 749
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 750
    .local v0, "message":Landroid/os/Message;
    const/4 v1, 0x4

    iput v1, v0, Landroid/os/Message;->what:I

    .line 751
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$4;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 752
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$4;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v1, v3}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3000(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)V

    .line 758
    .end local v0    # "message":Landroid/os/Message;
    :goto_0
    return-void

    .line 754
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$4;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const v2, 0x7f070026

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
