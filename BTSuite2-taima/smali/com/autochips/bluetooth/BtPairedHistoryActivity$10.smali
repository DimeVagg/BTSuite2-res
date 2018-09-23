.class Lcom/autochips/bluetooth/BtPairedHistoryActivity$10;
.super Ljava/util/TimerTask;
.source "BtPairedHistoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/BtPairedHistoryActivity;->startBTSettingTimer(I)V
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
    .line 1857
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$10;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/16 v6, 0x7d0

    const/4 v5, 0x3

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1860
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3200()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 1916
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "BtPairedHistoryActivity"

    const-string v2, "timeout, force power off bluetooth"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1917
    :cond_0
    sget v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mA2dpState:I

    if-eq v3, v1, :cond_1

    sget v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mAvrcpState:I

    if-ne v3, v1, :cond_2

    :cond_1
    sget-object v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v1, :cond_2

    .line 1920
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$10;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    .line 1922
    .local v0, "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    sget-object v1, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_A2DP_SINK:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v0, v1}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->disconnect(Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;)V

    .line 1923
    sget-object v1, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_AVRCP_CT:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v0, v1}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->disconnect(Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;)V

    .line 1925
    .end local v0    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :cond_2
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$10;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/autochips/bluetooth/LocalBluetoothManager;->setBluetoothEnabled(Z)V

    .line 1926
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$10;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v1, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V

    .line 1927
    invoke-static {v4}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3202(I)I

    .line 1928
    invoke-static {v4}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3302(I)I

    .line 1932
    :goto_0
    const/16 v1, 0x12c

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3312(I)I

    .line 1933
    return-void

    .line 1862
    :pswitch_0
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3300()I

    move-result v1

    if-le v1, v6, :cond_3

    .line 1863
    invoke-static {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3202(I)I

    goto :goto_0

    .line 1866
    :cond_3
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v1, :cond_4

    .line 1867
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->StopDownload(I)Z

    .line 1869
    :cond_4
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mSmsSyncProxy:Lcom/autochips/bluetooth/dundt/SMSSyncManager;

    if-eqz v1, :cond_5

    .line 1870
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mSmsSyncProxy:Lcom/autochips/bluetooth/dundt/SMSSyncManager;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/dundt/SMSSyncManager;->StopDownload()Z

    .line 1872
    :cond_5
    const/16 v1, 0xf

    sget v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mA2dpState:I

    if-ne v1, v2, :cond_6

    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v1, :cond_6

    .line 1874
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v2}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->getA2dpAddr()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->pause(Ljava/lang/String;)Z

    .line 1875
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3208()I

    goto :goto_0

    .line 1878
    :cond_6
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3208()I

    .line 1882
    :pswitch_1
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3300()I

    move-result v1

    if-le v1, v6, :cond_7

    .line 1883
    invoke-static {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3202(I)I

    goto :goto_0

    .line 1886
    :cond_7
    sget-boolean v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    if-nez v1, :cond_8

    sget v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mA2dpState:I

    if-eq v3, v1, :cond_8

    sget v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mAvrcpState:I

    if-ne v3, v1, :cond_9

    :cond_8
    sget-object v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v1, :cond_9

    .line 1890
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$10;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    .line 1892
    .restart local v0    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    invoke-virtual {v0}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->disconnect()V

    goto :goto_0

    .line 1895
    .end local v0    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :cond_9
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3208()I

    goto :goto_0

    .line 1899
    :pswitch_2
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3300()I

    move-result v1

    if-le v1, v6, :cond_a

    .line 1900
    invoke-static {v5}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3202(I)I

    goto :goto_0

    .line 1903
    :cond_a
    sget-boolean v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mIsHFConnected:Z

    if-nez v1, :cond_b

    sget v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mA2dpState:I

    if-eq v3, v1, :cond_b

    sget v1, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->mAvrcpState:I

    if-eq v3, v1, :cond_b

    .line 1906
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$10;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/autochips/bluetooth/LocalBluetoothManager;->setBluetoothEnabled(Z)V

    .line 1907
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$10;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v1, v3}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V

    .line 1908
    invoke-static {v4}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3202(I)I

    .line 1909
    invoke-static {v4}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3302(I)I

    goto/16 :goto_0

    .line 1911
    :cond_b
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3210()I

    goto/16 :goto_0

    .line 1860
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
