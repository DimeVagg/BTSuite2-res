.class Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;
.super Landroid/widget/SimpleAdapter;
.source "BtPhonebookActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtPhonebookActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HighlightAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mSelectIdx:I

.field final synthetic this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;


# direct methods
.method public constructor <init>(Lcom/autochips/bluetooth/BtPhonebookActivity;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V
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
            "Ljava/lang/String;",
            ">;>;I[",
            "Ljava/lang/String;",
            "[I)V"
        }
    .end annotation

    .prologue
    .line 1138
    .local p3, "data":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move v3, p4

    move-object v4, p5

    move-object v5, p6

    .line 1139
    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 1140
    iput-object p2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->mContext:Landroid/content/Context;

    .line 1141
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 1142
    const/4 v0, 0x0

    iput v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->mSelectIdx:I

    .line 1143
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 13
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 1150
    iget-object v10, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/EditText;

    move-result-object v10

    invoke-virtual {v10}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 1151
    .local v5, "replace":Ljava/lang/String;
    const/4 v1, 0x0

    .line 1152
    .local v1, "holder":Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;
    if-nez p2, :cond_3

    .line 1153
    new-instance v1, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;

    .end local v1    # "holder":Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;
    invoke-direct {v1, p0}, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;-><init>(Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;)V

    .line 1154
    .restart local v1    # "holder":Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;
    iget-object v10, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v11, 0x7f030017

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 1155
    const v10, 0x7f0a009d

    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v1, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;->name:Landroid/widget/TextView;

    .line 1156
    const v10, 0x7f0a009e

    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v1, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;->phone:Landroid/widget/TextView;

    .line 1157
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1162
    :goto_0
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v10

    if-eqz v10, :cond_0

    const-string v10, "BtPhonebookActivity"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "mSearchFlag = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2200(Lcom/autochips/bluetooth/BtPhonebookActivity;)Z

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1163
    :cond_0
    const-string v3, ""

    .line 1164
    .local v3, "pbname":Ljava/lang/String;
    const-string v4, ""

    .line 1166
    .local v4, "pbnumber":Ljava/lang/String;
    :try_start_0
    iget-object v10, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/HashMap;

    const-string v11, "item_phonebook_name"

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Ljava/lang/String;

    move-object v3, v0

    .line 1167
    iget-object v10, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/HashMap;

    const-string v11, "item_phonebook_number"

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "pbnumber":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1171
    .restart local v4    # "pbnumber":Ljava/lang/String;
    iget-object v10, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2200(Lcom/autochips/bluetooth/BtPhonebookActivity;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 1172
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "<font color=\'green\'>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</font>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v5, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    .line 1173
    .local v6, "replace_name":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v8

    check-cast v8, Landroid/text/Spannable;

    .line 1174
    .local v8, "span_name":Landroid/text/Spannable;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "<font color=\'green\'>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "</font>"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v5, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    .line 1175
    .local v7, "replace_number":Ljava/lang/String;
    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v9

    check-cast v9, Landroid/text/Spannable;

    .line 1176
    .local v9, "span_number":Landroid/text/Spannable;
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v10

    if-eqz v10, :cond_1

    const-string v10, "BtPhonebookActivity"

    invoke-static {v10, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1177
    :cond_1
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v10

    if-eqz v10, :cond_2

    const-string v10, "BtPhonebookActivity"

    invoke-static {v10, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1178
    :cond_2
    iget-object v10, v1, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;->name:Landroid/widget/TextView;

    invoke-virtual {v10, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1179
    iget-object v10, v1, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;->phone:Landroid/widget/TextView;

    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1190
    .end local v6    # "replace_name":Ljava/lang/String;
    .end local v7    # "replace_number":Ljava/lang/String;
    .end local v8    # "span_name":Landroid/text/Spannable;
    .end local v9    # "span_number":Landroid/text/Spannable;
    :goto_1
    iget v10, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->mSelectIdx:I

    if-ne v10, p1, :cond_5

    .line 1191
    const v10, 0x7f0a009b

    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 1192
    .local v2, "iv":Landroid/widget/ImageView;
    const/4 v10, 0x0

    invoke-virtual {v2, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1197
    :goto_2
    return-object p2

    .line 1159
    .end local v2    # "iv":Landroid/widget/ImageView;
    .end local v3    # "pbname":Ljava/lang/String;
    .end local v4    # "pbnumber":Ljava/lang/String;
    :cond_3
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "holder":Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;
    check-cast v1, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;

    .restart local v1    # "holder":Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;
    goto/16 :goto_0

    .line 1169
    .restart local v3    # "pbname":Ljava/lang/String;
    :catchall_0
    move-exception v10

    throw v10

    .line 1183
    .restart local v4    # "pbnumber":Ljava/lang/String;
    :cond_4
    iget-object v10, v1, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;->name:Landroid/widget/TextView;

    invoke-virtual {v10, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1184
    iget-object v10, v1, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter$ViewHolder;->phone:Landroid/widget/TextView;

    invoke-virtual {v10, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 1194
    :cond_5
    const v10, 0x7f0a009b

    invoke-virtual {p2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 1195
    .restart local v2    # "iv":Landroid/widget/ImageView;
    const/4 v10, 0x4

    invoke-virtual {v2, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2
.end method

.method public setSelect(I)V
    .locals 0
    .param p1, "index"    # I

    .prologue
    .line 1146
    iput p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->mSelectIdx:I

    .line 1147
    return-void
.end method
