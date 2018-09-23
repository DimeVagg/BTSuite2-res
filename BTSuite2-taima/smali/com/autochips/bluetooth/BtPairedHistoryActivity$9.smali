.class Lcom/autochips/bluetooth/BtPairedHistoryActivity$9;
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
    .line 1840
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$9;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1843
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "BtPairedHistoryActivity"

    const-string v1, "TIMER_BT_AUTO_CONNECT:delay ok"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1844
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$9;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getBluetoothAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1846
    invoke-static {}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$000()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "BtPairedHistoryActivity"

    const-string v1, "TIMER_BT_AUTO_CONNECT: isDiscovering"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1852
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$9;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3100(Lcom/autochips/bluetooth/BtPairedHistoryActivity;I)V

    .line 1853
    return-void

    .line 1850
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$9;->this$0:Lcom/autochips/bluetooth/BtPairedHistoryActivity;

    invoke-static {v0}, Lcom/autochips/bluetooth/BtPairedHistoryActivity;->access$3000(Lcom/autochips/bluetooth/BtPairedHistoryActivity;)V

    goto :goto_0
.end method
