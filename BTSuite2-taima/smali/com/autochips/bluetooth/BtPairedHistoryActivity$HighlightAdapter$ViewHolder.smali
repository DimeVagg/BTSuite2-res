.class public final Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "BtPairedHistoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ViewHolder"
.end annotation


# instance fields
.field public macaddr:Landroid/widget/TextView;

.field public name:Landroid/widget/TextView;

.field public status:Landroid/widget/TextView;

.field final synthetic this$1:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;


# direct methods
.method public constructor <init>(Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;)V
    .locals 0

    .prologue
    .line 1793
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter$ViewHolder;->this$1:Lcom/autochips/bluetooth/BtPairedHistoryActivity$HighlightAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
