.class public Lcom/autochips/bluetooth/util/QuickActions;
.super Landroid/widget/PopupWindow;
.source "QuickActions.java"


# static fields
.field public static final ANIM_AUTO:I = 0x4

.field public static final ANIM_GROW_FROM_CENTER:I = 0x3

.field public static final ANIM_GROW_FROM_LEFT:I = 0x1

.field public static final ANIM_GROW_FROM_RIGHT:I = 0x2

.field private static final TAG:Ljava/lang/String; = "QuickActions"


# instance fields
.field private actionList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/autochips/bluetooth/util/ActionItem;",
            ">;"
        }
    .end annotation
.end field

.field protected final anchor:Landroid/view/View;

.field private animStyle:I

.field private animateTrack:Z

.field private background:Landroid/graphics/drawable/Drawable;

.field private final context:Landroid/content/Context;

.field private final inflater:Landroid/view/LayoutInflater;

.field private final mArrowDown:Landroid/widget/ImageView;

.field private final mArrowUp:Landroid/widget/ImageView;

.field private mLayout:Landroid/widget/RelativeLayout;

.field private mTrack:Landroid/view/ViewGroup;

.field private final root:Landroid/view/View;

.field protected final window:Landroid/widget/PopupWindow;

.field protected final windowManager:Landroid/view/WindowManager;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 3
    .param p1, "anchor"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x0

    .line 67
    invoke-direct {p0, p1}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;)V

    .line 47
    iput-object v2, p0, Lcom/autochips/bluetooth/util/QuickActions;->background:Landroid/graphics/drawable/Drawable;

    .line 69
    iput-object p1, p0, Lcom/autochips/bluetooth/util/QuickActions;->anchor:Landroid/view/View;

    .line 70
    new-instance v0, Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->window:Landroid/widget/PopupWindow;

    .line 73
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->window:Landroid/widget/PopupWindow;

    new-instance v1, Lcom/autochips/bluetooth/util/QuickActions$1;

    invoke-direct {v1, p0}, Lcom/autochips/bluetooth/util/QuickActions$1;-><init>(Lcom/autochips/bluetooth/util/QuickActions;)V

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    .line 86
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->windowManager:Landroid/view/WindowManager;

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->actionList:Ljava/util/ArrayList;

    .line 89
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->context:Landroid/content/Context;

    .line 90
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->context:Landroid/content/Context;

    const-string v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->inflater:Landroid/view/LayoutInflater;

    .line 93
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->inflater:Landroid/view/LayoutInflater;

    const v1, 0x7f030018

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->root:Landroid/view/View;

    .line 96
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->root:Landroid/view/View;

    const v1, 0x7f0a00a5

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->mArrowDown:Landroid/widget/ImageView;

    .line 97
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->root:Landroid/view/View;

    const v1, 0x7f0a00a1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->mArrowUp:Landroid/widget/ImageView;

    .line 98
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->root:Landroid/view/View;

    const v1, 0x7f0a009f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->mLayout:Landroid/widget/RelativeLayout;

    .line 100
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->root:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/util/QuickActions;->setContentView(Landroid/view/View;)V

    .line 117
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->root:Landroid/view/View;

    const v1, 0x7f0a00a3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->mTrack:Landroid/view/ViewGroup;

    .line 118
    const/4 v0, 0x3

    iput v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->animStyle:I

    .line 119
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->animateTrack:Z

    .line 120
    return-void
.end method

