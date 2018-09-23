.class Lcom/autochips/bluetooth/BtPhonebookActivity$1;
.super Landroid/os/Handler;
.source "BtPhonebookActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/autochips/bluetooth/BtPhonebookActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;


# direct methods
.method constructor <init>(Lcom/autochips/bluetooth/BtPhonebookActivity;)V
    .locals 0

    .prologue
    .line 164
    iput-object p1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 166
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 215
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 169
    :pswitch_1
    sget-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v1, :cond_0

    .line 172
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 173
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$100(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    goto :goto_0

    .line 174
    :cond_1
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v2, 0xa

    if-ge v1, v2, :cond_2

    .line 175
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$200(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I

    goto :goto_0

    .line 177
    :cond_2
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$300(Lcom/autochips/bluetooth/BtPhonebookActivity;I)V

    goto :goto_0

    .line 184
    :pswitch_2
    sget-boolean v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v1, :cond_0

    .line 187
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$100(Lcom/autochips/bluetooth/BtPhonebookActivity;)V

    goto :goto_0

    .line 193
    :pswitch_3
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1, v6}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$402(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I

    .line 194
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1, v6}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$502(Lcom/autochips/bluetooth/BtPhonebookActivity;I)I

    .line 195
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$000(Lcom/autochips/bluetooth/BtPhonebookActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 196
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/EditText;

    move-result-object v1

    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    const v3, 0x7f070090

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {v2, v3, v4}, Lcom/autochips/bluetooth/BtPhonebookActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 197
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$700(Lcom/autochips/bluetooth/BtPhonebookActivity;)Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity$HighlightAdapter;->notifyDataSetChanged()V

    goto :goto_0

    .line 203
    :pswitch_4
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    .line 204
    .local v0, "index":I
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$802(Lcom/autochips/bluetooth/BtPhonebookActivity;Landroid/text/Editable;)Landroid/text/Editable;

    .line 205
    if-lt v0, v4, :cond_0

    .line 206
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$800(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/text/Editable;

    move-result-object v1

    add-int/lit8 v2, v0, -0x1

    invoke-interface {v1, v2, v0}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 210
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/EditText;

    move-result-object v1

    iget-object v2, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v2}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$800(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 211
    iget-object v1, p0, Lcom/autochips/bluetooth/BtPhonebookActivity$1;->this$0:Lcom/autochips/bluetooth/BtPhonebookActivity;

    invoke-static {v1}, Lcom/autochips/bluetooth/BtPhonebookActivity;->access$600(Lcom/autochips/bluetooth/BtPhonebookActivity;)Landroid/widget/EditText;

    move-result-object v1

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    goto/16 :goto_0

    .line 166
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
