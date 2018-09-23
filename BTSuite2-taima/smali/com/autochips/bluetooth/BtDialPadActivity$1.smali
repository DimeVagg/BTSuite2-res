.class Lcom/autochips/bluetooth/BtDialPadActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "BtDialPadActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtDialPadActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtDialPadActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtDialPadActivity;)V
    .locals 0

    .prologue
    .line 363
    iput-object p1, p0, Lcom/autochips/bluetooth/BtDialPadActivity$1;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 366
    invoke-static {}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$100()Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "BTDialPadActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Received "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 370
    .local v0, "action":Ljava/lang/String;
    const-string v4, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 371
    const-string v4, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    .line 372
    .local v2, "device":Landroid/bluetooth/BluetoothDevice;
    const-string v4, "android.bluetooth.adapter.extra.STATE"

    const/high16 v5, -0x80000000

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 374
    .local v3, "state":I
    const/16 v4, 0xa

    if-ne v3, v4, :cond_1

    .line 375
    const-string v4, "BTDialPadActivity"

    const-string v5, "clear BluetoothHfAdapter pointer"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 399
    .end local v2    # "device":Landroid/bluetooth/BluetoothDevice;
    .end local v3    # "state":I
    :cond_1
    :goto_0
    return-void

    .line 378
    :cond_2
    const-string v4, "com.autochips.bluetooth.BtDialPadActivity.action.BLUETOOTH_HF_CONNECT_FINISH"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 379
    const-string v4, "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_HF_CONNECTING_RESULT"

    const/4 v5, 0x0

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 382
    .local v1, "btHfConnectResult":I
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity$1;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v4, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$200(Lcom/autochips/bluetooth/BtDialPadActivity;I)V

    goto :goto_0

    .line 383
    .end local v1    # "btHfConnectResult":I
    :cond_3
    const-string v4, "com.autochips.bluetooth.hf.BluetoothHfUtility.action.callStateChange"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 385
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity$1;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$300(Lcom/autochips/bluetooth/BtDialPadActivity;)V

    goto :goto_0

    .line 386
    :cond_4
    const-string v4, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 387
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity$1;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v4, p2}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$400(Lcom/autochips/bluetooth/BtDialPadActivity;Landroid/content/Intent;)V

    goto :goto_0

    .line 388
    :cond_5
    const-string v4, "com.autochips.bluetooth.BtDialPadActivity.action.BLUETOOTH_CALLOUT"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 389
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity$1;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v4, p2}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$500(Lcom/autochips/bluetooth/BtDialPadActivity;Landroid/content/Intent;)V

    goto :goto_0

    .line 390
    :cond_6
    const-string v4, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.BLUETOOTH_AT_CMD_WARNING"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 391
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity$1;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v4, p2}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$600(Lcom/autochips/bluetooth/BtDialPadActivity;Landroid/content/Intent;)V

    goto :goto_0

    .line 392
    :cond_7
    const-string v4, "com.autochips.bluetooth.BtDialPadActivity.action.BLUETOOTH_UPDATE_MEMORY_CALL"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 393
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity$1;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v4, p2}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$700(Lcom/autochips/bluetooth/BtDialPadActivity;Landroid/content/Intent;)V

    goto :goto_0

    .line 394
    :cond_8
    const-string v4, "com.autochips.bluetooth.BluetoothHfService.action.SCO_STATE_CHANGED"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 395
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity$1;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v4, p2}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$800(Lcom/autochips/bluetooth/BtDialPadActivity;Landroid/content/Intent;)V

    goto :goto_0

    .line 396
    :cond_9
    const-string v4, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS_CHANGE"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 397
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity$1;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v4, p2}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$900(Lcom/autochips/bluetooth/BtDialPadActivity;Landroid/content/Intent;)V

    goto :goto_0
.end method
