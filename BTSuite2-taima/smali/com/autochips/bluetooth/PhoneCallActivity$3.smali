.class Lcom/autochips/bluetooth/PhoneCallActivity$3;
.super Ljava/lang/Object;
.source "PhoneCallActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/PhoneCallActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/PhoneCallActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/PhoneCallActivity;)V
    .locals 0

    .prologue
    .line 937
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 940
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity$3;->this$0:Lcom/autochips/bluetooth/PhoneCallActivity;

    iget v0, v0, Lcom/autochips/bluetooth/PhoneCallActivity;->phoneCallState_new:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 943
    :cond_0
    return-void
.end method
