.class Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;
.super Ljava/lang/Thread;
.source "PhoneCallYkActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/PhoneCallYkActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "autoAnswerTimeoutThread"
.end annotation


# instance fields
.field private stoped:Z

.field final synthetic this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;


# direct methods
.method private constructor <init>(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V
    .locals 1

    .prologue
    .line 530
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 531
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;->stoped:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/bluetooth/PhoneCallYkActivity;Lcom/autochips/bluetooth/PhoneCallYkActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;
    .param p2, "x1"    # Lcom/autochips/bluetooth/PhoneCallYkActivity$1;

    .prologue
    .line 530
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;-><init>(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    return-void
.end method

.method private autoAnswertimeout()V
    .locals 5

    .prologue
    .line 541
    const/4 v2, 0x0

    .line 542
    .local v2, "timeout":Z
    const/4 v0, 0x0

    .line 543
    .local v0, "cnt":I
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, "PhoneCallYkActivity"

    const-string v4, "autoAnswer timeout Thread is running"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 544
    :cond_0
    :goto_0
    iget-boolean v3, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;->stoped:Z

    if-nez v3, :cond_1

    .line 546
    const/16 v3, 0x1388

    if-lt v0, v3, :cond_4

    .line 547
    const/4 v2, 0x1

    .line 559
    :cond_1
    if-eqz v2, :cond_3

    .line 560
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "PhoneCallYkActivity"

    const-string v4, "auto answer time out,answer the call"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 561
    :cond_2
    iget-object v3, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$700(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    .line 563
    :cond_3
    return-void

    .line 552
    :cond_4
    const-wide/16 v3, 0x64

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 556
    :cond_5
    :goto_1
    add-int/lit8 v0, v0, 0x64

    goto :goto_0

    .line 553
    :catch_0
    move-exception v1

    .line 554
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v3

    if-eqz v3, :cond_5

    const-string v3, "PhoneCallYkActivity"

    const-string v4, "Waiting for action was interrupted."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 534
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;->autoAnswertimeout()V

    .line 535
    return-void
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 538
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;->stoped:Z

    .line 539
    return-void
.end method
