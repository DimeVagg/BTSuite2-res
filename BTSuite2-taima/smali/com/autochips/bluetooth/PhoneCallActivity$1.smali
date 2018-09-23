.class Lcom/autochips/bluetooth/PhoneCallActivity$1;
.super Ljava/util/TimerTask;
.source "PhoneCallActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/PhoneCallActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/PhoneCallActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/PhoneCallActivity;)V
    .locals 0

    .prologue
    .line 402
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$1;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 405
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity$1;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$100(Lcom/autochips/bluetooth/PhoneCallActivity;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 406
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity$1;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$100(Lcom/autochips/bluetooth/PhoneCallActivity;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_QueryPhoneIndicator()V

    .line 412
    :goto_0
    return-void

    .line 409
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity$1;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$1;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$200(Lcom/autochips/bluetooth/PhoneCallActivity;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$102(Lcom/autochips/bluetooth/PhoneCallActivity;Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    .line 410
    const-string v0, "PhoneCallActivity"

    const-string v1, "m_hfadpter is null"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
