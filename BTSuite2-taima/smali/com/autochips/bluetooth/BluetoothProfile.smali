.class public Lcom/autochips/bluetooth/BluetoothProfile;
.super Ljava/lang/Object;
.source "BluetoothProfile.java"


# static fields
.field public static final BT_PROFILE_RANGE:I = 0x989680

.field public static final BT_PROFILE_START:I = 0x0

.field public static final ID_A2DP:I = 0x0

.field public static final ID_AVRCP:I = 0x1

.field public static final ID_BIP:I = 0x2

.field public static final ID_BPP:I = 0x3

.field public static final ID_CHN:I = 0x4

.field public static final ID_FTP:I = 0x5

.field public static final ID_GAP:I = 0x6

.field public static final ID_GOEP:I = 0x7

.field public static final ID_HFG:I = 0x8

.field public static final ID_HFP:I = 0x12

.field public static final ID_HID:I = 0x9

.field public static final ID_MAP:I = 0xa

.field public static final ID_OPP:I = 0xb

.field public static final ID_PAN:I = 0xf

.field public static final ID_PBAP:I = 0xc

.field public static final ID_PRXM:I = 0x10

.field public static final ID_PRXR:I = 0x11

.field public static final ID_SIMAP:I = 0xd

.field public static final ID_SPP:I = 0xe

.field public static final ID_TIMEC:I = 0x13

.field public static final ID_TIMES:I = 0x14

.field public static final PROFILE_START:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    const/16 v0, 0x15

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/autochips/bluetooth/BluetoothProfile;->PROFILE_START:[I

    return-void

    :array_0
    .array-data 4
        0x989680
        0x1312d00
        0x1c9c380
        0x2625a00
        0x2faf080
        0x3938700
        0x42c1d80
        0x4c4b400
        0x55d4a80
        0x5f5e100
        0x68e7780
        0x7270e00
        0x7bfa480
        0x8583b00
        0x8f0d180
        0x9896800
        0xa21fe80
        0xaba9500
        0xb532b80
        0xbebc200
        0xc845880
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getProfileStart(I)I
    .locals 1
    .param p0, "profileId"    # I

    .prologue
    .line 91
    sget-object v0, Lcom/autochips/bluetooth/BluetoothProfile;->PROFILE_START:[I

    aget v0, v0, p0

    return v0
.end method
