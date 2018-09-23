.class Lcom/autochips/bluetooth/BtSettingsActivity$4;
.super Ljava/lang/Object;
.source "BtSettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/BtSettingsActivity;->buildEditPinDialog(Landroid/content/Context;)V
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
    .line 379
    iput-object p1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$4;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 382
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$4;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$800(Lcom/autochips/bluetooth/BtSettingsActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 384
    .local v0, "newpincode":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$900()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 385
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$4;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-static {v1, v0}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$1000(Lcom/autochips/bluetooth/BtSettingsActivity;Ljava/lang/String;)V

    .line 386
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$4;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$1100(Lcom/autochips/bluetooth/BtSettingsActivity;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 388
    sput-object v0, Lcom/autochips/bluetooth/BtSettingsActivity;->mPin:Ljava/lang/String;

    .line 389
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$4;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$1200(Lcom/autochips/bluetooth/BtSettingsActivity;)Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 394
    :goto_0
    return-void

    .line 391
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$4;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    const v2, 0x7f0700ac

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$700(Lcom/autochips/bluetooth/BtSettingsActivity;I)V

    goto :goto_0
.end method
