.class Lcom/autochips/bluetooth/MainBluetoothActivity$4;
.super Ljava/lang/Object;
.source "MainBluetoothActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/MainBluetoothActivity;->setTabClickListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/MainBluetoothActivity;)V
    .locals 0

    .prologue
    .line 391
    iput-object p1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$4;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v4, 0x0

    const/4 v6, 0x4

    const/4 v5, 0x3

    .line 393
    const v3, 0x7f0a0088

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 394
    .local v2, "iv":Landroid/widget/ImageView;
    if-nez v2, :cond_1

    .line 479
    :cond_0
    :goto_0
    return-void

    .line 395
    :cond_1
    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 396
    .local v1, "integer":Ljava/lang/Integer;
    if-nez v1, :cond_2

    move v3, v4

    :goto_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 397
    sget-object v3, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v3}, Lcom/autochips/bluetooth/MyTabHost;->getCurrentTab()I

    move-result v0

    .line 398
    .local v0, "curTabId":I
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 474
    const-string v3, "TABLISTENER"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "========integer========"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    sget-object v3, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v3, v6}, Lcom/autochips/bluetooth/MyTabHost;->setCurrentTab(I)V

    goto :goto_0

    .line 396
    .end local v0    # "curTabId":I
    :cond_2
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_1

    .line 400
    .restart local v0    # "curTabId":I
    :sswitch_0
    invoke-static {}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$000()Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, "MainBluetoothActivity"

    const-string v5, "+++  TAB_INDEX_BT_DIALER +++"

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 401
    :cond_3
    if-eqz v0, :cond_0

    .line 402
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v3, :cond_4

    .line 403
    sget-object v3, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v3, v4}, Lcom/autochips/bluetooth/MyTabHost;->setCurrentTab(I)V

    goto :goto_0

    .line 404
    :cond_4
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    if-nez v3, :cond_5

    .line 405
    iget-object v3, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$4;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$100(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    goto :goto_0

    .line 407
    :cond_5
    iget-object v3, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$4;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$200(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    goto :goto_0

    .line 412
    :sswitch_1
    invoke-static {}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$000()Z

    move-result v3

    if-eqz v3, :cond_6

    const-string v3, "MainBluetoothActivity"

    const-string v4, "+++  TAB_INDEX_BT_HISTORY +++"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    :cond_6
    if-eq v0, v8, :cond_0

    .line 414
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v3, :cond_7

    .line 415
    sget-object v3, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v3, v8}, Lcom/autochips/bluetooth/MyTabHost;->setCurrentTab(I)V

    goto :goto_0

    .line 416
    :cond_7
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    if-nez v3, :cond_8

    .line 417
    iget-object v3, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$4;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$100(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    goto/16 :goto_0

    .line 419
    :cond_8
    iget-object v3, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$4;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$200(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    goto/16 :goto_0

    .line 424
    :sswitch_2
    invoke-static {}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$000()Z

    move-result v3

    if-eqz v3, :cond_9

    const-string v3, "MainBluetoothActivity"

    const-string v4, "+++  TAB_INDEX_BT_PHONEBOOK +++"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 425
    :cond_9
    if-eq v0, v7, :cond_0

    .line 426
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v3, :cond_a

    .line 427
    sget-object v3, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v3, v7}, Lcom/autochips/bluetooth/MyTabHost;->setCurrentTab(I)V

    goto/16 :goto_0

    .line 428
    :cond_a
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    if-nez v3, :cond_b

    .line 429
    iget-object v3, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$4;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$100(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    goto/16 :goto_0

    .line 431
    :cond_b
    iget-object v3, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$4;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$200(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    goto/16 :goto_0

    .line 436
    :sswitch_3
    invoke-static {}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$000()Z

    move-result v3

    if-eqz v3, :cond_c

    const-string v3, "MainBluetoothActivity"

    const-string v4, "+++  TAB_INDEX_BT_SMS +++"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 437
    :cond_c
    if-eq v0, v5, :cond_0

    .line 438
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v3, :cond_d

    .line 439
    sget-object v3, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v3, v5}, Lcom/autochips/bluetooth/MyTabHost;->setCurrentTab(I)V

    goto/16 :goto_0

    .line 440
    :cond_d
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    if-nez v3, :cond_e

    .line 441
    iget-object v3, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$4;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$100(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    goto/16 :goto_0

    .line 443
    :cond_e
    iget-object v3, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$4;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$200(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    goto/16 :goto_0

    .line 448
    :sswitch_4
    invoke-static {}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$000()Z

    move-result v3

    if-eqz v3, :cond_f

    const-string v3, "MainBluetoothActivity"

    const-string v4, "+++  TAB_INDEX_BT_MUSIC +++"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    :cond_f
    if-eq v0, v5, :cond_0

    .line 450
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v3, :cond_10

    .line 451
    sget-object v3, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v3, v5}, Lcom/autochips/bluetooth/MyTabHost;->setCurrentTab(I)V

    goto/16 :goto_0

    .line 452
    :cond_10
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    if-nez v3, :cond_11

    .line 453
    iget-object v3, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$4;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$100(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    goto/16 :goto_0

    .line 455
    :cond_11
    iget-object v3, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$4;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$200(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    goto/16 :goto_0

    .line 460
    :sswitch_5
    if-eq v0, v6, :cond_0

    .line 461
    sget-object v3, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    invoke-virtual {v3, v6}, Lcom/autochips/bluetooth/MyTabHost;->setCurrentTab(I)V

    goto/16 :goto_0

    .line 465
    :sswitch_6
    invoke-static {}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$000()Z

    move-result v3

    if-eqz v3, :cond_12

    const-string v3, "MainBluetoothActivity"

    const-string v4, "+++  TAB_INDEX_BT_SETTINGS +++"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    :cond_12
    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-nez v3, :cond_13

    sget-boolean v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mbPoweron:Z

    if-nez v3, :cond_13

    .line 467
    iget-object v3, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$4;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-static {v3}, Lcom/autochips/bluetooth/MainBluetoothActivity;->access$100(Lcom/autochips/bluetooth/MainBluetoothActivity;)V

    goto/16 :goto_0

    .line 469
    :cond_13
    const/4 v3, 0x5

    if-eq v0, v3, :cond_0

    .line 470
    sget-object v3, Lcom/autochips/bluetooth/MainBluetoothActivity;->mTabHost:Lcom/autochips/bluetooth/MyTabHost;

    const/4 v4, 0x5

    invoke-virtual {v3, v4}, Lcom/autochips/bluetooth/MyTabHost;->setCurrentTab(I)V

    goto/16 :goto_0

    .line 398
    :sswitch_data_0
    .sparse-switch
        0x7f02001e -> :sswitch_4
        0x7f020039 -> :sswitch_0
        0x7f02003a -> :sswitch_1
        0x7f02004b -> :sswitch_2
        0x7f020050 -> :sswitch_5
        0x7f020052 -> :sswitch_6
        0x7f020053 -> :sswitch_3
    .end sparse-switch
.end method
