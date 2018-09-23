.class Lcom/autochips/bluetooth/BtCallHistoryActivity$7;
.super Ljava/lang/Object;
.source "BtCallHistoryActivity.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtCallHistoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field isLastRow:Z

.field final synthetic this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V
    .locals 1

    .prologue
    .line 999
    iput-object p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1000
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->isLastRow:Z

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 14
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    .line 1004
    invoke-static {}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$500()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 1005
    const-string v11, "BtCallHistoryActivity"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "firstVisibleItem = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", visibleItemCount = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p3

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", totalItemCount = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p4

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1007
    :cond_0
    add-int v11, p2, p3

    move/from16 v0, p4

    if-ne v11, v0, :cond_1

    if-lez p4, :cond_1

    .line 1009
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->isLastRow:Z

    .line 1012
    :cond_1
    sget-object v11, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v11, :cond_2

    sget-boolean v11, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-nez v11, :cond_3

    .line 1133
    :cond_2
    :goto_0
    return-void

    .line 1017
    :cond_3
    iget-boolean v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->isLastRow:Z

    if-eqz v11, :cond_2

    .line 1019
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1021
    .local v8, "record":Ljava/util/List;, "Ljava/util/List<Lcom/autochips/bluetooth/PbSyncManager/PBRecord;>;"
    const/4 v9, 0x0

    .line 1022
    .local v9, "showedRecord":I
    const/4 v7, 0x6

    .line 1023
    .local v7, "path":I
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v11

    if-nez v11, :cond_e

    .line 1024
    const/4 v7, 0x6

    .line 1025
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$700(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v9

    .line 1036
    :cond_4
    :goto_1
    sget-object v11, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v12, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v12}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12, v7}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecCnt(Ljava/lang/String;I)I

    move-result v2

    .line 1039
    .local v2, "downloadednum":I
    const/16 v4, 0xa

    .line 1040
    .local v4, "iOneStepCount":I
    if-le v2, v9, :cond_20

    .line 1041
    add-int/lit8 v11, v9, 0xa

    if-ge v2, v11, :cond_5

    .line 1042
    sub-int v4, v2, v9

    .line 1045
    :cond_5
    sget-object v11, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v11, v7, v9, v4, v8}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetRecord(IIILjava/util/List;)Z

    move-result v1

    .line 1047
    .local v1, "bRes":Z
    if-eqz v1, :cond_21

    .line 1048
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v11

    if-nez v11, :cond_11

    .line 1049
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11, v4}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$712(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 1058
    :cond_6
    :goto_2
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v11

    if-ge v3, v11, :cond_1f

    .line 1059
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 1061
    .local v5, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getName()Ljava/lang/String;

    move-result-object v6

    .line 1062
    .local v6, "name":Ljava/lang/String;
    if-eqz v6, :cond_7

    const-string v11, ""

    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_7

    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 1064
    :cond_7
    sget-object v12, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v11, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v11}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v12, v13, v11}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetNameByTelExectly(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1067
    const-string v11, ""

    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 1068
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const v12, 0x7f070091

    invoke-virtual {v11, v12}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 1072
    :cond_8
    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getType()I

    move-result v10

    .line 1073
    .local v10, "type":I
    const/16 v11, 0x40

    if-eq v10, v11, :cond_9

    const/16 v11, 0x80

    if-ne v10, v11, :cond_14

    .line 1075
    :cond_9
    const-string v11, "item_history_name"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3608(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ". "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1076
    const-string v12, "item_history_number"

    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v12, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1077
    const-string v12, "item_history_time"

    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getCalltime()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v12, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1078
    const-string v11, "btn_call_history_img"

    const v12, 0x7f0200c9

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1096
    :cond_a
    :goto_4
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v11

    if-nez v11, :cond_1c

    .line 1097
    const-string v11, "item_history_name"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1208(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ". "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1098
    const-string v12, "item_history_number"

    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v12, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1099
    const-string v12, "item_history_time"

    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getCalltime()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v12, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1100
    const/16 v11, 0x40

    if-eq v10, v11, :cond_b

    const/16 v11, 0x80

    if-ne v10, v11, :cond_18

    .line 1102
    :cond_b
    const-string v11, "btn_call_history_img"

    const v12, 0x7f0200c9

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1114
    :cond_c
    :goto_5
    sget-object v11, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllCallList:Ljava/util/ArrayList;

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1122
    :cond_d
    :goto_6
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1058
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_3

    .line 1026
    .end local v1    # "bRes":Z
    .end local v2    # "downloadednum":I
    .end local v3    # "i":I
    .end local v4    # "iOneStepCount":I
    .end local v5    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v6    # "name":Ljava/lang/String;
    .end local v10    # "type":I
    :cond_e
    const/4 v11, 0x1

    iget-object v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v12

    if-ne v11, v12, :cond_f

    .line 1027
    const/4 v7, 0x3

    .line 1028
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v9

    goto/16 :goto_1

    .line 1029
    :cond_f
    const/4 v11, 0x2

    iget-object v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v12

    if-ne v11, v12, :cond_10

    .line 1030
    const/4 v7, 0x4

    .line 1031
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1000(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v9

    goto/16 :goto_1

    .line 1032
    :cond_10
    const/4 v11, 0x3

    iget-object v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v12

    if-ne v11, v12, :cond_4

    .line 1033
    const/4 v7, 0x5

    .line 1034
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1100(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v9

    goto/16 :goto_1

    .line 1050
    .restart local v1    # "bRes":Z
    .restart local v2    # "downloadednum":I
    .restart local v4    # "iOneStepCount":I
    :cond_11
    const/4 v11, 0x1

    iget-object v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v12

    if-ne v11, v12, :cond_12

    .line 1051
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11, v4}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$912(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    goto/16 :goto_2

    .line 1052
    :cond_12
    const/4 v11, 0x2

    iget-object v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v12

    if-ne v11, v12, :cond_13

    .line 1053
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11, v4}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1012(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    goto/16 :goto_2

    .line 1054
    :cond_13
    const/4 v11, 0x3

    iget-object v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v12

    if-ne v11, v12, :cond_6

    .line 1055
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11, v4}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1112(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    goto/16 :goto_2

    .line 1080
    .restart local v3    # "i":I
    .restart local v5    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v6    # "name":Ljava/lang/String;
    .restart local v10    # "type":I
    :cond_14
    const/16 v11, 0x100

    if-eq v10, v11, :cond_15

    const/16 v11, 0x200

    if-ne v10, v11, :cond_16

    .line 1082
    :cond_15
    const-string v11, "item_history_name"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3408(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ". "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1083
    const-string v12, "item_history_number"

    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v12, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1084
    const-string v12, "item_history_time"

    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getCalltime()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v12, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1085
    const-string v11, "btn_call_history_img"

    const v12, 0x7f0200cb

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_4

    .line 1087
    :cond_16
    const/16 v11, 0x400

    if-eq v10, v11, :cond_17

    const/16 v11, 0x800

    if-ne v10, v11, :cond_a

    .line 1089
    :cond_17
    const-string v11, "item_history_name"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3508(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ". "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1090
    const-string v12, "item_history_number"

    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v12, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1091
    const-string v12, "item_history_time"

    invoke-interface {v8, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getCalltime()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v12, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1092
    const-string v11, "btn_call_history_img"

    const v12, 0x7f0200ca

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_4

    .line 1104
    :cond_18
    const/16 v11, 0x100

    if-eq v10, v11, :cond_19

    const/16 v11, 0x200

    if-ne v10, v11, :cond_1a

    .line 1106
    :cond_19
    const-string v11, "btn_call_history_img"

    const v12, 0x7f0200cb

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_5

    .line 1108
    :cond_1a
    const/16 v11, 0x400

    if-eq v10, v11, :cond_1b

    const/16 v11, 0x800

    if-ne v10, v11, :cond_c

    .line 1110
    :cond_1b
    const-string v11, "btn_call_history_img"

    const v12, 0x7f0200ca

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v5, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_5

    .line 1115
    :cond_1c
    const/4 v11, 0x1

    iget-object v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v12

    if-ne v11, v12, :cond_1d

    .line 1116
    sget-object v11, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mRecievedList:Ljava/util/ArrayList;

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_6

    .line 1117
    :cond_1d
    const/4 v11, 0x2

    iget-object v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v12

    if-ne v11, v12, :cond_1e

    .line 1118
    sget-object v11, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedList:Ljava/util/ArrayList;

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_6

    .line 1119
    :cond_1e
    const/4 v11, 0x3

    iget-object v12, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v12

    if-ne v11, v12, :cond_d

    .line 1120
    sget-object v11, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedList:Ljava/util/ArrayList;

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_6

    .line 1124
    .end local v5    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v6    # "name":Ljava/lang/String;
    .end local v10    # "type":I
    :cond_1f
    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    move-result-object v11

    invoke-virtual {v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 1131
    .end local v1    # "bRes":Z
    .end local v3    # "i":I
    :cond_20
    :goto_7
    const/4 v11, 0x0

    iput-boolean v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->isLastRow:Z

    goto/16 :goto_0

    .line 1126
    .restart local v1    # "bRes":Z
    :cond_21
    const-string v11, "BtCallHistoryActivity"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "[phonebook] GetRecord error, startIdx = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$7;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$700(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", count = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 1136
    return-void
.end method
