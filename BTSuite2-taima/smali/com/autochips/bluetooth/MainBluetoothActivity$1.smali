.class Lcom/autochips/bluetooth/MainBluetoothActivity$1;
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
    .line 126
    iput-object p1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$1;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 129
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 130
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 131
    const-string v1, "android.intent.category.HOME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 132
    iget-object v1, p0, Lcom/autochips/bluetooth/MainBluetoothActivity$1;->this$0:Lcom/autochips/bluetooth/MainBluetoothActivity;

    invoke-virtual {v1, v0}, Lcom/autochips/bluetooth/MainBluetoothActivity;->startActivity(Landroid/content/Intent;)V

    .line 133
    return-void
.end method
