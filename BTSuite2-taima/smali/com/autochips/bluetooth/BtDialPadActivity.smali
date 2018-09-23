.class public Lcom/autochips/bluetooth/BtDialPadActivity;
.super Landroid/app/Activity;
.source "BtDialPadActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;
    }
.end annotation


# static fields
.field public static final ACTION_BLUETOOTH_CALLOUT:Ljava/lang/String; = "com.autochips.bluetooth.BtDialPadActivity.action.BLUETOOTH_CALLOUT"

.field public static final ACTION_BLUETOOTH_UPDATE_MEMORY_CALL:Ljava/lang/String; = "com.autochips.bluetooth.BtDialPadActivity.action.BLUETOOTH_UPDATE_MEMORY_CALL"

.field private static DEBUG:Z = false

.field public static final EXTRA_BLUETOOTH_CALLOUT_NAME:Ljava/lang/String; = "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_CALLOUT_NAME"

.field public static final EXTRA_BLUETOOTH_CALLOUT_NUMBER:Ljava/lang/String; = "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_CALLOUT_NUMBER"

.field public static final EXTRA_BLUETOOTH_MEMORY_CALL_NUMBER:Ljava/lang/String; = "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_MEMORY_CALL_NUMBER"

.field private static final HIDTESTSTRING:Ljava/lang/String; = "**4438378**"

.field private static final TAG:Ljava/lang/String; = "BTDialPadActivity"

.field private static final UNKOWN_PHONE_NUMBER:Ljava/lang/String; = "unkown"

.field private static hidMouseButtonDown:Z

.field private static hidTestMode:Z

.field public static m_hfadpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;


# instance fields
.field private final MSG_INVOKE_BT_PHONECALL_ACTIVITY:I

.field private bgDeleteNum:Landroid/widget/LinearLayout;

.field private bt_dial_layout:Landroid/widget/LinearLayout;

.field private bt_incalling_layout:Landroid/widget/LinearLayout;

.field private btn_gotocall:Landroid/widget/Button;

.field private btn_hangup:Landroid/widget/Button;

.field private dialButtonPressed:Z

.field private mBTDialpadMsgHandler:Landroid/os/Handler;

.field private mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private mContext:Landroid/content/Context;

.field private mDialButtonTimer:Ljava/util/Timer;

.field public mHfConnect_finish_intent:Landroid/content/Intent;

.field private mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

.field private mToast:Landroid/widget/Toast;

.field private m_answer_Btn:Landroid/widget/Button;

.field private m_bAutoCalloutTest:Z

.field private m_bIsCallUIShowing:Z

.field private m_bIsCurrentAudioOutputFromAG:Z

.field private m_bIsHFInitiatedCall:Z

.field private m_bIsHfConnected:Z

.field m_callnumber_et:Landroid/widget/EditText;

.field m_callnumstr_edt:Landroid/text/Editable;

.field private m_phoneNumber_Tv:Landroid/widget/TextView;

.field m_strMemoryCallNum:Ljava/lang/String;

.field m_strPhoneName:Ljava/lang/String;

.field private m_thrdAutoCalloutTest:Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;

.field private m_voiceSourceCar_Btn:Landroid/widget/Button;

.field private m_voiceSourcePhone_Btn:Landroid/widget/Button;

