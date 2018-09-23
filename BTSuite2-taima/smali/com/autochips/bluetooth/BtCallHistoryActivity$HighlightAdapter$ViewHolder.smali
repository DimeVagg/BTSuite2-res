.class public final Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "BtCallHistoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ViewHolder"
.end annotation


# instance fields
.field public image:Landroid/widget/ImageView;

.field public name:Landroid/widget/TextView;

.field public phone:Landroid/widget/TextView;

.field final synthetic this$1:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

.field public time:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;)V
    .locals 0

    .prologue
    .line 1622
    iput-object p1, p0, Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter$ViewHolder;->this$1:Lcom/autochips/bluetooth/BtCallHistoryActivity$HighlightAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
