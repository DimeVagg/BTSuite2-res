.class Lcom/autochips/bluetooth/PhoneCallYkActivity$3;
.super Landroid/content/BroadcastReceiver;
.source "PhoneCallYkActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/PhoneCallYkActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mBtCallsetupState:I

.field private mCallState:I

.field final synthetic this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 745
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 746
    iput v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->mCallState:I

    .line 747
    iput v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->mBtCallsetupState:I

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 750
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v11

    if-eqz v11, :cond_0

    const-string v11, "PhoneCallYkActivity"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Intent Received "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 752
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    .line 754
    .local v4, "action":Ljava/lang/String;
    const-string v11, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 755
    const-string v11, "android.bluetooth.device.extra.DEVICE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/bluetooth/BluetoothDevice;

    .line 757
    .local v6, "device":Landroid/bluetooth/BluetoothDevice;
    const-string v11, "android.bluetooth.adapter.extra.STATE"

    const/high16 v12, -0x80000000

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 875
    .end local v6    # "device":Landroid/bluetooth/BluetoothDevice;
    :cond_1
    :goto_0
    return-void

    .line 760
    :cond_2
    const-string v11, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 761
    const-string v11, "android.bluetooth.profilemanager.extra.ATCPROFILE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v8

    check-cast v8, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    .line 762
    .local v8, "profile":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    if-nez v8, :cond_3

    .line 763
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v11

    if-eqz v11, :cond_1

    const-string v11, "PhoneCallYkActivity"

    const-string v12, "ACTION_PROFILE_STATE_UPDATE,profilename is null"

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 766
    :cond_3
    sget-object v11, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_HF:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v8, v11}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 767
    const-string v11, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    .line 768
    .local v9, "profilestate":I
    const/4 v11, 0x2

    if-ne v9, v11, :cond_5

    .line 770
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v11

    if-eqz v11, :cond_4

    const-string v11, "PhoneCallYkActivity"

    const-string v12, "hf disconnected,exit phonecall activity "

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 771
    :cond_4
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    iget-object v12, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    const v13, 0x7f070048

    invoke-virtual {v12, v13}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-static {v11, v12, v13}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v11

    invoke-virtual {v11}, Landroid/widget/Toast;->show()V

    .line 774
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$800(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    goto :goto_0

    .line 775
    :cond_5
    const/4 v11, 0x1

    if-ne v9, v11, :cond_1

    .line 776
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v11

    if-eqz v11, :cond_1

    const-string v11, "PhoneCallYkActivity"

    const-string v12, "hf disconnected,exit phonecall activity "

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 781
    .end local v8    # "profile":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    .end local v9    # "profilestate":I
    :cond_6
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfUtility.action.callStateChange"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_b

    .line 782
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v11

    if-eqz v11, :cond_7

    const-string v11, "PhoneCallYkActivity"

    const-string v12, "BluetoothHfUtility.ACTION_CALL_STATE_CHANGE"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 783
    :cond_7
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfUtility.extra.callState"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    .line 785
    .local v7, "phoneCallState":I
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v11

    if-eqz v11, :cond_8

    const-string v11, "PhoneCallYkActivity"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 786
    :cond_8
    const/4 v11, 0x2

    if-ne v7, v11, :cond_9

    .line 787
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    const/4 v12, 0x1

    invoke-static {v11, v12}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$902(Lcom/autochips/bluetooth/PhoneCallYkActivity;Z)Z

    goto/16 :goto_0

    .line 788
    :cond_9
    const/4 v11, 0x3

    if-eq v7, v11, :cond_1

    .line 791
    const/4 v11, 0x4

    if-ne v7, v11, :cond_a

    .line 792
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    const/4 v12, 0x1

    invoke-static {v11, v12}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1002(Lcom/autochips/bluetooth/PhoneCallYkActivity;Z)Z

    .line 793
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    const/4 v12, 0x0

    invoke-static {v11, v12}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$902(Lcom/autochips/bluetooth/PhoneCallYkActivity;Z)Z

    .line 794
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1100(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    .line 795
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1200(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    goto/16 :goto_0

    .line 797
    :cond_a
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$800(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    goto/16 :goto_0

    .line 826
    .end local v7    # "phoneCallState":I
    :cond_b
    const-string v11, "com.autochips.bluetooth.BluetoothHfService.action.SCO_STATE_CHANGED"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_f

    .line 827
    const-string v11, "com.autochips.bluetooth.BluetoothHfService.extra.EXTRA_NEW_SCO_STATE"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 828
    .local v3, "ScoState":I
    if-nez v3, :cond_d

    .line 829
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v11

    if-eqz v11, :cond_c

    const-string v11, "PhoneCallYkActivity"

    const-string v12, "bt sco disconnect "

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 830
    :cond_c
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    const/4 v12, 0x1

    invoke-static {v11, v12}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1302(Lcom/autochips/bluetooth/PhoneCallYkActivity;Z)Z

    .line 835
    :goto_1
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    iget-object v12, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1300(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Z

    move-result v12

    invoke-static {v11, v12}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1400(Lcom/autochips/bluetooth/PhoneCallYkActivity;Z)V

    goto/16 :goto_0

    .line 832
    :cond_d
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v11

    if-eqz v11, :cond_e

    const-string v11, "PhoneCallYkActivity"

    const-string v12, "bt sco connect "

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 833
    :cond_e
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    const/4 v12, 0x0

    invoke-static {v11, v12}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1302(Lcom/autochips/bluetooth/PhoneCallYkActivity;Z)Z

    goto :goto_1

    .line 836
    .end local v3    # "ScoState":I
    :cond_f
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.PHONE_NUMBER_CHANGED"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_11

    .line 837
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_PHONE_NUMBER"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 838
    .local v10, "remotePhoneNumber":Ljava/lang/String;
    if-eqz v10, :cond_1

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_1

    .line 839
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v11

    if-eqz v11, :cond_10

    const-string v11, "PhoneCallYkActivity"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "updatePhoneNumberDisplay "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 840
    :cond_10
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    const/4 v12, 0x0

    invoke-static {v11, v12, v10}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1500(Lcom/autochips/bluetooth/PhoneCallYkActivity;ZLjava/lang/String;)V

    goto/16 :goto_0

    .line 842
    .end local v10    # "remotePhoneNumber":Ljava/lang/String;
    :cond_11
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.AG_VOLUME_CHANGED"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_12

    .line 843
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_AG_VOLUME"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 844
    .local v2, "AgVolume":I
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v11

    if-eqz v11, :cond_1

    const-string v11, "PhoneCallYkActivity"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "NEW_AG_VOLUME "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 845
    .end local v2    # "AgVolume":I
    :cond_12
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.AG_MIC_GAIN_CHANGED"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_13

    .line 846
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_MIC_GAIN"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 847
    .local v1, "AgMicGain":I
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v11

    if-eqz v11, :cond_1

    const-string v11, "PhoneCallYkActivity"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "NEW_AG_MIC_GAIN "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 848
    .end local v1    # "AgMicGain":I
    :cond_13
    const-string v11, "autochips.intent.action.QB_POWEROFF"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_14

    const-string v11, "xy.android.acc.off"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_16

    .line 850
    :cond_14
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$600()Z

    move-result v11

    if-eqz v11, :cond_15

    const-string v11, "PhoneCallYkActivity"

    const-string v12, "BluetoothEventRedirector.ACTION_QB_POWEROFF"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 851
    :cond_15
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$800(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    goto/16 :goto_0

    .line 852
    :cond_16
    const-string v11, "xy.xbtheadset.incomingans"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_18

    .line 853
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1000(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Z

    move-result v11

    if-nez v11, :cond_17

    .line 854
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$700(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    .line 856
    :cond_17
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1600(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    goto/16 :goto_0

    .line 857
    :cond_18
    const-string v11, "xy.xbtheadset.incomingansorhangup"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1b

    .line 859
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    const v12, 0x7f0a001b

    invoke-virtual {v11, v12}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    .line 860
    .local v5, "answer_btn":Landroid/widget/Button;
    invoke-virtual {v5}, Landroid/widget/Button;->getVisibility()I

    move-result v11

    if-nez v11, :cond_1a

    .line 861
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1000(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Z

    move-result v11

    if-nez v11, :cond_19

    .line 862
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$700(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    .line 864
    :cond_19
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$1600(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    goto/16 :goto_0

    .line 867
    :cond_1a
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$100(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    .line 868
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$300(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Landroid/os/Handler;

    move-result-object v11

    iget-object v12, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$200(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Ljava/lang/Runnable;

    move-result-object v12

    const-wide/16 v13, 0x3e8

    invoke-virtual {v11, v12, v13, v14}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    .line 871
    .end local v5    # "answer_btn":Landroid/widget/Button;
    :cond_1b
    const-string v11, "xy.xbtheadset.incomingreject"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 872
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$100(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    .line 873
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$300(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Landroid/os/Handler;

    move-result-object v11

    iget-object v12, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallYkActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->access$200(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Ljava/lang/Runnable;

    move-result-object v12

    const-wide/16 v13, 0x3e8

    invoke-virtual {v11, v12, v13, v14}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0
.end method
