.class public Lcom/autochips/bluetooth/BtMusicActivity;
.super Landroid/app/Activity;
.source "BtMusicActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static final ACTION_FORCEPAUSE:Ljava/lang/String; = "xy.android.forcepause"

.field public static final ACTION_FORCEPLAY:Ljava/lang/String; = "xy.android.forceplay"

.field public static final ACTION_NEXT:Ljava/lang/String; = "xy.android.nextmedia"

.field public static final ACTION_PLAY:Ljava/lang/String; = "xy.android.playpause"

.field public static final ACTION_PREV:Ljava/lang/String; = "xy.android.previousmedia"

.field private static DEBUG:Z = false

.field public static final MUSIC_FORCEPAUSE:I = 0x2

.field public static final MUSIC_FORCEPLAY:I = 0x1

.field public static final MUSIC_PLAYPAUSE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "BtMusicActivity"

.field public static final cmdGetPlayerStatus:B = 0x1t

.field public static final cmdPlayingPosChangedNoti:B = 0x2t

.field private static gCbmCtx:Lcom/autochips/cbmctx/CBMCtx;

.field private static isRds:Z

.field private static isRemoteDeviceSupportA2dp:Z

.field private static isRemoteDeviceSupportAvrcp:Z

.field public static mA2dpsinkstate:I

.field public static mAvrcpctBrowsestate:I

.field public static mAvrcpctstate:I

.field public static mConnectedAvrcpDeviceAddr:Ljava/lang/String;


# instance fields
.field private a2dpsinkStateInfo:Landroid/widget/TextView;

.field private avrcpctStateInfo:Landroid/widget/TextView;

.field private bBackcarPause:Z

.field private bPressStop:Z

.field private bStoped:Z

.field private mAudioManager:Landroid/media/AudioManager;

.field private mAudiorec:Landroid/content/ComponentName;

.field private mChecktimes:I

.field private mDefaultMusicLong:I

.field private mDefaultPlayingTime:I

.field private mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

.field private mMusicPlayingProgressBar:Landroid/widget/ProgressBar;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mTask:Ljava/util/TimerTask;

.field private mTimer:Ljava/util/Timer;

.field private mToast:Landroid/widget/Toast;

.field private mediaAlbumInfo:Landroid/widget/TextView;

.field private mediaArtistInfo:Landroid/widget/TextView;

.field private mediaLengthInfo:Landroid/widget/TextView;

.field private mediaPlayingPositionInfo:Landroid/widget/TextView;

.field private mediaTitleInfo:Landroid/widget/TextView;

.field private musicAlbum:Ljava/lang/String;

.field private musicArtist:Ljava/lang/String;

.field private musicPlayingTime:I

.field private musicState:B

.field private musicTitle:Ljava/lang/String;

.field private musicTotalLength:I

.field pausebutton:Landroid/widget/Button;

