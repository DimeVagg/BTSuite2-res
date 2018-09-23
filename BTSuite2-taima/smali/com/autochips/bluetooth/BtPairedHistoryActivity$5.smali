.class Lcom/autochips/bluetooth/BtPairedHistoryActivity$5;
.super Ljava/lang/Object;
.source "BtPairedHistoryActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/BtPairedHistoryActivity;->showUpdateDialog()V
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
    .line 998
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$5;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v1, 0x0

    .line 1001
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$5;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$800(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V

    .line 1002
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$5;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2700(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V

    .line 1003
    sput-boolean v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldPbWhenConnect:Z

    .line 1004
    sput-boolean v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldClyWhenConnect:Z

    .line 1005
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$5;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$900(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V

    .line 1006
    return-void
.end method
