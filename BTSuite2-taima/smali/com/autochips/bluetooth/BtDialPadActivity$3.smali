.class Lcom/autochips/bluetooth/BtDialPadActivity$3;
.super Ljava/util/TimerTask;
.source "BtDialPadActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/BtDialPadActivity;->onClick(Landroid/view/View;)V
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
    .line 987
    iput-object p1, p0, Lcom/autochips/bluetooth/BtDialPadActivity$3;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 989
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity$3;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1702(Lcom/autochips/bluetooth/BtDialPadActivity;Z)Z

    .line 990
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity$3;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1800(Lcom/autochips/bluetooth/BtDialPadActivity;)Ljava/util/Timer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 991
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity$3;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1800(Lcom/autochips/bluetooth/BtDialPadActivity;)Ljava/util/Timer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 992
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity$3;->this$0:Lcom/autochips/bluetooth/BtDialPadActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->access$1802(Lcom/autochips/bluetooth/BtDialPadActivity;Ljava/util/Timer;)Ljava/util/Timer;

    .line 994
    :cond_0
    return-void
.end method
