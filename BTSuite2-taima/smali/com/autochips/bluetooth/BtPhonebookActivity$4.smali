.class Lcom/autochips/bluetooth/BtPhonebookActivity$4;
.super Ljava/lang/Object;
.source "BtPhonebookActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/BtPhonebookActivity;->onCreate(Landroid/os/Bundle;)V
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
    .line 505
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 11
    .param p1, "arg0"    # Landroid/text/Editable;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 509
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v5, "BtPhonebookActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v7}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/EditText;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " starttime = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    :cond_0
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v5, "BtPhonebookActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "afterTextChanged() begin mSearchFlag = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v7}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2200(Lcom/autochips/bluetooth/BtPhonebookActivity;)Z

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    :cond_1
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/EditText;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 513
    .local v4, "strSearch":Ljava/lang/String;
    sget-boolean v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-nez v5, :cond_4

    .line 514
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v5, "BtPhonebookActivity"

    const-string v6, "connect bluetooth first"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 520
    :cond_2
    new-instance v2, Landroid/os/Message;

    invoke-direct {v2}, Landroid/os/Message;-><init>()V

    .line 521
    .local v2, "message":Landroid/os/Message;
    const/4 v5, 0x4

    iput v5, v2, Landroid/os/Message;->what:I

    .line 522
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 571
    .end local v2    # "message":Landroid/os/Message;
    :cond_3
    :goto_0
    return-void

    .line 526
    :cond_4
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2300(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 532
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2300(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 533
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5, v9}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2202(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z

    .line 534
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$100(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    .line 536
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2400(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/ListView;

    move-result-object v5

    invoke-virtual {v5, v9, v9}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    goto :goto_0

    .line 540
    :cond_5
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x3

    if-ge v5, v6, :cond_7

    invoke-static {v4}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2500(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 543
    :cond_6
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5, v9}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2202(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z

    goto :goto_0

    .line 547
    :cond_7
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5, v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2202(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z

    .line 548
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5, v4}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2302(Lcom/autochips/bluetooth/BtPhonebookActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 549
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v5, :cond_a

    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v5, :cond_a

    .line 550
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 551
    .local v3, "record":Ljava/util/List;, "Ljava/util/List<Lcom/autochips/bluetooth/PbSyncManager/PBRecord;>;"
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v4, v3}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->SearchPhonebook(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    .line 554
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 555
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_8

    .line 556
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 557
    .local v1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v6, "item_phonebook_name"

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    const-string v6, "item_phonebook_number"

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/PbSyncManager/PBRecord;->getNumber()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 555
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 561
    .end local v1    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_8
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-ge v5, v10, :cond_9

    .line 563
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v6, 0x7f07004c

    invoke-static {v5, v6}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2600(Lcom/autochips/bluetooth/BtPhonebookActivity;I)V

    .line 565
    :cond_9
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$700(Lcom/autochips/bluetooth/BtPhonebookActivity;)Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    move-result-object v5

    invoke-virtual {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 568
    .end local v0    # "i":I
    .end local v3    # "record":Ljava/util/List;, "Ljava/util/List<Lcom/autochips/bluetooth/PbSyncManager/PBRecord;>;"
    :cond_a
    iget-object v5, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v5}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2400(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/ListView;

    move-result-object v5

    invoke-virtual {v5, v9, v9}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    .line 569
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v5

    if-eqz v5, :cond_b

    const-string v5, "BtPhonebookActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "endtime = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    :cond_b
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v5, "BtPhonebookActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "afterTextChanged() end mSearchFlag = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$4;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v7}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$2200(Lcom/autochips/bluetooth/BtPhonebookActivity;)Z

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "arg0"    # Ljava/lang/CharSequence;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .param p4, "arg3"    # I

    .prologue
    .line 577
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "arg0"    # Ljava/lang/CharSequence;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .param p4, "arg3"    # I

    .prologue
    .line 583
    return-void
.end method