.field playbutton:Landroid/widget/Button;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 90
    sput-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    .line 100
    sput-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->isRemoteDeviceSupportA2dp:Z

    .line 102
    sput-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->isRemoteDeviceSupportAvrcp:Z

    .line 104
    const/4 v0, 0x0

    sput-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->isRds:Z

    .line 111
    const/4 v0, 0x2

    sput v0, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    .line 112
    const/16 v0, 0xd

    sput v0, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    .line 113
    const/16 v0, 0x12

    sput v0, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctBrowsestate:I

    .line 114
    sput-object v1, Lcom/autochips/bluetooth/BtMusicActivity;->mConnectedAvrcpDeviceAddr:Ljava/lang/String;

    .line 698
    sput-object v1, Lcom/autochips/bluetooth/BtMusicActivity;->gCbmCtx:Lcom/autochips/cbmctx/CBMCtx;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 88
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 119
    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mMusicPlayingProgressBar:Landroid/widget/ProgressBar;

    .line 127
    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mAudioManager:Landroid/media/AudioManager;

    .line 128
    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mAudiorec:Landroid/content/ComponentName;

    .line 136
    iput v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mDefaultMusicLong:I

    .line 137
    iput v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mDefaultPlayingTime:I

    .line 138
    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicTitle:Ljava/lang/String;

    .line 139
    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicArtist:Ljava/lang/String;

    .line 140
    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicAlbum:Ljava/lang/String;

    .line 141
    iput v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicTotalLength:I

    .line 142
    iput v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicPlayingTime:I

    .line 143
    iput-byte v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    .line 144
    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bStoped:Z

    .line 145
    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bPressStop:Z

    .line 146
    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bBackcarPause:Z

    .line 148
    iput v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mChecktimes:I

    .line 149
    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mTimer:Ljava/util/Timer;

    .line 150
    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mTask:Ljava/util/TimerTask;

    .line 191
    new-instance v0, Lcom/autochips/bluetooth/BtMusicActivity$2;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtMusicActivity$2;-><init>(Lcom/autochips/bluetooth/BtMusicActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/autochips/bluetooth/BtMusicActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bStoped:Z

    return v0
.end method

.method static synthetic access$002(Lcom/autochips/bluetooth/BtMusicActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 88
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bStoped:Z

    return p1
.end method

.method static synthetic access$100(Lcom/autochips/bluetooth/BtMusicActivity;)B
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget-byte v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    return v0
.end method

.method static synthetic access$1000(Lcom/autochips/bluetooth/BtMusicActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->avrcpctStateInfo:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$102(Lcom/autochips/bluetooth/BtMusicActivity;B)B
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # B

    .prologue
    .line 88
    iput-byte p1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    return p1
.end method

.method static synthetic access$1100(Lcom/autochips/bluetooth/BtMusicActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->resetParameters()V

    return-void
.end method

.method static synthetic access$1200(Lcom/autochips/bluetooth/BtMusicActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mDefaultMusicLong:I

    return v0
.end method

.method static synthetic access$1300(Lcom/autochips/bluetooth/BtMusicActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mDefaultPlayingTime:I

    return v0
.end method

.method static synthetic access$1400(Lcom/autochips/bluetooth/BtMusicActivity;BII)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # B
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 88
    invoke-direct {p0, p1, p2, p3}, Lcom/autochips/bluetooth/BtMusicActivity;->updateMusicPlayingProgress(BII)V

    return-void
.end method

.method static synthetic access$1500(Lcom/autochips/bluetooth/BtMusicActivity;IIB)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # B

    .prologue
    .line 88
    invoke-direct {p0, p1, p2, p3}, Lcom/autochips/bluetooth/BtMusicActivity;->updatePlayingStatus(IIB)V

    return-void
.end method

.method static synthetic access$1600(Lcom/autochips/bluetooth/BtMusicActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # I

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtMusicActivity;->updateMediaTitle(I)V

    return-void
.end method

.method static synthetic access$1700(Lcom/autochips/bluetooth/BtMusicActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # I

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtMusicActivity;->updateMediaArtist(I)V

    return-void
.end method

.method static synthetic access$1800(Lcom/autochips/bluetooth/BtMusicActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # I

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtMusicActivity;->updateMediaAlbum(I)V

    return-void
.end method

.method static synthetic access$1900(Lcom/autochips/bluetooth/BtMusicActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicTitle:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1902(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicTitle:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/autochips/bluetooth/BtMusicActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bPressStop:Z

    return v0
.end method

.method static synthetic access$2000(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtMusicActivity;->updateMediaTitle(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$202(Lcom/autochips/bluetooth/BtMusicActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 88
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bPressStop:Z

    return p1
.end method

.method static synthetic access$2100(Lcom/autochips/bluetooth/BtMusicActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicArtist:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2102(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicArtist:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2200(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtMusicActivity;->updateMediaArtist(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2300(Lcom/autochips/bluetooth/BtMusicActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicAlbum:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2302(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicAlbum:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2400(Lcom/autochips/bluetooth/BtMusicActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtMusicActivity;->updateMediaAlbum(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2500(Lcom/autochips/bluetooth/BtMusicActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicTotalLength:I

    return v0
.end method

.method static synthetic access$2502(Lcom/autochips/bluetooth/BtMusicActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # I

    .prologue
    .line 88
    iput p1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicTotalLength:I

    return p1
.end method

.method static synthetic access$2600(Lcom/autochips/bluetooth/BtMusicActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicPlayingTime:I

    return v0
.end method

.method static synthetic access$2602(Lcom/autochips/bluetooth/BtMusicActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # I

    .prologue
    .line 88
    iput p1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicPlayingTime:I

    return p1
.end method

.method static synthetic access$2700(Lcom/autochips/bluetooth/BtMusicActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # I

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtMusicActivity;->updatePlayingProcess(I)V

    return-void
.end method

.method static synthetic access$2800(Lcom/autochips/bluetooth/BtMusicActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->dobtn_music_stop()V

    return-void
.end method

.method static synthetic access$2900(Lcom/autochips/bluetooth/BtMusicActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->startCheckplayTimer()V

    return-void
.end method

.method static synthetic access$300(Lcom/autochips/bluetooth/BtMusicActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bBackcarPause:Z

    return v0
.end method

.method static synthetic access$3000(Lcom/autochips/bluetooth/BtMusicActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->dobtn_music_prev()V

    return-void
.end method

.method static synthetic access$302(Lcom/autochips/bluetooth/BtMusicActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 88
    iput-boolean p1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bBackcarPause:Z

    return p1
.end method

.method static synthetic access$3100(Lcom/autochips/bluetooth/BtMusicActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->dobtn_music_next()V

    return-void
.end method

.method static synthetic access$400(Lcom/autochips/bluetooth/BtMusicActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # I

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtMusicActivity;->dobtn_music_playpause(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/autochips/bluetooth/BtMusicActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mChecktimes:I

    return v0
.end method

.method static synthetic access$508(Lcom/autochips/bluetooth/BtMusicActivity;)I
    .locals 2
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mChecktimes:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mChecktimes:I

    return v0
.end method

.method static synthetic access$600(Lcom/autochips/bluetooth/BtMusicActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->stopCheckplayTimer()V

    return-void
.end method

.method static synthetic access$700()Z
    .locals 1

    .prologue
    .line 88
    sget-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    return v0
.end method

.method static synthetic access$800(Lcom/autochips/bluetooth/BtMusicActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->a2dpsinkStateInfo:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$900(Lcom/autochips/bluetooth/BtMusicActivity;B)V
    .locals 0
    .param p0, "x0"    # Lcom/autochips/bluetooth/BtMusicActivity;
    .param p1, "x1"    # B

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/autochips/bluetooth/BtMusicActivity;->updatePlayPauseButton(B)V

    return-void
.end method

.method private dobtn_music_next()V
    .locals 2

    .prologue
    .line 840
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bPressStop:Z

    .line 841
    sget v0, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-nez v0, :cond_2

    .line 843
    :cond_0
    const v0, 0x7f0700b0

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtMusicActivity;->showToast(I)V

    .line 853
    :cond_1
    :goto_0
    return-void

    .line 847
    :cond_2
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v0, :cond_3

    .line 848
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->sendAvrcpCommand(I)V

    goto :goto_0

    .line 851
    :cond_3
    sget-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string v0, "BtMusicActivity"

    const-string v1, "Next:BluetoothReceiver.mAvrcpCtPlayerManage is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private dobtn_music_playpause(I)V
    .locals 10
    .param p1, "status"    # I

    .prologue
    const v9, 0x7f0700ae

    const/4 v8, 0x0

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 732
    const/4 v0, 0x0

    .line 733
    .local v0, "BT_ADDR":Ljava/lang/String;
    const-string v3, "BtMusicActivity"

    const-string v4, "onClick(): play/pause"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 734
    if-ne p1, v6, :cond_3

    .line 735
    iget-boolean v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bBackcarPause:Z

    .line 736
    .local v1, "bBackcarPause_back":Z
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->stopCheckplayTimer()V

    .line 737
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bBackcarPause:Z

    .line 742
    .end local v1    # "bBackcarPause_back":Z
    :cond_0
    :goto_0
    invoke-static {}, Lcom/autochips/bluetooth/BtMusicActivity;->isRDSActive()Z

    move-result v3

    if-nez v3, :cond_1

    sget-boolean v3, Lcom/autochips/bluetooth/BtMusicActivity;->isRds:Z

    if-eqz v3, :cond_4

    .line 743
    :cond_1
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f07005e

    invoke-static {v3, v4, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 821
    :cond_2
    :goto_1
    return-void

    .line 739
    :cond_3
    if-eq p1, v5, :cond_0

    .line 740
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->stopCheckplayTimer()V

    goto :goto_0

    .line 748
    :cond_4
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v3, :cond_6

    sget v3, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    if-eq v3, v5, :cond_6

    sget v3, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    const/16 v4, 0xf

    if-eq v3, v4, :cond_6

    sget v3, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    const/16 v4, 0x13

    if-eq v3, v4, :cond_6

    .line 753
    sget v3, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    if-eq v3, v7, :cond_2

    .line 754
    sget-boolean v3, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v3, :cond_5

    const-string v3, "BtMusicActivity"

    const-string v4, "onClick(): connect a2dp"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 755
    :cond_5
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p0, v9}, Lcom/autochips/bluetooth/BtMusicActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 756
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v3, v4}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v2

    .line 758
    .local v2, "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    sget-object v3, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_A2DP_SINK:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v2, v3}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->connect(Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;)V

    goto :goto_1

    .line 761
    .end local v2    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :cond_6
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v3, :cond_8

    sget v3, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    if-eq v3, v5, :cond_8

    sget v3, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    if-eq v3, v7, :cond_8

    .line 766
    sget-boolean v3, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v3, :cond_7

    const-string v3, "BtMusicActivity"

    const-string v4, "onClick(): connect avrcp"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 767
    :cond_7
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {p0, v9}, Lcom/autochips/bluetooth/BtMusicActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 768
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v3, v4}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v2

    .line 770
    .restart local v2    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    sget-object v3, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_AVRCP_CT:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v2, v3}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->connect(Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;)V

    goto :goto_1

    .line 775
    .end local v2    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :cond_8
    sget v3, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    if-eq v3, v7, :cond_2

    sget v3, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    if-eq v3, v7, :cond_2

    .line 779
    if-nez p1, :cond_b

    .line 780
    iget-byte v3, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    if-ne v3, v5, :cond_9

    .line 782
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v3, :cond_2

    .line 783
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v3, v6}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->sendAvrcpCommand(I)V

    goto/16 :goto_1

    .line 786
    :cond_9
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v3, :cond_2

    .line 787
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->medianeedfinish()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 788
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v3, v6}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->sendAvrcpCommand(I)V

    .line 789
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->dobtn_music_stop()V

    goto/16 :goto_1

    .line 793
    :cond_a
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v3, v5}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->sendAvrcpCommand(I)V

    goto/16 :goto_1

    .line 798
    :cond_b
    if-ne p1, v5, :cond_d

    .line 799
    iget-byte v3, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    if-eq v3, v5, :cond_2

    .line 801
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v3, :cond_2

    .line 802
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->medianeedfinish()Z

    move-result v3

    if-eqz v3, :cond_c

    .line 803
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v3, v6}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->sendAvrcpCommand(I)V

    .line 804
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->dobtn_music_stop()V

    goto/16 :goto_1

    .line 808
    :cond_c
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v3, v5}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->sendAvrcpCommand(I)V

    goto/16 :goto_1

    .line 813
    :cond_d
    if-ne p1, v6, :cond_2

    .line 814
    iget-byte v3, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    if-ne v3, v5, :cond_2

    .line 815
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v3, :cond_2

    .line 816
    sget-object v3, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v3, v6}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->sendAvrcpCommand(I)V

    goto/16 :goto_1
.end method

.method private dobtn_music_prev()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 823
    iput-boolean v2, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bPressStop:Z

    .line 824
    invoke-static {}, Lcom/autochips/bluetooth/BtMusicActivity;->isRDSActive()Z

    move-result v0

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->isRds:Z

    if-eqz v0, :cond_2

    .line 825
    :cond_0
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f07005e

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 837
    :cond_1
    :goto_0
    return-void

    .line 828
    :cond_2
    sget v0, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-nez v0, :cond_4

    .line 830
    :cond_3
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0700b0

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 834
    :cond_4
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v0, :cond_1

    .line 835
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->sendAvrcpCommand(I)V

    goto :goto_0
.end method

.method private dobtn_music_stop()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 856
    sget-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtMusicActivity"

    const-string v1, "+ dobtn_music_stop"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 857
    :cond_0
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bStoped:Z

    .line 858
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bPressStop:Z

    .line 859
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "btmusic"

    const-string v2, "out"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 860
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mAudioManager:Landroid/media/AudioManager;

    if-eqz v0, :cond_1

    .line 861
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mAudioManager:Landroid/media/AudioManager;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mAudiorec:Landroid/content/ComponentName;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->unregisterMediaButtonEventReceiver(Landroid/content/ComponentName;)V

    .line 864
    :cond_1
    sget v0, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    if-ne v0, v3, :cond_2

    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-nez v0, :cond_4

    .line 866
    :cond_2
    const v0, 0x7f0700b0

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtMusicActivity;->showToast(I)V

    .line 876
    :cond_3
    :goto_0
    return-void

    .line 870
    :cond_4
    iget-byte v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    if-ne v0, v3, :cond_3

    .line 872
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v0, :cond_3

    .line 873
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->sendAvrcpCommand(I)V

    goto :goto_0
.end method

.method public static isRDSActive()Z
    .locals 7

    .prologue
    .line 700
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 701
    .local v1, "reply":Landroid/os/Parcel;
    sget-object v4, Lcom/autochips/bluetooth/BtMusicActivity;->gCbmCtx:Lcom/autochips/cbmctx/CBMCtx;

    if-nez v4, :cond_0

    .line 702
    new-instance v4, Lcom/autochips/cbmctx/CBMCtx;

    invoke-direct {v4}, Lcom/autochips/cbmctx/CBMCtx;-><init>()V

    sput-object v4, Lcom/autochips/bluetooth/BtMusicActivity;->gCbmCtx:Lcom/autochips/cbmctx/CBMCtx;

    .line 704
    :cond_0
    sget-object v4, Lcom/autochips/bluetooth/BtMusicActivity;->gCbmCtx:Lcom/autochips/cbmctx/CBMCtx;

    invoke-virtual {v4, v1}, Lcom/autochips/cbmctx/CBMCtx;->query(Landroid/os/Parcel;)I

    .line 705
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 706
    .local v2, "souce_count":I
    const-string v4, "BtMusicActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "rds --------souce_count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 707
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_2

    .line 708
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 709
    .local v3, "t":I
    const-string v4, "BtMusicActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "rds --------souce="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 710
    const/16 v4, 0xf

    if-ne v4, v3, :cond_1

    .line 711
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 712
    const/4 v4, 0x1

    .line 717
    .end local v3    # "t":I
    :goto_1
    return v4

    .line 707
    .restart local v3    # "t":I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 715
    .end local v3    # "t":I
    :cond_2
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 717
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private isRemoteDeviceSupportBtMusic(Landroid/bluetooth/BluetoothDevice;)Z
    .locals 6
    .param p1, "remoteDevice"    # Landroid/bluetooth/BluetoothDevice;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1082
    sget-boolean v1, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BtMusicActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isRemoteDeviceSupportBtMusic "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " UUID"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1083
    :cond_0
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getUuids()[Landroid/os/ParcelUuid;

    move-result-object v0

    .line 1089
    .local v0, "uuids":[Landroid/os/ParcelUuid;
    sget-object v1, Lcom/autochips/bluetooth/LocalBluetoothProfileManager;->A2DP_SINK_UUIDS:[Landroid/os/ParcelUuid;

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager;->containsAnyUuid([Landroid/os/ParcelUuid;[Landroid/os/ParcelUuid;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1090
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0700b7

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/BtMusicActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1091
    sput-boolean v4, Lcom/autochips/bluetooth/BtMusicActivity;->isRemoteDeviceSupportA2dp:Z

    .line 1102
    :goto_0
    return v5

    .line 1094
    :cond_1
    sput-boolean v5, Lcom/autochips/bluetooth/BtMusicActivity;->isRemoteDeviceSupportA2dp:Z

    .line 1096
    sget-object v1, Lcom/autochips/bluetooth/LocalBluetoothProfileManager;->AVRCP_CT_UUIDS:[Landroid/os/ParcelUuid;

    invoke-static {v0, v1}, Lcom/autochips/bluetooth/LocalBluetoothProfileManager;->containsAnyUuid([Landroid/os/ParcelUuid;[Landroid/os/ParcelUuid;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1097
    sput-boolean v4, Lcom/autochips/bluetooth/BtMusicActivity;->isRemoteDeviceSupportAvrcp:Z

    .line 1098
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0700b8

    invoke-virtual {p0, v2}, Lcom/autochips/bluetooth/BtMusicActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1100
    :cond_2
    sput-boolean v5, Lcom/autochips/bluetooth/BtMusicActivity;->isRemoteDeviceSupportAvrcp:Z

    goto :goto_0
.end method

.method private medianeedfinish()Z
    .locals 4

    .prologue
    .line 721
    const/4 v0, 0x0

    .line 728
    .local v0, "bneedfinsh":Z
    const-string v1, "BtMusicActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bneedfinsh="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 729
    return v0
.end method

.method private resetParameters()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 1073
    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicAlbum:Ljava/lang/String;

    .line 1074
    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicArtist:Ljava/lang/String;

    .line 1075
    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicTitle:Ljava/lang/String;

    .line 1076
    iput v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicTotalLength:I

    .line 1077
    iput v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicPlayingTime:I

    .line 1078
    iput-byte v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    .line 1079
    return-void
.end method

.method private showToast(I)V
    .locals 3
    .param p1, "resid"    # I

    .prologue
    .line 910
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mToast:Landroid/widget/Toast;

    if-nez v0, :cond_0

    .line 911
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, ""

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mToast:Landroid/widget/Toast;

    .line 913
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0, p1}, Landroid/widget/Toast;->setText(I)V

    .line 914
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 915
    return-void
.end method

.method private startCheckplayTimer()V
    .locals 6

    .prologue
    const-wide/16 v2, 0x7d0

    .line 153
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mTimer:Ljava/util/Timer;

    if-nez v0, :cond_0

    .line 154
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mTimer:Ljava/util/Timer;

    .line 156
    :cond_0
    new-instance v0, Lcom/autochips/bluetooth/BtMusicActivity$1;

    invoke-direct {v0, p0}, Lcom/autochips/bluetooth/BtMusicActivity$1;-><init>(Lcom/autochips/bluetooth/BtMusicActivity;)V

    iput-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mTask:Ljava/util/TimerTask;

    .line 174
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mTimer:Ljava/util/Timer;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mTask:Ljava/util/TimerTask;

    move-wide v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 176
    return-void
.end method

.method private stopCheckplayTimer()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 179
    iput v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mChecktimes:I

    .line 180
    iput-boolean v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bBackcarPause:Z

    .line 181
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mTask:Ljava/util/TimerTask;

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mTask:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 184
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mTimer:Ljava/util/Timer;

    if-eqz v0, :cond_1

    .line 185
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 186
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    .line 187
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mTimer:Ljava/util/Timer;

    .line 189
    :cond_1
    return-void
.end method

.method private updateMediaAlbum(I)V
    .locals 1
    .param p1, "string_id"    # I

    .prologue
    .line 984
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaAlbumInfo:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 985
    return-void
.end method

.method private updateMediaAlbum(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 973
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 975
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaAlbumInfo:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/ScrollingMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 976
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaAlbumInfo:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 980
    :goto_0
    return-void

    .line 978
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaAlbumInfo:Landroid/widget/TextView;

    const v1, 0x7f0700b2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method

.method private updateMediaArtist(I)V
    .locals 1
    .param p1, "string_id"    # I

    .prologue
    .line 968
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaArtistInfo:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 969
    return-void
.end method

.method private updateMediaArtist(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 957
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 959
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaArtistInfo:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/ScrollingMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 960
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaArtistInfo:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 964
    :goto_0
    return-void

    .line 962
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaArtistInfo:Landroid/widget/TextView;

    const v1, 0x7f0700b3

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method

.method private updateMediaTitle(I)V
    .locals 1
    .param p1, "string_id"    # I

    .prologue
    .line 952
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaTitleInfo:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 953
    return-void
.end method

.method private updateMediaTitle(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 941
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 943
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaTitleInfo:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/ScrollingMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 944
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaTitleInfo:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 948
    :goto_0
    return-void

    .line 946
    :cond_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaTitleInfo:Landroid/widget/TextView;

    const v1, 0x7f0700b1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method

.method private updateMusicPlayingProgress(BII)V
    .locals 1
    .param p1, "cmdType"    # B
    .param p2, "total_long"    # I
    .param p3, "playing_time"    # I

    .prologue
    const/4 v0, -0x1

    .line 1019
    packed-switch p1, :pswitch_data_0

    .line 1040
    :goto_0
    return-void

    .line 1022
    :pswitch_0
    if-eq p2, v0, :cond_0

    if-ne p3, v0, :cond_1

    .line 1023
    :cond_0
    const/4 p2, 0x0

    .line 1024
    const/4 p3, 0x0

    .line 1026
    :cond_1
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mMusicPlayingProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p2}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 1027
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mMusicPlayingProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p3}, Landroid/widget/ProgressBar;->setProgress(I)V

    goto :goto_0

    .line 1032
    :pswitch_1
    if-ne p3, v0, :cond_2

    .line 1033
    const/4 p3, 0x0

    .line 1034
    :cond_2
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mMusicPlayingProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p3}, Landroid/widget/ProgressBar;->setProgress(I)V

    goto :goto_0

    .line 1019
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private updatePlayPauseButton(B)V
    .locals 5
    .param p1, "playState"    # B

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 919
    sget-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtMusicActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updatePlayPauseButton,music="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-byte v2, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",a2dp="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 921
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 935
    :goto_0
    iput-byte p1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    .line 937
    return-void

    .line 923
    :pswitch_0
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->pausebutton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 924
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->playbutton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 929
    :pswitch_1
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->pausebutton:Landroid/widget/Button;

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 930
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->playbutton:Landroid/widget/Button;

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 921
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private updatePlayingProcess(I)V
    .locals 2
    .param p1, "pos"    # I

    .prologue
    .line 1008
    const/4 v0, 0x0

    .line 1009
    .local v0, "position":Ljava/lang/String;
    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    .line 1010
    invoke-virtual {p0, p1}, Lcom/autochips/bluetooth/BtMusicActivity;->millSeconds2readableTime(I)Ljava/lang/String;

    move-result-object v0

    .line 1014
    :goto_0
    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaPlayingPositionInfo:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1015
    return-void

    .line 1012
    :cond_0
    const-string v0, "00:00:00"

    goto :goto_0
.end method

.method private updatePlayingStatus(IIB)V
    .locals 3
    .param p1, "song_length"    # I
    .param p2, "song_position"    # I
    .param p3, "play_status"    # B

    .prologue
    const/4 v2, -0x1

    .line 989
    const/4 v0, 0x0

    .line 990
    .local v0, "length":Ljava/lang/String;
    const/4 v1, 0x0

    .line 992
    .local v1, "pos":Ljava/lang/String;
    if-eq p1, v2, :cond_0

    .line 993
    invoke-virtual {p0, p1}, Lcom/autochips/bluetooth/BtMusicActivity;->millSeconds2readableTime(I)Ljava/lang/String;

    move-result-object v0

    .line 997
    :goto_0
    if-eq p2, v2, :cond_1

    .line 998
    invoke-virtual {p0, p2}, Lcom/autochips/bluetooth/BtMusicActivity;->millSeconds2readableTime(I)Ljava/lang/String;

    move-result-object v1

    .line 1002
    :goto_1
    iget-object v2, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaLengthInfo:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1003
    iget-object v2, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaPlayingPositionInfo:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1004
    return-void

    .line 995
    :cond_0
    const-string v0, "00:00:00"

    goto :goto_0

    .line 1000
    :cond_1
    const-string v1, "00:00:00"

    goto :goto_1
.end method


# virtual methods
.method public millSeconds2readableTime(I)Ljava/lang/String;
    .locals 9
    .param p1, "millseconds"    # I

    .prologue
    const/16 v8, 0x9

    .line 1044
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 1045
    .local v0, "dateBf":Ljava/lang/StringBuffer;
    div-int/lit16 v4, p1, 0x3e8

    .line 1048
    .local v4, "totalSeconds":I
    div-int/lit8 v5, v4, 0x3c

    div-int/lit8 v1, v5, 0x3c

    .line 1049
    .local v1, "hour":I
    if-gt v1, v8, :cond_0

    .line 1050
    const-string v5, "0"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1055
    :goto_0
    div-int/lit8 v5, v4, 0x3c

    rem-int/lit8 v2, v5, 0x3c

    .line 1056
    .local v2, "minute":I
    if-gt v2, v8, :cond_1

    .line 1057
    const-string v5, "0"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1062
    :goto_1
    rem-int/lit8 v3, v4, 0x3c

    .line 1063
    .local v3, "second":I
    if-gt v3, v8, :cond_2

    .line 1064
    const-string v5, "0"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 1068
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 1052
    .end local v2    # "minute":I
    .end local v3    # "second":I
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 1059
    .restart local v2    # "minute":I
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 1066
    .restart local v3    # "second":I
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    goto :goto_2
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 879
    sget-boolean v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mbHfConnected:Z

    if-nez v0, :cond_1

    .line 880
    sget-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtMusicActivity"

    const-string v1, "[BTSuite]onClick:no connect bluetooth device!!!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 907
    :cond_0
    :goto_0
    return-void

    .line 884
    :cond_1
    sget-boolean v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mbInRds:Z

    if-eqz v0, :cond_2

    .line 885
    const v0, 0x7f07005e

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtMusicActivity;->showToast(I)V

    goto :goto_0

    .line 888
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 901
    :pswitch_0
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtMusicActivity;->dobtn_music_playpause(I)V

    .line 902
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->dobtn_music_stop()V

    goto :goto_0

    .line 891
    :pswitch_1
    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bPressStop:Z

    .line 892
    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->dobtn_music_playpause(I)V

    goto :goto_0

    .line 895
    :pswitch_2
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->dobtn_music_prev()V

    goto :goto_0

    .line 898
    :pswitch_3
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->dobtn_music_next()V

    goto :goto_0

    .line 888
    :pswitch_data_0
    .packed-switch 0x7f0a0050
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 510
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 511
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->setVolumeControlStream(I)V

    .line 512
    sget-boolean v1, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BtMusicActivity"

    const-string v2, "+ onCreat()+"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 513
    :cond_0
    const v1, 0x7f030009

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->setContentView(I)V

    .line 514
    const-string v1, "audio"

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mAudioManager:Landroid/media/AudioManager;

    .line 515
    new-instance v1, Landroid/content/ComponentName;

    const-class v2, Lcom/autochips/bluetooth/BtMusicActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mAudiorec:Landroid/content/ComponentName;

    .line 517
    sget-boolean v1, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v1, :cond_1

    const-string v1, "BtMusicActivity"

    const-string v2, "get mLocalBluetoothManager"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    :cond_1
    invoke-static {p0}, Lcom/autochips/bluetooth/LocalBluetoothManager;->getInstance(Landroid/content/Context;)Lcom/autochips/bluetooth/LocalBluetoothManager;

    move-result-object v1

    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    .line 519
    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mLocalManager:Lcom/autochips/bluetooth/LocalBluetoothManager;

    if-nez v1, :cond_2

    .line 520
    sget-boolean v1, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v1, :cond_2

    const-string v1, "BtMusicActivity"

    const-string v2, "mLocalManager is null"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 523
    :cond_2
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-nez v1, :cond_3

    .line 524
    sget-boolean v1, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v1, :cond_3

    const-string v1, "BtMusicActivity"

    const-string v2, "mAvrcpCtPlayerManage is null"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    :cond_3
    invoke-direct {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->resetParameters()V

    .line 531
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 532
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v1, "android.bluetooth.profilemanager.action.PROFILE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 533
    const-string v1, "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.action.ACTION_MEDIA_DATA_UPDATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 534
    const-string v1, "com.autochips.bluetooth.avrcpct.AvrcpCtPlayerUtility.action.ACTION_PLAYBACK_DATA_UPDATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 535
    const-string v1, "com.autochips.bluetooth.avrcpct.BluetoothAvrcpCtService.action.ACTION_BTMUSIC_INTERACTIVE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 536
    const-string v1, "xy.btmusic.stop"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 537
    const-string v1, "xy.android.xybtmusic.cbmpause"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 538
    const-string v1, "xy.android.avin.leave"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 539
    const-string v1, "xy.android.previousmedia"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 540
    const-string v1, "xy.android.nextmedia"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 541
    const-string v1, "xy.android.playpause"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 542
    const-string v1, "xy.android.forceplay"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 543
    const-string v1, "xy.android.forcepause"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 544
    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/autochips/bluetooth/BtMusicActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 547
    const v1, 0x7f0a0045

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->a2dpsinkStateInfo:Landroid/widget/TextView;

    .line 548
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v1, :cond_4

    .line 549
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->getA2dpSinkStateValue()I

    move-result v1

    sput v1, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    .line 551
    :cond_4
    sget v1, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    const/16 v2, 0xf

    if-ne v1, v2, :cond_6

    .line 552
    iput-byte v4, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    .line 558
    :goto_0
    const v1, 0x7f0a0047

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->avrcpctStateInfo:Landroid/widget/TextView;

    .line 559
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v1, :cond_5

    .line 560
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->getAvrcpStateValue()I

    move-result v1

    sput v1, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    .line 565
    :cond_5
    const v1, 0x7f0a0052

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->pausebutton:Landroid/widget/Button;

    .line 566
    const v1, 0x7f0a0053

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->playbutton:Landroid/widget/Button;

    .line 567
    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->pausebutton:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 568
    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->playbutton:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 569
    iget-byte v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->updatePlayPauseButton(B)V

    .line 570
    const v1, 0x7f0a0051

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 571
    const v1, 0x7f0a0054

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 572
    const v1, 0x7f0a0050

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 575
    const v1, 0x7f0a004c

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaTitleInfo:Landroid/widget/TextView;

    .line 576
    const v1, 0x7f0a0049

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaArtistInfo:Landroid/widget/TextView;

    .line 577
    const v1, 0x7f0a004b

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaAlbumInfo:Landroid/widget/TextView;

    .line 578
    const v1, 0x7f0a004d

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaPlayingPositionInfo:Landroid/widget/TextView;

    .line 579
    const v1, 0x7f0a004f

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mediaLengthInfo:Landroid/widget/TextView;

    .line 580
    const v1, 0x7f0a004e

    invoke-virtual {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mMusicPlayingProgressBar:Landroid/widget/ProgressBar;

    .line 581
    iget v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mDefaultMusicLong:I

    iget v2, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mDefaultPlayingTime:I

    invoke-direct {p0, v4, v1, v2}, Lcom/autochips/bluetooth/BtMusicActivity;->updateMusicPlayingProgress(BII)V

    .line 582
    iget v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mDefaultMusicLong:I

    iget v2, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mDefaultPlayingTime:I

    invoke-direct {p0, v1, v2, v3}, Lcom/autochips/bluetooth/BtMusicActivity;->updatePlayingStatus(IIB)V

    .line 583
    const v1, 0x7f0700b1

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->updateMediaTitle(I)V

    .line 584
    const v1, 0x7f0700b3

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->updateMediaArtist(I)V

    .line 585
    const v1, 0x7f0700b2

    invoke-direct {p0, v1}, Lcom/autochips/bluetooth/BtMusicActivity;->updateMediaAlbum(I)V

    .line 607
    return-void

    .line 554
    :cond_6
    iput-byte v3, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 677
    sget-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtMusicActivity"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 678
    :cond_0
    invoke-static {}, Lcom/autochips/bluetooth/BtMusicActivity;->isRDSActive()Z

    move-result v0

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->isRds:Z

    if-eqz v0, :cond_3

    .line 688
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "btmusic"

    const-string v2, "out"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 689
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mAudioManager:Landroid/media/AudioManager;

    if-eqz v0, :cond_2

    .line 690
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mAudioManager:Landroid/media/AudioManager;

    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mAudiorec:Landroid/content/ComponentName;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->unregisterMediaButtonEventReceiver(Landroid/content/ComponentName;)V

    .line 691
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bStoped:Z

    .line 693
    :cond_2
    iput-boolean v3, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bPressStop:Z

    .line 694
    iget-object v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/autochips/bluetooth/BtMusicActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 695
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 696
    return-void

    .line 679
    :cond_3
    sget v0, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    if-ne v0, v3, :cond_1

    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v0, :cond_1

    .line 682
    iget-byte v0, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    if-ne v0, v3, :cond_1

    .line 683
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/autochips/bluetooth/BtMusicActivity;->dobtn_music_playpause(I)V

    .line 684
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v0, :cond_1

    .line 685
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->sendAvrcpCommand(I)V

    goto :goto_0
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 620
    sget-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtMusicActivity"

    const-string v1, "onPause"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 621
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 623
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v0, :cond_1

    .line 624
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v0}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->notifyRevoke()Z

    .line 626
    :cond_1
    return-void
.end method

.method protected onResume()V
    .locals 7

    .prologue
    const v6, 0x7f070063

    const v5, 0x7f070062

    const/4 v4, 0x1

    .line 630
    sget-boolean v1, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "BtMusicActivity"

    const-string v2, "onResume"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 631
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 633
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "btmusic"

    const-string v3, "in"

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 635
    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mAudioManager:Landroid/media/AudioManager;

    if-eqz v1, :cond_1

    .line 636
    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mAudioManager:Landroid/media/AudioManager;

    iget-object v2, p0, Lcom/autochips/bluetooth/BtMusicActivity;->mAudiorec:Landroid/content/ComponentName;

    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->registerMediaButtonEventReceiver(Landroid/content/ComponentName;)V

    .line 637
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->bStoped:Z

    .line 639
    :cond_1
    sget-boolean v1, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v1, :cond_2

    const-string v1, "BtMusicActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onResume:music="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-byte v3, p0, Lcom/autochips/bluetooth/BtMusicActivity;->musicState:B

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",a2dp="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",avrcp="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 640
    :cond_2
    sget v1, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    if-eq v1, v4, :cond_4

    .line 641
    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->avrcpctStateInfo:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(I)V

    .line 647
    :goto_0
    sget v1, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    if-eq v1, v4, :cond_5

    sget v1, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    const/16 v2, 0xf

    if-eq v1, v2, :cond_5

    sget v1, Lcom/autochips/bluetooth/BtMusicActivity;->mA2dpsinkstate:I

    const/16 v2, 0x13

    if-eq v1, v2, :cond_5

    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v1, :cond_5

    .line 651
    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->a2dpsinkStateInfo:Landroid/widget/TextView;

    const v2, 0x7f070059

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 652
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    .line 654
    .local v0, "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    sget-object v1, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_A2DP_SINK:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v0, v1}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->connect(Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;)V

    .line 660
    .end local v0    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :goto_1
    sget v1, Lcom/autochips/bluetooth/BtMusicActivity;->mAvrcpctstate:I

    if-eq v1, v4, :cond_6

    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v1, :cond_6

    .line 662
    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->avrcpctStateInfo:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(I)V

    .line 663
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/autochips/bluetooth/BluetoothReceiver;->mConnectedDevice:Landroid/bluetooth/BluetoothDevice;

    invoke-static {v1, v2}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->getCachedDevice(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lcom/autochips/bluetooth/CachedBluetoothDevice;

    move-result-object v0

    .line 665
    .restart local v0    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    sget-object v1, Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;->Bluetooth_AVRCP_CT:Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;

    invoke-virtual {v0, v1}, Lcom/autochips/bluetooth/CachedBluetoothDevice;->connect(Lcom/autochips/bluetooth/LocalBluetoothProfileManager$BTProfile;)V

    .line 670
    .end local v0    # "cachedDevice":Lcom/autochips/bluetooth/CachedBluetoothDevice;
    :goto_2
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-eqz v1, :cond_3

    .line 671
    sget-object v1, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    invoke-virtual {v1}, Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;->notifyResume()Z

    .line 673
    :cond_3
    return-void

    .line 643
    :cond_4
    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->avrcpctStateInfo:Landroid/widget/TextView;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 656
    :cond_5
    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->a2dpsinkStateInfo:Landroid/widget/TextView;

    const v2, 0x7f070058

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1

    .line 667
    :cond_6
    iget-object v1, p0, Lcom/autochips/bluetooth/BtMusicActivity;->avrcpctStateInfo:Landroid/widget/TextView;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(I)V

    goto :goto_2
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outstate"    # Landroid/os/Bundle;

    .prologue
    .line 506
    return-void
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 611
    sget-boolean v0, Lcom/autochips/bluetooth/BtMusicActivity;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "BtMusicActivity"

    const-string v1, "onStart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 612
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 613
    sget-object v0, Lcom/autochips/bluetooth/BluetoothReceiver;->mAvrcpCtPlayerManage:Lcom/autochips/bluetooth/avrcpct/BluetoothAvrcpCtPlayerManage;

    if-nez v0, :cond_1

    .line 614
    invoke-virtual {p0}, Lcom/autochips/bluetooth/BtMusicActivity;->finish()V

    .line 616
    :cond_1
    return-void
.end method
