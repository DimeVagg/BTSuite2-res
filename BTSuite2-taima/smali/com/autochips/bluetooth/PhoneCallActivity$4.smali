.class Lcom/autochips/bluetooth/PhoneCallActivity$4;
.super Ljava/util/TimerTask;
.source "PhoneCallActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/PhoneCallActivity;->scheduleCallMonitor(J)V
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
    .line 1108
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$4;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 1111
    const/4 v0, 0x0

    .line 1114
    .local v0, "stopMonitoring":Z
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$4;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1700(Lcom/autochips/bluetooth/PhoneCallActivity;)I

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$4;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1800(Lcom/autochips/bluetooth/PhoneCallActivity;)I

    move-result v1

    if-nez v1, :cond_0

    .line 1116
    const-string v1, "PhoneCallActivity"

    const-string v2, "mTimerCallMonitor. Call had been ended."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1117
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$4;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$500(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    .line 1118
    const/4 v0, 0x1

    .line 1120
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$4;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    const-wide/16 v2, 0x64

    invoke-static {v1, v2, v3}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1922(Lcom/autochips/bluetooth/PhoneCallActivity;J)J

    .line 1121
    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$4;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1900(Lcom/autochips/bluetooth/PhoneCallActivity;)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-gtz v1, :cond_2

    :cond_1
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$4;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$2000(Lcom/autochips/bluetooth/PhoneCallActivity;)Ljava/util/Timer;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1123
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$4;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$2000(Lcom/autochips/bluetooth/PhoneCallActivity;)Ljava/util/Timer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    .line 1124
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$4;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$2000(Lcom/autochips/bluetooth/PhoneCallActivity;)Ljava/util/Timer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Timer;->purge()I

    .line 1125
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$4;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$2002(Lcom/autochips/bluetooth/PhoneCallActivity;Ljava/util/Timer;)Ljava/util/Timer;

    .line 1127
    :cond_2
    return-void
.end method
