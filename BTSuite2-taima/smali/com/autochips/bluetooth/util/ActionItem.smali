.class public Lcom/autochips/bluetooth/util/ActionItem;
.super Ljava/lang/Object;
.source "ActionItem.java"


# instance fields
.field private icon:Landroid/graphics/drawable/Drawable;

.field private listener:Landroid/view/View$OnClickListener;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/autochips/bluetooth/util/ActionItem;->icon:Landroid/graphics/drawable/Drawable;

    .line 19
    return-void
.end method


# virtual methods
.method public getIcon()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/autochips/bluetooth/util/ActionItem;->icon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getListener()Landroid/view/View$OnClickListener;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/autochips/bluetooth/util/ActionItem;->listener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/autochips/bluetooth/util/ActionItem;->title:Ljava/lang/String;

    return-object v0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/autochips/bluetooth/util/ActionItem;->icon:Landroid/graphics/drawable/Drawable;

    .line 34
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/autochips/bluetooth/util/ActionItem;->listener:Landroid/view/View$OnClickListener;

    .line 44
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/autochips/bluetooth/util/ActionItem;->title:Ljava/lang/String;

    .line 24
    return-void
.end method
