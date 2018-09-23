.class Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;
.super Ljava/lang/Thread;
.source "PhoneCallActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/PhoneCallActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "autoAnswerTimeoutThread"
.end annotation


# instance fields
.field private stoped:Z

.field final synthetic this$0:Lcom/autochips/bluetooth/PhoneCallActivity;


# direct methods
.method private constructor <init>(Lcom/autochips/bluetooth/PhoneCallActivity;)V
    .locals 1

    .prologue
    .line 482
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 483
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;->stoped:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/bluetooth/PhoneCallActivity;Lcom/autochips/bluetooth/PhoneCallActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;
    .param p2, "x1"    # Lcom/autochips/bluetooth/PhoneCallActivity$1;

    .prologue
    .line 482
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;-><init>(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    return-void
.end method

.method private autoAnswertimeout()V
    .locals 5

    .prologue
    .line 493
    const/4 v2, 0x0

    .line 494
    .local v2, "timeout":Z
    const/4 v0, 0x0

    .line 495
    .local v0, "cnt":I
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, "PhoneCallActivity"

    const-string v4, "autoAnswer timeout Thread is running"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 496
    :cond_0
    :goto_0
    iget-boolean v3, p0, Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;->stoped:Z

    if-nez v3, :cond_1

    .line 498
    const/16 v3, 0x1388

    if-lt v0, v3, :cond_4

    .line 499
    const/4 v2, 0x1

    .line 511
    :cond_1
    if-eqz v2, :cond_3

    .line 512
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "PhoneCallActivity"

    const-string v4, "auto answer time out,answer the call"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 513
    :cond_2
    iget-object v3, p0, Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$400(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    .line 515
    :cond_3
    return-void

    .line 504
    :cond_4
    const-wide/16 v3, 0x64

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 508
    :cond_5
    :goto_1
    add-int/lit8 v0, v0, 0x64

    goto :goto_0

    .line 505
    :catch_0
    move-exception v1

    .line 506
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v3

    if-eqz v3, :cond_5

    const-string v3, "PhoneCallActivity"

    const-string v4, "Waiting for action was interrupted."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 486
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;->autoAnswertimeout()V

    .line 487
    return-void
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 490
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;->stoped:Z

    .line 491
    return-void
.end method
