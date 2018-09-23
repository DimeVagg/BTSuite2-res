.class public Lcom/autochips/bluetooth/BtReadingSmsActivity;
.super Landroid/app/Activity;
.source "BtReadingSmsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "BtSmsActivity"


# instance fields
.field m_strContent:Ljava/lang/String;

.field m_strDate:Ljava/lang/String;

.field m_strPhoneNum:Ljava/lang/String;

.field m_strType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 108
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 113
    :goto_0
    return-void

    .line 110
    :pswitch_0
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtReadingSmsActivity;->finish()V

    goto :goto_0

    .line 108
    :pswitch_data_0
    .packed-switch 0x7f0a0072
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 61
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 62
    const v5, 0x7f03000d

    invoke-virtual {p0, v5}, Lcom/autochips/bluetooth/BtReadingSmsActivity;->setContentView(I)V

    .line 63
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtReadingSmsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    .line 64
    .local v3, "intent":Landroid/content/Intent;
    const-string v5, "Contact"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/autochips/bluetooth/BtReadingSmsActivity;->m_strPhoneNum:Ljava/lang/String;

    .line 65
    const-string v5, "Type"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/autochips/bluetooth/BtReadingSmsActivity;->m_strType:Ljava/lang/String;

    .line 66
    const-string v5, "Content"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/autochips/bluetooth/BtReadingSmsActivity;->m_strContent:Ljava/lang/String;

    .line 67
    const-string v5, "Date"

    invoke-virtual {v3, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/autochips/bluetooth/BtReadingSmsActivity;->m_strDate:Ljava/lang/String;

    .line 69
    const v5, 0x7f0a0070

    invoke-virtual {p0, v5}, Lcom/autochips/bluetooth/BtReadingSmsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 70
    .local v0, "contact_TV":Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtReadingSmsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0700cc

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/autochips/bluetooth/BtReadingSmsActivity;->m_strPhoneNum:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    const v5, 0x7f0a0073

    invoke-virtual {p0, v5}, Lcom/autochips/bluetooth/BtReadingSmsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 72
    .local v4, "type_TV":Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtReadingSmsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0700ce

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/autochips/bluetooth/BtReadingSmsActivity;->m_strType:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    const v5, 0x7f0a0074

    invoke-virtual {p0, v5}, Lcom/autochips/bluetooth/BtReadingSmsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 74
    .local v1, "content_TV":Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtReadingSmsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0700cf

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/autochips/bluetooth/BtReadingSmsActivity;->m_strContent:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    const v5, 0x7f0a0071

    invoke-virtual {p0, v5}, Lcom/autochips/bluetooth/BtReadingSmsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 76
    .local v2, "date_TV":Landroid/widget/TextView;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtReadingSmsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0700cd

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/autochips/bluetooth/BtReadingSmsActivity;->m_strDate:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    const v5, 0x7f0a0072

    invoke-virtual {p0, v5}, Lcom/autochips/bluetooth/BtReadingSmsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageButton;

    invoke-virtual {v5, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 104
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 105
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 94
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 95
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 88
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 90
    return-void
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 83
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 84
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 99
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 100
    return-void
.end method
