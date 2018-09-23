.class Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;
.super Landroid/widget/SimpleAdapter;
.source "BtCallHistoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtCallHistoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HighlightAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mSelectIdx:I

.field final synthetic this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;


# direct methods
.method public constructor <init>(Lcom/autochips/bluetooth/BtCallHistoryActivity;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V
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
    .line 1564
    .local p3, "data":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    iput-object p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move v3, p4

    move-object v4, p5

    move-object v5, p6

    .line 1565
    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 1566
    iput-object p2, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->mContext:Landroid/content/Context;

    .line 1567
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 1568
    const/4 v0, 0x0

    iput v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->mSelectIdx:I

    .line 1569
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const v10, 0x7f0a0092

    .line 1576
    const/4 v1, 0x0

    .line 1577
    .local v1, "holder":Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;
    if-nez p2, :cond_0

    .line 1578
    new-instance v1, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;

    .end local v1    # "holder":Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;
    invoke-direct {v1, p0}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;-><init>(Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;)V

    .line 1579
    .restart local v1    # "holder":Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;
    iget-object v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v8, 0x7f030014

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 1580
    const v7, 0x7f0a0094

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, v1, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;->name:Landroid/widget/TextView;

    .line 1581
    const v7, 0x7f0a0095

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, v1, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;->phone:Landroid/widget/TextView;

    .line 1582
    const v7, 0x7f0a0096

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iput-object v7, v1, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;->time:Landroid/widget/TextView;

    .line 1583
    const v7, 0x7f0a0097

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    iput-object v7, v1, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;->image:Landroid/widget/ImageView;

    .line 1584
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1589
    :goto_0
    const-string v4, ""

    .line 1590
    .local v4, "pbname":Ljava/lang/String;
    const-string v5, ""

    .line 1591
    .local v5, "pbnumber":Ljava/lang/String;
    const-string v6, ""

    .line 1592
    .local v6, "pbtime":Ljava/lang/String;
    const/4 v3, -0x1

    .line 1594
    .local v3, "pbimage":I
    :try_start_0
    iget-object v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v7}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    const-string v8, "item_history_name"

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Ljava/lang/String;

    move-object v4, v0

    .line 1595
    iget-object v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v7}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    const-string v8, "item_history_number"

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Ljava/lang/String;

    move-object v5, v0

    .line 1596
    iget-object v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v7}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    const-string v8, "item_history_time"

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Ljava/lang/String;

    move-object v6, v0

    .line 1597
    iget-object v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v7}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    const-string v8, "btn_call_history_img"

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    .line 1602
    iget-object v7, v1, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;->name:Landroid/widget/TextView;

    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1603
    iget-object v7, v1, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;->phone:Landroid/widget/TextView;

    invoke-virtual {v7, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1604
    iget-object v7, v1, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;->time:Landroid/widget/TextView;

    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1605
    iget-object v7, v1, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;->image:Landroid/widget/ImageView;

    iget-object v8, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-virtual {v8}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1612
    iget v7, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->mSelectIdx:I

    if-ne v7, p1, :cond_1

    .line 1613
    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 1614
    .local v2, "iv":Landroid/widget/ImageView;
    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1619
    :goto_1
    return-object p2

    .line 1586
    .end local v2    # "iv":Landroid/widget/ImageView;
    .end local v3    # "pbimage":I
    .end local v4    # "pbname":Ljava/lang/String;
    .end local v5    # "pbnumber":Ljava/lang/String;
    .end local v6    # "pbtime":Ljava/lang/String;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "holder":Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;
    check-cast v1, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;

    .restart local v1    # "holder":Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;
    goto/16 :goto_0

    .line 1599
    .restart local v3    # "pbimage":I
    .restart local v4    # "pbname":Ljava/lang/String;
    .restart local v5    # "pbnumber":Ljava/lang/String;
    .restart local v6    # "pbtime":Ljava/lang/String;
    :catchall_0
    move-exception v7

    throw v7

    .line 1616
    :cond_1
    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 1617
    .restart local v2    # "iv":Landroid/widget/ImageView;
    const/4 v7, 0x4

    invoke-virtual {v2, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_1
.end method

.method public setSelect(I)V
    .locals 0
    .param p1, "index"    # I

    .prologue
    .line 1572
    iput p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->mSelectIdx:I

    .line 1573
    return-void
.end method
