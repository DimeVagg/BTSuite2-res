.class public Lcom/autochips/bluetooth/YikaActivity;
.super Landroid/app/Activity;
.source "YikaActivity.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field private listView:Landroid/widget/ListView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 26
    const-string v0, "TEST"

    iput-object v0, p0, Lcom/autochips/bluetooth/YikaActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/autochips/bluetooth/YikaActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/YikaActivity;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/autochips/bluetooth/YikaActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v3, 0x400

    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 30
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 31
    invoke-virtual {p0, v6}, Lcom/autochips/bluetooth/YikaActivity;->requestWindowFeature(I)Z

    .line 32
    invoke-virtual {p0}, Lcom/autochips/bluetooth/YikaActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v3, v3}, Landroid/view/Window;->setFlags(II)V

    .line 33
    const v1, 0x7f030011

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/YikaActivity;->setContentView(I)V

    .line 34
    const v1, 0x7f0a008a

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/YikaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/autochips/bluetooth/YikaActivity;->listView:Landroid/widget/ListView;

    .line 36
    invoke-virtual {p0}, Lcom/autochips/bluetooth/YikaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v3, "SelectPhone"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 38
    .local v2, "nameList":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v0, Landroid/widget/SimpleAdapter;

    const v3, 0x7f030012

    new-array v4, v7, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v5, "PHONEName"

    aput-object v5, v4, v1

    const-string v1, "PHONENumber"

    aput-object v1, v4, v6

    new-array v5, v7, [I

    fill-array-data v5, :array_0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 42
    .local v0, "adapter":Landroid/widget/SimpleAdapter;
    iget-object v1, p0, Lcom/autochips/bluetooth/YikaActivity;->listView:Landroid/widget/ListView;

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 43
    iget-object v1, p0, Lcom/autochips/bluetooth/YikaActivity;->listView:Landroid/widget/ListView;

    new-instance v3, Lcom/autochips/bluetooth/YikaActivity$1;

    invoke-direct {v3, p0, v2}, Lcom/autochips/bluetooth/YikaActivity$1;-><init>(Lcom/autochips/bluetooth/YikaActivity;Ljava/util/List;)V

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 57
    return-void

    .line 38
    nop

    :array_0
    .array-data 4
        0x7f0a008b
        0x7f0a008c
    .end array-data
.end method