.method private createActionList()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 263
    const/4 v2, 0x1

    .line 265
    .local v2, "index":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v6, p0, Lcom/autochips/bluetooth/util/QuickActions;->actionList:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v0, v6, :cond_0

    .line 266
    iget-object v6, p0, Lcom/autochips/bluetooth/util/QuickActions;->actionList:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/autochips/bluetooth/util/ActionItem;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/util/ActionItem;->getTitle()Ljava/lang/String;

    move-result-object v4

    .line 267
    .local v4, "title":Ljava/lang/String;
    iget-object v6, p0, Lcom/autochips/bluetooth/util/QuickActions;->actionList:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/autochips/bluetooth/util/ActionItem;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/util/ActionItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 268
    .local v1, "icon":Landroid/graphics/drawable/Drawable;
    iget-object v6, p0, Lcom/autochips/bluetooth/util/QuickActions;->actionList:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/autochips/bluetooth/util/ActionItem;

    invoke-virtual {v6}, Lcom/autochips/bluetooth/util/ActionItem;->getListener()Landroid/view/View$OnClickListener;

    move-result-object v3

    .line 270
    .local v3, "listener":Landroid/view/View$OnClickListener;
    invoke-direct {p0, v4, v1, v3}, Lcom/autochips/bluetooth/util/QuickActions;->getActionItem(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Landroid/view/View$OnClickListener;)Landroid/view/View;

    move-result-object v5

    .line 272
    .local v5, "view":Landroid/view/View;
    invoke-virtual {v5, v7}, Landroid/view/View;->setFocusable(Z)V

    .line 273
    invoke-virtual {v5, v7}, Landroid/view/View;->setClickable(Z)V

    .line 275
    iget-object v6, p0, Lcom/autochips/bluetooth/util/QuickActions;->mTrack:Landroid/view/ViewGroup;

    invoke-virtual {v6, v5, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 277
    add-int/lit8 v2, v2, 0x1

    .line 265
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 279
    .end local v1    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v3    # "listener":Landroid/view/View$OnClickListener;
    .end local v4    # "title":Ljava/lang/String;
    .end local v5    # "view":Landroid/view/View;
    :cond_0
    return-void
.end method

.method private getActionItem(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Landroid/view/View$OnClickListener;)Landroid/view/View;
    .locals 7
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p3, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    const/16 v6, 0x8

    .line 283
    iget-object v3, p0, Lcom/autochips/bluetooth/util/QuickActions;->inflater:Landroid/view/LayoutInflater;

    const/high16 v4, 0x7f030000

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 284
    .local v0, "container":Landroid/widget/LinearLayout;
    const/high16 v3, 0x7f0a0000

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 285
    .local v1, "img":Landroid/widget/ImageView;
    const v3, 0x7f0a0001

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 287
    .local v2, "text":Landroid/widget/TextView;
    if-eqz p2, :cond_1

    .line 288
    invoke-virtual {v1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 293
    :goto_0
    if-eqz p1, :cond_2

    .line 294
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 299
    :goto_1
    if-eqz p3, :cond_0

    .line 300
    invoke-virtual {v0, p3}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 303
    :cond_0
    return-object v0

    .line 290
    :cond_1
    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 296
    :cond_2
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1
.end method

.method private setAnimationStyle(IIZ)V
    .locals 3
    .param p1, "screenWidth"    # I
    .param p2, "requestedX"    # I
    .param p3, "onTop"    # Z

    .prologue
    .line 225
    iget-object v1, p0, Lcom/autochips/bluetooth/util/QuickActions;->mArrowUp:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    sub-int v0, p2, v1

    .line 227
    .local v0, "arrowPos":I
    iget v1, p0, Lcom/autochips/bluetooth/util/QuickActions;->animStyle:I

    packed-switch v1, :pswitch_data_0

    .line 253
    :goto_0
    return-void

    .line 238
    :pswitch_0
    iget-object v2, p0, Lcom/autochips/bluetooth/util/QuickActions;->window:Landroid/widget/PopupWindow;

    if-eqz p3, :cond_0

    const v1, 0x7f080006

    :goto_1
    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    goto :goto_0

    :cond_0
    const v1, 0x7f080004

    goto :goto_1

    .line 227
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method private showArrow(II)V
    .locals 5
    .param p1, "whichArrow"    # I
    .param p2, "requestedX"    # I

    .prologue
    const v4, 0x7f0a00a1

    .line 307
    if-ne p1, v4, :cond_0

    iget-object v3, p0, Lcom/autochips/bluetooth/util/QuickActions;->mArrowUp:Landroid/widget/ImageView;

    .line 308
    .local v3, "showArrow":Landroid/view/View;
    :goto_0
    if-ne p1, v4, :cond_1

    iget-object v1, p0, Lcom/autochips/bluetooth/util/QuickActions;->mArrowDown:Landroid/widget/ImageView;

    .line 310
    .local v1, "hideArrow":Landroid/view/View;
    :goto_1
    iget-object v4, p0, Lcom/autochips/bluetooth/util/QuickActions;->mArrowUp:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v0

    .line 312
    .local v0, "arrowWidth":I
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 314
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 316
    .local v2, "param":Landroid/view/ViewGroup$MarginLayoutParams;
    div-int/lit8 v4, v0, 0x2

    sub-int v4, p2, v4

    iput v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 318
    const/4 v4, 0x4

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 319
    return-void

    .line 307
    .end local v0    # "arrowWidth":I
    .end local v1    # "hideArrow":Landroid/view/View;
    .end local v2    # "param":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v3    # "showArrow":Landroid/view/View;
    :cond_0
    iget-object v3, p0, Lcom/autochips/bluetooth/util/QuickActions;->mArrowDown:Landroid/widget/ImageView;

    goto :goto_0

    .line 308
    .restart local v3    # "showArrow":Landroid/view/View;
    :cond_1
    iget-object v1, p0, Lcom/autochips/bluetooth/util/QuickActions;->mArrowUp:Landroid/widget/ImageView;

    goto :goto_1
.end method


# virtual methods
.method public SetQuickActionsWidth(I)V
    .locals 4
    .param p1, "width"    # I

    .prologue
    .line 129
    iget-object v3, p0, Lcom/autochips/bluetooth/util/QuickActions;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v1, v3, Landroid/util/DisplayMetrics;->density:F

    .line 130
    .local v1, "scale":F
    int-to-float v3, p1

    mul-float/2addr v3, v1

    float-to-int v2, v3

    .line 131
    .local v2, "widthpx":I
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v0, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 132
    .local v0, "params":Landroid/view/ViewGroup$LayoutParams;
    iget-object v3, p0, Lcom/autochips/bluetooth/util/QuickActions;->mLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v3, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 133
    return-void
.end method

.method public addActionItem(Lcom/autochips/bluetooth/util/ActionItem;)V
    .locals 1
    .param p1, "action"    # Lcom/autochips/bluetooth/util/ActionItem;

    .prologue
    .line 153
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->actionList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    return-void
.end method

.method public animateTrack(Z)V
    .locals 0
    .param p1, "animateTrack"    # Z

    .prologue
    .line 139
    iput-boolean p1, p0, Lcom/autochips/bluetooth/util/QuickActions;->animateTrack:Z

    .line 140
    return-void
.end method

.method public getActionsWindow()Landroid/widget/PopupWindow;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->window:Landroid/widget/PopupWindow;

    return-object v0
.end method

.method protected preShow()V
    .locals 4

    .prologue
    const/4 v3, -0x2

    const/4 v2, 0x1

    .line 204
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->root:Landroid/view/View;

    if-nez v0, :cond_0

    .line 205
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "no view"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 208
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->background:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_1

    .line 209
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->window:Landroid/widget/PopupWindow;

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 214
    :goto_0
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->window:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 215
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->window:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 216
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->window:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 217
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->window:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 218
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->window:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 219
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->window:Landroid/widget/PopupWindow;

    iget-object v1, p0, Lcom/autochips/bluetooth/util/QuickActions;->root:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 220
    return-void

    .line 211
    :cond_1
    iget-object v0, p0, Lcom/autochips/bluetooth/util/QuickActions;->window:Landroid/widget/PopupWindow;

    iget-object v1, p0, Lcom/autochips/bluetooth/util/QuickActions;->background:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method public setAnimStyle(I)V
    .locals 0
    .param p1, "animStyle"    # I

    .prologue
    .line 146
    iput p1, p0, Lcom/autochips/bluetooth/util/QuickActions;->animStyle:I

    .line 147
    return-void
.end method

.method public show()V
    .locals 15

    .prologue
    const/4 v12, 0x1

    const/4 v14, 0x0

    const/4 v13, -0x2

    .line 160
    invoke-virtual {p0}, Lcom/autochips/bluetooth/util/QuickActions;->preShow()V

    .line 162
    const/4 v8, 0x2

    new-array v1, v8, [I

    .line 164
    .local v1, "location":[I
    iget-object v8, p0, Lcom/autochips/bluetooth/util/QuickActions;->anchor:Landroid/view/View;

    invoke-virtual {v8, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 167
    new-instance v0, Landroid/graphics/Rect;

    aget v8, v1, v14

    aget v9, v1, v12

    aget v10, v1, v14

    iget-object v11, p0, Lcom/autochips/bluetooth/util/QuickActions;->anchor:Landroid/view/View;

    invoke-virtual {v11}, Landroid/view/View;->getWidth()I

    move-result v11

    add-int/2addr v10, v11

    aget v11, v1, v12

    iget-object v12, p0, Lcom/autochips/bluetooth/util/QuickActions;->anchor:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getHeight()I

    move-result v12

    add-int/2addr v11, v12

    invoke-direct {v0, v8, v9, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 170
    .local v0, "anchorRect":Landroid/graphics/Rect;
    iget-object v8, p0, Lcom/autochips/bluetooth/util/QuickActions;->root:Landroid/view/View;

    new-instance v9, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v9, v13, v13}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 171
    iget-object v8, p0, Lcom/autochips/bluetooth/util/QuickActions;->root:Landroid/view/View;

    invoke-virtual {v8, v13, v13}, Landroid/view/View;->measure(II)V

    .line 173
    iget-object v8, p0, Lcom/autochips/bluetooth/util/QuickActions;->root:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    .line 174
    .local v4, "rootWidth":I
    iget-object v8, p0, Lcom/autochips/bluetooth/util/QuickActions;->root:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    .line 176
    .local v3, "rootHeight":I
    iget-object v8, p0, Lcom/autochips/bluetooth/util/QuickActions;->windowManager:Landroid/view/WindowManager;

    invoke-interface {v8}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Display;->getWidth()I

    move-result v5

    .line 179
    .local v5, "screenWidth":I
    sub-int v8, v5, v4

    div-int/lit8 v6, v8, 0x2

    .line 180
    .local v6, "xPos":I
    iget v8, v0, Landroid/graphics/Rect;->top:I

    sub-int v7, v8, v3

    .line 182
    .local v7, "yPos":I
    const/4 v2, 0x1

    .line 184
    .local v2, "onTop":Z
    iget v8, v0, Landroid/graphics/Rect;->top:I

    if-le v3, v8, :cond_0

    .line 185
    iget v7, v0, Landroid/graphics/Rect;->bottom:I

    .line 186
    const/4 v2, 0x0

    .line 189
    :cond_0
    if-eqz v2, :cond_1

    const v8, 0x7f0a00a5

    :goto_0
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v9

    invoke-direct {p0, v8, v9}, Lcom/autochips/bluetooth/util/QuickActions;->showArrow(II)V

    .line 191
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v8

    invoke-direct {p0, v5, v8, v2}, Lcom/autochips/bluetooth/util/QuickActions;->setAnimationStyle(IIZ)V

    .line 193
    invoke-direct {p0}, Lcom/autochips/bluetooth/util/QuickActions;->createActionList()V

    .line 195
    iget-object v8, p0, Lcom/autochips/bluetooth/util/QuickActions;->window:Landroid/widget/PopupWindow;

    iget-object v9, p0, Lcom/autochips/bluetooth/util/QuickActions;->anchor:Landroid/view/View;

    invoke-virtual {v8, v9, v14, v6, v7}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 198
    return-void

    .line 189
    :cond_1
    const v8, 0x7f0a00a1

    goto :goto_0
.end method
