.class Lcom/autochips/bluetooth/PhoneCallActivity$2;
.super Landroid/content/BroadcastReceiver;
.source "PhoneCallActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/PhoneCallActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mBtCallsetupState:I

.field private mCallState:I

.field final synthetic this$0:Lcom/autochips/bluetooth/PhoneCallActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/PhoneCallActivity;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 685
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 686
    iput v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->mCallState:I

    .line 687
    iput v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->mBtCallsetupState:I

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 690
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v11

    if-eqz v11, :cond_0

    const-string v11, "PhoneCallActivity"

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

    .line 692
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    .line 694
    .local v4, "action":Ljava/lang/String;
    const-string v11, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 695
    const-string v11, "android.bluetooth.device.extra.DEVICE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/bluetooth/BluetoothDevice;

    .line 697
    .local v6, "device":Landroid/bluetooth/BluetoothDevice;
    const-string v11, "android.bluetooth.adapter.extra.STATE"

    const/high16 v12, -0x80000000

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 816
    .end local v6    # "device":Landroid/bluetooth/BluetoothDevice;
    :cond_1
    :goto_0
    return-void

    .line 700
    :cond_2
    const-string v11, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 701
    const-string v11, "android.bluetooth.profilemanager.extra.ATCPROFILE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v8

    check-cast v8, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    .line 702
    .local v8, "profile":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    if-nez v8, :cond_3

    .line 703
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v11

    if-eqz v11, :cond_1

    const-string v11, "PhoneCallActivity"

    const-string v12, "ACTION_PROFILE_STATE_UPDATE,profilename is null"

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 706
    :cond_3
    sget-object v11, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_HF:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v8, v11}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 707
    const-string v11, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    .line 708
    .local v9, "profilestate":I
    const/4 v11, 0x2

    if-ne v9, v11, :cond_5

    .line 710
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v11

    if-eqz v11, :cond_4

    const-string v11, "PhoneCallActivity"

    const-string v12, "hf disconnected,exit phonecall activity "

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 711
    :cond_4
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-virtual {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    iget-object v12, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    const v13, 0x7f070048

    invoke-virtual {v12, v13}, Lcom/autochips/bluetooth/PhoneCallActivity;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    invoke-static {v11, v12, v13}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v11

    invoke-virtual {v11}, Landroid/widget/Toast;->show()V

    .line 714
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$500(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    goto :goto_0

    .line 715
    :cond_5
    const/4 v11, 0x1

    if-ne v9, v11, :cond_1

    .line 716
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v11

    if-eqz v11, :cond_1

    const-string v11, "PhoneCallActivity"

    const-string v12, "hf disconnected,exit phonecall activity "

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 721
    .end local v8    # "profile":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    .end local v9    # "profilestate":I
    :cond_6
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfUtility.action.callStateChange"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_c

    .line 722
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v11

    if-eqz v11, :cond_7

    const-string v11, "PhoneCallActivity"

    const-string v12, "BluetoothHfUtility.ACTION_CALL_STATE_CHANGE"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 723
    :cond_7
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfUtility.extra.callState"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    .line 725
    .local v7, "phoneCallState":I
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v11

    if-eqz v11, :cond_8

    const-string v11, "PhoneCallActivity"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 726
    :cond_8
    const/4 v11, 0x2

    if-ne v7, v11, :cond_a

    .line 727
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    const/4 v12, 0x1

    invoke-static {v11, v12}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$602(Lcom/autochips/bluetooth/PhoneCallActivity;Z)Z

    .line 739
    :cond_9
    :goto_1
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    iput v7, v11, Lcom/autochips/bluetooth/PhoneCallActivity;->phoneCallState_new:I

    goto/16 :goto_0

    .line 728
    :cond_a
    const/4 v11, 0x3

    if-eq v7, v11, :cond_9

    .line 731
    const/4 v11, 0x4

    if-ne v7, v11, :cond_b

    .line 732
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    const/4 v12, 0x1

    invoke-static {v11, v12}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$702(Lcom/autochips/bluetooth/PhoneCallActivity;Z)Z

    .line 733
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    const/4 v12, 0x0

    invoke-static {v11, v12}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$602(Lcom/autochips/bluetooth/PhoneCallActivity;Z)Z

    .line 734
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$800(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    .line 735
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$900(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    goto :goto_1

    .line 737
    :cond_b
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$500(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    goto :goto_1

    .line 767
    .end local v7    # "phoneCallState":I
    :cond_c
    const-string v11, "com.autochips.bluetooth.BluetoothHfService.action.SCO_STATE_CHANGED"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_10

    .line 768
    const-string v11, "com.autochips.bluetooth.BluetoothHfService.extra.EXTRA_NEW_SCO_STATE"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 769
    .local v3, "ScoState":I
    if-nez v3, :cond_e

    .line 770
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v11

    if-eqz v11, :cond_d

    const-string v11, "PhoneCallActivity"

    const-string v12, "bt sco disconnect "

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 771
    :cond_d
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    const/4 v12, 0x1

    invoke-static {v11, v12}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1002(Lcom/autochips/bluetooth/PhoneCallActivity;Z)Z

    .line 776
    :goto_2
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    iget-object v12, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1000(Lcom/autochips/bluetooth/PhoneCallActivity;)Z

    move-result v12

    invoke-static {v11, v12}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1100(Lcom/autochips/bluetooth/PhoneCallActivity;Z)V

    goto/16 :goto_0

    .line 773
    :cond_e
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v11

    if-eqz v11, :cond_f

    const-string v11, "PhoneCallActivity"

    const-string v12, "bt sco connect "

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 774
    :cond_f
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    const/4 v12, 0x0

    invoke-static {v11, v12}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1002(Lcom/autochips/bluetooth/PhoneCallActivity;Z)Z

    goto :goto_2

    .line 777
    .end local v3    # "ScoState":I
    :cond_10
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.PHONE_NUMBER_CHANGED"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_12

    .line 778
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_PHONE_NUMBER"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 779
    .local v10, "remotePhoneNumber":Ljava/lang/String;
    if-eqz v10, :cond_1

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_1

    .line 780
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v11

    if-eqz v11, :cond_11

    const-string v11, "PhoneCallActivity"

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

    .line 781
    :cond_11
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    const/4 v12, 0x0

    invoke-static {v11, v12, v10}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1200(Lcom/autochips/bluetooth/PhoneCallActivity;ZLjava/lang/String;)V

    goto/16 :goto_0

    .line 783
    .end local v10    # "remotePhoneNumber":Ljava/lang/String;
    :cond_12
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.AG_VOLUME_CHANGED"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_13

    .line 784
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_AG_VOLUME"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 785
    .local v2, "AgVolume":I
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v11

    if-eqz v11, :cond_1

    const-string v11, "PhoneCallActivity"

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

    .line 786
    .end local v2    # "AgVolume":I
    :cond_13
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.AG_MIC_GAIN_CHANGED"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_14

    .line 787
    const-string v11, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.EXTRA_NEW_MIC_GAIN"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 788
    .local v1, "AgMicGain":I
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v11

    if-eqz v11, :cond_1

    const-string v11, "PhoneCallActivity"

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

    .line 789
    .end local v1    # "AgMicGain":I
    :cond_14
    const-string v11, "autochips.intent.action.QB_POWEROFF"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_15

    const-string v11, "xy.android.acc.off"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_17

    .line 791
    :cond_15
    invoke-static {}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$300()Z

    move-result v11

    if-eqz v11, :cond_16

    const-string v11, "PhoneCallActivity"

    const-string v12, "BluetoothEventRedirector.ACTION_QB_POWEROFF"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 792
    :cond_16
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$500(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    goto/16 :goto_0

    .line 793
    :cond_17
    const-string v11, "xy.xbtheadset.incomingans"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_19

    .line 794
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$700(Lcom/autochips/bluetooth/PhoneCallActivity;)Z

    move-result v11

    if-nez v11, :cond_18

    .line 795
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$400(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    .line 797
    :cond_18
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1300(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    goto/16 :goto_0

    .line 798
    :cond_19
    const-string v11, "xy.xbtheadset.incomingansorhangup"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1c

    .line 800
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    const v12, 0x7f0a001b

    invoke-virtual {v11, v12}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    .line 801
    .local v5, "answer_btn":Landroid/widget/Button;
    invoke-virtual {v5}, Landroid/widget/Button;->getVisibility()I

    move-result v11

    if-nez v11, :cond_1b

    .line 802
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$700(Lcom/autochips/bluetooth/PhoneCallActivity;)Z

    move-result v11

    if-nez v11, :cond_1a

    .line 803
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$400(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    .line 805
    :cond_1a
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1300(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    goto/16 :goto_0

    .line 808
    :cond_1b
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1400(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    .line 809
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1600(Lcom/autochips/bluetooth/PhoneCallActivity;)Landroid/os/Handler;

    move-result-object v11

    iget-object v12, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1500(Lcom/autochips/bluetooth/PhoneCallActivity;)Ljava/lang/Runnable;

    move-result-object v12

    const-wide/16 v13, 0x3e8

    invoke-virtual {v11, v12, v13, v14}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0

    .line 812
    .end local v5    # "answer_btn":Landroid/widget/Button;
    :cond_1c
    const-string v11, "xy.xbtheadset.incomingreject"

    invoke-virtual {v4, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 813
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1400(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    .line 814
    iget-object v11, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v11}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1600(Lcom/autochips/bluetooth/PhoneCallActivity;)Landroid/os/Handler;

    move-result-object v11

    iget-object v12, p0, Lcom/autochips/bluetooth/PhoneCallActivity$2;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-static {v12}, Lcom/autochips/bluetooth/PhoneCallActivity;->access$1500(Lcom/autochips/bluetooth/PhoneCallActivity;)Ljava/lang/Runnable;

    move-result-object v12

    const-wide/16 v13, 0x3e8

    invoke-virtual {v11, v12, v13, v14}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_0
.end method
