.class Lcom/autochips/bluetooth/BtPhonebookActivity$2;
.super Landroid/content/BroadcastReceiver;
.source "BtPhonebookActivity.java"


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
    .line 218
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 221
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v10

    if-eqz v10, :cond_0

    const-string v10, "BtPhonebookActivity"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "onReceive intent->"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    const-string v11, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_finish"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 224
    const-string v10, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_folder"

    const/16 v11, 0x8

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 226
    .local v2, "iDownloadPath":I
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const-string v11, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_support_folder"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v11

    invoke-static {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1002(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z

    .line 227
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v10

    if-eqz v10, :cond_1

    const-string v10, "BtPhonebookActivity"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "intent folder->"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " Support Flag = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Z

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    :cond_1
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1100(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v10

    if-eq v2, v10, :cond_3

    .line 411
    .end local v2    # "iDownloadPath":I
    :cond_2
    :goto_0
    return-void

    .line 232
    .restart local v2    # "iDownloadPath":I
    :cond_3
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Z

    move-result v10

    if-nez v10, :cond_4

    .line 233
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    .line 234
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 235
    .local v4, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v10, "item_phonebook_name"

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v12, 0x7f070092

    invoke-virtual {v11, v12}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    const-string v10, "item_phonebook_number"

    const-string v11, ""

    invoke-virtual {v4, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 238
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$700(Lcom/autochips/bluetooth/BtPhonebookActivity;)Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    move-result-object v10

    invoke-virtual {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 241
    .end local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a0069

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setEnabled(Z)V

    .line 242
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a006a

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setEnabled(Z)V

    .line 243
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a006b

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setEnabled(Z)V

    .line 244
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a006b

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f020091

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 247
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1200(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/LinearLayout;

    move-result-object v10

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 248
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const/4 v11, 0x0

    invoke-static {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1302(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z

    .line 249
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const/4 v11, 0x1

    invoke-static {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1402(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z

    .line 250
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1500(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    .line 251
    new-instance v6, Landroid/os/Message;

    invoke-direct {v6}, Landroid/os/Message;-><init>()V

    .line 252
    .local v6, "messageUpdate":Landroid/os/Message;
    const/4 v10, 0x2

    iput v10, v6, Landroid/os/Message;->what:I

    .line 253
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/os/Handler;

    move-result-object v10

    invoke-virtual {v10, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 254
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    invoke-static {v10, v11, v12}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1702(Lcom/autochips/bluetooth/BtPhonebookActivity;J)J

    .line 255
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v10

    if-eqz v10, :cond_2

    const-string v10, "BtPhonebookActivity"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "finish download phonebook time is "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1700(Lcom/autochips/bluetooth/BtPhonebookActivity;)J

    move-result-wide v12

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v14}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1800(Lcom/autochips/bluetooth/BtPhonebookActivity;)J

    move-result-wide v14

    sub-long/2addr v12, v14

    const-wide/16 v14, 0x3e8

    div-long/2addr v12, v14

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "s"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 269
    .end local v2    # "iDownloadPath":I
    .end local v6    # "messageUpdate":Landroid/os/Message;
    :cond_5
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    const-string v11, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_onestep"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 270
    const-string v10, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_folder"

    const/16 v11, 0x8

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 272
    .restart local v2    # "iDownloadPath":I
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v10

    if-eqz v10, :cond_6

    const-string v10, "BtPhonebookActivity"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "intent folder->"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    :cond_6
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1100(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v10

    if-ne v2, v10, :cond_2

    .line 276
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const/4 v11, 0x1

    invoke-static {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1002(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z

    .line 278
    const-string v10, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_onestep_count"

    const/4 v11, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 279
    .local v3, "iOneStepCount":I
    new-instance v5, Landroid/os/Message;

    invoke-direct {v5}, Landroid/os/Message;-><init>()V

    .line 280
    .local v5, "message":Landroid/os/Message;
    const/4 v10, 0x1

    iput v10, v5, Landroid/os/Message;->what:I

    .line 281
    iput v3, v5, Landroid/os/Message;->arg1:I

    .line 282
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/os/Handler;

    move-result-object v10

    invoke-virtual {v10, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 283
    .end local v2    # "iDownloadPath":I
    .end local v3    # "iOneStepCount":I
    .end local v5    # "message":Landroid/os/Message;
    :cond_7
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    const-string v11, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_stop"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_a

    .line 284
    const-string v10, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_folder"

    const/16 v11, 0x8

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 286
    .restart local v2    # "iDownloadPath":I
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v10

    if-eqz v10, :cond_8

    const-string v10, "BtPhonebookActivity"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "intent folder->"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    :cond_8
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1100(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v10

    if-eq v2, v10, :cond_9

    const/16 v10, 0x8

    if-eq v2, v10, :cond_9

    sget-boolean v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    const/4 v11, 0x1

    if-eq v10, v11, :cond_2

    .line 292
    :cond_9
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const/4 v11, 0x1

    invoke-static {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1002(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z

    .line 294
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a006a

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setEnabled(Z)V

    .line 295
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a006b

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setEnabled(Z)V

    .line 296
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a006b

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f0200db

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 298
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a0069

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setEnabled(Z)V

    .line 300
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1200(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/LinearLayout;

    move-result-object v10

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 301
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    invoke-static {v10, v11, v12}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1702(Lcom/autochips/bluetooth/BtPhonebookActivity;J)J

    .line 302
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const/4 v11, 0x0

    invoke-static {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1302(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z

    .line 308
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v10

    if-eqz v10, :cond_2

    const-string v10, "BtPhonebookActivity"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "stop download phonebook time is "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1700(Lcom/autochips/bluetooth/BtPhonebookActivity;)J

    move-result-wide v12

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v14}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1800(Lcom/autochips/bluetooth/BtPhonebookActivity;)J

    move-result-wide v14

    sub-long/2addr v12, v14

    const-wide/16 v14, 0x3e8

    div-long/2addr v12, v14

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "s"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 309
    .end local v2    # "iDownloadPath":I
    :cond_a
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    const-string v11, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.startdownload_position"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_c

    .line 310
    const-string v10, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_folder"

    const/16 v11, 0x8

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 312
    .restart local v2    # "iDownloadPath":I
    invoke-static {}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$900()Z

    move-result v10

    if-eqz v10, :cond_b

    const-string v10, "BtPhonebookActivity"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "intent folder->"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    :cond_b
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1100(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v10

    if-ne v2, v10, :cond_2

    .line 316
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const/4 v11, 0x1

    invoke-static {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1002(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)Z

    .line 318
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const-string v11, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_start_position"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    invoke-static {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$502(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I

    .line 321
    new-instance v5, Landroid/os/Message;

    invoke-direct {v5}, Landroid/os/Message;-><init>()V

    .line 322
    .restart local v5    # "message":Landroid/os/Message;
    const/4 v10, 0x4

    iput v10, v5, Landroid/os/Message;->what:I

    .line 323
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/os/Handler;

    move-result-object v10

    invoke-virtual {v10, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 326
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$500(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v10

    if-lez v10, :cond_2

    .line 327
    new-instance v7, Landroid/os/Message;

    invoke-direct {v7}, Landroid/os/Message;-><init>()V

    .line 328
    .local v7, "msg":Landroid/os/Message;
    const/4 v10, 0x1

    iput v10, v7, Landroid/os/Message;->what:I

    .line 329
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$500(Lcom/autochips/bluetooth/BtPhonebookActivity;)I

    move-result v10

    iput v10, v7, Landroid/os/Message;->arg1:I

    .line 330
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/os/Handler;

    move-result-object v10

    invoke-virtual {v10, v7}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 332
    .end local v2    # "iDownloadPath":I
    .end local v5    # "message":Landroid/os/Message;
    .end local v7    # "msg":Landroid/os/Message;
    :cond_c
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    const-string v11, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS_CHANGE"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_f

    .line 333
    const-string v10, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS"

    const/4 v11, -0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 334
    .local v1, "call_status":I
    const/4 v10, 0x1

    if-ne v10, v1, :cond_e

    .line 335
    const/4 v10, 0x1

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1300(Lcom/autochips/bluetooth/BtPhonebookActivity;)Z

    move-result v11

    if-ne v10, v11, :cond_2

    .line 337
    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v10, :cond_d

    .line 338
    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v11, 0x2

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StopDownload(I)Z

    .line 340
    :cond_d
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a006a

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setEnabled(Z)V

    .line 341
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a006b

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setEnabled(Z)V

    .line 342
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a006b

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f020091

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 344
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1200(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/LinearLayout;

    move-result-object v10

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_0

    .line 346
    :cond_e
    if-nez v1, :cond_2

    .line 347
    const/4 v10, 0x1

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1300(Lcom/autochips/bluetooth/BtPhonebookActivity;)Z

    move-result v11

    if-ne v10, v11, :cond_2

    .line 348
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const/4 v11, 0x1

    invoke-static {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1900(Lcom/autochips/bluetooth/BtPhonebookActivity;Z)V

    goto/16 :goto_0

    .line 351
    .end local v1    # "call_status":I
    :cond_f
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    const-string v11, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_10

    .line 352
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v10

    invoke-virtual {v10}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v10

    if-nez v10, :cond_2

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_2

    .line 353
    new-instance v5, Landroid/os/Message;

    invoke-direct {v5}, Landroid/os/Message;-><init>()V

    .line 354
    .restart local v5    # "message":Landroid/os/Message;
    const/4 v10, 0x4

    iput v10, v5, Landroid/os/Message;->what:I

    .line 355
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/os/Handler;

    move-result-object v10

    invoke-virtual {v10, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 357
    .end local v5    # "message":Landroid/os/Message;
    :cond_10
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    const-string v11, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 358
    const-string v10, "android.bluetooth.profilemanager.extra.ATCPROFILE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v8

    check-cast v8, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    .line 359
    .local v8, "profilename":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    if-nez v8, :cond_11

    .line 360
    const-string v10, "BtPhonebookActivity"

    const-string v11, "profilename == null. return."

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 363
    :cond_11
    sget-object v10, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_HF:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v8, v10}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_13

    .line 364
    const-string v10, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/4 v11, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    .line 365
    .local v9, "profilestate":I
    const/4 v10, 0x2

    if-ne v9, v10, :cond_2

    .line 366
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    .line 367
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/EditText;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v12, 0x7f070090

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-virtual {v11, v12, v13}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 368
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$700(Lcom/autochips/bluetooth/BtPhonebookActivity;)Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    move-result-object v10

    invoke-virtual {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 369
    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v10, :cond_12

    .line 370
    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v11, 0x2

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StopDownload(I)Z

    .line 372
    :cond_12
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a006a

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setEnabled(Z)V

    .line 373
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a006b

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setEnabled(Z)V

    .line 374
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v11, 0x7f0a006b

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f020091

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 376
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/autochips/bluetooth/BtPhonebookActivity$2;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$1200(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/LinearLayout;

    move-result-object v10

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_0

    .line 378
    .end local v9    # "profilestate":I
    :cond_13
    sget-object v10, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_PBAP_Client:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v8, v10}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 379
    const-string v10, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/4 v11, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    .line 380
    .restart local v9    # "profilestate":I
    const/4 v10, 0x1

    if-eq v9, v10, :cond_2

    .line 394
    const/4 v10, 0x2

    if-ne v9, v10, :cond_2

    goto/16 :goto_0
.end method
