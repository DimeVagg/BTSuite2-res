.class Lcom/autochips/bluetooth/BtCallHistoryActivity$1;
.super Landroid/os/Handler;
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
    .line 189
    iput-object p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v8, 0x0

    .line 191
    iget v6, p1, Landroid/os/Message;->what:I

    packed-switch v6, :pswitch_data_0

    .line 257
    :cond_0
    :goto_0
    return-void

    .line 194
    :pswitch_0
    sget-boolean v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v6, :cond_0

    .line 197
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v6}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$000(Lcom/autochips/bluetooth/BtCallHistoryActivity;)V

    .line 198
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v6, v8}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)V

    goto :goto_0

    .line 204
    :pswitch_1
    sget-boolean v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v6, :cond_0

    .line 207
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v6}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/16 v7, 0xa

    if-ge v6, v7, :cond_1

    .line 208
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    iget v7, p1, Landroid/os/Message;->arg1:I

    invoke-static {v6, v7}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$300(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    goto :goto_0

    .line 210
    :cond_1
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    iget v7, p1, Landroid/os/Message;->arg1:I

    invoke-static {v6, v7}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$400(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)V

    goto :goto_0

    .line 217
    :pswitch_2
    invoke-static {}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$500()Z

    move-result v6

    if-eqz v6, :cond_2

    const-string v6, "BtCallHistoryActivity"

    const-string v7, "uiHandler MSG_HANDLER_ADDCALL"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    :cond_2
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/content/Intent;

    .line 219
    .local v1, "intent":Landroid/content/Intent;
    const-string v6, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_TYPE"

    invoke-virtual {v1, v6, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 220
    .local v5, "type":I
    const-string v6, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_NAME"

    invoke-virtual {v1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 221
    .local v2, "name":Ljava/lang/String;
    const-string v6, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_NUMBER"

    invoke-virtual {v1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 222
    .local v3, "number":Ljava/lang/String;
    const-string v6, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_TIME"

    invoke-virtual {v1, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 223
    .local v4, "time":Ljava/lang/String;
    const-string v6, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_HASCALLED"

    invoke-virtual {v1, v6, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 224
    .local v0, "hascalled":I
    if-nez v2, :cond_3

    .line 225
    const-string v2, ""

    .line 226
    :cond_3
    if-nez v3, :cond_4

    .line 227
    const-string v3, ""

    .line 228
    :cond_4
    if-nez v0, :cond_5

    .line 229
    const/4 v5, 0x2

    .line 232
    :cond_5
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v6, :cond_6

    .line 233
    sget-object v6, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    invoke-virtual {v6, v5, v2, v3, v4}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->AddCall(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    :cond_6
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v6, v5, v2, v3, v4}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$600(Lcom/autochips/bluetooth/BtCallHistoryActivity;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 241
    .end local v0    # "hascalled":I
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "number":Ljava/lang/String;
    .end local v4    # "time":Ljava/lang/String;
    .end local v5    # "type":I
    :pswitch_3
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v6, v8}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$702(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 242
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v6, v8}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$802(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 243
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v6, v8}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$902(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 244
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v6, v8}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1002(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 245
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v6, v8}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1102(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 246
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    const/4 v7, 0x1

    invoke-static {v6, v7}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1202(Lcom/autochips/bluetooth/BtCallHistoryActivity;I)I

    .line 247
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v6}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 248
    sget-object v6, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mAllCallList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 249
    sget-object v6, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mRecievedList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 250
    sget-object v6, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mDialedList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 251
    sget-object v6, Lcom/autochips/bluetooth/BtCallHistoryActivity;->mMissedList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 252
    iget-object v6, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtCallHistoryActivity;

    invoke-static {v6}, Lcom/autochips/bluetooth/BtCallHistoryActivity;->access$1300(Lcom/autochips/bluetooth/BtCallHistoryActivity;)Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    move-result-object v6

    invoke-virtual {v6}, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0

    .line 191
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
