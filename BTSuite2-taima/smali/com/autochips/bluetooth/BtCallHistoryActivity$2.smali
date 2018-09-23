.class Lcom/autochips/bluetooth/BtCallHistoryActivity$2;
.super Landroid/content/BroadcastReceiver;
.source "BtCallHistoryActivity.java"


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
    .line 260
    iput-object p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 263
    invoke-static {}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$500()Z

    move-result v9

    if-eqz v9, :cond_0

    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "onReceive intent->"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_finish"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 266
    const-string v9, "RECEIVER"

    const-string v10, "================ACTION_DOWNLOAD_FINISH==============="

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    const-string v9, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_folder"

    const/16 v10, 0x8

    move-object/from16 v0, p2

    invoke-virtual {v0, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 269
    .local v2, "iDownloadPath":I
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const-string v10, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_support_folder"

    const/4 v11, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v10

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1402(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)Z

    .line 272
    invoke-static {}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$500()Z

    move-result v9

    if-eqz v9, :cond_1

    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "intent folder->"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " Support Flag = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1400(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 274
    :cond_1
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v9

    if-eq v2, v9, :cond_3

    .line 498
    .end local v2    # "iDownloadPath":I
    :cond_2
    :goto_0
    return-void

    .line 278
    .restart local v2    # "iDownloadPath":I
    :cond_3
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1602(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)Z

    .line 279
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x1

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1702(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)Z

    .line 280
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1800(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V

    .line 281
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1400(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Z

    move-result v9

    if-nez v9, :cond_4

    .line 282
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 283
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2000(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 284
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2100(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 285
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 286
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 287
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 288
    .local v4, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v9, "item_history_name"

    iget-object v10, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const v11, 0x7f070093

    invoke-virtual {v10, v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    const-string v9, "item_history_number"

    const-string v10, ""

    invoke-virtual {v4, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    const-string v9, "item_history_time"

    const-string v10, ""

    invoke-virtual {v4, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 293
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    move-result-object v9

    invoke-virtual {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 297
    .end local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_1
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 298
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2400(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 299
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 300
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    iget-object v10, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-virtual {v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f020085

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 303
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2600(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/LinearLayout;

    move-result-object v9

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 304
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {v9, v10, v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2702(Lcom/autochips/bluetooth/BtCallHistoryActivity;J)J

    .line 305
    invoke-static {}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$500()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 306
    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "download call history time is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2700(Lcom/autochips/bluetooth/BtCallHistoryActivity;)J

    move-result-wide v11

    iget-object v13, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2800(Lcom/autochips/bluetooth/BtCallHistoryActivity;)J

    move-result-wide v13

    sub-long/2addr v11, v13

    const-wide/16 v13, 0x3e8

    div-long/2addr v11, v13

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "s"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 295
    :cond_4
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)V

    goto/16 :goto_1

    .line 327
    .end local v2    # "iDownloadPath":I
    :cond_5
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_onestep"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 328
    const-string v9, "RECEIVER"

    const-string v10, "================ACTION_DOWNLOAD_ONESTEP==============="

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    const-string v9, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_folder"

    const/16 v10, 0x8

    move-object/from16 v0, p2

    invoke-virtual {v0, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 331
    .restart local v2    # "iDownloadPath":I
    invoke-static {}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$500()Z

    move-result v9

    if-eqz v9, :cond_6

    .line 332
    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "intent folder->"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    :cond_6
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v9

    if-ne v2, v9, :cond_2

    .line 339
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x1

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1402(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)Z

    .line 341
    const-string v9, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_onestep_count"

    const/4 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 344
    .local v3, "iOneStepCount":I
    new-instance v5, Landroid/os/Message;

    invoke-direct {v5}, Landroid/os/Message;-><init>()V

    .line 345
    .local v5, "message":Landroid/os/Message;
    const/4 v9, 0x1

    iput v9, v5, Landroid/os/Message;->what:I

    .line 346
    iput v3, v5, Landroid/os/Message;->arg1:I

    .line 347
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/os/Handler;

    move-result-object v9

    invoke-virtual {v9, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 348
    .end local v2    # "iDownloadPath":I
    .end local v3    # "iOneStepCount":I
    .end local v5    # "message":Landroid/os/Message;
    :cond_7
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.download_stop"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 349
    const-string v9, "RECEIVER"

    const-string v10, "================ACTION_DOWNLOAD_STOP==============="

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    const-string v9, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_folder"

    const/16 v10, 0x8

    move-object/from16 v0, p2

    invoke-virtual {v0, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 352
    .restart local v2    # "iDownloadPath":I
    invoke-static {}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$500()Z

    move-result v9

    if-eqz v9, :cond_8

    .line 353
    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "intent folder->"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    :cond_8
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v9

    if-eq v2, v9, :cond_9

    const/16 v9, 0x8

    if-eq v2, v9, :cond_9

    sget-boolean v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    const/4 v10, 0x1

    if-eq v9, v10, :cond_2

    .line 362
    :cond_9
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x1

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1402(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)Z

    .line 364
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)V

    .line 365
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2400(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 366
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 367
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 368
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    iget-object v10, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-virtual {v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0200ba

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 372
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1602(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)Z

    .line 373
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2600(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/LinearLayout;

    move-result-object v9

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 374
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {v9, v10, v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2702(Lcom/autochips/bluetooth/BtCallHistoryActivity;J)J

    .line 375
    invoke-static {}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$500()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 376
    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "stop download phonebook time is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2700(Lcom/autochips/bluetooth/BtCallHistoryActivity;)J

    move-result-wide v11

    iget-object v13, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2800(Lcom/autochips/bluetooth/BtCallHistoryActivity;)J

    move-result-wide v13

    sub-long/2addr v11, v13

    const-wide/16 v13, 0x3e8

    div-long/2addr v11, v13

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "s"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 379
    .end local v2    # "iDownloadPath":I
    :cond_a
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.action.startdownload_position"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c

    .line 381
    const-string v9, "RECEIVER"

    const-string v10, "================ACTION_STARTDOWNLOAD_POSITION==============="

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    const-string v9, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_folder"

    const/16 v10, 0x8

    move-object/from16 v0, p2

    invoke-virtual {v0, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 384
    .restart local v2    # "iDownloadPath":I
    invoke-static {}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$500()Z

    move-result v9

    if-eqz v9, :cond_b

    .line 385
    const-string v9, "BtCallHistoryActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "intent folder->"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 388
    :cond_b
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v9

    if-ne v2, v9, :cond_2

    .line 392
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x1

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1402(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)Z

    .line 394
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const-string v10, "com.autochips.bluetooth.PbSyncManager.PbSyncManagerService.extra.pbsync_start_position"

    const/4 v11, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v10, v11}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v10

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$802(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 397
    new-instance v5, Landroid/os/Message;

    invoke-direct {v5}, Landroid/os/Message;-><init>()V

    .line 398
    .restart local v5    # "message":Landroid/os/Message;
    const/4 v9, 0x4

    iput v9, v5, Landroid/os/Message;->what:I

    .line 399
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/os/Handler;

    move-result-object v9

    invoke-virtual {v9, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 402
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$800(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v9

    if-lez v9, :cond_2

    .line 403
    new-instance v6, Landroid/os/Message;

    invoke-direct {v6}, Landroid/os/Message;-><init>()V

    .line 404
    .local v6, "msg":Landroid/os/Message;
    const/4 v9, 0x1

    iput v9, v6, Landroid/os/Message;->what:I

    .line 405
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$800(Lcom/autochips/bluetooth/BtCallHistoryActivity;)I

    move-result v9

    iput v9, v6, Landroid/os/Message;->arg1:I

    .line 406
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/os/Handler;

    move-result-object v9

    invoke-virtual {v9, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 408
    .end local v2    # "iDownloadPath":I
    .end local v5    # "message":Landroid/os/Message;
    .end local v6    # "msg":Landroid/os/Message;
    :cond_c
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS_CHANGE"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_f

    .line 410
    const-string v9, "RECEIVER"

    const-string v10, "================ACTION_BLUETOOTH_CALL_STATUS_CHANGE==============="

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 411
    const-string v9, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS"

    const/4 v10, -0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 413
    .local v1, "call_status":I
    const/4 v9, 0x1

    if-ne v9, v1, :cond_e

    .line 414
    const/4 v9, 0x1

    iget-object v10, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1600(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Z

    move-result v10

    if-ne v9, v10, :cond_2

    .line 416
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v9, :cond_d

    .line 417
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v10, 0x6

    invoke-virtual {v9, v10}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StopDownload(I)Z

    .line 421
    :cond_d
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2600(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/LinearLayout;

    move-result-object v9

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_0

    .line 424
    :cond_e
    if-nez v1, :cond_2

    .line 425
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1700(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 426
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$3000(Lcom/autochips/bluetooth/BtCallHistoryActivity;Z)V

    goto/16 :goto_0

    .line 431
    .end local v1    # "call_status":I
    :cond_f
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_11

    .line 432
    const-string v9, "RECEIVER"

    const-string v10, "================ACTION_STATE_CHANGED==============="

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v9

    invoke-virtual {v9}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v9

    if-nez v9, :cond_10

    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_10

    .line 434
    new-instance v5, Landroid/os/Message;

    invoke-direct {v5}, Landroid/os/Message;-><init>()V

    .line 435
    .restart local v5    # "message":Landroid/os/Message;
    const/4 v9, 0x4

    iput v9, v5, Landroid/os/Message;->what:I

    .line 436
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/os/Handler;

    move-result-object v9

    invoke-virtual {v9, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 439
    .end local v5    # "message":Landroid/os/Message;
    :cond_10
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 440
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2000(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 441
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2100(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 442
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    goto/16 :goto_0

    .line 443
    :cond_11
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_15

    .line 445
    const-string v9, "RECEIVER"

    const-string v10, "================ACTION_PROFILE_STATE_UPDATE==============="

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    const-string v9, "android.bluetooth.profilemanager.extra.ATCPROFILE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v7

    check-cast v7, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    .line 448
    .local v7, "profilename":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    if-nez v7, :cond_12

    .line 449
    const-string v9, "BtCallHistoryActivity"

    const-string v10, "profilename == null. return."

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 452
    :cond_12
    sget-object v9, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_HF:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v7, v9}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 453
    const-string v9, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/4 v10, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    .line 456
    .local v8, "profilestate":I
    const/4 v9, 0x2

    if-ne v8, v9, :cond_14

    .line 457
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 458
    sget-object v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllCallList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 459
    sget-object v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mRecievedList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 460
    sget-object v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 461
    sget-object v9, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedList:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 462
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x1

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1202(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 463
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$702(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 464
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$902(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 465
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1002(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 466
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1102(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 467
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    move-result-object v9

    invoke-virtual {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 468
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v9, :cond_13

    .line 469
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/4 v10, 0x6

    invoke-virtual {v9, v10}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StopDownload(I)Z

    .line 473
    :cond_13
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2400(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 474
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 475
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2500(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    iget-object v10, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-virtual {v10}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f020085

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 477
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 478
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2000(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 479
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2100(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 480
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 481
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2600(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/LinearLayout;

    move-result-object v9

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_0

    .line 482
    :cond_14
    const/4 v9, 0x1

    if-ne v8, v9, :cond_2

    .line 483
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 484
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2000(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 485
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2100(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 486
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/widget/Button;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Button;->setEnabled(Z)V

    goto/16 :goto_0

    .line 489
    .end local v7    # "profilename":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    .end local v8    # "profilestate":I
    :cond_15
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_NEW_CALL"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 490
    const-string v9, "RECEIVER"

    const-string v10, "================ACTION_BLUETOOTH_NEW_CALL==============="

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1700(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 492
    new-instance v5, Landroid/os/Message;

    invoke-direct {v5}, Landroid/os/Message;-><init>()V

    .line 493
    .restart local v5    # "message":Landroid/os/Message;
    const/4 v9, 0x3

    iput v9, v5, Landroid/os/Message;->what:I

    .line 494
    move-object/from16 v0, p2

    iput-object v0, v5, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 495
    iget-object v9, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$2;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$2900(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Landroid/os/Handler;

    move-result-object v9

    invoke-virtual {v9, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0
.end method
