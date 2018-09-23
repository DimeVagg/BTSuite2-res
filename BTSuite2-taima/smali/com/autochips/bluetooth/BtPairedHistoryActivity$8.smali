.class Lcom/autochips/bluetooth/BtPairedHistoryActivity$8;
.super Ljava/lang/Object;
.source "BtPairedHistoryActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtPairedHistoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V
    .locals 0

    .prologue
    .line 1114
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$8;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
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
    .line 1116
    .local p1, "av":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$8;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v0, p3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2902(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)I

    .line 1117
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$8;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1800(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$8;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2900(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->setSelect(I)V

    .line 1118
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$8;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1800(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1119
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$8;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2802(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)I

    .line 1120
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$8;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1300(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$8;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2800(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->setSelect(I)V

    .line 1121
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$8;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1300(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1122
    return-void
.end method
