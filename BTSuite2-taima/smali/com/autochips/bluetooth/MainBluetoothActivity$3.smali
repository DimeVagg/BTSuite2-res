.class Lcom/autochips/bluetooth/MainBluetoothActivity$3;
.super Landroid/content/BroadcastReceiver;
.source "MainBluetoothActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/MainBluetoothActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/MainBluetoothActivity;)V
    .locals 0

    .prologue
    .line 164
    iput-object p1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$3;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 168
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.xy.kill.app.action.bluetooth"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 170
    new-instance v0, Landroid/content/Intent;

    const-string v1, "xy.btmusic.stop"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 171
    .local v0, "intentstopmusic":Landroid/content/Intent;
    iget-object v1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$3;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-virtual {v1, v0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 172
    iget-object v1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$3;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/MainBluetoothActivity;->finish()V

    .line 174
    .end local v0    # "intentstopmusic":Landroid/content/Intent;
    :cond_0
    return-void
.end method