.field private toast_btv:Landroid/widget/Toast;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 90
    sget-boolean v0, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugAll:Z

    sget-boolean v1, Lcom/autochips/bluetooth/BtEmulatorDebug;->mDebugHF:Z

    and-int/2addr v0, v1

    sput-boolean v0, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    .line 98
    const/4 v0, 0x0

    sput-object v0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_hfadpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    .line 134
    sput-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->hidTestMode:Z

    .line 135
    sput-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->hidMouseButtonDown:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 86
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 103
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHfConnected:Z

    .line 104
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHFInitiatedCall:Z

    .line 105
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bAutoCalloutTest:Z

    .line 106
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsCallUIShowing:Z

    .line 107
    iput-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_thrdAutoCalloutTest:Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;

    .line 109
    iput-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mDialButtonTimer:Ljava/util/Timer;

    .line 110
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->dialButtonPressed:Z

    .line 111
    iput-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->bgDeleteNum:Landroid/widget/LinearLayout;

    .line 116
    const/4 v0, 0x1

    iput v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->MSG_INVOKE_BT_PHONECALL_ACTIVITY:I

    .line 136
    iput-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->toast_btv:Landroid/widget/Toast;

    .line 144
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsCurrentAudioOutputFromAG:Z

    .line 363
    new-instance v0, Lcom/autochips/bluetooth/BtDialPadActivity$1;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtDialPadActivity$1;-><init>(Lcom/autochips/bluetooth/BtDialPadActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 579
    new-instance v0, Lcom/autochips/bluetooth/BtDialPadActivity$2;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtDialPadActivity$2;-><init>(Lcom/autochips/bluetooth/BtDialPadActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mBTDialpadMsgHandler:Landroid/os/Handler;

    .line 643
    return-void
.end method

.method private BluetoothHfCallout(Ljava/lang/String;)Z
    .locals 4
    .param p1, "PhoneNumber"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 822
    if-nez p1, :cond_1

    .line 846
    :cond_0
    :goto_0
    return v0

    .line 824
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 825
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->ShowNoticeCallNumberIsEmpty()V

    .line 826
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BTDialPadActivity"

    const-string v2, "BluetoothHfCallout return PhoneNumber is empty"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 829
    :cond_2
    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-nez v2, :cond_3

    .line 830
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BTDialPadActivity"

    const-string v2, "BluetoothHfCallout return m_hfadpter is null"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 834
    :cond_3
    sget-boolean v0, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v0, :cond_4

    const-string v0, "BTDialPadActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BluetoothHfCallout"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 836
    :cond_4
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v0, p1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_DialNumber(Ljava/lang/String;)V

    .line 843
    iput-object p1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strMemoryCallNum:Ljava/lang/String;

    .line 845
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHFInitiatedCall:Z

    move v0, v1

    .line 846
    goto :goto_0
.end method

.method private BluetoothHfTerminatePhoneCall()Z
    .locals 2

    .prologue
    .line 857
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-nez v0, :cond_1

    .line 858
    sget-boolean v0, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BTDialPadActivity"

    const-string v1, "BluetoothHfTerminatePhoneCall return m_hfadpter is null"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 859
    :cond_0
    const/4 v0, 0x0

    .line 870
    :goto_0
    return v0

    .line 863
    :cond_1
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_TerminatePhoneCall()V

    .line 870
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private ShowNoticeCallNumberIsEmpty()V
    .locals 3

    .prologue
    .line 894
    const v1, 0x7f07004a

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 895
    .local v0, "notice_text":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 901
    :goto_0
    return-void

    .line 897
    :cond_0
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private ShowNoticeDeviceNoMemoryCall()V
    .locals 3

    .prologue
    .line 904
    const v1, 0x7f070049

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 905
    .local v0, "notice_text":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 911
    :goto_0
    return-void

    .line 907
    :cond_0
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private ShowNoticeDeviceNotAvaible()V
    .locals 3

    .prologue
    .line 914
    const v1, 0x7f070046

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 915
    .local v0, "notice_text":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 921
    :goto_0
    return-void

    .line 917
    :cond_0
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private ShowNoticeHFConectStaus(I)V
    .locals 2
    .param p1, "HfConnectResult"    # I

    .prologue
    .line 876
    const-string v0, ""

    .line 877
    .local v0, "notice_text":Ljava/lang/String;
    if-nez p1, :cond_1

    .line 878
    const v1, 0x7f070048

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 885
    :goto_0
    if-nez v0, :cond_0

    .line 891
    :cond_0
    return-void

    .line 879
    :cond_1
    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 880
    const v1, 0x7f070047

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method static synthetic access$100()Z
    .locals 1

    .prologue
    .line 86
    sget-boolean v0, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/autochips/bluetooth/BtDialPadActivity;)Lcom/autochips/bluetooth/LocalBluetoothManager;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/autochips/bluetooth/BtDialPadActivity;ZLjava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 86
    invoke-direct {p0, p1, p2}, Lcom/autochips/bluetooth/BtDialPadActivity;->invokePhoneCallActivity(ZLjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1200(Lcom/autochips/bluetooth/BtDialPadActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;

    .prologue
    .line 86
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHfConnected:Z

    return v0
.end method

.method static synthetic access$1300(Lcom/autochips/bluetooth/BtDialPadActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;

    .prologue
    .line 86
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsCallUIShowing:Z

    return v0
.end method

.method static synthetic access$1400(Lcom/autochips/bluetooth/BtDialPadActivity;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtDialPadActivity;->BluetoothHfCallout(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1502(Lcom/autochips/bluetooth/BtDialPadActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHFInitiatedCall:Z

    return p1
.end method

.method static synthetic access$1600(Lcom/autochips/bluetooth/BtDialPadActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;

    .prologue
    .line 86
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->BluetoothHfTerminatePhoneCall()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1702(Lcom/autochips/bluetooth/BtDialPadActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->dialButtonPressed:Z

    return p1
.end method

.method static synthetic access$1800(Lcom/autochips/bluetooth/BtDialPadActivity;)Ljava/util/Timer;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mDialButtonTimer:Ljava/util/Timer;

    return-object v0
.end method

.method static synthetic access$1802(Lcom/autochips/bluetooth/BtDialPadActivity;Ljava/util/Timer;)Ljava/util/Timer;
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;
    .param p1, "x1"    # Ljava/util/Timer;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mDialButtonTimer:Ljava/util/Timer;

    return-object p1
.end method

.method static synthetic access$200(Lcom/autochips/bluetooth/BtDialPadActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;
    .param p1, "x1"    # I

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtDialPadActivity;->ShowNoticeHFConectStaus(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/autochips/bluetooth/BtDialPadActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;

    .prologue
    .line 86
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->onBTPhoneCallActive()V

    return-void
.end method

.method static synthetic access$400(Lcom/autochips/bluetooth/BtDialPadActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtDialPadActivity;->onProfileStateChange(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$500(Lcom/autochips/bluetooth/BtDialPadActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtDialPadActivity;->onBluetoothCalloutRequest(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$600(Lcom/autochips/bluetooth/BtDialPadActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtDialPadActivity;->onBluetoothATCmdWarning(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$700(Lcom/autochips/bluetooth/BtDialPadActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtDialPadActivity;->onUpdateMemoryCall(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$800(Lcom/autochips/bluetooth/BtDialPadActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtDialPadActivity;->onScoStateChange(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$900(Lcom/autochips/bluetooth/BtDialPadActivity;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtDialPadActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtDialPadActivity;->onBluetoothPhoneCallUIStateChange(Landroid/content/Intent;)V

    return-void
.end method

.method private addDialPadInputString(Ljava/lang/CharSequence;)Z
    .locals 4
    .param p1, "str"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v1, 0x0

    .line 768
    if-nez p1, :cond_0

    .line 787
    :goto_0
    return v1

    .line 771
    :cond_0
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    .line 772
    .local v0, "index":I
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    iput-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    .line 774
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    invoke-interface {v2}, Landroid/text/Editable;->length()I

    move-result v2

    const/16 v3, 0x3f

    if-le v2, v3, :cond_1

    .line 776
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->showToolongDialog()V

    goto :goto_0

    .line 779
    :cond_1
    if-ltz v0, :cond_2

    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    if-le v0, v1, :cond_3

    .line 780
    :cond_2
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    invoke-interface {v1, p1}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    .line 784
    :goto_1
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 785
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    .line 787
    const/4 v1, 0x1

    goto :goto_0

    .line 782
    :cond_3
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    invoke-interface {v1, v0, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    goto :goto_1
.end method

.method private bluetoothAnswerPhoneCall()V
    .locals 2

    .prologue
    .line 304
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 305
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_AcceptIncommingCall()V

    .line 309
    :cond_0
    :goto_0
    return-void

    .line 307
    :cond_1
    sget-boolean v0, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BTDialPadActivity"

    const-string v1, "getHfAdapter() is null "

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private bluetoothAudioOutput()Z
    .locals 1

    .prologue
    .line 286
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 288
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_IsAudioTransferTowardsAG()Z

    move-result v0

    .line 291
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private bluetoothGetCallState()I
    .locals 4

    .prologue
    .line 269
    const/4 v0, 0x0

    .line 271
    .local v0, "call":I
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 272
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallState()I

    move-result v0

    .line 274
    :cond_0
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "BTDialPadActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bluetooth_Hf_GetCallState call = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    :cond_1
    return v0
.end method

.method private bluetoothGetCallValue()I
    .locals 2

    .prologue
    .line 278
    const/4 v0, 0x0

    .line 280
    .local v0, "call":I
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 281
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallValue()I

    move-result v0

    .line 283
    :cond_0
    return v0
.end method

.method private bluetoothTerminatePhoneCall()V
    .locals 2

    .prologue
    .line 296
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 297
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_TerminatePhoneCall()V

    .line 301
    :cond_0
    :goto_0
    return-void

    .line 299
    :cond_1
    sget-boolean v0, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BTDialPadActivity"

    const-string v1, "TerminatePhoneCall failure ,getHfAdapter() is null  "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private checkHandsfreeDeviceConnected()Z
    .locals 1

    .prologue
    .line 925
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHfConnected:Z

    if-eqz v0, :cond_0

    .line 926
    const/4 v0, 0x1

    .line 929
    :goto_0
    return v0

    .line 928
    :cond_0
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->ShowNoticeDeviceNotAvaible()V

    .line 929
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private delelteAllDialPadString()Z
    .locals 2

    .prologue
    .line 809
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    .line 811
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    invoke-interface {v0}, Landroid/text/Editable;->clear()V

    .line 812
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 813
    const/4 v0, 0x1

    return v0
.end method

.method private delelteOneDialPadString()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 795
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    .line 796
    .local v0, "index":I
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    iput-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    .line 798
    if-lt v0, v1, :cond_0

    .line 799
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    add-int/lit8 v3, v0, -0x1

    invoke-interface {v2, v3, v0}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 803
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 804
    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setSelection(I)V

    .line 805
    :goto_0
    return v1

    .line 801
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getCallNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 749
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;
    .locals 1

    .prologue
    .line 266
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    return-object v0
.end method

.method private invokePhoneCallActivity(ZLjava/lang/String;)Z
    .locals 3
    .param p1, "isIcommingCall"    # Z
    .param p2, "strPhoneNumber"    # Ljava/lang/String;

    .prologue
    .line 715
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 716
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BTDialPadActivity"

    const-string v2, "strPhoneNumber is empty ,call failure "

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 717
    :cond_0
    const/4 v1, 0x0

    .line 740
    :goto_0
    return v1

    .line 720
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 721
    .local v0, "intentPhoneCall":Landroid/content/Intent;
    const-class v1, Lcom/autochips/bluetooth/PhoneCallActivity;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 723
    if-eqz p1, :cond_2

    .line 724
    const-string v1, "isIncomingCall"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 729
    :goto_1
    iget-boolean v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHFInitiatedCall:Z

    if-eqz v1, :cond_3

    .line 730
    const-string v1, "isHFInitiated"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 734
    :goto_2
    const-string v1, "PhoneNumber"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 736
    const-string v1, "PhoneName"

    iget-object v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strPhoneName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 738
    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtDialPadActivity;->startActivity(Landroid/content/Intent;)V

    .line 740
    const/4 v1, 0x1

    goto :goto_0

    .line 726
    :cond_2
    const-string v1, "isIncomingCall"

    const-string v2, "false"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    .line 732
    :cond_3
    const-string v1, "isHFInitiated"

    const-string v2, "false"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_2
.end method

.method private onBTPhoneCallActive()V
    .locals 2

    .prologue
    .line 403
    sget-boolean v0, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BTDialPadActivity"

    const-string v1, "onBTPhoneCallActive"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtDialPadActivity;->updateCallStateTextView(Z)V

    .line 406
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->bluetoothGetCallState()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtDialPadActivity;->updateShowbycall(I)V

    .line 407
    return-void
.end method

.method private onBluetoothATCmdWarning(Landroid/content/Intent;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 435
    const-string v1, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.extra.BLUETOOTH_AT_CMD_WARNING_TYPE"

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 438
    .local v0, "warningtype":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 439
    const-string v1, "BTDialPadActivity"

    const-string v2, "No Carrier "

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 440
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "No Carrier!"

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 444
    :cond_0
    return-void
.end method

.method private onBluetoothCalloutRequest(Landroid/content/Intent;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 420
    const-string v1, "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_CALLOUT_NUMBER"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 422
    .local v0, "calloutNumber":Ljava/lang/String;
    const-string v1, "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_CALLOUT_NAME"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strPhoneName:Ljava/lang/String;

    .line 423
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strPhoneName:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 424
    const-string v1, ""

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strPhoneName:Ljava/lang/String;

    .line 425
    const-string v1, "BTDialPadActivity"

    const-string v2, "ACTION_BLUETOOTH_CALLOUT m_strPhoneName is null"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 428
    :cond_0
    const-string v1, "BTDialPadActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Callout Number =   "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Name = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strPhoneName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 429
    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtDialPadActivity;->BluetoothHfCallout(Ljava/lang/String;)Z

    .line 430
    return-void
.end method

.method private onBluetoothPhoneCallUIStateChange(Landroid/content/Intent;)V
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 461
    const-string v1, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS"

    const/4 v2, -0x1

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 462
    .local v0, "ui_call_status":I
    if-ne v4, v0, :cond_1

    .line 463
    const-string v1, "BTDialPadActivity"

    const-string v2, "Phone Call Activity start "

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 464
    iput-boolean v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsCallUIShowing:Z

    .line 471
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->bluetoothGetCallState()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->updateShowbycall(I)V

    .line 472
    return-void

    .line 465
    :cond_1
    if-nez v0, :cond_0

    .line 466
    const-string v1, "BTDialPadActivity"

    const-string v2, "Phone Call Activity end "

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 467
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsCallUIShowing:Z

    .line 468
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHFInitiatedCall:Z

    .line 469
    const-string v1, ""

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strPhoneName:Ljava/lang/String;

    goto :goto_0
.end method

.method private onCallStateChange(Landroid/content/Intent;)V
    .locals 8
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 536
    const/4 v2, 0x0

    .line 537
    .local v2, "bInvokecall":Z
    const/4 v1, 0x0

    .line 538
    .local v1, "bIncomming":Z
    const-string v4, "unkown"

    .line 540
    .local v4, "strCurCallNum":Ljava/lang/String;
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-eqz v5, :cond_0

    .line 541
    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallingNumber()Ljava/lang/String;

    move-result-object v4

    .line 544
    :cond_0
    const-string v5, "com.autochips.bluetooth.hf.BluetoothHfUtility.extra.callState"

    const/4 v6, 0x0

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 545
    .local v3, "callState":I
    const-string v5, "BTDialPadActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onCallStateChangeEXTRA_CALL_STATE = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 547
    const/4 v5, 0x2

    if-ne v3, v5, :cond_2

    .line 549
    const/4 v1, 0x1

    .line 550
    const/4 v2, 0x1

    .line 565
    :goto_0
    if-eqz v2, :cond_1

    .line 566
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 567
    .local v0, "arg":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v1, :cond_5

    .line 568
    const-string v5, "incommingcall"

    const-string v6, "true"

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 572
    :goto_1
    const-string v5, "callnumber"

    invoke-virtual {v0, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 573
    const/4 v5, 0x1

    invoke-direct {p0, v5, v0}, Lcom/autochips/bluetooth/BtDialPadActivity;->sendBTDialpadMsg(ILjava/lang/Object;)V

    .line 576
    .end local v0    # "arg":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    return-void

    .line 552
    :cond_2
    const/4 v5, 0x3

    if-eq v3, v5, :cond_3

    const/4 v5, 0x4

    if-ne v3, v5, :cond_1

    .line 555
    :cond_3
    const/4 v1, 0x0

    .line 556
    iget-boolean v5, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHFInitiatedCall:Z

    if-eqz v5, :cond_4

    .line 557
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strMemoryCallNum:Ljava/lang/String;

    .line 559
    :cond_4
    const/4 v2, 0x1

    goto :goto_0

    .line 570
    .restart local v0    # "arg":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_5
    const-string v5, "incommingcall"

    const-string v6, "false"

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method private onClickHIDTestHandler(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1156
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->delelteAllDialPadString()Z

    .line 1157
    const-string v3, "**HID TEST MODE** "

    invoke-direct {p0, v3}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1159
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "connected="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    invoke-virtual {v4}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->isConnected()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1167
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 1339
    :goto_0
    :pswitch_0
    return-void

    .line 1161
    :catch_0
    move-exception v0

    .line 1163
    .local v0, "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 1169
    .end local v0    # "e":Landroid/os/RemoteException;
    :pswitch_1
    const-string v1, " action: connect"

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1171
    :try_start_1
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mHfConnectedDeviceAddr:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->connect(Ljava/lang/String;)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 1172
    :catch_1
    move-exception v0

    .line 1174
    .restart local v0    # "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 1180
    .end local v0    # "e":Landroid/os/RemoteException;
    :pswitch_2
    const-string v1, " action: disconnect"

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1182
    :try_start_2
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->disconnect()Z
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 1183
    :catch_2
    move-exception v0

    .line 1185
    .restart local v0    # "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 1194
    .end local v0    # "e":Landroid/os/RemoteException;
    :pswitch_3
    const-string v1, " action: left up"

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1196
    :try_start_3
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    sget-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->hidMouseButtonDown:Z

    const/4 v3, -0x5

    const/4 v4, -0x5

    invoke-virtual {v1, v2, v3, v4}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->sendMouseData(ZII)Z
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_0

    .line 1198
    :catch_3
    move-exception v0

    .line 1200
    .restart local v0    # "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 1206
    .end local v0    # "e":Landroid/os/RemoteException;
    :pswitch_4
    const-string v1, " action: up"

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1208
    :try_start_4
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    sget-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->hidMouseButtonDown:Z

    const/4 v3, 0x0

    const/4 v4, -0x5

    invoke-virtual {v1, v2, v3, v4}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->sendMouseData(ZII)Z
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_0

    .line 1210
    :catch_4
    move-exception v0

    .line 1212
    .restart local v0    # "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 1218
    .end local v0    # "e":Landroid/os/RemoteException;
    :pswitch_5
    const-string v1, " action: right up"

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1220
    :try_start_5
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    sget-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->hidMouseButtonDown:Z

    const/4 v3, 0x5

    const/4 v4, -0x5

    invoke-virtual {v1, v2, v3, v4}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->sendMouseData(ZII)Z
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_0

    .line 1222
    :catch_5
    move-exception v0

    .line 1224
    .restart local v0    # "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 1230
    .end local v0    # "e":Landroid/os/RemoteException;
    :pswitch_6
    const-string v1, " action: left"

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1232
    :try_start_6
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    sget-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->hidMouseButtonDown:Z

    const/4 v3, -0x5

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->sendMouseData(ZII)Z
    :try_end_6
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_0

    .line 1234
    :catch_6
    move-exception v0

    .line 1236
    .restart local v0    # "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 1242
    .end local v0    # "e":Landroid/os/RemoteException;
    :pswitch_7
    sget-boolean v3, Lcom/autochips/bluetooth/BtDialPadActivity;->hidMouseButtonDown:Z

    if-nez v3, :cond_0

    :goto_1
    sput-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->hidMouseButtonDown:Z

    .line 1243
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " action: mouse button "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->hidMouseButtonDown:Z

    if-eqz v1, :cond_1

    const-string v1, "pressed"

    :goto_2
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1246
    :try_start_7
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    sget-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->hidMouseButtonDown:Z

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->sendMouseData(ZII)Z
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_7

    goto/16 :goto_0

    .line 1248
    :catch_7
    move-exception v0

    .line 1250
    .restart local v0    # "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_0
    move v1, v2

    .line 1242
    goto :goto_1

    .line 1243
    :cond_1
    const-string v1, "released"

    goto :goto_2

    .line 1256
    :pswitch_8
    const-string v1, " action: right"

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1258
    :try_start_8
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    sget-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->hidMouseButtonDown:Z

    const/4 v3, 0x5

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->sendMouseData(ZII)Z
    :try_end_8
    .catch Landroid/os/RemoteException; {:try_start_8 .. :try_end_8} :catch_8

    goto/16 :goto_0

    .line 1260
    :catch_8
    move-exception v0

    .line 1262
    .restart local v0    # "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 1268
    .end local v0    # "e":Landroid/os/RemoteException;
    :pswitch_9
    const-string v1, " action: left down"

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1270
    :try_start_9
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    sget-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->hidMouseButtonDown:Z

    const/4 v3, -0x5

    const/4 v4, 0x5

    invoke-virtual {v1, v2, v3, v4}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->sendMouseData(ZII)Z
    :try_end_9
    .catch Landroid/os/RemoteException; {:try_start_9 .. :try_end_9} :catch_9

    goto/16 :goto_0

    .line 1272
    :catch_9
    move-exception v0

    .line 1274
    .restart local v0    # "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 1280
    .end local v0    # "e":Landroid/os/RemoteException;
    :pswitch_a
    const-string v1, " action: down"

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1282
    :try_start_a
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    sget-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->hidMouseButtonDown:Z

    const/4 v3, 0x0

    const/4 v4, 0x5

    invoke-virtual {v1, v2, v3, v4}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->sendMouseData(ZII)Z
    :try_end_a
    .catch Landroid/os/RemoteException; {:try_start_a .. :try_end_a} :catch_a

    goto/16 :goto_0

    .line 1284
    :catch_a
    move-exception v0

    .line 1286
    .restart local v0    # "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 1292
    .end local v0    # "e":Landroid/os/RemoteException;
    :pswitch_b
    const-string v1, " action: right down"

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1294
    :try_start_b
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    sget-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->hidMouseButtonDown:Z

    const/4 v3, 0x5

    const/4 v4, 0x5

    invoke-virtual {v1, v2, v3, v4}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->sendMouseData(ZII)Z
    :try_end_b
    .catch Landroid/os/RemoteException; {:try_start_b .. :try_end_b} :catch_b

    goto/16 :goto_0

    .line 1296
    :catch_b
    move-exception v0

    .line 1298
    .restart local v0    # "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 1304
    .end local v0    # "e":Landroid/os/RemoteException;
    :pswitch_c
    const-string v1, " action: BACK"

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1306
    :try_start_c
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->sendControlData(I)Z
    :try_end_c
    .catch Landroid/os/RemoteException; {:try_start_c .. :try_end_c} :catch_c

    goto/16 :goto_0

    .line 1308
    :catch_c
    move-exception v0

    .line 1310
    .restart local v0    # "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 1316
    .end local v0    # "e":Landroid/os/RemoteException;
    :pswitch_d
    const-string v1, " action: HOME"

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1318
    :try_start_d
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->sendControlData(I)Z
    :try_end_d
    .catch Landroid/os/RemoteException; {:try_start_d .. :try_end_d} :catch_d

    goto/16 :goto_0

    .line 1320
    :catch_d
    move-exception v0

    .line 1322
    .restart local v0    # "e":Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_0

    .line 1167
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0006
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_0
        :pswitch_d
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private onHFConnectDuaringCalling()V
    .locals 4

    .prologue
    .line 496
    const-string v1, "unkown"

    .line 498
    .local v1, "strCurCallNum":Ljava/lang/String;
    sget-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BTDialPadActivity"

    const-string v3, "on HFConnectDuaringCalling "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    :cond_0
    iget-boolean v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsCallUIShowing:Z

    if-nez v2, :cond_1

    .line 500
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 501
    .local v0, "arg":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "incommingcall"

    const-string v3, "false"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 502
    const-string v2, "callnumber"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 503
    const/4 v2, 0x1

    invoke-direct {p0, v2, v0}, Lcom/autochips/bluetooth/BtDialPadActivity;->sendBTDialpadMsg(ILjava/lang/Object;)V

    .line 505
    .end local v0    # "arg":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    return-void
.end method

.method private onProfileStateChange(Landroid/content/Intent;)V
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 477
    const-string v2, "android.bluetooth.profilemanager.extra.ATCPROFILE"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    .line 479
    .local v0, "profile":Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;
    if-nez v0, :cond_1

    .line 480
    sget-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BTDialPadActivity"

    const-string v3, "ACTION_PROFILE_STATE_UPDATE,profilename is null"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    :cond_0
    :goto_0
    return-void

    .line 483
    :cond_1
    sget-object v2, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_HF:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v0, v2}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 484
    const-string v2, "android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE"

    invoke-virtual {p1, v2, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 486
    .local v1, "profilestate":I
    if-ne v1, v3, :cond_2

    .line 487
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHfConnected:Z

    goto :goto_0

    .line 488
    :cond_2
    if-ne v1, v4, :cond_0

    .line 489
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHfConnected:Z

    goto :goto_0
.end method

.method private onScoStateChange(Landroid/content/Intent;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 510
    const-string v1, "com.autochips.bluetooth.BluetoothHfService.extra.EXTRA_NEW_SCO_STATE"

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 511
    .local v0, "ScoState":I
    if-nez v0, :cond_1

    .line 512
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BTDialPadActivity"

    const-string v2, "bt sco disconnect "

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 513
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsCurrentAudioOutputFromAG:Z

    .line 518
    :goto_0
    iget-boolean v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsCurrentAudioOutputFromAG:Z

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->phoneCallShowVoiceOutputSource(Z)V

    .line 519
    return-void

    .line 515
    :cond_1
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_2

    const-string v1, "BTDialPadActivity"

    const-string v2, "bt sco connect "

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    :cond_2
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsCurrentAudioOutputFromAG:Z

    goto :goto_0
.end method

.method private onUpdateMemoryCall(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 450
    const-string v1, "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_MEMORY_CALL_NUMBER"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 452
    .local v0, "strMemoryNumber":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 453
    const-string v1, "BTDialPadActivity"

    const-string v2, "update memory call number "

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 454
    iput-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strMemoryCallNum:Ljava/lang/String;

    .line 456
    :cond_0
    return-void
.end method

.method private phoneCallShowVoiceOutputSource(Z)V
    .locals 4
    .param p1, "fgAudioFromPhone"    # Z

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 522
    if-eqz p1, :cond_1

    .line 523
    sget-boolean v0, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BTDialPadActivity"

    const-string v1, "show  soud from phone "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 525
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 532
    :goto_0
    return-void

    .line 528
    :cond_1
    sget-boolean v0, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v0, :cond_2

    const-string v0, "BTDialPadActivity"

    const-string v1, "show soud from car"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 529
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 530
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0
.end method

.method private sendBTDialpadMsg(ILjava/lang/Object;)V
    .locals 4
    .param p1, "what"    # I
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    .line 629
    const/4 v0, 0x0

    .line 630
    .local v0, "msg":Landroid/os/Message;
    const-string v1, "BTDialPadActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendBTDialpadMsg("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 631
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mBTDialpadMsgHandler:Landroid/os/Handler;

    if-eqz v1, :cond_0

    .line 632
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mBTDialpadMsgHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 633
    iput p1, v0, Landroid/os/Message;->what:I

    .line 634
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 635
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mBTDialpadMsgHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 640
    :goto_0
    return-void

    .line 638
    :cond_0
    const-string v1, "BTDialPadActivity"

    const-string v2, "mBTDialpadMsgHandler is null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private showToast(I)V
    .locals 3
    .param p1, "resid"    # I

    .prologue
    .line 1342
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mToast:Landroid/widget/Toast;

    if-nez v0, :cond_0

    .line 1343
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, ""

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mToast:Landroid/widget/Toast;

    .line 1345
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0, p1}, Landroid/widget/Toast;->setText(I)V

    .line 1346
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1347
    return-void
.end method

.method private showToolongDialog()V
    .locals 3

    .prologue
    .line 753
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->toast_btv:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    .line 760
    :goto_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->toast_btv:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 761
    return-void

    .line 756
    :cond_0
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f07004b

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->toast_btv:Landroid/widget/Toast;

    goto :goto_0
.end method

.method private stopAutoCalloutTestThread()V
    .locals 3

    .prologue
    .line 691
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_thrdAutoCalloutTest:Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;

    if-eqz v1, :cond_1

    .line 693
    :try_start_0
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BTDialPadActivity"

    const-string v2, "AutoCalloutTestThread close."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 694
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_thrdAutoCalloutTest:Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->shutdown()V

    .line 695
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_thrdAutoCalloutTest:Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->join()V

    .line 696
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_thrdAutoCalloutTest:Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;

    .line 697
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "BTDialPadActivity"

    const-string v2, "AutoCalloutTestThread close OK."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 702
    :cond_1
    :goto_0
    return-void

    .line 698
    :catch_0
    move-exception v0

    .line 699
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "BTDialPadActivity"

    const-string v2, "AutoCalloutTestThread close error."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private updateCallStateTextView(Z)V
    .locals 2
    .param p1, "is_active"    # Z

    .prologue
    .line 410
    const v1, 0x7f0a0016

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 411
    .local v0, "callstatus_TV":Landroid/widget/TextView;
    if-eqz p1, :cond_0

    .line 412
    const v1, 0x7f07004f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 417
    :goto_0
    return-void

    .line 414
    :cond_0
    const v1, 0x7f070050

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 10
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const-wide/16 v8, 0xbb8

    const v7, 0x7f07005f

    const/4 v4, 0x1

    .line 956
    sget-boolean v5, Lcom/autochips/bluetooth/BtDialPadActivity;->hidTestMode:Z

    if-eqz v5, :cond_1

    .line 957
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtDialPadActivity;->onClickHIDTestHandler(Landroid/view/View;)V

    .line 1153
    :cond_0
    :goto_0
    return-void

    .line 962
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 1114
    :pswitch_1
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->delelteOneDialPadString()Z

    goto :goto_0

    .line 964
    :pswitch_2
    sget-boolean v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v5, :cond_0

    iget-boolean v5, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->dialButtonPressed:Z

    if-nez v5, :cond_0

    .line 968
    sget-boolean v5, Lcom/autochips/bluetooth/BtDialPadActivity;->hidTestMode:Z

    if-nez v5, :cond_2

    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getCallNumber()Ljava/lang/String;

    move-result-object v5

    const-string v6, "**4438378**"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 969
    sput-boolean v4, Lcom/autochips/bluetooth/BtDialPadActivity;->hidTestMode:Z

    .line 970
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->delelteAllDialPadString()Z

    .line 971
    const-string v4, "**HID TEST MODE** "

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 973
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "connected="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    invoke-virtual {v5}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->isConnected()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 980
    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HIDAdpter:Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;

    const/16 v5, 0x64

    invoke-virtual {v4, v5}, Lcom/autochips/bluetooth/hid/BluetoothHidAdapter;->startHIDSendThread(I)Z

    goto :goto_0

    .line 975
    :catch_0
    move-exception v2

    .line 977
    .local v2, "e":Landroid/os/RemoteException;
    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 985
    .end local v2    # "e":Landroid/os/RemoteException;
    :cond_2
    iput-boolean v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->dialButtonPressed:Z

    .line 986
    new-instance v4, Ljava/util/Timer;

    invoke-direct {v4}, Ljava/util/Timer;-><init>()V

    iput-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mDialButtonTimer:Ljava/util/Timer;

    .line 987
    new-instance v0, Lcom/autochips/bluetooth/BtDialPadActivity$3;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtDialPadActivity$3;-><init>(Lcom/autochips/bluetooth/BtDialPadActivity;)V

    .line 996
    .local v0, "buttonTimertask1":Ljava/util/TimerTask;
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mDialButtonTimer:Ljava/util/Timer;

    invoke-virtual {v4, v0, v8, v9}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 998
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->checkHandsfreeDeviceConnected()Z

    move-result v4

    if-nez v4, :cond_3

    .line 999
    sget-boolean v4, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v4, :cond_0

    const-string v4, "BTDialPadActivity"

    const-string v5, "Bluetooth Hf is not connected"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1003
    :cond_3
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getCallNumber()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 1004
    sget-boolean v4, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v4, :cond_4

    const-string v4, "BTDialPadActivity"

    const-string v5, "call number is empty"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1005
    :cond_4
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->ShowNoticeCallNumberIsEmpty()V

    goto/16 :goto_0

    .line 1009
    :cond_5
    sget-boolean v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mbInRds:Z

    if-eqz v4, :cond_7

    .line 1010
    sget-boolean v4, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v4, :cond_6

    const-string v4, "BTDialPadActivity"

    const-string v5, "Bluetooth RDS exist"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1011
    :cond_6
    invoke-direct {p0, v7}, Lcom/autochips/bluetooth/BtDialPadActivity;->showToast(I)V

    goto/16 :goto_0

    .line 1014
    :cond_7
    const-string v4, ""

    iput-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strPhoneName:Ljava/lang/String;

    .line 1015
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getCallNumber()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strMemoryCallNum:Ljava/lang/String;

    .line 1017
    iget-object v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strMemoryCallNum:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->BluetoothHfCallout(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 1018
    sget-boolean v4, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v4, :cond_8

    const-string v4, "BTDialPadActivity"

    const-string v5, "BluetoothHfCallout sucess"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1019
    :cond_8
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->delelteAllDialPadString()Z

    goto/16 :goto_0

    .line 1022
    :cond_9
    sget-boolean v4, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v4, :cond_0

    const-string v4, "BTDialPadActivity"

    const-string v5, "BluetoothHfCallout failure"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1027
    .end local v0    # "buttonTimertask1":Ljava/util/TimerTask;
    :pswitch_3
    sget-boolean v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-eqz v5, :cond_0

    iget-boolean v5, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->dialButtonPressed:Z

    if-nez v5, :cond_0

    .line 1030
    iput-boolean v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->dialButtonPressed:Z

    .line 1031
    new-instance v5, Ljava/util/Timer;

    invoke-direct {v5}, Ljava/util/Timer;-><init>()V

    iput-object v5, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mDialButtonTimer:Ljava/util/Timer;

    .line 1032
    new-instance v1, Lcom/autochips/bluetooth/BtDialPadActivity$4;

    invoke-direct {v1, p0}, Lcom/autochips/bluetooth/BtDialPadActivity$4;-><init>(Lcom/autochips/bluetooth/BtDialPadActivity;)V

    .line 1041
    .local v1, "buttonTimertask2":Ljava/util/TimerTask;
    iget-object v5, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mDialButtonTimer:Ljava/util/Timer;

    invoke-virtual {v5, v1, v8, v9}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 1043
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->checkHandsfreeDeviceConnected()Z

    move-result v5

    if-nez v5, :cond_a

    .line 1044
    sget-boolean v4, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v4, :cond_0

    const-string v4, "BTDialPadActivity"

    const-string v5, "Bluetooth Hf is not connected"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1047
    :cond_a
    sget-boolean v5, Lcom/autochips/bluetooth/BluetoothReceiver;->mbInRds:Z

    if-eqz v5, :cond_c

    .line 1048
    sget-boolean v4, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v4, :cond_b

    const-string v4, "BTDialPadActivity"

    const-string v5, "Bluetooth RDS exist"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1049
    :cond_b
    invoke-direct {p0, v7}, Lcom/autochips/bluetooth/BtDialPadActivity;->showToast(I)V

    goto/16 :goto_0

    .line 1052
    :cond_c
    iget-object v5, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strMemoryCallNum:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_e

    .line 1053
    sget-boolean v4, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v4, :cond_d

    const-string v4, "BTDialPadActivity"

    const-string v5, "no memory call number"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1054
    :cond_d
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->ShowNoticeDeviceNoMemoryCall()V

    goto/16 :goto_0

    .line 1057
    :cond_e
    const-string v5, ""

    iput-object v5, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strPhoneName:Ljava/lang/String;

    .line 1058
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->delelteAllDialPadString()Z

    .line 1059
    iget-object v5, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strMemoryCallNum:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    .line 1060
    iget-object v5, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strMemoryCallNum:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/autochips/bluetooth/BtDialPadActivity;->BluetoothHfCallout(Ljava/lang/String;)Z

    .line 1062
    iput-boolean v4, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHFInitiatedCall:Z

    goto/16 :goto_0

    .line 1066
    .end local v1    # "buttonTimertask2":Ljava/util/TimerTask;
    :pswitch_4
    const-string v4, "0"

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    goto/16 :goto_0

    .line 1070
    :pswitch_5
    const-string v4, "1"

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    goto/16 :goto_0

    .line 1074
    :pswitch_6
    const-string v4, "2"

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    goto/16 :goto_0

    .line 1078
    :pswitch_7
    const-string v4, "3"

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    goto/16 :goto_0

    .line 1082
    :pswitch_8
    const-string v4, "4"

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    goto/16 :goto_0

    .line 1086
    :pswitch_9
    const-string v4, "5"

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    goto/16 :goto_0

    .line 1090
    :pswitch_a
    const-string v4, "6"

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    goto/16 :goto_0

    .line 1094
    :pswitch_b
    const-string v4, "7"

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    goto/16 :goto_0

    .line 1098
    :pswitch_c
    const-string v4, "8"

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    goto/16 :goto_0

    .line 1102
    :pswitch_d
    const-string v4, "9"

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    goto/16 :goto_0

    .line 1106
    :pswitch_e
    const-string v4, "*"

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    goto/16 :goto_0

    .line 1110
    :pswitch_f
    const-string v4, "#"

    invoke-direct {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    goto/16 :goto_0

    .line 1129
    :pswitch_10
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->bluetoothAnswerPhoneCall()V

    goto/16 :goto_0

    .line 1132
    :pswitch_11
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->bluetoothTerminatePhoneCall()V

    goto/16 :goto_0

    .line 1136
    :pswitch_12
    const-string v5, "BTDialPadActivity"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "bluetoothGetCallValue() = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->bluetoothGetCallValue()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", m_bIsCurrentAudioOutputFromAG="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v7, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsCurrentAudioOutputFromAG:Z

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1137
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->bluetoothGetCallValue()I

    move-result v5

    if-ne v5, v4, :cond_0

    .line 1138
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v5

    if-eqz v5, :cond_10

    .line 1139
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v5

    iget-boolean v6, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsCurrentAudioOutputFromAG:Z

    if-nez v6, :cond_f

    :goto_1
    invoke-virtual {v5, v4}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_SwithAudioTransfer(Z)V

    goto/16 :goto_0

    :cond_f
    const/4 v4, 0x0

    goto :goto_1

    .line 1141
    :cond_10
    sget-boolean v4, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v4, :cond_0

    const-string v4, "BTDialPadActivity"

    const-string v5, "getHfAdapter() is null "

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1146
    :pswitch_13
    new-instance v3, Landroid/content/Intent;

    const-string v4, "com.xyauto.action.checkincallstatus"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1147
    .local v3, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v3}, Lcom/autochips/bluetooth/BtDialPadActivity;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 962
    :pswitch_data_0
    .packed-switch 0x7f0a0006
        :pswitch_1
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_4
        :pswitch_f
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_12
        :pswitch_12
        :pswitch_10
        :pswitch_11
        :pswitch_13
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v4, 0x7f0a0011

    const v3, 0x7f0a0006

    .line 148
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 150
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BTDialPadActivity"

    const-string v2, "onCreate start"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    :cond_0
    iput-object p0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mContext:Landroid/content/Context;

    .line 153
    const v1, 0x7f030002

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->setContentView(I)V

    .line 155
    const v1, 0x7f0a0013

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 156
    const v1, 0x7f0a0014

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 157
    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 158
    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 159
    const v1, 0x7f0a0007

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    const v1, 0x7f0a0008

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 161
    const v1, 0x7f0a0009

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    const v1, 0x7f0a000a

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 163
    const v1, 0x7f0a000b

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 164
    const v1, 0x7f0a000c

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 165
    const v1, 0x7f0a000d

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 166
    const v1, 0x7f0a000e

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 167
    const v1, 0x7f0a000f

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 168
    const v1, 0x7f0a0010

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 169
    const v1, 0x7f0a0012

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    invoke-virtual {p0, v3}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    invoke-virtual {v1, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 172
    invoke-virtual {p0, v3}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    invoke-virtual {v1, p0}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 174
    const v1, 0x7f0a0003

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->bt_dial_layout:Landroid/widget/LinearLayout;

    .line 175
    const v1, 0x7f0a0015

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->bt_incalling_layout:Landroid/widget/LinearLayout;

    .line 177
    const v1, 0x7f0a001b

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_answer_Btn:Landroid/widget/Button;

    .line 178
    const v1, 0x7f0a001c

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->btn_hangup:Landroid/widget/Button;

    .line 179
    const v1, 0x7f0a0019

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    .line 180
    const v1, 0x7f0a001a

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    .line 181
    const v1, 0x7f0a001d

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->btn_gotocall:Landroid/widget/Button;

    .line 182
    const v1, 0x7f0a0018

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_phoneNumber_Tv:Landroid/widget/TextView;

    .line 184
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_answer_Btn:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 185
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->btn_hangup:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 187
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 188
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->btn_gotocall:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 190
    const v1, 0x7f0a0004

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtDialPadActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    .line 192
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 194
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 195
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumber_et:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_callnumstr_edt:Landroid/text/Editable;

    .line 196
    const-string v1, ""

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_strMemoryCallNum:Ljava/lang/String;

    .line 199
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 200
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 201
    const-string v1, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 203
    const-string v1, "com.autochips.bluetooth.BtDialPadActivity.action.BLUETOOTH_HF_CONNECT_FINISH"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 204
    const-string v1, "com.autochips.bluetooth.BluetoothHfService.action.SCO_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 205
    const-string v1, "com.autochips.bluetooth.hf.BluetoothHfUtility.action.callStateChange"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 207
    const-string v1, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.BLUETOOTH_AT_CMD_WARNING"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 208
    const-string v1, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 209
    const-string v1, "com.autochips.bluetooth.BtDialPadActivity.action.BLUETOOTH_UPDATE_MEMORY_CALL"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 210
    const-string v1, "com.autochips.bluetooth.BtDialPadActivity.action.BLUETOOTH_CALLOUT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 211
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/autochips/bluetooth/BtDialPadActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 212
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "BTDialPadActivity"

    const-string v2, "onCreate finish"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    :cond_1
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    if-eqz v1, :cond_6

    .line 216
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_isConnected()Z

    move-result v1

    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHfConnected:Z

    .line 226
    :cond_2
    :goto_0
    invoke-static {p0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v1

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    .line 227
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    if-nez v1, :cond_3

    .line 228
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_3

    const-string v1, "BTDialPadActivity"

    const-string v2, "mLocalManager is null"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    :cond_3
    iget-boolean v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bAutoCalloutTest:Z

    if-eqz v1, :cond_5

    .line 231
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_4

    const-string v1, "BTDialPadActivity"

    const-string v2, "auto calling out test is enabled"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    :cond_4
    new-instance v1, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;-><init>(Lcom/autochips/bluetooth/BtDialPadActivity;Lcom/autochips/bluetooth/BtDialPadActivity$1;)V

    iput-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_thrdAutoCalloutTest:Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;

    .line 233
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_thrdAutoCalloutTest:Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;

    if-eqz v1, :cond_5

    .line 234
    iget-object v1, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_thrdAutoCalloutTest:Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/BtDialPadActivity$autoCalloutTestThread;->start()V

    .line 251
    :cond_5
    return-void

    .line 222
    :cond_6
    sget-boolean v1, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v1, :cond_2

    const-string v1, "BTDialPadActivity"

    const-string v2, "m_hfadpter is null"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 354
    sget-boolean v0, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BTDialPadActivity"

    const-string v1, "+++  onDestroy +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtDialPadActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 357
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bAutoCalloutTest:Z

    if-eqz v0, :cond_1

    .line 358
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->stopAutoCalloutTestThread()V

    .line 360
    :cond_1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 361
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x1

    .line 936
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 937
    .local v0, "id":I
    const v2, 0x7f0a0006

    if-ne v0, v2, :cond_1

    .line 938
    sget-boolean v2, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "BTDialPadActivity"

    const-string v3, "onLongClick R.id.btn_del_num"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 939
    :cond_0
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->delelteAllDialPadString()Z

    .line 946
    :goto_0
    return v1

    .line 942
    :cond_1
    const v2, 0x7f0a0011

    if-ne v0, v2, :cond_2

    .line 943
    const-string v2, "+"

    invoke-direct {p0, v2}, Lcom/autochips/bluetooth/BtDialPadActivity;->addDialPadInputString(Ljava/lang/CharSequence;)Z

    goto :goto_0

    .line 946
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 1365
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 318
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 319
    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsHFInitiatedCall:Z

    .line 320
    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->dialButtonPressed:Z

    .line 321
    sget-boolean v0, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BTDialPadActivity"

    const-string v1, "===== onResume ====="

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    :cond_0
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->bluetoothAudioOutput()Z

    move-result v0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsCurrentAudioOutputFromAG:Z

    .line 323
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtDialPadActivity;->bluetoothGetCallState()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtDialPadActivity;->updateShowbycall(I)V

    .line 324
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 1356
    return-void
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 312
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 313
    sget-boolean v0, Lcom/autochips/bluetooth/BtDialPadActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BTDialPadActivity"

    const-string v1, "===== onStart ====="

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    :cond_0
    return-void
.end method

.method protected updateShowbycall(I)V
    .locals 3
    .param p1, "call"    # I

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x8

    .line 327
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 328
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->bt_dial_layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 329
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->bt_incalling_layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 350
    :cond_0
    :goto_0
    return-void

    .line 331
    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 332
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->bt_incalling_layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 333
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->bt_dial_layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 334
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_answer_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 335
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 336
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 338
    :cond_2
    const/4 v0, 0x3

    if-ne p1, v0, :cond_3

    .line 339
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->bt_incalling_layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 340
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->bt_dial_layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 341
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_answer_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 342
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 343
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 345
    :cond_3
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 346
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->bt_incalling_layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 347
    iget-object v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->bt_dial_layout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 348
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtDialPadActivity;->m_bIsCurrentAudioOutputFromAG:Z

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtDialPadActivity;->phoneCallShowVoiceOutputSource(Z)V

    goto :goto_0
.end method
