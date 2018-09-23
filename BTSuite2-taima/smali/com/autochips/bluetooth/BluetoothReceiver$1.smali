.class Lcom/autochips/bluetooth/BluetoothReceiver$1;
.super Ljava/util/TimerTask;
.source "BluetoothReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/BluetoothReceiver;->handleBootCompleted(Landroid/content/Intent;Landroid/content/Context;)V
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
    .line 487
    iput-object p1, p0, Lcom/autochips/bluetooth/BluetoothReceiver$1;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 490
    const-string v0, "BluetoothReceiver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mCheckTask mbHfConnected = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    sget-boolean v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-nez v0, :cond_0

    .line 492
    invoke-static {}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$000()Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 493
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver$1;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    invoke-static {}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$000()Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$100(Lcom/autochips/bluetooth/BluetoothReceiver;Landroid/content/Context;)V

    .line 496
    :cond_0
    return-void
.end method
