.class Lcom/autochips/bluetooth/BtCallHistoryActivity$6;
.super Ljava/lang/Object;
.source "BtCallHistoryActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtCallHistoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V
    .locals 0

    .prologue
    .line 941
    iput-object p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$6;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
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
    .line 944
    .local p1, "av":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$6;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v0, p3}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3702(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 945
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$6;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->setSelect(I)V

    .line 946
    iget-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$6;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 993
    return-void
.end method
