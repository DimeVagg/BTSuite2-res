.class Lcom/autochips/bluetooth/BtSettingsActivity$2;
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
    .line 338
    iput-object p1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$2;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 341
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$2;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$100(Lcom/autochips/bluetooth/BtSettingsActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 342
    .local v0, "newdevicename":Ljava/lang/String;
    const-string v1, "newdevicename"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "===================:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 343
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 344
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$2;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-static {v1, v0}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$200(Lcom/autochips/bluetooth/BtSettingsActivity;Ljava/lang/String;)V

    .line 345
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$2;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$300(Lcom/autochips/bluetooth/BtSettingsActivity;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 347
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$2;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-static {v1, v0}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$402(Lcom/autochips/bluetooth/BtSettingsActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 348
    const-string v1, "SETNAME"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "===================:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/autochips/bluetooth/BtSettingsActivity$2;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$400(Lcom/autochips/bluetooth/BtSettingsActivity;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 349
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$2;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$500(Lcom/autochips/bluetooth/BtSettingsActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/bluetooth/BluetoothAdapter;->setName(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 350
    invoke-static {}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$000()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "BtSettingsActivity"

    const-string v2, "set local bluetooth adapter name fail"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$2;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$600(Lcom/autochips/bluetooth/BtSettingsActivity;)Landroid/app/Dialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 356
    :goto_0
    return-void

    .line 353
    :cond_1
    iget-object v1, p0, Lcom/autochips/bluetooth/BtSettingsActivity$2;->this$0:Lcom/autochips/bluetooth/BtSettingsActivity;

    const v2, 0x7f0700ac

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/BtSettingsActivity;->access$700(Lcom/autochips/bluetooth/BtSettingsActivity;I)V

    goto :goto_0
.end method
