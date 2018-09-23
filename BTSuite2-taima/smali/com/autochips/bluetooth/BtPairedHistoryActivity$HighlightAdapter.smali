.class Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;
.super Landroid/widget/SimpleAdapter;
.source "BtPairedHistoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtPairedHistoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HighlightAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field mDeviceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private mInflater:Landroid/view/LayoutInflater;

.field private mSelectIdx:I

.field final synthetic this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;


# direct methods
.method public constructor <init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V
    .locals 6
    .param p2, "context"    # Landroid/content/Context;
    .param p4, "resource"    # I
    .param p5, "from"    # [Ljava/lang/String;
    .param p6, "to"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;I[",
            "Ljava/lang/String;",
            "[I)V"
        }
    .end annotation

    .prologue
    .line 1725
    .local p3, "data":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move v3, p4

    move-object v4, p5

    move-object v5, p6

    .line 1726
    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 1727
    iput-object p2, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->mContext:Landroid/content/Context;

    .line 1728
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 1729
    const/4 v0, -0x1

    iput v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->mSelectIdx:I

    .line 1730
    iput-object p3, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->mDeviceList:Ljava/util/List;

    .line 1731
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 1738
    const/4 v1, 0x0

    .line 1739
    .local v1, "holder":Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;
    if-nez p2, :cond_0

    .line 1740
    new-instance v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;

    .end local v1    # "holder":Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;
    invoke-direct {v1, p0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;-><init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;)V

    .line 1741
    .restart local v1    # "holder":Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v7, 0x7f030013

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 1742
    const v6, 0x7f0a008f

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->name:Landroid/widget/TextView;

    .line 1743
    const v6, 0x7f0a0090

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->status:Landroid/widget/TextView;

    .line 1744
    const v6, 0x7f0a0091

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->macaddr:Landroid/widget/TextView;

    .line 1746
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1751
    :goto_0
    const-string v4, ""

    .line 1752
    .local v4, "pbname":Ljava/lang/String;
    const-string v5, ""

    .line 1753
    .local v5, "pbstatus":Ljava/lang/String;
    const-string v3, ""

    .line 1755
    .local v3, "pbmacaddr":Ljava/lang/String;
    :try_start_0
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->mDeviceList:Ljava/util/List;

    invoke-interface {v6, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    const-string v7, "remote_device_name"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object v4, v0

    .line 1756
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->mDeviceList:Ljava/util/List;

    invoke-interface {v6, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    const-string v7, "remote_connect_status"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object v5, v0

    .line 1757
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->mDeviceList:Ljava/util/List;

    invoke-interface {v6, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    const-string v7, "remote_device_macaddr"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "pbmacaddr":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1762
    .restart local v3    # "pbmacaddr":Ljava/lang/String;
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f070017

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1763
    iget-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->name:Landroid/widget/TextView;

    const/high16 v7, -0x10000

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1764
    iget-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->status:Landroid/widget/TextView;

    const/high16 v7, -0x10000

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1765
    iget-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->macaddr:Landroid/widget/TextView;

    const/high16 v7, -0x10000

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1766
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$2700(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V

    .line 1778
    :goto_1
    iget-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->name:Landroid/widget/TextView;

    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1779
    iget-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->status:Landroid/widget/TextView;

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1780
    iget-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->macaddr:Landroid/widget/TextView;

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1783
    iget v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->mSelectIdx:I

    if-ne v6, p1, :cond_3

    .line 1784
    const v6, 0x7f0a008d

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 1785
    .local v2, "iv":Landroid/widget/ImageView;
    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1790
    :goto_2
    return-object p2

    .line 1748
    .end local v2    # "iv":Landroid/widget/ImageView;
    .end local v3    # "pbmacaddr":Ljava/lang/String;
    .end local v4    # "pbname":Ljava/lang/String;
    .end local v5    # "pbstatus":Ljava/lang/String;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "holder":Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;
    check-cast v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;

    .restart local v1    # "holder":Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;
    goto/16 :goto_0

    .line 1759
    .restart local v4    # "pbname":Ljava/lang/String;
    .restart local v5    # "pbstatus":Ljava/lang/String;
    :catchall_0
    move-exception v6

    throw v6

    .line 1768
    .restart local v3    # "pbmacaddr":Ljava/lang/String;
    :cond_1
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f070015

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1769
    iget-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->name:Landroid/widget/TextView;

    const v7, -0xffff01

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1770
    iget-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->status:Landroid/widget/TextView;

    const v7, -0xffff01

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1771
    iget-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->macaddr:Landroid/widget/TextView;

    const v7, -0xffff01

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1

    .line 1774
    :cond_2
    iget-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->name:Landroid/widget/TextView;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1775
    iget-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->status:Landroid/widget/TextView;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1776
    iget-object v6, v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->macaddr:Landroid/widget/TextView;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1

    .line 1787
    :cond_3
    const v6, 0x7f0a008d

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 1788
    .restart local v2    # "iv":Landroid/widget/ImageView;
    const/4 v6, 0x4

    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2
.end method

.method public setSelect(I)V
    .locals 0
    .param p1, "index"    # I

    .prologue
    .line 1734
    iput p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->mSelectIdx:I

    .line 1735
    return-void
.end method
