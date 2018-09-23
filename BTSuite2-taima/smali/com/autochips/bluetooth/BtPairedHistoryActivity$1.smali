.class Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "BtPairedHistoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtPairedHistoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V
    .locals 0

    .prologue
    .line 162
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 165
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v12

    .line 166
    .local v12, "recievedAction":Ljava/lang/String;
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v13

    if-eqz v13, :cond_0

    const-string v13, "BtPairedHistoryActivity"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "onRecieve:action->"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    :cond_0
    const-string v13, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 169
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v14}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v14

    invoke-virtual {v14}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothState()I

    move-result v14

    invoke-static {v13, v14}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V

    .line 296
    :cond_1
    :goto_0
    return-void

    .line 170
    :cond_2
    const-string v13, "android.bluetooth.adapter.action.DISCOVERY_STARTED"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 171
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$300(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Landroid/widget/LinearLayout;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0

    .line 172
    :cond_3
    const-string v13, "android.bluetooth.adapter.action.DISCOVERY_FINISHED"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 173
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$300(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Landroid/widget/LinearLayout;

    move-result-object v13

    const/16 v14, 0x8

    invoke-virtual {v13, v14}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0

    .line 174
    :cond_4
    const-string v13, "android.bluetooth.adapter.action.SCAN_MODE_CHANGED"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 175
    const-string v13, "android.bluetooth.adapter.extra.SCAN_MODE"

    const/high16 v14, -0x80000000

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    .line 177
    .local v9, "mode":I
    const/high16 v13, -0x80000000

    if-eq v9, v13, :cond_1

    .line 178
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13, v9}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$400(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V

    goto :goto_0

    .line 180
    .end local v9    # "mode":I
    :cond_5
    const-string v13, "android.bluetooth.device.action.BOND_STATE_CHANGED"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 181
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    move-object/from16 v0, p2

    invoke-static {v13, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$500(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Landroid/content/Intent;)V

    goto :goto_0

    .line 182
    :cond_6
    const-string v13, "xy.android.bt.unpair.success"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_7

    .line 183
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    move-object/from16 v0, p2

    invoke-static {v13, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$600(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Landroid/content/Intent;)V

    goto :goto_0

    .line 184
    :cond_7
    const-string v13, "xy.com.autochips.bluetooth.bt.statuscheck"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8

    .line 185
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$700(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    goto :goto_0

    .line 186
    :cond_8
    const-string v13, "xy.android.acc.off"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 187
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    const/4 v14, 0x0

    invoke-static {v13, v14}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$800(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V

    .line 188
    const/4 v13, 0x1

    sput-boolean v13, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->bAccoff:Z

    .line 189
    const/4 v13, 0x0

    sput-boolean v13, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldPbWhenConnect:Z

    .line 190
    const/4 v13, 0x0

    sput-boolean v13, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mNeedDldClyWhenConnect:Z

    .line 191
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    const/4 v14, 0x1

    invoke-static {v13, v14}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$900(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V

    goto/16 :goto_0

    .line 192
    :cond_9
    const-string v13, "xy.android.acc.on"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_c

    .line 193
    const/4 v13, 0x0

    sput-boolean v13, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->bAccoff:Z

    .line 194
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-virtual {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    const-string v14, "xy_bt_powered"

    const/4 v15, 0x1

    invoke-static {v13, v14, v15}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 195
    .local v2, "bpowered":I
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v13

    if-eqz v13, :cond_a

    const-string v13, "BtPairedHistoryActivity"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "bpowered = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    :cond_a
    if-eqz v2, :cond_b

    .line 197
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v13

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Lcom/autochips/bluetooth/LocalBluetoothManager;->setBluetoothEnabled(Z)V

    goto/16 :goto_0

    .line 200
    :cond_b
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Lcom/autochips/bluetooth/LocalBluetoothManager;->setBluetoothEnabled(Z)V

    .line 201
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    const/4 v14, -0x1

    invoke-static {v13, v14}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$200(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V

    goto/16 :goto_0

    .line 203
    .end local v2    # "bpowered":I
    :cond_c
    const-string v13, "android.bluetooth.device.action.PAIRING_REQUEST"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_d

    .line 204
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    move-object/from16 v0, p2

    invoke-static {v13, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1000(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 205
    :cond_d
    const-string v13, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_15

    .line 207
    const-string v13, "android.bluetooth.profilemanager.extra.ATCPROFILE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v10

    check-cast v10, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    .line 209
    .local v10, "profilename":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    if-eqz v10, :cond_1

    .line 210
    sget-object v13, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_HF:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v10, v13}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_e

    .line 211
    const-string v13, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/4 v14, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    .line 212
    .local v11, "profilestate":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    move-object/from16 v0, p2

    invoke-static {v13, v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;Landroid/content/Intent;)V

    .line 213
    const/4 v13, 0x1

    if-ne v11, v13, :cond_1

    .line 214
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v13

    if-eqz v13, :cond_1

    const-string v13, "BtPairedHistoryActivity"

    const-string v14, "hf connected"

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 216
    .end local v11    # "profilestate":I
    :cond_e
    sget-object v13, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_A2DP_SINK:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v10, v13}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_11

    .line 218
    const-string v13, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/4 v14, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    .line 219
    .restart local v11    # "profilestate":I
    const/4 v13, 0x1

    if-ne v11, v13, :cond_f

    .line 220
    const/4 v13, 0x1

    sput v13, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mA2dpState:I

    .line 221
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v13

    if-eqz v13, :cond_1

    const-string v13, "BtPairedHistoryActivity"

    const-string v14, "a2dp connected"

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 223
    :cond_f
    const/4 v13, 0x2

    if-ne v11, v13, :cond_10

    .line 224
    const/4 v13, 0x2

    sput v13, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mA2dpState:I

    .line 226
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v13

    if-eqz v13, :cond_1

    const-string v13, "BtPairedHistoryActivity"

    const-string v14, "a2dp disconnected"

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 227
    :cond_10
    const/16 v13, 0xf

    if-ne v11, v13, :cond_1

    .line 228
    const/16 v13, 0xf

    sput v13, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mA2dpState:I

    .line 229
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v13

    if-eqz v13, :cond_1

    const-string v13, "BtPairedHistoryActivity"

    const-string v14, "a2dp playing "

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 231
    .end local v11    # "profilestate":I
    :cond_11
    sget-object v13, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_AVRCP_CT:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v10, v13}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 233
    const-string v13, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/4 v14, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    .line 234
    .restart local v11    # "profilestate":I
    const/4 v13, 0x1

    if-ne v11, v13, :cond_12

    .line 235
    const/4 v13, 0x1

    sput v13, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mAvrcpState:I

    .line 236
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v13

    if-eqz v13, :cond_1

    const-string v13, "BtPairedHistoryActivity"

    const-string v14, "avrcp connected"

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 237
    :cond_12
    const/4 v13, 0x2

    if-ne v11, v13, :cond_13

    .line 238
    const/4 v13, 0x2

    sput v13, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mAvrcpState:I

    .line 239
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v13

    if-eqz v13, :cond_1

    const-string v13, "BtPairedHistoryActivity"

    const-string v14, "avrcp disconnected"

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 240
    :cond_13
    const/16 v13, 0xb

    if-eq v11, v13, :cond_14

    const/16 v13, 0xd

    if-ne v11, v13, :cond_1

    .line 242
    :cond_14
    sput v11, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mAvrcpState:I

    goto/16 :goto_0

    .line 245
    .end local v10    # "profilename":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    .end local v11    # "profilestate":I
    :cond_15
    const-string v13, "android.bluetooth.device.action.FOUND"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1a

    .line 246
    const-string v13, "android.bluetooth.device.extra.DEVICE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/bluetooth/BluetoothDevice;

    .line 247
    .local v6, "device":Landroid/bluetooth/BluetoothDevice;
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v13

    if-eqz v13, :cond_16

    const-string v13, "BtPairedHistoryActivity"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " found "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :cond_16
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1200(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ge v7, v13, :cond_18

    .line 251
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1200(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/HashMap;

    const-string v14, "remote_device_macaddr"

    invoke-virtual {v13, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 252
    .local v1, "addr":Ljava/lang/String;
    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_17

    .line 253
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1200(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/HashMap;

    const-string v14, "remote_device_name"

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v14, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1300(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    move-result-object v13

    invoke-virtual {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0

    .line 250
    :cond_17
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 258
    .end local v1    # "addr":Ljava/lang/String;
    :cond_18
    const/4 v7, 0x0

    :goto_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1400(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ge v7, v13, :cond_19

    .line 260
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1400(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/HashMap;

    const-string v14, "remote_device_macaddr"

    invoke-virtual {v13, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 261
    .restart local v1    # "addr":Ljava/lang/String;
    const-string v13, "BtPairedHistoryActivity"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " found "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 258
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 268
    .end local v1    # "addr":Ljava/lang/String;
    :cond_19
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 269
    .local v8, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v13, "remote_device_name"

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v8, v13, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    const-string v13, "remote_connect_status"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-virtual {v14}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f070014

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v8, v13, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    const-string v13, "remote_device_macaddr"

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v8, v13, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1200(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 274
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1500(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/Set;

    move-result-object v13

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 275
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1300(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    move-result-object v13

    invoke-virtual {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto/16 :goto_0

    .line 277
    .end local v6    # "device":Landroid/bluetooth/BluetoothDevice;
    .end local v7    # "i":I
    .end local v8    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1a
    const-string v13, "android.bluetooth.device.action.NAME_CHANGED"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 278
    const-string v13, "android.bluetooth.device.extra.DEVICE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/bluetooth/BluetoothDevice;

    .line 279
    .restart local v6    # "device":Landroid/bluetooth/BluetoothDevice;
    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    .line 280
    .local v5, "current_bt_addr":Ljava/lang/String;
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v13

    if-eqz v13, :cond_1b

    const-string v13, "BtPairedHistoryActivity"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " device name changed,the new name is "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    :cond_1b
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1500(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/Set;

    move-result-object v13

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1d

    .line 284
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1200(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ge v7, v13, :cond_1

    .line 285
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1200(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Ljava/util/ArrayList;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 286
    .local v4, "bt_map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v13, "remote_device_macaddr"

    invoke-virtual {v4, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 287
    .local v3, "bt_addr":Ljava/lang/String;
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1c

    .line 288
    const-string v13, "remote_device_name"

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v13, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$1;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$1300(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    move-result-object v13

    invoke-virtual {v13}, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;->notifyDataSetChanged()V

    .line 284
    :cond_1c
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 293
    .end local v3    # "bt_addr":Ljava/lang/String;
    .end local v4    # "bt_map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v7    # "i":I
    :cond_1d
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v13

    if-eqz v13, :cond_1

    const-string v13, "BtPairedHistoryActivity"

    const-string v14, "ACTION_FOUND,it is a paired device"

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method
