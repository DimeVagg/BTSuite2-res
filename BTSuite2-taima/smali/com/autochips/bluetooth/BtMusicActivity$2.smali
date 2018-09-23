.class Lcom/autochips/bluetooth/BtMusicActivity$2;
.super Landroid/content/BroadcastReceiver;
.source "BtMusicActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtMusicActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtMusicActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtMusicActivity;)V
    .locals 0

    .prologue
    .line 191
    iput-object p1, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 195
    invoke-static {}, Lcom/autochips/bluetooth/BtMusicActivity;->access$700()Z

    move-result v9

    if-eqz v9, :cond_0

    const-string v9, "BtMusicActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "onReive:action->"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 199
    const-string v9, "android.bluetooth.profilemanager.extra.ATCPROFILE"

    invoke-virtual {p2, v9}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v7

    check-cast v7, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    .line 200
    .local v7, "profilename":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    const-string v9, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/4 v10, 0x2

    invoke-virtual {p2, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    .line 201
    .local v8, "profilestate":I
    invoke-static {}, Lcom/autochips/bluetooth/BtMusicActivity;->access$700()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 202
    const-string v9, "BtMusicActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "profilename:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    const-string v9, "BtMusicActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "profilestate:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    :cond_1
    if-eqz v7, :cond_3

    sget-object v9, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_A2DP_SINK:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v7, v9}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 210
    sparse-switch v8, :sswitch_data_0

    .line 500
    .end local v7    # "profilename":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    .end local v8    # "profilestate":I
    :cond_2
    :goto_0
    return-void

    .line 213
    .restart local v7    # "profilename":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    .restart local v8    # "profilestate":I
    :sswitch_0
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$800(Lcom/autochips/bluetooth/BtMusicActivity;)Landroid/widget/TextView;

    move-result-object v9

    const v10, 0x7f070058

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(I)V

    .line 215
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->getA2dpSinkStateValue()I

    move-result v9

    sput v9, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    .line 216
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$900(Lcom/autochips/bluetooth/BtMusicActivity;B)V

    .line 235
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v9, :cond_2

    sget v9, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    const/4 v10, 0x1

    if-eq v9, v10, :cond_2

    sget v9, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    const/4 v10, 0x3

    if-eq v9, v10, :cond_2

    .line 238
    const-string v9, "BtMusicActivity"

    const-string v10, "connect avrcp"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    .line 241
    .local v0, "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    sget-object v9, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_AVRCP_CT:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v0, v9}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->connect(Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;)V

    goto :goto_0

    .line 247
    .end local v0    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :sswitch_1
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$800(Lcom/autochips/bluetooth/BtMusicActivity;)Landroid/widget/TextView;

    move-result-object v9

    const v10, 0x7f070059

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(I)V

    .line 248
    const/4 v9, 0x2

    sput v9, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    .line 250
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$900(Lcom/autochips/bluetooth/BtMusicActivity;B)V

    .line 270
    sget-object v9, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v9, :cond_2

    sget v9, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    const/4 v10, 0x1

    if-ne v9, v10, :cond_2

    .line 272
    const-string v9, "BtMusicActivity"

    const-string v10, "discconnect avrcp"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-virtual {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    sget-object v10, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    .line 275
    .restart local v0    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    sget-object v9, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_AVRCP_CT:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v0, v9}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->disconnect(Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;)V

    goto :goto_0

    .line 280
    .end local v0    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :sswitch_2
    const/4 v9, 0x3

    sput v9, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    goto :goto_0

    .line 283
    :sswitch_3
    const/4 v9, 0x4

    sput v9, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    goto :goto_0

    .line 287
    :sswitch_4
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$800(Lcom/autochips/bluetooth/BtMusicActivity;)Landroid/widget/TextView;

    move-result-object v9

    const v10, 0x7f070058

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(I)V

    .line 288
    const/16 v9, 0xf

    sput v9, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    .line 290
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x1

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$900(Lcom/autochips/bluetooth/BtMusicActivity;B)V

    goto/16 :goto_0

    .line 301
    :cond_3
    if-eqz v7, :cond_2

    sget-object v9, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_AVRCP_CT:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v7, v9}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 304
    packed-switch v8, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 306
    :pswitch_1
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1000(Lcom/autochips/bluetooth/BtMusicActivity;)Landroid/widget/TextView;

    move-result-object v9

    const v10, 0x7f070062

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(I)V

    .line 307
    const/4 v9, 0x1

    sput v9, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    .line 308
    const-string v9, "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.extra.REMOTE_DEVICE_ADDR"

    invoke-virtual {p2, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    sput-object v9, Lcom/autochips/bluetooth/BtMusicActivity;->mConnectedAvrcpDeviceAddr:Ljava/lang/String;

    .line 312
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1100(Lcom/autochips/bluetooth/BtMusicActivity;)V

    goto/16 :goto_0

    .line 333
    :pswitch_2
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1000(Lcom/autochips/bluetooth/BtMusicActivity;)Landroid/widget/TextView;

    move-result-object v9

    const v10, 0x7f070063

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(I)V

    .line 334
    const/4 v9, 0x2

    sput v9, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    .line 335
    const/4 v9, 0x0

    sput-object v9, Lcom/autochips/bluetooth/BtMusicActivity;->mConnectedAvrcpDeviceAddr:Ljava/lang/String;

    .line 338
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1100(Lcom/autochips/bluetooth/BtMusicActivity;)V

    .line 340
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1200(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v11

    iget-object v12, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1300(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v12

    invoke-static {v9, v10, v11, v12}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1400(Lcom/autochips/bluetooth/BtMusicActivity;BII)V

    .line 342
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    iget-object v10, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1200(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v10

    iget-object v11, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1300(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v11

    const/4 v12, 0x0

    invoke-static {v9, v10, v11, v12}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1500(Lcom/autochips/bluetooth/BtMusicActivity;IIB)V

    .line 343
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const v10, 0x7f0700b1

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1600(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    .line 344
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const v10, 0x7f0700b3

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1700(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    .line 345
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const v10, 0x7f0700b2

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1800(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    goto/16 :goto_0

    .line 367
    :pswitch_3
    const/4 v9, 0x3

    sput v9, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    goto/16 :goto_0

    .line 370
    :pswitch_4
    const/4 v9, 0x4

    sput v9, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    goto/16 :goto_0

    .line 373
    :pswitch_5
    const/16 v9, 0xb

    sput v9, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    goto/16 :goto_0

    .line 376
    :pswitch_6
    const/16 v9, 0xd

    sput v9, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    goto/16 :goto_0

    .line 387
    .end local v7    # "profilename":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    .end local v8    # "profilestate":I
    :cond_4
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.action.ACTION_MEDIA_DATA_UPDATE"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 388
    const-string v9, "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.extra.MEDIA_TITLE"

    invoke-virtual {p2, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 389
    .local v5, "mediaTitle":Ljava/lang/String;
    const-string v9, "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.extra.MEDIA_ARTIST"

    invoke-virtual {p2, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 390
    .local v2, "mediaAritist":Ljava/lang/String;
    const-string v9, "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.extra.MEIDA_ALBUM"

    invoke-virtual {p2, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 392
    .local v1, "mediaAlbum":Ljava/lang/String;
    if-nez v5, :cond_7

    .line 393
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1902(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 394
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const v10, 0x7f0700b1

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1600(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    .line 400
    :cond_5
    :goto_1
    if-nez v2, :cond_8

    .line 401
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2102(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 402
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const v10, 0x7f0700b3

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1700(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    .line 408
    :cond_6
    :goto_2
    if-nez v1, :cond_9

    .line 409
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2302(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 410
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const v10, 0x7f0700b2

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1800(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    goto/16 :goto_0

    .line 395
    :cond_7
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1900(Lcom/autochips/bluetooth/BtMusicActivity;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_5

    .line 396
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9, v5}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1902(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 397
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    iget-object v10, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1900(Lcom/autochips/bluetooth/BtMusicActivity;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2000(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)V

    goto :goto_1

    .line 403
    :cond_8
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2100(Lcom/autochips/bluetooth/BtMusicActivity;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    .line 404
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9, v2}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2102(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 405
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    iget-object v10, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2100(Lcom/autochips/bluetooth/BtMusicActivity;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2200(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)V

    goto :goto_2

    .line 411
    :cond_9
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2300(Lcom/autochips/bluetooth/BtMusicActivity;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 412
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2302(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 413
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    iget-object v10, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2300(Lcom/autochips/bluetooth/BtMusicActivity;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2400(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 418
    .end local v1    # "mediaAlbum":Ljava/lang/String;
    .end local v2    # "mediaAritist":Ljava/lang/String;
    .end local v5    # "mediaTitle":Ljava/lang/String;
    :cond_a
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.action.ACTION_PLAYBACK_DATA_UPDATE"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 419
    const-string v9, "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.extra.MEDIA_LENGTH"

    const/4 v10, 0x0

    invoke-virtual {p2, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 420
    .local v3, "mediaLength":I
    const-string v9, "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.extra.MEDIA_POSITION"

    const/4 v10, 0x0

    invoke-virtual {p2, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 421
    .local v4, "mediaPosition":I
    const-string v9, "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.extra.PLAYBACK_STATUS"

    const/4 v10, 0x0

    invoke-virtual {p2, v9, v10}, Landroid/content/Intent;->getByteExtra(Ljava/lang/String;B)B

    move-result v6

    .line 424
    .local v6, "play_status":B
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$100(Lcom/autochips/bluetooth/BtMusicActivity;)B

    move-result v9

    if-eq v6, v9, :cond_b

    .line 425
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9, v6}, Lcom/autochips/bluetooth/BtMusicActivity;->access$102(Lcom/autochips/bluetooth/BtMusicActivity;B)B

    .line 426
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    iget-object v10, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$100(Lcom/autochips/bluetooth/BtMusicActivity;)B

    move-result v10

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$900(Lcom/autochips/bluetooth/BtMusicActivity;B)V

    .line 429
    :cond_b
    if-nez v3, :cond_c

    .line 430
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2502(Lcom/autochips/bluetooth/BtMusicActivity;I)I

    .line 431
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1200(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v11

    iget-object v12, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1300(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v12

    invoke-static {v9, v10, v11, v12}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1400(Lcom/autochips/bluetooth/BtMusicActivity;BII)V

    .line 432
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    iget-object v10, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1200(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v10

    iget-object v11, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1300(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v11

    const/4 v12, 0x0

    invoke-static {v9, v10, v11, v12}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1500(Lcom/autochips/bluetooth/BtMusicActivity;IIB)V

    goto/16 :goto_0

    .line 433
    :cond_c
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2500(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v9

    if-ne v3, v9, :cond_d

    .line 434
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2600(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v9

    if-eq v4, v9, :cond_2

    .line 436
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9, v4}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2602(Lcom/autochips/bluetooth/BtMusicActivity;I)I

    .line 437
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x2

    iget-object v11, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2500(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v11

    iget-object v12, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2600(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v12

    invoke-static {v9, v10, v11, v12}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1400(Lcom/autochips/bluetooth/BtMusicActivity;BII)V

    .line 438
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    iget-object v10, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2600(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v10

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2700(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    goto/16 :goto_0

    .line 442
    :cond_d
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9, v3}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2502(Lcom/autochips/bluetooth/BtMusicActivity;I)I

    .line 443
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9, v4}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2602(Lcom/autochips/bluetooth/BtMusicActivity;I)I

    .line 444
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2500(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v11

    iget-object v12, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2600(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v12

    invoke-static {v9, v10, v11, v12}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1400(Lcom/autochips/bluetooth/BtMusicActivity;BII)V

    .line 445
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    iget-object v10, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2500(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v10

    iget-object v11, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2600(Lcom/autochips/bluetooth/BtMusicActivity;)I

    move-result v11

    invoke-static {v9, v10, v11, v6}, Lcom/autochips/bluetooth/BtMusicActivity;->access$1500(Lcom/autochips/bluetooth/BtMusicActivity;IIB)V

    goto/16 :goto_0

    .line 449
    .end local v3    # "mediaLength":I
    .end local v4    # "mediaPosition":I
    .end local v6    # "play_status":B
    :cond_e
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "xy.btmusic.stop"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_10

    .line 450
    invoke-static {}, Lcom/autochips/bluetooth/BtMusicActivity;->access$700()Z

    move-result v9

    if-eqz v9, :cond_f

    const-string v9, "BtMusicActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "+ bStoped="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtMusicActivity;->access$000(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 451
    :cond_f
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x1

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$202(Lcom/autochips/bluetooth/BtMusicActivity;Z)Z

    .line 452
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$000(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 453
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x1

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$002(Lcom/autochips/bluetooth/BtMusicActivity;Z)Z

    .line 454
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x2

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$400(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    .line 455
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2800(Lcom/autochips/bluetooth/BtMusicActivity;)V

    goto/16 :goto_0

    .line 458
    :cond_10
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "xy.android.xybtmusic.cbmpause"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_11

    .line 460
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$000(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 461
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x2

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$400(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    .line 462
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x1

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$302(Lcom/autochips/bluetooth/BtMusicActivity;Z)Z

    goto/16 :goto_0

    .line 465
    :cond_11
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "xy.android.avin.leave"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_12

    .line 466
    const-string v9, "BtMusicActivity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "avin.leave bStoped="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtMusicActivity;->access$000(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", bBackcarPause="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/BtMusicActivity;->access$300(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 467
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$000(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v9

    if-nez v9, :cond_2

    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$300(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_2

    .line 468
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x1

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$400(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    .line 469
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$2900(Lcom/autochips/bluetooth/BtMusicActivity;)V

    goto/16 :goto_0

    .line 472
    :cond_12
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "xy.android.previousmedia"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_13

    .line 473
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$000(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 474
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$3000(Lcom/autochips/bluetooth/BtMusicActivity;)V

    goto/16 :goto_0

    .line 477
    :cond_13
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "xy.android.nextmedia"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_14

    .line 478
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$000(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 479
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$3100(Lcom/autochips/bluetooth/BtMusicActivity;)V

    goto/16 :goto_0

    .line 482
    :cond_14
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "xy.android.playpause"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_15

    .line 483
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$000(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 484
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$202(Lcom/autochips/bluetooth/BtMusicActivity;Z)Z

    .line 485
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$400(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    goto/16 :goto_0

    .line 488
    :cond_15
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "xy.android.forceplay"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_16

    .line 489
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$000(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 490
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$202(Lcom/autochips/bluetooth/BtMusicActivity;Z)Z

    .line 491
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x1

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$400(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    goto/16 :goto_0

    .line 494
    :cond_16
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "xy.android.forcepause"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 495
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-static {v9}, Lcom/autochips/bluetooth/BtMusicActivity;->access$000(Lcom/autochips/bluetooth/BtMusicActivity;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 496
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x0

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$202(Lcom/autochips/bluetooth/BtMusicActivity;Z)Z

    .line 497
    iget-object v9, p0, Lcom/autochips/bluetooth/BtMusicActivity$2;->this$0:Lcom/autochips/bluetooth/BtMusicActivity;

    const/4 v10, 0x2

    invoke-static {v9, v10}, Lcom/autochips/bluetooth/BtMusicActivity;->access$400(Lcom/autochips/bluetooth/BtMusicActivity;I)V

    goto/16 :goto_0

    .line 210
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x3 -> :sswitch_2
        0x4 -> :sswitch_3
        0xf -> :sswitch_4
    .end sparse-switch

    .line 304
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_6
    .end packed-switch
.end method
