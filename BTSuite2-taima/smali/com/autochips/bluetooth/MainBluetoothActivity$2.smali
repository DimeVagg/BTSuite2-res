.class Lcom/autochips/bluetooth/MainBluetoothActivity$2;
.super Ljava/lang/Object;
.source "MainBluetoothActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/autochips/bluetooth/MainBluetoothActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/MainBluetoothActivity;)V
    .locals 0

    .prologue
    .line 135
    iput-object p1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$2;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$2;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->finish()V

    .line 139
    return-void
.end method
