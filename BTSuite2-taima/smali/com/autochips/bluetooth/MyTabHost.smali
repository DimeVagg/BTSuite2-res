.class public Lcom/autochips/bluetooth/MyTabHost;
.super Landroid/widget/TabHost;
.source "MyTabHost.java"


# instance fields
.field private slideLeftIn:Landroid/view/animation/Animation;

.field private slideLeftOut:Landroid/view/animation/Animation;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Landroid/widget/TabHost;-><init>(Landroid/content/Context;)V

    .line 57
    const v0, 0x7f040005

    invoke-static {p1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/MyTabHost;->slideLeftOut:Landroid/view/animation/Animation;

    .line 58
    const v0, 0x7f040004

    invoke-static {p1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/MyTabHost;->slideLeftIn:Landroid/view/animation/Animation;

    .line 59
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2}, Landroid/widget/TabHost;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    const v0, 0x7f040005

    invoke-static {p1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/MyTabHost;->slideLeftOut:Landroid/view/animation/Animation;

    .line 52
    const v0, 0x7f040004

    invoke-static {p1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/MyTabHost;->slideLeftIn:Landroid/view/animation/Animation;

    .line 53
    return-void
.end method


# virtual methods
.method public setCurrentTab(I)V
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 65
    invoke-virtual {p0}, Lcom/autochips/bluetooth/MyTabHost;->getCurrentTab()I

    move-result v0

    .line 67
    .local v0, "currentTabIndex":I
    invoke-virtual {p0}, Lcom/autochips/bluetooth/MyTabHost;->getCurrentView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 71
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/TabHost;->setCurrentTab(I)V

    .line 73
    invoke-virtual {p0}, Lcom/autochips/bluetooth/MyTabHost;->getCurrentView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 76
    :cond_1
    return-void
.end method
