.class Lcom/autochips/bluetooth/BluetoothReceiver$5;
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
    .line 974
    iput-object p1, p0, Lcom/autochips/bluetooth/BluetoothReceiver$5;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 978
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v0, :cond_0

    .line 979
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v0, v1}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->regResume(Z)Z

    .line 982
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver$5;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$600(Lcom/autochips/bluetooth/BluetoothReceiver;I)V

    .line 983
    return-void
.end method
