.class Lcom/autochips/bluetooth/PhoneCallYkActivity$2;
.super Ljava/util/TimerTask;
.source "PhoneCallYkActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/PhoneCallYkActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V
    .locals 0

    .prologue
    .line 447
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 450
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$400(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 451
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$400(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_QueryPhoneIndicator()V

    .line 457
    :goto_0
    return-void

    .line 454
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$500(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$402(Lcom/autochips/bluetooth/PhoneCallYkActivity;Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    .line 455
    const-string v0, "PhoneCallYkActivity"

    const-string v1, "m_hfadpter is null"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
