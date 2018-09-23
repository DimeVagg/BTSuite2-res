.class public Lcom/autochips/bluetooth/PhoneCallActivity;
.super Landroid/app/Activity;
.source "PhoneCallActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;
    }
.end annotation


# static fields
.field public static final ACTION_ACC_OFF:Ljava/lang/String; = "xy.android.acc.off"

.field public static final ACTION_BLUETOOTH_CALL_STATUS:Ljava/lang/String; = "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS"

.field public static final ACTION_BLUETOOTH_CALL_STATUS_CHANGE:Ljava/lang/String; = "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS_CHANGE"

.field public static final ACTION_BLUETOOTH_NEW_CALL:Ljava/lang/String; = "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_NEW_CALL"

.field public static final ACTION_BT_INCOMING_ANS:Ljava/lang/String; = "xy.xbtheadset.incomingans"

.field public static final ACTION_BT_INCOMING_ANSORHANGUP:Ljava/lang/String; = "xy.xbtheadset.incomingansorhangup"

.field public static final ACTION_BT_INCOMING_REJECT:Ljava/lang/String; = "xy.xbtheadset.incomingreject"

.field public static final CALL_STATE_FINISH:I = 0x0

.field public static final CALL_STATE_START:I = 0x1

.field private static DEBUG:Z = false

.field public static final EXTRA_CALL_HASCALLED:Ljava/lang/String; = "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_HASCALLED"

.field public static final EXTRA_CALL_NAME:Ljava/lang/String; = "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_NAME"

.field public static final EXTRA_CALL_NUMBER:Ljava/lang/String; = "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_NUMBER"

.field public static final EXTRA_CALL_TIME:Ljava/lang/String; = "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_TIME"

.field public static final EXTRA_CALL_TYPE:Ljava/lang/String; = "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_TYPE"

.field private static final TAG:Ljava/lang/String; = "PhoneCallActivity"

.field public static final TYPE_INCOMING:I = 0x1

.field public static final TYPE_MISSED:I = 0x2

.field public static final TYPE_OUTGOING:I = 0x0

.field private static final UNKOWN_PHONE_NUMBER:Ljava/lang/String; = "unkown"


# instance fields
.field private bt_calling_view:Landroid/widget/LinearLayout;

.field call_state_change_intent:Landroid/content/Intent;

.field call_type_intent:Landroid/content/Intent;

.field private finishHandler:Landroid/os/Handler;

.field private finishrunnable:Ljava/lang/Runnable;

.field private mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private mCallMonitorRemainingTime:J

.field private mReceiverRegistered:Z

.field private mStatusBarManager:Landroid/app/StatusBarManager;

.field private mTimerCallMonitor:Ljava/util/Timer;

.field private mTimerStatusMonitor:Ljava/util/Timer;

.field private m_answer_Btn:Landroid/widget/Button;

.field private m_bIsCallActive:Z

.field private m_bIsCurrentAudioOutputFromAG:Z

.field private m_bIsHFInitiateCall:Z

.field private m_bIsIncomingCall:Z

.field private m_bIsMissedCall:Z

.field private m_bIsSoftkeyPadVisible:Z

.field private m_callStartTime:Landroid/text/format/Time;

.field private m_hfadpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

.field private m_phoneNumber_Tv:Landroid/widget/TextView;

.field private m_strPhoneName:Ljava/lang/String;

.field private m_strPhoneNum:Ljava/lang/String;

.field private m_subcallNumber_Et:Landroid/widget/EditText;

.field private m_subcallNumstr_Edt:Landroid/text/Editable;

.field private m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;

.field private m_voiceSourceCar_Btn:Landroid/widget/Button;

.field private m_voiceSourcePhone_Btn:Landroid/widget/Button;

.field private mbCallAudioActive:Z

.field public phoneCallState_new:I

.field timerstatusTask:Ljava/util/TimerTask;

.field update_memory_call_intent:Landroid/content/Intent;

