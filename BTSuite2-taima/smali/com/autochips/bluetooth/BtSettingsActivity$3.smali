.class Lcom/autochips/bluetooth/BtSettingsActivity$3;
.super Ljava/lang/Object;
.source "BtSettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/BtSettingsActivity;->buildEditNameDialog(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtSettingsActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtSettingsActivity;)V
    .locals 0

    .prologue
    .line 359
    iput-object p1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$3;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 361
    iget-object v0, p0, Lcom/autochips/bluetooth/BtSettingsActivity$3;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$600(Lcom/autochips/bluetooth/BtSettingsActivity;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 362
    return-void
.end method
