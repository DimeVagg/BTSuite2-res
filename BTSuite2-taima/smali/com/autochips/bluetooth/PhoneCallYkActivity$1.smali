.class Lcom/autochips/bluetooth/PhoneCallYkActivity$1;
.super Ljava/util/TimerTask;
.source "PhoneCallYkActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/PhoneCallYkActivity;->onCreate(Landroid/os/Bundle;)V
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
    .line 322
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$1;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 326
    const-string v0, ""

    .line 328
    .local v0, "exits":Ljava/lang/String;
    const-string v1, "sys.xy.xydtmfover"

    const-string v2, "0"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 329
    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 332
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$1;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$100(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    .line 333
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$1;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$300(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$1;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$200(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Ljava/lang/Runnable;

    move-result-object v2

    const-wide/16 v3, 0x3e8

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 335
    const-string v1, "sys.xy.xydtmfover"

    const-string v2, "0"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    :cond_0
    return-void
.end method
