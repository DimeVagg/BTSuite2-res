.class Lcom/autochips/bluetooth/BtPhonebookActivity$7;
.super Ljava/lang/Object;
.source "BtPhonebookActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtPhonebookActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtPhonebookActivity;)V
    .locals 0

    .prologue
    .line 896
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$7;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .param p2, "v"    # Landroid/view/View;
    .param p3, "arg2"    # I
    .param p4, "arg3"    # J
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
    .line 898
    .local p1, "av":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$7;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v0, p3}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2802(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I

    const-string v0, "PHONEBOOK"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "=========index==========:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 899
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$7;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$700(Lcom/autochips/bluetooth/BtPhonebookActivity;)Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->setSelect(I)V

    .line 900
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$7;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$700(Lcom/autochips/bluetooth/BtPhonebookActivity;)Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 936
    return-void
.end method