.field private yikaImageBtn:Landroid/widget/ImageButton;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x1

    sput-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 90
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 108
    iput-object v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mTimerCallMonitor:Ljava/util/Timer;

    .line 109
    iput-object v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mTimerStatusMonitor:Ljava/util/Timer;

    .line 110
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mCallMonitorRemainingTime:J

    .line 112
    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsIncomingCall:Z

    .line 113
    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsHFInitiateCall:Z

    .line 114
    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsMissedCall:Z

    .line 115
    iput-boolean v3, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCurrentAudioOutputFromAG:Z

    .line 116
    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCallActive:Z

    .line 117
    iput-boolean v3, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsSoftkeyPadVisible:Z

    .line 119
    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mReceiverRegistered:Z

    .line 120
    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mbCallAudioActive:Z

    .line 123
    iput-object v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;

    .line 160
    iput v3, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->phoneCallState_new:I

    .line 162
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->call_state_change_intent:Landroid/content/Intent;

    .line 163
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_NEW_CALL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->call_type_intent:Landroid/content/Intent;

    .line 164
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.autochips.bluetooth.BtDialPadActivity.action.BLUETOOTH_UPDATE_MEMORY_CALL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->update_memory_call_intent:Landroid/content/Intent;

    .line 402
    new-instance v0, Lcom/autochips/bluetooth/PhoneCallActivity$1;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/PhoneCallActivity$1;-><init>(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->timerstatusTask:Ljava/util/TimerTask;

    .line 685
    new-instance v0, Lcom/autochips/bluetooth/PhoneCallActivity$2;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/PhoneCallActivity$2;-><init>(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 936
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->finishHandler:Landroid/os/Handler;

    .line 937
    new-instance v0, Lcom/autochips/bluetooth/PhoneCallActivity$3;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/PhoneCallActivity$3;-><init>(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->finishrunnable:Ljava/lang/Runnable;

    return-void
.end method

.method private DestroyActivity()V
    .locals 2

    .prologue
    .line 871
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallActivity"

    const-string v1, "Destroy Activity "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 872
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->finishHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->finishrunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 873
    const/4 v0, 0x1

    iput v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->phoneCallState_new:I

    .line 874
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->finish()V

    .line 875
    return-void
.end method

.method static synthetic access$100(Lcom/autochips/bluetooth/PhoneCallActivity;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_hfadpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/autochips/bluetooth/PhoneCallActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCurrentAudioOutputFromAG:Z

    return v0
.end method

.method static synthetic access$1002(Lcom/autochips/bluetooth/PhoneCallActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCurrentAudioOutputFromAG:Z

    return p1
.end method

.method static synthetic access$102(Lcom/autochips/bluetooth/PhoneCallActivity;Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;
    .param p1, "x1"    # Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_hfadpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/autochips/bluetooth/PhoneCallActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/PhoneCallActivity;->phoneCallShowVoiceOutputSource(Z)V

    return-void
.end method

.method static synthetic access$1200(Lcom/autochips/bluetooth/PhoneCallActivity;ZLjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-direct {p0, p1, p2}, Lcom/autochips/bluetooth/PhoneCallActivity;->updatePhoneNumberDisplay(ZLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/autochips/bluetooth/PhoneCallActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->stopAutoAnswerTimeoutThread()V

    return-void
.end method

.method static synthetic access$1400(Lcom/autochips/bluetooth/PhoneCallActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->bluetoothTerminatePhoneCall()V

    return-void
.end method

.method static synthetic access$1500(Lcom/autochips/bluetooth/PhoneCallActivity;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->finishrunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/autochips/bluetooth/PhoneCallActivity;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->finishHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/autochips/bluetooth/PhoneCallActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->bluetoothGetCallValue()I

    move-result v0

    return v0
.end method

.method static synthetic access$1800(Lcom/autochips/bluetooth/PhoneCallActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->bluetoothGetCallsetupValue()I

    move-result v0

    return v0
.end method

.method static synthetic access$1900(Lcom/autochips/bluetooth/PhoneCallActivity;)J
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    iget-wide v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mCallMonitorRemainingTime:J

    return-wide v0
.end method

.method static synthetic access$1922(Lcom/autochips/bluetooth/PhoneCallActivity;J)J
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;
    .param p1, "x1"    # J

    .prologue
    .line 90
    iget-wide v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mCallMonitorRemainingTime:J

    sub-long/2addr v0, p1

    iput-wide v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mCallMonitorRemainingTime:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/autochips/bluetooth/PhoneCallActivity;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2000(Lcom/autochips/bluetooth/PhoneCallActivity;)Ljava/util/Timer;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mTimerCallMonitor:Ljava/util/Timer;

    return-object v0
.end method

.method static synthetic access$2002(Lcom/autochips/bluetooth/PhoneCallActivity;Ljava/util/Timer;)Ljava/util/Timer;
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;
    .param p1, "x1"    # Ljava/util/Timer;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mTimerCallMonitor:Ljava/util/Timer;

    return-object p1
.end method

.method static synthetic access$300()Z
    .locals 1

    .prologue
    .line 90
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    return v0
.end method

.method static synthetic access$400(Lcom/autochips/bluetooth/PhoneCallActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->bluetoothAnswerPhoneCall()V

    return-void
.end method

.method static synthetic access$500(Lcom/autochips/bluetooth/PhoneCallActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->DestroyActivity()V

    return-void
.end method

.method static synthetic access$602(Lcom/autochips/bluetooth/PhoneCallActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsMissedCall:Z

    return p1
.end method

.method static synthetic access$700(Lcom/autochips/bluetooth/PhoneCallActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCallActive:Z

    return v0
.end method

.method static synthetic access$702(Lcom/autochips/bluetooth/PhoneCallActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCallActive:Z

    return p1
.end method

.method static synthetic access$800(Lcom/autochips/bluetooth/PhoneCallActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->onBTPhoneCallActive()V

    return-void
.end method

.method static synthetic access$900(Lcom/autochips/bluetooth/PhoneCallActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->resetBTvolume()V

    return-void
.end method

.method private bluetoothAnswerPhoneCall()V
    .locals 2

    .prologue
    .line 888
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 889
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_AcceptIncommingCall()V

    .line 893
    :cond_0
    :goto_0
    return-void

    .line 891
    :cond_1
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallActivity"

    const-string v1, "getHfAdapter() is null "

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private bluetoothGetCallValue()I
    .locals 2

    .prologue
    .line 1070
    const/4 v0, 0x0

    .line 1072
    .local v0, "call":I
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1073
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallValue()I

    move-result v0

    .line 1075
    :cond_0
    return v0
.end method

.method private bluetoothGetCallsetupValue()I
    .locals 2

    .prologue
    .line 1079
    const/4 v0, 0x0

    .line 1081
    .local v0, "callsetup":I
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1082
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallsetupValue()I

    move-result v0

    .line 1084
    :cond_0
    return v0
.end method

.method private bluetoothGetClipNum()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1088
    const-string v0, ""

    .line 1090
    .local v0, "clipNum":Ljava/lang/String;
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1091
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetClipNumber()Ljava/lang/String;

    move-result-object v0

    .line 1093
    :cond_0
    return-object v0
.end method

.method private bluetoothTerminatePhoneCall()V
    .locals 2

    .prologue
    .line 880
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 881
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_TerminatePhoneCall()V

    .line 885
    :cond_0
    :goto_0
    return-void

    .line 883
    :cond_1
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallActivity"

    const-string v1, "TerminatePhoneCall failure ,getHfAdapter() is null  "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private checkAutoAnswerOption()V
    .locals 2

    .prologue
    .line 271
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsIncomingCall:Z

    if-eqz v0, :cond_1

    .line 272
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->readAutoAnswerData()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 273
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallActivity"

    const-string v1, "auto answer on "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 274
    :cond_0
    new-instance v0, Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;-><init>(Lcom/autochips/bluetooth/PhoneCallActivity;Lcom/autochips/bluetooth/PhoneCallActivity$1;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;

    .line 275
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;

    if-eqz v0, :cond_1

    .line 276
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;->start()V

    .line 283
    :cond_1
    :goto_0
    return-void

    .line 279
    :cond_2
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string v0, "PhoneCallActivity"

    const-string v1, "auto answer off "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;
    .locals 1

    .prologue
    .line 288
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    return-object v0
.end method

.method private initUILayout()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 223
    const v1, 0x7f0a0018

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_phoneNumber_Tv:Landroid/widget/TextView;

    .line 224
    const v1, 0x7f0a002c

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    .line 227
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setInputType(I)V

    .line 228
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 231
    iget-boolean v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsIncomingCall:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCallActive:Z

    if-nez v1, :cond_0

    .line 232
    const v1, 0x7f0a0016

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 233
    .local v0, "callstatus_TV":Landroid/widget/TextView;
    const v1, 0x7f07004d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 235
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 236
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_answer_Btn:Landroid/widget/Button;

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 237
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_answer_Btn:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 240
    .end local v0    # "callstatus_TV":Landroid/widget/TextView;
    :cond_0
    iget-boolean v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCallActive:Z

    if-eqz v1, :cond_1

    .line 242
    invoke-direct {p0, v3}, Lcom/autochips/bluetooth/PhoneCallActivity;->updateCallStateTextView(Z)V

    .line 252
    :cond_1
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneNum:Ljava/lang/String;

    const-string v2, "unkown"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eq v1, v3, :cond_3

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneNum:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 253
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneNum:Ljava/lang/String;

    invoke-direct {p0, v3, v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->updatePhoneNumberDisplay(ZLjava/lang/String;)V

    .line 262
    :cond_2
    :goto_0
    return v3

    .line 254
    :cond_3
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 255
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallingNumber()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneNum:Ljava/lang/String;

    .line 256
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneNum:Ljava/lang/String;

    const-string v2, "unkown"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eq v1, v3, :cond_2

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneNum:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 257
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneNum:Ljava/lang/String;

    invoke-direct {p0, v3, v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->updatePhoneNumberDisplay(ZLjava/lang/String;)V

    goto :goto_0
.end method

.method private notifyUpdateCallHistory()V
    .locals 7

    .prologue
    .line 541
    const/4 v3, 0x0

    .line 542
    .local v3, "call_type":I
    const/4 v0, 0x0

    .line 543
    .local v0, "call_name":Ljava/lang/String;
    const/4 v1, 0x0

    .line 544
    .local v1, "call_number":Ljava/lang/String;
    const/4 v2, 0x0

    .line 546
    .local v2, "call_time":Ljava/lang/String;
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_callStartTime:Landroid/text/format/Time;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneName:Ljava/lang/String;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneNum:Ljava/lang/String;

    if-nez v4, :cond_1

    .line 593
    :cond_0
    :goto_0
    return-void

    .line 552
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_callStartTime:Landroid/text/format/Time;

    iget v5, v5, Landroid/text/format/Time;->year:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_callStartTime:Landroid/text/format/Time;

    iget v5, v5, Landroid/text/format/Time;->month:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_callStartTime:Landroid/text/format/Time;

    iget v5, v5, Landroid/text/format/Time;->monthDay:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 559
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_callStartTime:Landroid/text/format/Time;

    iget v5, v5, Landroid/text/format/Time;->hour:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_callStartTime:Landroid/text/format/Time;

    iget v5, v5, Landroid/text/format/Time;->minute:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_callStartTime:Landroid/text/format/Time;

    iget v5, v5, Landroid/text/format/Time;->second:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 566
    iget-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsIncomingCall:Z

    if-eqz v4, :cond_4

    .line 567
    iget-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsMissedCall:Z

    if-eqz v4, :cond_3

    .line 568
    const/4 v3, 0x2

    .line 575
    :goto_1
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneName:Ljava/lang/String;

    .line 576
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneNum:Ljava/lang/String;

    .line 579
    sget-boolean v4, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v4, :cond_2

    const-string v4, "PhoneCallActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "notify UpdateCallHistory "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 581
    :cond_2
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->call_type_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_TYPE"

    invoke-virtual {v4, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 582
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->call_type_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_NAME"

    invoke-virtual {v4, v5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 583
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->call_type_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_NUMBER"

    invoke-virtual {v4, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 584
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->call_type_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_TIME"

    invoke-virtual {v4, v5, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 585
    iget-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCallActive:Z

    if-nez v4, :cond_5

    iget-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsIncomingCall:Z

    if-eqz v4, :cond_5

    .line 586
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->call_type_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_HASCALLED"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 591
    :goto_2
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->call_type_intent:Landroid/content/Intent;

    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/PhoneCallActivity;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 570
    :cond_3
    const/4 v3, 0x1

    goto :goto_1

    .line 573
    :cond_4
    const/4 v3, 0x0

    goto :goto_1

    .line 589
    :cond_5
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->call_type_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_HASCALLED"

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_2
.end method

.method private onBTPhoneCallActive()V
    .locals 3

    .prologue
    .line 829
    sget-boolean v1, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "PhoneCallActivity"

    const-string v2, "onBTPhoneCallActive"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 831
    :cond_0
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->updateCallStateTextView(Z)V

    .line 832
    iget-boolean v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsIncomingCall:Z

    if-eqz v1, :cond_1

    .line 833
    const v1, 0x7f0a001b

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 834
    .local v0, "answer_btn":Landroid/widget/Button;
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 837
    .end local v0    # "answer_btn":Landroid/widget/Button;
    :cond_1
    iget-boolean v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCurrentAudioOutputFromAG:Z

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->phoneCallShowVoiceOutputSource(Z)V

    .line 843
    return-void
.end method

.method private parseActivityParms()Z
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 175
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 177
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "PhoneNumber"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneNum:Ljava/lang/String;

    .line 178
    const-string v2, "PhoneName"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneName:Ljava/lang/String;

    .line 179
    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneName:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 180
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "PhoneCallActivity"

    const-string v3, "m_strPhoneName is null "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    :cond_0
    const-string v2, ""

    iput-object v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneName:Ljava/lang/String;

    .line 185
    :cond_1
    const-string v2, "isIncomingCall"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 186
    .local v1, "strParam":Ljava/lang/String;
    if-eqz v1, :cond_6

    .line 187
    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsIncomingCall:Z

    .line 191
    :cond_2
    :goto_0
    const-string v2, "isHFInitiated"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 192
    if-eqz v1, :cond_7

    .line 193
    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsHFInitiateCall:Z

    .line 198
    :cond_3
    :goto_1
    iget-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsIncomingCall:Z

    if-eqz v2, :cond_8

    .line 199
    iput-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsMissedCall:Z

    .line 200
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v2, :cond_4

    const-string v2, "PhoneCallActivity"

    const-string v3, "incoming call "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    :cond_4
    :goto_2
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->bluetoothGetCallValue()I

    move-result v2

    if-ne v2, v4, :cond_5

    .line 207
    iput-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCallActive:Z

    .line 208
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v2, :cond_5

    const-string v2, "PhoneCallActivity"

    const-string v3, "parseActivityParms ,call is active "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    :cond_5
    return v4

    .line 189
    :cond_6
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v2, :cond_2

    const-string v2, "PhoneCallActivity"

    const-string v3, "isIncomingCall param is null "

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 195
    :cond_7
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v2, :cond_3

    const-string v2, "PhoneCallActivity"

    const-string v3, "isHFInitiated param is null "

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 202
    :cond_8
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v2, :cond_9

    const-string v2, "PhoneCallActivity"

    const-string v3, "outgoing call "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    :cond_9
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsMissedCall:Z

    goto :goto_2
.end method

.method private phoneCallShowSoftkeyPad(Z)V
    .locals 5
    .param p1, "fgShow"    # Z

    .prologue
    const/4 v4, 0x0

    .line 898
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 899
    .local v0, "res":Landroid/content/res/Resources;
    const v2, 0x7f0a002b

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 900
    .local v1, "softkeyPadLayout":Landroid/widget/LinearLayout;
    if-eqz p1, :cond_1

    .line 901
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "PhoneCallActivity"

    const-string v3, "Show SoftkeyPad "

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 902
    :cond_0
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 903
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsSoftkeyPadVisible:Z

    .line 911
    :goto_0
    return-void

    .line 906
    :cond_1
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v2, :cond_2

    const-string v2, "PhoneCallActivity"

    const-string v3, "hide SoftkeyPad"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 908
    :cond_2
    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 909
    iput-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsSoftkeyPadVisible:Z

    goto :goto_0
.end method

.method private phoneCallShowVoiceOutputSource(Z)V
    .locals 4
    .param p1, "fgAudioFromPhone"    # Z

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 916
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsIncomingCall:Z

    if-eqz v0, :cond_1

    .line 917
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCallActive:Z

    if-nez v0, :cond_1

    .line 918
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallActivity"

    const-string v1, "incoming call is not active,don\'t show the button"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 933
    :cond_0
    :goto_0
    return-void

    .line 923
    :cond_1
    if-eqz p1, :cond_3

    .line 924
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_2

    const-string v0, "PhoneCallActivity"

    const-string v1, "show  soud from phone "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 925
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 926
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 929
    :cond_3
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_4

    const-string v0, "PhoneCallActivity"

    const-string v1, "show soud from car"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 930
    :cond_4
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 931
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0
.end method

.method private readAutoAnswerData()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 478
    const-string v1, "bt.setting.autoanswer"

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 479
    .local v0, "sharedata":Landroid/content/SharedPreferences;
    const-string v1, "IS_BT_AUTO_ANSWER"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method private resetBTvolume()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 672
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "btMcuMuteState"

    invoke-static {v4, v5, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    .line 673
    .local v1, "iMute":I
    const-string v4, "audio"

    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/PhoneCallActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/AudioManager;

    .line 674
    .local v2, "mAudioManager":Landroid/media/AudioManager;
    if-eqz v2, :cond_0

    .line 675
    const/4 v4, 0x6

    invoke-virtual {v2, v4}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    .line 676
    .local v0, "bt_v":I
    invoke-virtual {v2}, Landroid/media/AudioManager;->getMasterMaxVolume()I

    move-result v3

    .line 677
    .local v3, "mMasterVolume":I
    if-eqz v1, :cond_1

    .line 678
    invoke-static {v6}, Lcom/autochips/settings/AtcSettings$Audio;->SetBTHFPVolume(I)I

    .line 684
    .end local v0    # "bt_v":I
    .end local v3    # "mMasterVolume":I
    :cond_0
    :goto_0
    return-void

    .line 681
    .restart local v0    # "bt_v":I
    .restart local v3    # "mMasterVolume":I
    :cond_1
    mul-int/lit16 v4, v0, 0xff

    div-int/2addr v4, v3

    invoke-static {v4}, Lcom/autochips/settings/AtcSettings$Audio;->SetBTHFPVolume(I)I

    goto :goto_0
.end method

.method private declared-synchronized scheduleCallMonitor(J)V
    .locals 6
    .param p1, "lastPeriodMs"    # J

    .prologue
    .line 1096
    monitor-enter p0

    :try_start_0
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "scheduleCallMonitor, Period = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1098
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mTimerCallMonitor:Ljava/util/Timer;

    if-nez v0, :cond_3

    .line 1099
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string v0, "PhoneCallActivity"

    const-string v2, "scheduleCallMonitor, new timer."

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1104
    :cond_1
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mTimerCallMonitor:Ljava/util/Timer;

    .line 1105
    iput-wide p1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mCallMonitorRemainingTime:J

    .line 1108
    new-instance v1, Lcom/autochips/bluetooth/PhoneCallActivity$4;

    invoke-direct {v1, p0}, Lcom/autochips/bluetooth/PhoneCallActivity$4;-><init>(Lcom/autochips/bluetooth/PhoneCallActivity;)V

    .line 1129
    .local v1, "timerTask":Ljava/util/TimerTask;
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mTimerCallMonitor:Ljava/util/Timer;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x64

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1130
    .end local v1    # "timerTask":Ljava/util/TimerTask;
    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    .line 1101
    :cond_3
    :try_start_1
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_2

    const-string v0, "PhoneCallActivity"

    const-string v2, "scheduleCallMonitor, mTimerCallMonitor existed."

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1096
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private stopAutoAnswerTimeoutThread()V
    .locals 3

    .prologue
    .line 519
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;

    if-eqz v1, :cond_1

    .line 521
    :try_start_0
    sget-boolean v1, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "PhoneCallActivity"

    const-string v2, "mConnectTimeout close."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 522
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;->shutdown()V

    .line 523
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;->join()V

    .line 524
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallActivity$autoAnswerTimeoutThread;

    .line 525
    sget-boolean v1, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "PhoneCallActivity"

    const-string v2, "thread AutoAnswerTimeout close OK."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 530
    :cond_1
    :goto_0
    return-void

    .line 526
    :catch_0
    move-exception v0

    .line 527
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-boolean v1, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "PhoneCallActivity"

    const-string v2, "thread AutoAnswerTimeout close error."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private updateCallStateTextView(Z)V
    .locals 2
    .param p1, "is_active"    # Z

    .prologue
    .line 606
    const v1, 0x7f0a0016

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 607
    .local v0, "callstatus_TV":Landroid/widget/TextView;
    if-eqz p1, :cond_0

    .line 608
    const v1, 0x7f07004f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 613
    :goto_0
    return-void

    .line 610
    :cond_0
    const v1, 0x7f070050

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method

.method private updatePhoneNumberDisplay(ZLjava/lang/String;)V
    .locals 3
    .param p1, "fgForeUpdate"    # Z
    .param p2, "strPhoneNumber"    # Ljava/lang/String;

    .prologue
    .line 626
    if-nez p2, :cond_1

    .line 661
    :cond_0
    :goto_0
    return-void

    .line 629
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 630
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallActivity"

    const-string v1, "phonenumber is empty"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 634
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneNum:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz p1, :cond_6

    .line 636
    :cond_3
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_4

    const-string v0, "PhoneCallActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "m_phoneNumber_Tv setText "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 637
    :cond_4
    iput-object p2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneNum:Ljava/lang/String;

    .line 639
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneName:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 640
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v0, :cond_7

    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mHfConnectedDeviceAddr:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 642
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mHfConnectedDeviceAddr:Ljava/lang/String;

    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneNum:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetNameByTelExectly(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneName:Ljava/lang/String;

    .line 649
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneName:Ljava/lang/String;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_8

    .line 650
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_phoneNumber_Tv:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_strPhoneName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 657
    :cond_6
    :goto_2
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsIncomingCall:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsHFInitiateCall:Z

    if-nez v0, :cond_0

    .line 658
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->update_memory_call_intent:Landroid/content/Intent;

    const-string v1, "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_MEMORY_CALL_NUMBER"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 659
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->update_memory_call_intent:Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 645
    :cond_7
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_5

    const-string v0, "PhoneCallActivity"

    const-string v1, "BluetoothReceiver.mConnectedDevice is Null! "

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 652
    :cond_8
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_phoneNumber_Tv:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2
.end method


# virtual methods
.method public addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z
    .locals 3
    .param p1, "str"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v1, 0x0

    .line 848
    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    if-nez v2, :cond_1

    .line 865
    :cond_0
    :goto_0
    return v1

    .line 851
    :cond_1
    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    .line 852
    .local v0, "index":I
    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getEditableText()Landroid/text/Editable;

    move-result-object v2

    iput-object v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumstr_Edt:Landroid/text/Editable;

    .line 854
    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumstr_Edt:Landroid/text/Editable;

    if-eqz v2, :cond_0

    .line 857
    if-ltz v0, :cond_2

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumstr_Edt:Landroid/text/Editable;

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    if-le v0, v1, :cond_3

    .line 858
    :cond_2
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumstr_Edt:Landroid/text/Editable;

    invoke-interface {v1, p1}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    .line 862
    :goto_1
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumstr_Edt:Landroid/text/Editable;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 863
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    .line 865
    const/4 v1, 0x1

    goto :goto_0

    .line 860
    :cond_3
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_subcallNumstr_Edt:Landroid/text/Editable;

    invoke-interface {v1, v0, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    goto :goto_1
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 469
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 946
    const/4 v1, 0x0

    .line 947
    .local v1, "dtmf_code":Ljava/lang/String;
    const/4 v0, 0x0

    .line 950
    .local v0, "bsenddtmf":Z
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 1058
    :cond_0
    :goto_0
    :pswitch_0
    iget-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCallActive:Z

    if-eqz v2, :cond_1

    .line 1059
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    .line 1060
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 1061
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_SendDTMFCode(Ljava/lang/String;)V

    .line 1067
    :cond_1
    :goto_1
    return-void

    .line 952
    :pswitch_1
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->bluetoothTerminatePhoneCall()V

    .line 953
    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->finishHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->finishrunnable:Ljava/lang/Runnable;

    const-wide/16 v4, 0x3e8

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 954
    const-string v2, "PhoneCallActivity"

    const-string v3, "btn_hangup onClick !!!"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 958
    :pswitch_2
    iget-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCallActive:Z

    if-nez v2, :cond_2

    .line 959
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->bluetoothAnswerPhoneCall()V

    .line 961
    :cond_2
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->stopAutoAnswerTimeoutThread()V

    goto :goto_0

    .line 965
    :pswitch_3
    iget-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsSoftkeyPadVisible:Z

    if-nez v4, :cond_3

    :goto_2
    invoke-direct {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->phoneCallShowSoftkeyPad(Z)V

    goto :goto_0

    :cond_3
    move v2, v3

    goto :goto_2

    .line 971
    :pswitch_4
    sget-boolean v4, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v4, :cond_4

    const-string v4, "PhoneCallActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onClick:m_bIsCurrentAudioOutputFromAG="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v6, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCurrentAudioOutputFromAG:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 972
    :cond_4
    iget-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCallActive:Z

    if-ne v4, v2, :cond_0

    .line 973
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 974
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v4

    iget-boolean v5, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCurrentAudioOutputFromAG:Z

    if-nez v5, :cond_5

    :goto_3
    invoke-virtual {v4, v2}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_SwithAudioTransfer(Z)V

    goto :goto_0

    :cond_5
    move v2, v3

    goto :goto_3

    .line 976
    :cond_6
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "PhoneCallActivity"

    const-string v3, "getHfAdapter() is null "

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 983
    :pswitch_5
    const-string v2, "0"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 984
    const-string v1, "0"

    .line 985
    const/4 v0, 0x1

    .line 986
    goto/16 :goto_0

    .line 989
    :pswitch_6
    const-string v2, "1"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 990
    const-string v1, "1"

    .line 991
    const/4 v0, 0x1

    .line 992
    goto/16 :goto_0

    .line 995
    :pswitch_7
    const-string v2, "2"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 996
    const-string v1, "2"

    .line 997
    const/4 v0, 0x1

    .line 998
    goto/16 :goto_0

    .line 1001
    :pswitch_8
    const-string v2, "3"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1002
    const-string v1, "3"

    .line 1003
    const/4 v0, 0x1

    .line 1004
    goto/16 :goto_0

    .line 1007
    :pswitch_9
    const-string v2, "4"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1008
    const-string v1, "4"

    .line 1009
    const/4 v0, 0x1

    .line 1010
    goto/16 :goto_0

    .line 1013
    :pswitch_a
    const-string v2, "5"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1014
    const-string v1, "5"

    .line 1015
    const/4 v0, 0x1

    .line 1016
    goto/16 :goto_0

    .line 1019
    :pswitch_b
    const-string v2, "6"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1020
    const-string v1, "6"

    .line 1021
    const/4 v0, 0x1

    .line 1022
    goto/16 :goto_0

    .line 1025
    :pswitch_c
    const-string v2, "7"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1026
    const-string v1, "7"

    .line 1027
    const/4 v0, 0x1

    .line 1028
    goto/16 :goto_0

    .line 1031
    :pswitch_d
    const-string v2, "8"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1032
    const-string v1, "8"

    .line 1033
    const/4 v0, 0x1

    .line 1034
    goto/16 :goto_0

    .line 1037
    :pswitch_e
    const-string v2, "9"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1038
    const-string v1, "9"

    .line 1039
    const/4 v0, 0x1

    .line 1040
    goto/16 :goto_0

    .line 1043
    :pswitch_f
    const-string v2, "*"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1044
    const-string v1, "*"

    .line 1045
    const/4 v0, 0x1

    .line 1046
    goto/16 :goto_0

    .line 1049
    :pswitch_10
    const-string v2, "#"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1050
    const-string v1, "#"

    .line 1051
    const/4 v0, 0x1

    .line 1052
    goto/16 :goto_0

    .line 1063
    :cond_7
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v2, :cond_1

    const-string v2, "PhoneCallActivity"

    const-string v3, "getHfAdapter() is null "

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 950
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0019
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_5
        :pswitch_f
        :pswitch_10
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x1

    .line 294
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallActivity"

    const-string v1, "+++ onCreate +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mReceiverRegistered:Z

    .line 296
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 297
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->setVolumeControlStream(I)V

    .line 298
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_hfadpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    .line 299
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->bluetoothGetCallValue()I

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->bluetoothGetCallsetupValue()I

    move-result v0

    if-nez v0, :cond_1

    .line 301
    const-string v0, "PhoneCallActivity"

    const-string v1, "Call had been ended before this activity create."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->DestroyActivity()V

    .line 400
    :goto_0
    return-void

    .line 305
    :cond_1
    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallActivity;->requestWindowFeature(I)Z

    .line 308
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    .line 309
    .local v9, "res":Landroid/content/res/Resources;
    const v0, 0x7f020023

    invoke-virtual {v9, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 310
    .local v7, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 312
    const v0, 0x7f030004

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->setContentView(I)V

    .line 313
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_callStartTime:Landroid/text/format/Time;

    .line 314
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_callStartTime:Landroid/text/format/Time;

    invoke-virtual {v0}, Landroid/text/format/Time;->setToNow()V

    .line 316
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->parseActivityParms()Z

    .line 318
    const v0, 0x7f0a001b

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_answer_Btn:Landroid/widget/Button;

    .line 319
    const v0, 0x7f0a0019

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    .line 320
    const v0, 0x7f0a001a

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    .line 322
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->initUILayout()Z

    .line 324
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 325
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 326
    const v0, 0x7f0a001c

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 327
    const v0, 0x7f0a002a

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 328
    const v0, 0x7f0a0036

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 329
    const v0, 0x7f0a002d

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 330
    const v0, 0x7f0a002e

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 331
    const v0, 0x7f0a002f

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 332
    const v0, 0x7f0a0030

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 333
    const v0, 0x7f0a0031

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 334
    const v0, 0x7f0a0032

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 335
    const v0, 0x7f0a0033

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 336
    const v0, 0x7f0a0034

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 337
    const v0, 0x7f0a0035

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 338
    const v0, 0x7f0a0037

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 339
    const v0, 0x7f0a0038

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 342
    new-instance v8, Landroid/content/IntentFilter;

    invoke-direct {v8}, Landroid/content/IntentFilter;-><init>()V

    .line 343
    .local v8, "filter":Landroid/content/IntentFilter;
    const-string v0, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 344
    const-string v0, "com.autochips.bluetooth.BluetoothHfService.action.SCO_STATE_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 347
    const-string v0, "com.autochips.bluetooth.hf.BluetoothHfUtility.action.callStateChange"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 348
    const-string v0, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.PHONE_NUMBER_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 349
    const-string v0, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.AG_VOLUME_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 350
    const-string v0, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.AG_MIC_GAIN_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 351
    const-string v0, "autochips.intent.action.QB_POWEROFF"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 352
    const-string v0, "xy.android.acc.off"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 353
    const-string v0, "xy.xbtheadset.incomingans"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 354
    const-string v0, "xy.xbtheadset.incomingansorhangup"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 355
    const-string v0, "xy.xbtheadset.incomingreject"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 356
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->bluetoothGetCallValue()I

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->bluetoothGetCallsetupValue()I

    move-result v0

    if-nez v0, :cond_2

    .line 358
    const-string v0, "PhoneCallActivity"

    const-string v1, "Call had been ended before registerReceiver."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->DestroyActivity()V

    goto/16 :goto_0

    .line 362
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0, v8}, Lcom/autochips/bluetooth/PhoneCallActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 363
    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mReceiverRegistered:Z

    .line 365
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 367
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_IsAudioTransferTowardsAG()Z

    move-result v0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCurrentAudioOutputFromAG:Z

    .line 368
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCurrentAudioOutputFromAG:Z

    if-eqz v0, :cond_6

    .line 369
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_3

    const-string v0, "PhoneCallActivity"

    const-string v1, " audio towards phone"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    :cond_3
    :goto_1
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsIncomingCall:Z

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCallActive:Z

    if-eqz v0, :cond_5

    .line 382
    :cond_4
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->m_bIsCurrentAudioOutputFromAG:Z

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->phoneCallShowVoiceOutputSource(Z)V

    .line 383
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->resetBTvolume()V

    .line 386
    :cond_5
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->checkAutoAnswerOption()V

    .line 387
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mTimerStatusMonitor:Ljava/util/Timer;

    .line 388
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mTimerStatusMonitor:Ljava/util/Timer;

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->timerstatusTask:Ljava/util/TimerTask;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x9c4

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 389
    const-string v0, "statusbar"

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/StatusBarManager;

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mStatusBarManager:Landroid/app/StatusBarManager;

    .line 391
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x111004d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v6

    .line 392
    .local v6, "ballowbthome":Z
    if-nez v6, :cond_8

    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-eqz v0, :cond_8

    .line 393
    const-string v0, "PhoneCallActivity"

    const-string v1, " Disable StatusBarManager.DISABLE_EXPAND"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 394
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mStatusBarManager:Landroid/app/StatusBarManager;

    const/high16 v1, 0x10000

    invoke-virtual {v0, v1}, Landroid/app/StatusBarManager;->disable(I)V

    goto/16 :goto_0

    .line 371
    .end local v6    # "ballowbthome":Z
    :cond_6
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_3

    const-string v0, "PhoneCallActivity"

    const-string v1, " audio towards carkit"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 378
    :cond_7
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_3

    const-string v0, "PhoneCallActivity"

    const-string v1, "can not get getHfAdapter() "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 396
    .restart local v6    # "ballowbthome":Z
    :cond_8
    const-string v0, "PhoneCallActivity"

    const-string v1, " get STATUS_BAR_SERVICE fail!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 432
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mTimerStatusMonitor:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 433
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mTimerStatusMonitor:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 435
    :cond_0
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mReceiverRegistered:Z

    if-eqz v0, :cond_1

    .line 436
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 438
    :cond_1
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->call_state_change_intent:Landroid/content/Intent;

    const-string v1, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 440
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->call_state_change_intent:Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 442
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mReceiverRegistered:Z

    if-eqz v0, :cond_2

    .line 443
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallActivity;->notifyUpdateCallHistory()V

    .line 445
    :cond_2
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_3

    const-string v0, "PhoneCallActivity"

    const-string v1, "===== onDestroy ====="

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 447
    :cond_3
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-eqz v0, :cond_4

    .line 448
    const-string v0, "PhoneCallActivity"

    const-string v1, " Disable StatusBarManager.DISABLE_NONE"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->mStatusBarManager:Landroid/app/StatusBarManager;

    invoke-virtual {v0, v2}, Landroid/app/StatusBarManager;->disable(I)V

    .line 453
    :goto_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 454
    return-void

    .line 451
    :cond_4
    const-string v0, "PhoneCallActivity"

    const-string v1, " get STATUS_BAR_SERVICE fail!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 416
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 417
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 418
    const-string v0, "PhoneCallActivity"

    const-string v1, "+++ onResume +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    :cond_0
    return-void
.end method

.method protected onStart()V
    .locals 3

    .prologue
    .line 423
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 424
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallActivity"

    const-string v1, "===== onStart ====="

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 425
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->call_state_change_intent:Landroid/content/Intent;

    const-string v1, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 427
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallActivity;->call_state_change_intent:Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 428
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 460
    const/4 v0, 0x1

    return v0
.end method
