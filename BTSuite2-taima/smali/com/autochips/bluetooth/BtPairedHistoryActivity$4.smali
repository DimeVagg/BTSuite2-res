.class Lcom/autochips/bluetooth/BtPairedHistoryActivity$4;
.super Ljava/lang/Object;
.source "BtPairedHistoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/BtPairedHistoryActivity;->buildEditNameDialog(Landroid/content/Context;)V
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
    .line 985
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$4;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 987
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$4;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2600(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 988
    return-void
.end method
