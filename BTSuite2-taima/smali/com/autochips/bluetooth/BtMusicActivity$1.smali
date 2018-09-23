.class Lcom/autochips/bluetooth/BtMusicActivity$1;
.super Ljava/util/TimerTask;
.source "BtMusicActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/BtMusicActivity;->startCheckplayTimer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtMusicActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtMusicActivity;)V
    .locals 0

    .prologue
    .line 156
    iput-object p1, p0, Lcom/autochips/bluetooth/BtMusicActivity$1;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 159
    const-string v0, "BtMusicActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startCheckplayTimer bStoped="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/autochips/bluetooth/BtMusicActivity$1;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtMusicActivity;->access$000(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",musicState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/autochips/bluetooth/BtMusicActivity$1;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtMusicActivity;->access$100(Lcom/autochips/bluetooth/BtMusicActivity;)B

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity$1;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtMusicActivity;->access$200(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity$1;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtMusicActivity;->access$100(Lcom/autochips/bluetooth/BtMusicActivity;)B

    move-result v0

    if-eq v0, v3, :cond_2

    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity$1;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtMusicActivity;->access$300(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v0

    if-ne v0, v3, :cond_2

    .line 161
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity$1;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v0, v3}, Lcom/autochips/bluetooth/BtMusicActivity;->access$400(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    .line 167
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity$1;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtMusicActivity;->access$508(Lcom/autochips/bluetooth/BtMusicActivity;)I

    .line 169
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity$1;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtMusicActivity;->access$500(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v0

    if-le v0, v3, :cond_1

    .line 170
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity$1;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtMusicActivity;->access$600(Lcom/autochips/bluetooth/BtMusicActivity;)V

    .line 172
    :cond_1
    return-void

    .line 163
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity$1;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtMusicActivity;->access$100(Lcom/autochips/bluetooth/BtMusicActivity;)B

    move-result v0

    if-ne v0, v3, :cond_0

    .line 164
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity$1;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v0, v4}, Lcom/autochips/bluetooth/BtMusicActivity;->access$302(Lcom/autochips/bluetooth/BtMusicActivity;Z)Z

    .line 165
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity$1;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v0, v4}, Lcom/autochips/bluetooth/BtMusicActivity;->access$202(Lcom/autochips/bluetooth/BtMusicActivity;Z)Z

    goto :goto_0
.end method
