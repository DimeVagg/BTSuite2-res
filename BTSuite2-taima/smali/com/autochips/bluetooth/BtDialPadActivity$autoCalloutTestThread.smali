.class Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;
.super Ljava/lang/Thread;
.source "BtDialPadActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtDialPadActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "autoCalloutTestThread"
.end annotation


# instance fields
.field private stoped:Z

.field final synthetic this$0:Lcom/autochips/bluetooth/BtDialPadActivity;


# direct methods
.method private constructor <init>(Lcom/autochips/bluetooth/BtDialPadActivity;)V
    .locals 1

    .prologue
    .line 643
    iput-object p1, p0, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 644
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->stoped:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/autochips/bluetooth/BtDialPadActivity;Lcom/autochips/bluetooth/BtDialPadActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;
    .param p2, "x1"    # Lcom/autochips/bluetooth/BtDialPadActivity$1;

    .prologue
    .line 643
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;-><init>(Lcom/autochips/bluetooth/BtDialPadActivity;)V

    return-void
.end method

.method private autoCallOutTest()V
    .locals 4

    .prologue
    .line 655
    const/4 v0, 0x0

    .line 656
    .local v0, "cnt":I
    invoke-static {}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$100()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "BTDialPadActivity"

    const-string v3, "autoCallOutTest timeout Thread is running"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 657
    :cond_0
    :goto_0
    iget-boolean v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->stoped:Z

    if-nez v2, :cond_4

    .line 660
    const-wide/16 v2, 0x3e8

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 665
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 667
    const/16 v2, 0x14

    if-lt v0, v2, :cond_0

    .line 668
    const/4 v0, 0x0

    .line 670
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1200(Lcom/autochips/bluetooth/BtDialPadActivity;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 671
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1300(Lcom/autochips/bluetooth/BtDialPadActivity;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 672
    invoke-static {}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$100()Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "BTDialPadActivity"

    const-string v3, "auto Callout time out"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 673
    :cond_2
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    const-string v3, "10000"

    iput-object v3, v2, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strMemoryCallNum:Ljava/lang/String;

    .line 674
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    iget-object v3, p0, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    iget-object v3, v3, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strMemoryCallNum:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1400(Lcom/autochips/bluetooth/BtDialPadActivity;Ljava/lang/String;)Z

    .line 675
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1502(Lcom/autochips/bluetooth/BtDialPadActivity;Z)Z

    goto :goto_0

    .line 661
    :catch_0
    move-exception v1

    .line 662
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$100()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 663
    const-string v2, "BTDialPadActivity"

    const-string v3, "Waiting for action was interrupted."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 678
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_3
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1600(Lcom/autochips/bluetooth/BtDialPadActivity;)Z

    goto :goto_0

    .line 686
    :cond_4
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 647
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->autoCallOutTest()V

    .line 648
    return-void
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 651
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->stoped:Z

    .line 652
    return-void
.end method
