.class Lcom/autochips/bluetooth/BtPairedHistoryActivity$3;
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
    .line 962
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 965
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2000(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 966
    .local v0, "newdevicename":Ljava/lang/String;
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 968
    .local v1, "newpincode":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2200()I

    move-result v3

    if-lt v2, v3, :cond_1

    .line 969
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v2, v0, v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2300(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 971
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2400(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    .line 972
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v2

    iget-object v3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2500(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothAdapter;->setName(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 973
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "BtPairedHistoryActivity"

    const-string v3, "set local bluetooth adapter name fail"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 975
    :cond_0
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2600(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    .line 982
    :goto_0
    return-void

    .line 977
    :cond_1
    iget-object v2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$3;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0700ac

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
