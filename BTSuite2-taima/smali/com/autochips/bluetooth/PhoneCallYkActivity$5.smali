.class Lcom/autochips/bluetooth/PhoneCallYkActivity$5;
.super Ljava/util/TimerTask;
.source "PhoneCallYkActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/PhoneCallYkActivity;->scheduleCallMonitor(J)V
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
    .line 1164
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$5;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 1167
    const/4 v0, 0x0

    .line 1170
    .local v0, "stopMonitoring":Z
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$5;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1700(Lcom/autochips/bluetooth/PhoneCallYkActivity;)I

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$5;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1800(Lcom/autochips/bluetooth/PhoneCallYkActivity;)I

    move-result v1

    if-nez v1, :cond_0

    .line 1172
    const-string v1, "PhoneCallYkActivity"

    const-string v2, "mTimerCallMonitor. Call had been ended."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1173
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$5;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$800(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    .line 1174
    const/4 v0, 0x1

    .line 1176
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$5;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    const-wide/16 v2, 0x64

    invoke-static {v1, v2, v3}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1922(Lcom/autochips/bluetooth/PhoneCallYkActivity;J)J

    .line 1177
    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$5;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1900(Lcom/autochips/bluetooth/PhoneCallYkActivity;)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gtz v1, :cond_2

    :cond_1
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$5;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$2000(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Ljava/util/Timer;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1179
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$5;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$2000(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Ljava/util/Timer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    .line 1180
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$5;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$2000(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Ljava/util/Timer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Timer;->purge()I

    .line 1181
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$5;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$2002(Lcom/autochips/bluetooth/PhoneCallYkActivity;Ljava/util/Timer;)Ljava/util/Timer;

    .line 1183
    :cond_2
    return-void
.end method
