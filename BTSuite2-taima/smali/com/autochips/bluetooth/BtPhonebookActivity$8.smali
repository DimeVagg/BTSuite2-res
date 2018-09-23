.class Lcom/autochips/bluetooth/BtPhonebookActivity$8;
.super Ljava/lang/Object;
.source "BtPhonebookActivity.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtPhonebookActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field isLastRow:Z

.field final synthetic this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtPhonebookActivity;)V
    .locals 1

    .prologue
    .line 942
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 943
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->isLastRow:Z

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 10
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    const/4 v9, 0x2

    .line 946
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, "BtPhonebookActivity"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "firstVisibleItem = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", visibleItemCount = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", totalItemCount = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 948
    :cond_0
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v6}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/EditText;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 949
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v6

    if-eqz v6, :cond_1

    const-string v6, "BtPhonebookActivity"

    const-string v7, "Search status"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 992
    :cond_1
    :goto_0
    return-void

    .line 952
    :cond_2
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v6, :cond_1

    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v6, :cond_1

    .line 955
    add-int v6, p2, p3

    if-ne v6, p4, :cond_3

    if-lez p4, :cond_3

    .line 957
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->isLastRow:Z

    .line 960
    :cond_3
    iget-boolean v6, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->isLastRow:Z

    if-eqz v6, :cond_1

    .line 962
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 963
    .local v5, "record":Ljava/util/List;, "Ljava/util/List<Lcom/autochips/bluetooth/PbSyncManager/PBRecord;>;"
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v7, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v7}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v9}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecCnt(Ljava/lang/String;I)I

    move-result v2

    .line 965
    .local v2, "iCount":I
    const/16 v3, 0xa

    .line 966
    .local v3, "iOneStepCount":I
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v6}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$500(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v6

    iget-object v7, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v7}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$400(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v7

    if-le v6, v7, :cond_8

    .line 967
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v6}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$500(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v6

    iget-object v7, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v7}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$400(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v7

    add-int/lit8 v7, v7, 0xa

    if-ge v6, v7, :cond_4

    .line 968
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v6}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$500(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v6

    iget-object v7, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v7}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$400(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v7

    sub-int v3, v6, v7

    .line 971
    :cond_4
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    iget-object v7, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v7}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$400(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v7

    invoke-virtual {v6, v9, v7, v3, v5}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecord(IIILjava/util/List;)Z

    move-result v0

    .line 973
    .local v0, "bRes":Z
    if-eqz v0, :cond_9

    .line 974
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v6, v3}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$412(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I

    .line 975
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v6

    if-eqz v6, :cond_5

    const-string v6, "BtPhonebookActivity"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mShowedRecordNum = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v8}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$400(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " iOneStepCount = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 976
    :cond_5
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v6

    if-eqz v6, :cond_6

    const-string v6, "BtPhonebookActivity"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "download phonebook iCount = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " get record size = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 977
    :cond_6
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    if-ge v1, v6, :cond_7

    .line 978
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 979
    .local v4, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v7, "item_phonebook_name"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v8}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2708(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ". "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 980
    const-string v7, "item_phonebook_number"

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 981
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v6}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 977
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 983
    .end local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_7
    iget-object v6, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v6}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$700(Lcom/autochips/bluetooth/BtPhonebookActivity;)Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    move-result-object v6

    invoke-virtual {v6}, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 990
    .end local v0    # "bRes":Z
    .end local v1    # "i":I
    :cond_8
    :goto_2
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->isLastRow:Z

    goto/16 :goto_0

    .line 985
    .restart local v0    # "bRes":Z
    :cond_9
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v6

    if-eqz v6, :cond_8

    const-string v6, "BtPhonebookActivity"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "[phonebook] GetRecord error, startIdx = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$8;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v8}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$400(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", count = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 995
    return-void
.end method
