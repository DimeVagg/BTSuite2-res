.class Lcom/autochips/bluetooth/BluetoothReceiver$3;
.super Ljava/lang/Object;
.source "BluetoothReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BluetoothReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BluetoothReceiver;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BluetoothReceiver;)V
    .locals 0

    .prologue
    .line 587
    iput-object p1, p0, Lcom/autochips/bluetooth/BluetoothReceiver$3;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 590
    iget-object v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver$3;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    invoke-static {v1}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$400(Lcom/autochips/bluetooth/BluetoothReceiver;)Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 591
    new-instance v0, Landroid/content/Intent;

    const-string v1, "xy.com.autochips.bluetooth.bt.statuscheck"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 592
    .local v0, "checkIntent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver$3;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    invoke-static {v1}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$400(Lcom/autochips/bluetooth/BluetoothReceiver;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 594
    .end local v0    # "checkIntent":Landroid/content/Intent;
    :cond_0
    return-void
.end method
