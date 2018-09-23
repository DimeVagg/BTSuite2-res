.class public Lcom/autochips/bluetooth/PhoneCallYkActivity;
.super Landroid/app/Activity;
.source "PhoneCallYkActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;
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

.field private static final TAG:Ljava/lang/String; = "PhoneCallYkActivity"

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

.field private m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;

.field private m_voiceSourceCar_Btn:Landroid/widget/Button;

.field private m_voiceSourcePhone_Btn:Landroid/widget/Button;

.field private mbCallAudioActive:Z

.field timerstatusTask:Ljava/util/TimerTask;

.field update_memory_call_intent:Landroid/content/Intent;

.field private xyTime:Ljava/util/Timer;

.field private xyTimerTask:Ljava/util/TimerTask;

.field private yikaImageBtn:Landroid/widget/ImageButton;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x1

    sput-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 90
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 111
    iput-object v3, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mTimerCallMonitor:Ljava/util/Timer;

    .line 112
    iput-object v3, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mTimerStatusMonitor:Ljava/util/Timer;

    .line 113
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mCallMonitorRemainingTime:J

    .line 115
    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsIncomingCall:Z

    .line 116
    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsHFInitiateCall:Z

    .line 117
    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsMissedCall:Z

    .line 118
    iput-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCurrentAudioOutputFromAG:Z

    .line 119
    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCallActive:Z

    .line 120
    iput-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsSoftkeyPadVisible:Z

    .line 122
    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mReceiverRegistered:Z

    .line 123
    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mbCallAudioActive:Z

    .line 126
    iput-object v3, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;

    .line 164
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->call_state_change_intent:Landroid/content/Intent;

    .line 165
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_NEW_CALL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->call_type_intent:Landroid/content/Intent;

    .line 166
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.autochips.bluetooth.BtDialPadActivity.action.BLUETOOTH_UPDATE_MEMORY_CALL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->update_memory_call_intent:Landroid/content/Intent;

    .line 447
    new-instance v0, Lcom/autochips/bluetooth/PhoneCallYkActivity$2;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity$2;-><init>(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->timerstatusTask:Ljava/util/TimerTask;

    .line 745
    new-instance v0, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity$3;-><init>(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 994
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->finishHandler:Landroid/os/Handler;

    .line 995
    new-instance v0, Lcom/autochips/bluetooth/PhoneCallYkActivity$4;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity$4;-><init>(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->finishrunnable:Ljava/lang/Runnable;

    return-void
.end method

.method private DestroyActivity()V
    .locals 2

    .prologue
    .line 930
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallYkActivity"

    const-string v1, "Destroy Activity "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 931
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->finishHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->finishrunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 932
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->finish()V

    .line 933
    return-void
.end method

.method static synthetic access$100(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->bluetoothTerminatePhoneCall()V

    return-void
.end method

.method static synthetic access$1000(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCallActive:Z

    return v0
.end method

.method static synthetic access$1002(Lcom/autochips/bluetooth/PhoneCallYkActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCallActive:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->onBTPhoneCallActive()V

    return-void
.end method

.method static synthetic access$1200(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->resetBTvolume()V

    return-void
.end method

.method static synthetic access$1300(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCurrentAudioOutputFromAG:Z

    return v0
.end method

.method static synthetic access$1302(Lcom/autochips/bluetooth/PhoneCallYkActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCurrentAudioOutputFromAG:Z

    return p1
.end method

.method static synthetic access$1400(Lcom/autochips/bluetooth/PhoneCallYkActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->phoneCallShowVoiceOutputSource(Z)V

    return-void
.end method

.method static synthetic access$1500(Lcom/autochips/bluetooth/PhoneCallYkActivity;ZLjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-direct {p0, p1, p2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->updatePhoneNumberDisplay(ZLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->stopAutoAnswerTimeoutThread()V

    return-void
.end method

.method static synthetic access$1700(Lcom/autochips/bluetooth/PhoneCallYkActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->bluetoothGetCallValue()I

    move-result v0

    return v0
.end method

.method static synthetic access$1800(Lcom/autochips/bluetooth/PhoneCallYkActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->bluetoothGetCallsetupValue()I

    move-result v0

    return v0
.end method

.method static synthetic access$1900(Lcom/autochips/bluetooth/PhoneCallYkActivity;)J
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    iget-wide v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mCallMonitorRemainingTime:J

    return-wide v0
.end method

.method static synthetic access$1922(Lcom/autochips/bluetooth/PhoneCallYkActivity;J)J
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;
    .param p1, "x1"    # J

    .prologue
    .line 90
    iget-wide v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mCallMonitorRemainingTime:J

    sub-long/2addr v0, p1

    iput-wide v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mCallMonitorRemainingTime:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->finishrunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Ljava/util/Timer;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mTimerCallMonitor:Ljava/util/Timer;

    return-object v0
.end method

.method static synthetic access$2002(Lcom/autochips/bluetooth/PhoneCallYkActivity;Ljava/util/Timer;)Ljava/util/Timer;
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;
    .param p1, "x1"    # Ljava/util/Timer;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mTimerCallMonitor:Ljava/util/Timer;

    return-object p1
.end method

.method static synthetic access$300(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->finishHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$400(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_hfadpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    return-object v0
.end method

.method static synthetic access$402(Lcom/autochips/bluetooth/PhoneCallYkActivity;Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;
    .param p1, "x1"    # Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_hfadpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    return-object p1
.end method

.method static synthetic access$500(Lcom/autochips/bluetooth/PhoneCallYkActivity;)Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600()Z
    .locals 1

    .prologue
    .line 90
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    return v0
.end method

.method static synthetic access$700(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->bluetoothAnswerPhoneCall()V

    return-void
.end method

.method static synthetic access$800(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DestroyActivity()V

    return-void
.end method

.method static synthetic access$902(Lcom/autochips/bluetooth/PhoneCallYkActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/PhoneCallYkActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsMissedCall:Z

    return p1
.end method

.method private bluetoothAnswerPhoneCall()V
    .locals 2

    .prologue
    .line 946
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 947
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_AcceptIncommingCall()V

    .line 951
    :cond_0
    :goto_0
    return-void

    .line 949
    :cond_1
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallYkActivity"

    const-string v1, "getHfAdapter() is null "

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private bluetoothGetCallValue()I
    .locals 2

    .prologue
    .line 1126
    const/4 v0, 0x0

    .line 1128
    .local v0, "call":I
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1129
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallValue()I

    move-result v0

    .line 1131
    :cond_0
    return v0
.end method

.method private bluetoothGetCallsetupValue()I
    .locals 2

    .prologue
    .line 1135
    const/4 v0, 0x0

    .line 1137
    .local v0, "callsetup":I
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1138
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallsetupValue()I

    move-result v0

    .line 1140
    :cond_0
    return v0
.end method

.method private bluetoothGetClipNum()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1144
    const-string v0, ""

    .line 1146
    .local v0, "clipNum":Ljava/lang/String;
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1147
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetClipNumber()Ljava/lang/String;

    move-result-object v0

    .line 1149
    :cond_0
    return-object v0
.end method

.method private bluetoothTerminatePhoneCall()V
    .locals 2

    .prologue
    .line 938
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 939
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_TerminatePhoneCall()V

    .line 943
    :cond_0
    :goto_0
    return-void

    .line 941
    :cond_1
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallYkActivity"

    const-string v1, "TerminatePhoneCall failure ,getHfAdapter() is null  "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private checkAutoAnswerOption()V
    .locals 2

    .prologue
    .line 273
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsIncomingCall:Z

    if-eqz v0, :cond_1

    .line 274
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->readAutoAnswerData()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 275
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallYkActivity"

    const-string v1, "auto answer on "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    :cond_0
    new-instance v0, Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;-><init>(Lcom/autochips/bluetooth/PhoneCallYkActivity;Lcom/autochips/bluetooth/PhoneCallYkActivity$1;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;

    .line 277
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;

    if-eqz v0, :cond_1

    .line 278
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;->start()V

    .line 285
    :cond_1
    :goto_0
    return-void

    .line 281
    :cond_2
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string v0, "PhoneCallYkActivity"

    const-string v1, "auto answer off "

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;
    .locals 1

    .prologue
    .line 290
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->m_HandsfreeAdpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    return-object v0
.end method

.method private initUILayout()Z
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 225
    const v1, 0x7f0a0018

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_phoneNumber_Tv:Landroid/widget/TextView;

    .line 226
    const v1, 0x7f0a002c

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    .line 229
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setInputType(I)V

    .line 230
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 233
    iget-boolean v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsIncomingCall:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCallActive:Z

    if-nez v1, :cond_0

    .line 234
    const v1, 0x7f0a0016

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 235
    .local v0, "callstatus_TV":Landroid/widget/TextView;
    const v1, 0x7f07004d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 237
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 238
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_answer_Btn:Landroid/widget/Button;

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 239
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_answer_Btn:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 242
    .end local v0    # "callstatus_TV":Landroid/widget/TextView;
    :cond_0
    iget-boolean v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCallActive:Z

    if-eqz v1, :cond_1

    .line 244
    invoke-direct {p0, v3}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->updateCallStateTextView(Z)V

    .line 254
    :cond_1
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneNum:Ljava/lang/String;

    const-string v2, "unkown"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eq v1, v3, :cond_3

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneNum:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 255
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneNum:Ljava/lang/String;

    invoke-direct {p0, v3, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->updatePhoneNumberDisplay(ZLjava/lang/String;)V

    .line 264
    :cond_2
    :goto_0
    return v3

    .line 256
    :cond_3
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 257
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_GetCallingNumber()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneNum:Ljava/lang/String;

    .line 258
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneNum:Ljava/lang/String;

    const-string v2, "unkown"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eq v1, v3, :cond_2

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneNum:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 259
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneNum:Ljava/lang/String;

    invoke-direct {p0, v3, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->updatePhoneNumberDisplay(ZLjava/lang/String;)V

    goto :goto_0
.end method

.method private notifyUpdateCallHistory()V
    .locals 7

    .prologue
    .line 589
    const/4 v3, 0x0

    .line 590
    .local v3, "call_type":I
    const/4 v0, 0x0

    .line 591
    .local v0, "call_name":Ljava/lang/String;
    const/4 v1, 0x0

    .line 592
    .local v1, "call_number":Ljava/lang/String;
    const/4 v2, 0x0

    .line 594
    .local v2, "call_time":Ljava/lang/String;
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_callStartTime:Landroid/text/format/Time;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneName:Ljava/lang/String;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneNum:Ljava/lang/String;

    if-nez v4, :cond_1

    .line 641
    :cond_0
    :goto_0
    return-void

    .line 600
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_callStartTime:Landroid/text/format/Time;

    iget v5, v5, Landroid/text/format/Time;->year:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_callStartTime:Landroid/text/format/Time;

    iget v5, v5, Landroid/text/format/Time;->month:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_callStartTime:Landroid/text/format/Time;

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

    .line 607
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_callStartTime:Landroid/text/format/Time;

    iget v5, v5, Landroid/text/format/Time;->hour:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_callStartTime:Landroid/text/format/Time;

    iget v5, v5, Landroid/text/format/Time;->minute:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_callStartTime:Landroid/text/format/Time;

    iget v5, v5, Landroid/text/format/Time;->second:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 614
    iget-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsIncomingCall:Z

    if-eqz v4, :cond_4

    .line 615
    iget-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsMissedCall:Z

    if-eqz v4, :cond_3

    .line 616
    const/4 v3, 0x2

    .line 623
    :goto_1
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneName:Ljava/lang/String;

    .line 624
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneNum:Ljava/lang/String;

    .line 627
    sget-boolean v4, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v4, :cond_2

    const-string v4, "PhoneCallYkActivity"

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

    .line 629
    :cond_2
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->call_type_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_TYPE"

    invoke-virtual {v4, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 630
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->call_type_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_NAME"

    invoke-virtual {v4, v5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 631
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->call_type_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_NUMBER"

    invoke-virtual {v4, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 632
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->call_type_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_TIME"

    invoke-virtual {v4, v5, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 633
    iget-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCallActive:Z

    if-nez v4, :cond_5

    iget-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsIncomingCall:Z

    if-eqz v4, :cond_5

    .line 634
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->call_type_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_HASCALLED"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 639
    :goto_2
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->call_type_intent:Landroid/content/Intent;

    invoke-virtual {p0, v4}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 618
    :cond_3
    const/4 v3, 0x1

    goto :goto_1

    .line 621
    :cond_4
    const/4 v3, 0x0

    goto :goto_1

    .line 637
    :cond_5
    iget-object v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->call_type_intent:Landroid/content/Intent;

    const-string v5, "com.autochips.bluetooth.PhoneCallActivity.extra.CALL_HASCALLED"

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_2
.end method

.method private onBTPhoneCallActive()V
    .locals 3

    .prologue
    .line 888
    sget-boolean v1, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "PhoneCallYkActivity"

    const-string v2, "onBTPhoneCallActive"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 890
    :cond_0
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->updateCallStateTextView(Z)V

    .line 891
    iget-boolean v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsIncomingCall:Z

    if-eqz v1, :cond_1

    .line 892
    const v1, 0x7f0a001b

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 893
    .local v0, "answer_btn":Landroid/widget/Button;
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 896
    .end local v0    # "answer_btn":Landroid/widget/Button;
    :cond_1
    iget-boolean v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCurrentAudioOutputFromAG:Z

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->phoneCallShowVoiceOutputSource(Z)V

    .line 902
    return-void
.end method

.method private parseActivityParms()Z
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 177
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 179
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "PhoneNumber"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneNum:Ljava/lang/String;

    .line 180
    const-string v2, "PhoneName"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneName:Ljava/lang/String;

    .line 181
    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneName:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 182
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "PhoneCallYkActivity"

    const-string v3, "m_strPhoneName is null "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    :cond_0
    const-string v2, ""

    iput-object v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneName:Ljava/lang/String;

    .line 187
    :cond_1
    const-string v2, "isIncomingCall"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "strParam":Ljava/lang/String;
    if-eqz v1, :cond_6

    .line 189
    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsIncomingCall:Z

    .line 193
    :cond_2
    :goto_0
    const-string v2, "isHFInitiated"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 194
    if-eqz v1, :cond_7

    .line 195
    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsHFInitiateCall:Z

    .line 200
    :cond_3
    :goto_1
    iget-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsIncomingCall:Z

    if-eqz v2, :cond_8

    .line 201
    iput-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsMissedCall:Z

    .line 202
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v2, :cond_4

    const-string v2, "PhoneCallYkActivity"

    const-string v3, "incoming call "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    :cond_4
    :goto_2
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->bluetoothGetCallValue()I

    move-result v2

    if-ne v2, v4, :cond_5

    .line 209
    iput-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCallActive:Z

    .line 210
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v2, :cond_5

    const-string v2, "PhoneCallYkActivity"

    const-string v3, "parseActivityParms ,call is active "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    :cond_5
    return v4

    .line 191
    :cond_6
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v2, :cond_2

    const-string v2, "PhoneCallYkActivity"

    const-string v3, "isIncomingCall param is null "

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 197
    :cond_7
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v2, :cond_3

    const-string v2, "PhoneCallYkActivity"

    const-string v3, "isHFInitiated param is null "

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 204
    :cond_8
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v2, :cond_9

    const-string v2, "PhoneCallYkActivity"

    const-string v3, "outgoing call "

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    :cond_9
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsMissedCall:Z

    goto :goto_2
.end method

.method private phoneCallShowSoftkeyPad(Z)V
    .locals 5
    .param p1, "fgShow"    # Z

    .prologue
    const/4 v4, 0x0

    .line 956
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 957
    .local v0, "res":Landroid/content/res/Resources;
    const v2, 0x7f0a002b

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 958
    .local v1, "softkeyPadLayout":Landroid/widget/LinearLayout;
    if-eqz p1, :cond_1

    .line 959
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "PhoneCallYkActivity"

    const-string v3, "Show SoftkeyPad "

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 960
    :cond_0
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 961
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsSoftkeyPadVisible:Z

    .line 969
    :goto_0
    return-void

    .line 964
    :cond_1
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v2, :cond_2

    const-string v2, "PhoneCallYkActivity"

    const-string v3, "hide SoftkeyPad"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 966
    :cond_2
    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 967
    iput-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsSoftkeyPadVisible:Z

    goto :goto_0
.end method

.method private phoneCallShowVoiceOutputSource(Z)V
    .locals 4
    .param p1, "fgAudioFromPhone"    # Z

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 974
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsIncomingCall:Z

    if-eqz v0, :cond_1

    .line 975
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCallActive:Z

    if-nez v0, :cond_1

    .line 976
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallYkActivity"

    const-string v1, "incoming call is not active,don\'t show the button"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 991
    :cond_0
    :goto_0
    return-void

    .line 981
    :cond_1
    if-eqz p1, :cond_3

    .line 982
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_2

    const-string v0, "PhoneCallYkActivity"

    const-string v1, "show  soud from phone "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 983
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 984
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 987
    :cond_3
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_4

    const-string v0, "PhoneCallYkActivity"

    const-string v1, "show soud from car"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 988
    :cond_4
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 989
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0
.end method

.method private readAutoAnswerData()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 526
    const-string v1, "bt.setting.autoanswer"

    invoke-virtual {p0, v1, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 527
    .local v0, "sharedata":Landroid/content/SharedPreferences;
    const-string v1, "IS_BT_AUTO_ANSWER"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method private resetBTvolume()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    const-wide v7, 0x4074800000000000L    # 328.0

    .line 720
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "btMcuMuteState"

    invoke-static {v5, v6, v9}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 721
    .local v2, "iMute":I
    const-string v5, "audio"

    invoke-virtual {p0, v5}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/media/AudioManager;

    .line 722
    .local v3, "mAudioManager":Landroid/media/AudioManager;
    if-eqz v3, :cond_0

    .line 723
    const/4 v5, 0x6

    invoke-virtual {v3, v5}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    .line 724
    .local v0, "bt_v":I
    invoke-virtual {v3}, Landroid/media/AudioManager;->getMasterMaxVolume()I

    move-result v4

    .line 725
    .local v4, "mMasterVolume":I
    if-eqz v2, :cond_1

    .line 726
    invoke-static {v9}, Lcom/autochips/settings/AtcSettings$Audio;->SetBTHFPVolume(I)I

    .line 733
    .end local v0    # "bt_v":I
    .end local v4    # "mMasterVolume":I
    :cond_0
    :goto_0
    const/4 v5, 0x1

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v6

    invoke-static {v5, v6}, Lcom/autochips/settings/AtcSettings$Audio;->SetDtmfCtrlType(II)I

    .line 734
    invoke-static {v7, v8, v7, v8}, Lcom/autochips/settings/AtcSettings$Audio;->SetDtmfThreshold(DD)I

    .line 735
    const/16 v5, 0x46

    invoke-static {v5}, Lcom/autochips/settings/AtcSettings$Audio;->SetDtmfNoiseRatio(I)I

    .line 736
    const/16 v5, 0x64

    const/16 v6, 0x32

    invoke-static {v5, v6}, Lcom/autochips/settings/AtcSettings$Audio;->SetDtmfValidTime(II)I

    .line 737
    const/16 v5, 0x50

    const/16 v6, 0x3c

    invoke-static {v5, v6}, Lcom/autochips/settings/AtcSettings$Audio;->SetDtmfInValidTime(II)I

    .line 738
    const/16 v5, 0x28

    invoke-static {v5}, Lcom/autochips/settings/AtcSettings$Audio;->SetDtmfNewSamples(I)I

    .line 739
    const/16 v5, 0x82

    invoke-static {v5}, Lcom/autochips/settings/AtcSettings$Audio;->SetDtmfMaxScale(I)I

    .line 741
    new-instance v1, Landroid/content/Intent;

    const-string v5, "xy.decode.xydtmf.start"

    invoke-direct {v1, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 742
    .local v1, "fmintent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 744
    return-void

    .line 729
    .end local v1    # "fmintent":Landroid/content/Intent;
    .restart local v0    # "bt_v":I
    .restart local v4    # "mMasterVolume":I
    :cond_1
    mul-int/lit16 v5, v0, 0xff

    div-int/2addr v5, v4

    invoke-static {v5}, Lcom/autochips/settings/AtcSettings$Audio;->SetBTHFPVolume(I)I

    goto :goto_0
.end method

.method private declared-synchronized scheduleCallMonitor(J)V
    .locals 6
    .param p1, "lastPeriodMs"    # J

    .prologue
    .line 1152
    monitor-enter p0

    :try_start_0
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallYkActivity"

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

    .line 1154
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mTimerCallMonitor:Ljava/util/Timer;

    if-nez v0, :cond_3

    .line 1155
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string v0, "PhoneCallYkActivity"

    const-string v2, "scheduleCallMonitor, new timer."

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1160
    :cond_1
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mTimerCallMonitor:Ljava/util/Timer;

    .line 1161
    iput-wide p1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mCallMonitorRemainingTime:J

    .line 1164
    new-instance v1, Lcom/autochips/bluetooth/PhoneCallYkActivity$5;

    invoke-direct {v1, p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity$5;-><init>(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    .line 1185
    .local v1, "timerTask":Ljava/util/TimerTask;
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mTimerCallMonitor:Ljava/util/Timer;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x64

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1186
    .end local v1    # "timerTask":Ljava/util/TimerTask;
    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    .line 1157
    :cond_3
    :try_start_1
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_2

    const-string v0, "PhoneCallYkActivity"

    const-string v2, "scheduleCallMonitor, mTimerCallMonitor existed."

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1152
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private stopAutoAnswerTimeoutThread()V
    .locals 3

    .prologue
    .line 567
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;

    if-eqz v1, :cond_1

    .line 569
    :try_start_0
    sget-boolean v1, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "PhoneCallYkActivity"

    const-string v2, "mConnectTimeout close."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 570
    :cond_0
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;->shutdown()V

    .line 571
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;->join()V

    .line 572
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_thrdAutoAnswerTimeout:Lcom/autochips/bluetooth/PhoneCallYkActivity$autoAnswerTimeoutThread;

    .line 573
    sget-boolean v1, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "PhoneCallYkActivity"

    const-string v2, "thread AutoAnswerTimeout close OK."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 578
    :cond_1
    :goto_0
    return-void

    .line 574
    :catch_0
    move-exception v0

    .line 575
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-boolean v1, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "PhoneCallYkActivity"

    const-string v2, "thread AutoAnswerTimeout close error."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private stopTimer()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 436
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->xyTime:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 437
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->xyTime:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 438
    iput-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->xyTime:Ljava/util/Timer;

    .line 441
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->xyTimerTask:Ljava/util/TimerTask;

    if-eqz v0, :cond_1

    .line 442
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->xyTimerTask:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 443
    iput-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->xyTimerTask:Ljava/util/TimerTask;

    .line 445
    :cond_1
    return-void
.end method

.method private updateCallStateTextView(Z)V
    .locals 2
    .param p1, "is_active"    # Z

    .prologue
    .line 654
    const v1, 0x7f0a0016

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 655
    .local v0, "callstatus_TV":Landroid/widget/TextView;
    if-eqz p1, :cond_0

    .line 656
    const v1, 0x7f07004f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 661
    :goto_0
    return-void

    .line 658
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
    .line 674
    if-nez p2, :cond_1

    .line 709
    :cond_0
    :goto_0
    return-void

    .line 677
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 678
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallYkActivity"

    const-string v1, "phonenumber is empty"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 682
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneNum:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz p1, :cond_6

    .line 684
    :cond_3
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_4

    const-string v0, "PhoneCallYkActivity"

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

    .line 685
    :cond_4
    iput-object p2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneNum:Ljava/lang/String;

    .line 687
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneName:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 688
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    if-eqz v0, :cond_7

    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mHfConnectedDeviceAddr:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 690
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mPBSyncProxy:Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;

    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mHfConnectedDeviceAddr:Ljava/lang/String;

    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneNum:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/autochips/bluetooth/PbSyncManager/PBSyncManager;->GetNameByTelExectly(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneName:Ljava/lang/String;

    .line 697
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneName:Ljava/lang/String;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_8

    .line 698
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_phoneNumber_Tv:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_strPhoneName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 705
    :cond_6
    :goto_2
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsIncomingCall:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsHFInitiateCall:Z

    if-nez v0, :cond_0

    .line 706
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->update_memory_call_intent:Landroid/content/Intent;

    const-string v1, "com.autochips.bluetooth.BtDialPadActivity.extra.EXTRA_BLUETOOTH_MEMORY_CALL_NUMBER"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 707
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->update_memory_call_intent:Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 693
    :cond_7
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_5

    const-string v0, "PhoneCallYkActivity"

    const-string v1, "BluetoothReceiver.mConnectedDevice is Null! "

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 700
    :cond_8
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_phoneNumber_Tv:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2
.end method


# virtual methods
.method public addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z
    .locals 3
    .param p1, "str"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v1, 0x0

    .line 907
    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    if-nez v2, :cond_1

    .line 924
    :cond_0
    :goto_0
    return v1

    .line 910
    :cond_1
    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    .line 911
    .local v0, "index":I
    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getEditableText()Landroid/text/Editable;

    move-result-object v2

    iput-object v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumstr_Edt:Landroid/text/Editable;

    .line 913
    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumstr_Edt:Landroid/text/Editable;

    if-eqz v2, :cond_0

    .line 916
    if-ltz v0, :cond_2

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumstr_Edt:Landroid/text/Editable;

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    if-le v0, v1, :cond_3

    .line 917
    :cond_2
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumstr_Edt:Landroid/text/Editable;

    invoke-interface {v1, p1}, Landroid/text/Editable;->append(Ljava/lang/CharSequence;)Landroid/text/Editable;

    .line 921
    :goto_1
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumstr_Edt:Landroid/text/Editable;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 922
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumber_Et:Landroid/widget/EditText;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    .line 924
    const/4 v1, 0x1

    goto :goto_0

    .line 919
    :cond_3
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_subcallNumstr_Edt:Landroid/text/Editable;

    invoke-interface {v1, v0, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    goto :goto_1
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 517
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 1001
    const/4 v1, 0x0

    .line 1002
    .local v1, "dtmf_code":Ljava/lang/String;
    const/4 v0, 0x0

    .line 1005
    .local v0, "bsenddtmf":Z
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 1114
    :cond_0
    :goto_0
    :pswitch_0
    iget-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCallActive:Z

    if-eqz v2, :cond_1

    .line 1115
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    .line 1116
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 1117
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_SendDTMFCode(Ljava/lang/String;)V

    .line 1123
    :cond_1
    :goto_1
    return-void

    .line 1008
    :pswitch_1
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->bluetoothTerminatePhoneCall()V

    .line 1009
    iget-object v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->finishHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->finishrunnable:Ljava/lang/Runnable;

    const-wide/16 v4, 0x3e8

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1010
    const-string v2, "PhoneCallYkActivity"

    const-string v3, "btn_hangup onClick !!!"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1014
    :pswitch_2
    iget-boolean v2, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCallActive:Z

    if-nez v2, :cond_2

    .line 1015
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->bluetoothAnswerPhoneCall()V

    .line 1017
    :cond_2
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->stopAutoAnswerTimeoutThread()V

    goto :goto_0

    .line 1021
    :pswitch_3
    iget-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsSoftkeyPadVisible:Z

    if-nez v4, :cond_3

    :goto_2
    invoke-direct {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->phoneCallShowSoftkeyPad(Z)V

    goto :goto_0

    :cond_3
    move v2, v3

    goto :goto_2

    .line 1027
    :pswitch_4
    sget-boolean v4, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v4, :cond_4

    const-string v4, "PhoneCallYkActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onClick:m_bIsCurrentAudioOutputFromAG="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v6, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCurrentAudioOutputFromAG:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1028
    :cond_4
    iget-boolean v4, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCallActive:Z

    if-ne v4, v2, :cond_0

    .line 1029
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 1030
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v4

    iget-boolean v5, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCurrentAudioOutputFromAG:Z

    if-nez v5, :cond_5

    :goto_3
    invoke-virtual {v4, v2}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_SwithAudioTransfer(Z)V

    goto :goto_0

    :cond_5
    move v2, v3

    goto :goto_3

    .line 1032
    :cond_6
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v2, :cond_0

    const-string v2, "PhoneCallYkActivity"

    const-string v3, "getHfAdapter() is null "

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1039
    :pswitch_5
    const-string v2, "0"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1040
    const-string v1, "0"

    .line 1041
    const/4 v0, 0x1

    .line 1042
    goto/16 :goto_0

    .line 1045
    :pswitch_6
    const-string v2, "1"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1046
    const-string v1, "1"

    .line 1047
    const/4 v0, 0x1

    .line 1048
    goto/16 :goto_0

    .line 1051
    :pswitch_7
    const-string v2, "2"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1052
    const-string v1, "2"

    .line 1053
    const/4 v0, 0x1

    .line 1054
    goto/16 :goto_0

    .line 1057
    :pswitch_8
    const-string v2, "3"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1058
    const-string v1, "3"

    .line 1059
    const/4 v0, 0x1

    .line 1060
    goto/16 :goto_0

    .line 1063
    :pswitch_9
    const-string v2, "4"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1064
    const-string v1, "4"

    .line 1065
    const/4 v0, 0x1

    .line 1066
    goto/16 :goto_0

    .line 1069
    :pswitch_a
    const-string v2, "5"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1070
    const-string v1, "5"

    .line 1071
    const/4 v0, 0x1

    .line 1072
    goto/16 :goto_0

    .line 1075
    :pswitch_b
    const-string v2, "6"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1076
    const-string v1, "6"

    .line 1077
    const/4 v0, 0x1

    .line 1078
    goto/16 :goto_0

    .line 1081
    :pswitch_c
    const-string v2, "7"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1082
    const-string v1, "7"

    .line 1083
    const/4 v0, 0x1

    .line 1084
    goto/16 :goto_0

    .line 1087
    :pswitch_d
    const-string v2, "8"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1088
    const-string v1, "8"

    .line 1089
    const/4 v0, 0x1

    .line 1090
    goto/16 :goto_0

    .line 1093
    :pswitch_e
    const-string v2, "9"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1094
    const-string v1, "9"

    .line 1095
    const/4 v0, 0x1

    .line 1096
    goto/16 :goto_0

    .line 1099
    :pswitch_f
    const-string v2, "*"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1100
    const-string v1, "*"

    .line 1101
    const/4 v0, 0x1

    .line 1102
    goto/16 :goto_0

    .line 1105
    :pswitch_10
    const-string v2, "#"

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->addSubPhoneCallInputString(Ljava/lang/CharSequence;)Z

    .line 1106
    const-string v1, "#"

    .line 1107
    const/4 v0, 0x1

    .line 1108
    goto/16 :goto_0

    .line 1119
    :cond_7
    sget-boolean v2, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v2, :cond_1

    const-string v2, "PhoneCallYkActivity"

    const-string v3, "getHfAdapter() is null "

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 1005
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
        :pswitch_1
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 11
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const-wide/16 v2, 0x3e8

    const/4 v10, 0x1

    .line 296
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallYkActivity"

    const-string v1, "+++ onCreate +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mReceiverRegistered:Z

    .line 298
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 299
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->setVolumeControlStream(I)V

    .line 300
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_hfadpter:Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    .line 301
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->bluetoothGetCallValue()I

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->bluetoothGetCallsetupValue()I

    move-result v0

    if-nez v0, :cond_1

    .line 303
    const-string v0, "PhoneCallYkActivity"

    const-string v1, "Call had been ended before this activity create."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DestroyActivity()V

    .line 432
    :goto_0
    return-void

    .line 307
    :cond_1
    invoke-virtual {p0, v10}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->requestWindowFeature(I)Z

    .line 310
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    .line 311
    .local v9, "res":Landroid/content/res/Resources;
    const v0, 0x7f020023

    invoke-virtual {v9, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 312
    .local v7, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 316
    const v0, 0x7f030005

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->setContentView(I)V

    .line 319
    const-string v0, "sys.xy.xydtmfover"

    const-string v1, "0"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->xyTime:Ljava/util/Timer;

    .line 321
    new-instance v0, Lcom/autochips/bluetooth/PhoneCallYkActivity$1;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity$1;-><init>(Lcom/autochips/bluetooth/PhoneCallYkActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->xyTimerTask:Ljava/util/TimerTask;

    .line 339
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->xyTime:Ljava/util/Timer;

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->xyTimerTask:Ljava/util/TimerTask;

    move-wide v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 341
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_callStartTime:Landroid/text/format/Time;

    .line 342
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_callStartTime:Landroid/text/format/Time;

    invoke-virtual {v0}, Landroid/text/format/Time;->setToNow()V

    .line 344
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->parseActivityParms()Z

    .line 346
    const v0, 0x7f0a001b

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_answer_Btn:Landroid/widget/Button;

    .line 347
    const v0, 0x7f0a0019

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    .line 348
    const v0, 0x7f0a001a

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    .line 352
    const v0, 0x7f0a0039

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->yikaImageBtn:Landroid/widget/ImageButton;

    .line 353
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->yikaImageBtn:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 355
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->initUILayout()Z

    .line 357
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_voiceSourceCar_Btn:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 358
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_voiceSourcePhone_Btn:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 359
    const v0, 0x7f0a001c

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 360
    const v0, 0x7f0a002a

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 361
    const v0, 0x7f0a0036

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 362
    const v0, 0x7f0a002d

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 363
    const v0, 0x7f0a002e

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 364
    const v0, 0x7f0a002f

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 365
    const v0, 0x7f0a0030

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 366
    const v0, 0x7f0a0031

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 367
    const v0, 0x7f0a0032

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 368
    const v0, 0x7f0a0033

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 369
    const v0, 0x7f0a0034

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 370
    const v0, 0x7f0a0035

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 371
    const v0, 0x7f0a0037

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 372
    const v0, 0x7f0a0038

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 374
    new-instance v8, Landroid/content/IntentFilter;

    invoke-direct {v8}, Landroid/content/IntentFilter;-><init>()V

    .line 375
    .local v8, "filter":Landroid/content/IntentFilter;
    const-string v0, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 376
    const-string v0, "com.autochips.bluetooth.BluetoothHfService.action.SCO_STATE_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 379
    const-string v0, "com.autochips.bluetooth.hf.BluetoothHfUtility.action.callStateChange"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 380
    const-string v0, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.PHONE_NUMBER_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 381
    const-string v0, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.AG_VOLUME_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 382
    const-string v0, "com.autochips.bluetooth.hf.BluetoothHfAtHandler.action.AG_MIC_GAIN_CHANGED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 383
    const-string v0, "autochips.intent.action.QB_POWEROFF"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 384
    const-string v0, "xy.android.acc.off"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 385
    const-string v0, "xy.xbtheadset.incomingans"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 386
    const-string v0, "xy.xbtheadset.incomingansorhangup"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 387
    const-string v0, "xy.xbtheadset.incomingreject"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 388
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->bluetoothGetCallValue()I

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->bluetoothGetCallsetupValue()I

    move-result v0

    if-nez v0, :cond_2

    .line 390
    const-string v0, "PhoneCallYkActivity"

    const-string v1, "Call had been ended before registerReceiver."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DestroyActivity()V

    goto/16 :goto_0

    .line 394
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0, v8}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 395
    iput-boolean v10, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mReceiverRegistered:Z

    .line 397
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 399
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getHfAdapter()Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/autochips/bluetooth/hf/BluetoothHfAdapter;->Bluetooth_Hf_IsAudioTransferTowardsAG()Z

    move-result v0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCurrentAudioOutputFromAG:Z

    .line 400
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCurrentAudioOutputFromAG:Z

    if-eqz v0, :cond_6

    .line 401
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_3

    const-string v0, "PhoneCallYkActivity"

    const-string v1, " audio towards phone"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    :cond_3
    :goto_1
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsIncomingCall:Z

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCallActive:Z

    if-eqz v0, :cond_5

    .line 414
    :cond_4
    iget-boolean v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->m_bIsCurrentAudioOutputFromAG:Z

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->phoneCallShowVoiceOutputSource(Z)V

    .line 415
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->resetBTvolume()V

    .line 418
    :cond_5
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->checkAutoAnswerOption()V

    .line 419
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mTimerStatusMonitor:Ljava/util/Timer;

    .line 420
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mTimerStatusMonitor:Ljava/util/Timer;

    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->timerstatusTask:Ljava/util/TimerTask;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x9c4

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 421
    const-string v0, "statusbar"

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/StatusBarManager;

    iput-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mStatusBarManager:Landroid/app/StatusBarManager;

    .line 423
    invoke-virtual {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x111004d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v6

    .line 424
    .local v6, "ballowbthome":Z
    if-nez v6, :cond_8

    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-eqz v0, :cond_8

    .line 425
    const-string v0, "PhoneCallYkActivity"

    const-string v1, " Disable StatusBarManager.DISABLE_EXPAND"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 426
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mStatusBarManager:Landroid/app/StatusBarManager;

    const/high16 v1, 0x10000

    invoke-virtual {v0, v1}, Landroid/app/StatusBarManager;->disable(I)V

    goto/16 :goto_0

    .line 403
    .end local v6    # "ballowbthome":Z
    :cond_6
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_3

    const-string v0, "PhoneCallYkActivity"

    const-string v1, " audio towards carkit"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 410
    :cond_7
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_3

    const-string v0, "PhoneCallYkActivity"

    const-string v1, "can not get getHfAdapter() "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 428
    .restart local v6    # "ballowbthome":Z
    :cond_8
    const-string v0, "PhoneCallYkActivity"

    const-string v1, " get STATUS_BAR_SERVICE fail!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 477
    new-instance v0, Landroid/content/Intent;

    const-string v1, "xy.decode.xydtmf.end"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 478
    .local v0, "fmintent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 479
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->stopTimer()V

    .line 480
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mTimerStatusMonitor:Ljava/util/Timer;

    if-eqz v1, :cond_0

    .line 481
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mTimerStatusMonitor:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    .line 483
    :cond_0
    iget-boolean v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mReceiverRegistered:Z

    if-eqz v1, :cond_1

    .line 484
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 486
    :cond_1
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->call_state_change_intent:Landroid/content/Intent;

    const-string v2, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 488
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->call_state_change_intent:Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 490
    iget-boolean v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mReceiverRegistered:Z

    if-eqz v1, :cond_2

    .line 491
    invoke-direct {p0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->notifyUpdateCallHistory()V

    .line 493
    :cond_2
    sget-boolean v1, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v1, :cond_3

    const-string v1, "PhoneCallYkActivity"

    const-string v2, "===== onDestroy ====="

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 495
    :cond_3
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-eqz v1, :cond_4

    .line 496
    const-string v1, "PhoneCallYkActivity"

    const-string v2, " Disable StatusBarManager.DISABLE_NONE"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    iget-object v1, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->mStatusBarManager:Landroid/app/StatusBarManager;

    invoke-virtual {v1, v3}, Landroid/app/StatusBarManager;->disable(I)V

    .line 501
    :goto_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 502
    return-void

    .line 499
    :cond_4
    const-string v1, "PhoneCallYkActivity"

    const-string v2, " get STATUS_BAR_SERVICE fail!"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 461
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 462
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    .line 463
    const-string v0, "PhoneCallYkActivity"

    const-string v1, "+++ onResume +++"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 464
    :cond_0
    return-void
.end method

.method protected onStart()V
    .locals 3

    .prologue
    .line 468
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 469
    sget-boolean v0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "PhoneCallYkActivity"

    const-string v1, "===== onStart ====="

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 470
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->call_state_change_intent:Landroid/content/Intent;

    const-string v1, "com.autochips.bluetooth.PhoneCallActivity.action.BLUETOOTH_CALL_STATUS"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 472
    iget-object v0, p0, Lcom/autochips/bluetooth/PhoneCallYkActivity;->call_state_change_intent:Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/PhoneCallYkActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 473
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 508
    const/4 v0, 0x1

    return v0
.end method
