.class Lcom/autochips/bluetooth/BluetoothReceiver$2;
.super Ljava/lang/Object;
.source "BluetoothReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BluetoothReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BluetoothReceiver;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BluetoothReceiver;)V
    .locals 0

    .prologue
    .line 529
    iput-object p1, p0, Lcom/autochips/bluetooth/BluetoothReceiver$2;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 532
    iget-object v0, p0, Lcom/autochips/bluetooth/BluetoothReceiver$2;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    iget-object v1, p0, Lcom/autochips/bluetooth/BluetoothReceiver$2;->this$0:Lcom/autochips/bluetooth/BluetoothReceiver;

    invoke-static {v1}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$200(Lcom/autochips/bluetooth/BluetoothReceiver;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/BluetoothReceiver;->access$300(Lcom/autochips/bluetooth/BluetoothReceiver;Landroid/content/Context;)V

    .line 533
    return-void
.end method
