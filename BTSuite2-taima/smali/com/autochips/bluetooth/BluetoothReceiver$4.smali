.class Lcom/autochips/bluetooth/BluetoothReceiver$4;
.super Ljava/util/TimerTask;
.source "BluetoothReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/BluetoothReceiver;->startTimer(I)V
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
    .line 956
    iput-object p1, p0, Lcom/autochips/bluetooth/BluetoothReceiver$4;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 959
    invoke-static {}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$000()Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 960
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver$4;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    invoke-static {}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$000()Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$100(Lcom/autochips/bluetooth/BluetoothReceiver;Landroid/content/Context;)V

    .line 963
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver$4;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    const/16 v1, 0x2710

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$512(Lcom/autochips/bluetooth/BluetoothReceiver;I)I

    .line 965
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver$4;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    invoke-static {v0}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$500(Lcom/autochips/bluetooth/BluetoothReceiver;)I

    move-result v0

    const/16 v1, 0x7530

    if-le v0, v1, :cond_1

    .line 966
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver$4;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$600(Lcom/autochips/bluetooth/BluetoothReceiver;I)V

    .line 968
    :cond_1
    return-void
.end method
