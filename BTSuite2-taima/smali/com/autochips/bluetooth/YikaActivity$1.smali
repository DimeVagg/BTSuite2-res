.class Lcom/autochips/bluetooth/YikaActivity$1;
.super Ljava/lang/Object;
.source "YikaActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/YikaActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/YikaActivity;

.field final synthetic val$nameList:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/YikaActivity;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 44
    iput-object p1, p0, Lcom/autochips/bluetooth/YikaActivity$1;->this$0:Lcom/autochips/bluetooth/YikaActivity;

    iput-object p2, p0, Lcom/autochips/bluetooth/YikaActivity$1;->val$nameList:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v2, p0, Lcom/autochips/bluetooth/YikaActivity$1;->val$nameList:Ljava/util/List;

    invoke-interface {v2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    const-string v3, "PHONENumber"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 50
    .local v1, "phoneNum":Ljava/lang/String;
    iget-object v2, p0, Lcom/autochips/bluetooth/YikaActivity$1;->this$0:Lcom/autochips/bluetooth/YikaActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/YikaActivity;->access$000(Lcom/autochips/bluetooth/YikaActivity;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "phoneNum ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    new-instance v0, Landroid/content/Intent;

    const-string v2, "com.xyauto.selectPhoneNumber"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 52
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "selectPhoneNumber"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    iget-object v2, p0, Lcom/autochips/bluetooth/YikaActivity$1;->this$0:Lcom/autochips/bluetooth/YikaActivity;

    invoke-virtual {v2, v0}, Lcom/autochips/bluetooth/YikaActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 54
    iget-object v2, p0, Lcom/autochips/bluetooth/YikaActivity$1;->this$0:Lcom/autochips/bluetooth/YikaActivity;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/YikaActivity;->finish()V

    .line 55
    return-void
.end method
