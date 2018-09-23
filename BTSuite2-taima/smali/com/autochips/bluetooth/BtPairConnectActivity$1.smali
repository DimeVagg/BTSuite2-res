.class Lcom/autochips/bluetooth/BtPairConnectActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "BtPairConnectActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtPairConnectActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtPairConnectActivity;)V
    .locals 0

    .prologue
    .line 89
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 93
    invoke-static {}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$000()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 94
    const-string v1, "BtPairConnectActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onRecieve:action->"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.bluetooth.device.action.BOND_STATE_CHANGED"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 97
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-static {v1, p2}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$100(Lcom/autochips/bluetooth/BtPairConnectActivity;Landroid/content/Intent;)V

    .line 108
    :cond_1
    :goto_0
    return-void

    .line 98
    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 99
    const-string v1, "android.bluetooth.profilemanager.extra.ATCPROFILE"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    .line 100
    .local v0, "profilename":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    if-eqz v0, :cond_1

    sget-object v1, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_HF:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v0, v1}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 101
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-static {v1, p2}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$200(Lcom/autochips/bluetooth/BtPairConnectActivity;Landroid/content/Intent;)V

    goto :goto_0

    .line 103
    .end local v0    # "profilename":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    :cond_3
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.bluetooth.device.action.PAIRING_REQUEST"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 104
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairConnectActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairConnectActivity;

    invoke-static {v1, p2}, Lcom/autochips/bluetooth/BtPairConnectActivity;->access$300(Lcom/autochips/bluetooth/BtPairConnectActivity;Landroid/content/Intent;)V

    goto :goto_0
.end method
