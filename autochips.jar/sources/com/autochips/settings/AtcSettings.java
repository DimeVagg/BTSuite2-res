package com.autochips.settings;

import android.media.AudioManager;
import android.media.AudioTrack;
import android.util.Log;
import com.autochips.inputsource.HDMI;

public class AtcSettings {
    private static final String TAG = "AtcSettings";

    public static class Audio {

        public enum BalanceType {
            FRONT_LEFT(0),
            FRONT_RIGHT(1),
            REAR_LEFT(2),
            REAR_RIGHT(3),
            CENTER(4),
            SUB_WOOFER(5),
            LS(6),
            RS(7);
            
            private static BalanceType[] sTypes;
            private final int nativeInt;

            static {
                sTypes = new BalanceType[]{FRONT_LEFT, FRONT_RIGHT, REAR_LEFT, REAR_RIGHT, CENTER, SUB_WOOFER, LS, RS};
            }

            private BalanceType(int ni) {
                this.nativeInt = ni;
            }

            public static BalanceType nativeToType(int ni) {
                return sTypes[ni];
            }
        }

        public enum DACType {
            PWM(0),
            EXTERNAL(1);
            
            private static DACType[] sTypes;
            private final int nativeInt;

            static {
                sTypes = new DACType[]{PWM, EXTERNAL};
            }

            private DACType(int ni) {
                this.nativeInt = ni;
            }

            public static DACType nativeToType(int ni) {
                return sTypes[ni];
            }
        }

        public enum DecFeatureType {
            PROLOGICII(0),
            SACD(1),
            AAC(2),
            AACUSED_ONLY(3),
            NEO6(4);
            
            private static DecFeatureType[] sTypes;
            private final int nativeInt;

            static {
                sTypes = new DecFeatureType[]{PROLOGICII, SACD, AAC, AACUSED_ONLY, NEO6};
            }

            private DecFeatureType(int ni) {
                this.nativeInt = ni;
            }

            public static DecFeatureType nativeToType(int ni) {
                return sTypes[ni];
            }
        }

        public enum LoudnessMode {
            LOUDNESS_0dB(0),
            LOUDNESS_1dB(1),
            LOUDNESS_2dB(2),
            LOUDNESS_3dB(3),
            LOUDNESS_4dB(4),
            LOUDNESS_5dB(5),
            LOUDNESS_6dB(6),
            LOUDNESS_7dB(7),
            LOUDNESS_8dB(8),
            LOUDNESS_9dB(9),
            LOUDNESS_10dB(10),
            LOUDNESS_11dB(11),
            LOUDNESS_12dB(12),
            LOUDNESS_13dB(13),
            LOUDNESS_14dB(14),
            LOUDNESS_15dB(15),
            LOUDNESS_16dB(16),
            LOUDNESS_17dB(17),
            LOUDNESS_18dB(18),
            LOUDNESS_19dB(19),
            LOUDNESS_20dB(20);
            
            private static LoudnessMode[] sTypes;
            private final int nativeInt;

            static {
                sTypes = new LoudnessMode[]{LOUDNESS_0dB, LOUDNESS_1dB, LOUDNESS_2dB, LOUDNESS_3dB, LOUDNESS_4dB, LOUDNESS_5dB, LOUDNESS_6dB, LOUDNESS_7dB, LOUDNESS_8dB, LOUDNESS_9dB, LOUDNESS_10dB, LOUDNESS_11dB, LOUDNESS_12dB, LOUDNESS_13dB, LOUDNESS_14dB, LOUDNESS_15dB, LOUDNESS_16dB, LOUDNESS_17dB, LOUDNESS_18dB, LOUDNESS_19dB, LOUDNESS_20dB};
            }

            private LoudnessMode(int ni) {
                this.nativeInt = ni;
            }

            public static LoudnessMode nativeToType(int ni) {
                return sTypes[ni];
            }
        }

        public enum PL2Type {
            AUD_SE_PL2_OFF(0),
            AUD_SE_PL2_MUSIC(1),
            AUD_SE_PL2_MOVIE(2),
            AUD_SE_PL2_AUTO(3);
            
            private static PL2Type[] sTypes;
            private final int nativeInt;

            static {
                sTypes = new PL2Type[]{AUD_SE_PL2_OFF, AUD_SE_PL2_MUSIC, AUD_SE_PL2_MOVIE, AUD_SE_PL2_AUTO};
            }

            private PL2Type(int ni) {
                this.nativeInt = ni;
            }

            public static PL2Type nativeToType(int ni) {
                return sTypes[ni];
            }
        }

        public enum ReverbType {
            OFF(0),
            LIVINGROOM(1),
            HALL(2),
            CONCERT(3),
            CAVE(4),
            BATHROOM(5),
            ARENA(6);
            
            private static ReverbType[] sTypes;
            private final int nativeInt;

            static {
                sTypes = new ReverbType[]{OFF, LIVINGROOM, HALL, CONCERT, CAVE, BATHROOM, ARENA};
            }

            private ReverbType(int ni) {
                this.nativeInt = ni;
            }

            public static ReverbType nativeToType(int ni) {
                return sTypes[ni];
            }
        }

        public enum SRSFocusType {
            CENTER(0),
            FRONT(1),
            REAR(2);
            
            private static SRSFocusType[] sTypes;
            private final int nativeInt;

            static {
                sTypes = new SRSFocusType[]{CENTER, FRONT, REAR};
            }

            private SRSFocusType(int ni) {
                this.nativeInt = ni;
            }

            public static SRSFocusType nativeToType(int ni) {
                return sTypes[ni];
            }
        }

        public enum SRSMode {
            CINEMA(0),
            PRO(1),
            MUSIC(2),
            MONO(3),
            LCRS(4);
            
            private static SRSMode[] sTypes;
            private final int nativeInt;

            static {
                sTypes = new SRSMode[]{CINEMA, PRO, MUSIC, MONO, LCRS};
            }

            private SRSMode(int ni) {
                this.nativeInt = ni;
            }

            public static SRSMode nativeToType(int ni) {
                return sTypes[ni];
            }
        }

        public enum SRSSwitchType {
            OFF(0),
            ON(1),
            AUTO(2);
            
            private static SRSSwitchType[] sTypes;
            private final int nativeInt;

            static {
                sTypes = new SRSSwitchType[]{OFF, ON, AUTO};
            }

            private SRSSwitchType(int ni) {
                this.nativeInt = ni;
            }

            public static SRSSwitchType nativeToType(int ni) {
                return sTypes[ni];
            }
        }

        public static class SRSTrueBassSize {
            public static int SS_100HZ = 4;
            public static int SS_150HZ = 8;
            public static int SS_200HZ = 16;
            public static int SS_250HZ = 32;
            public static int SS_300HZ = 64;
            public static int SS_400HZ = 128;
            public static int SS_40HZ = 1;
            public static int SS_60HZ = 2;
        }

        public enum SRSTrueBassSizeType {
            FRONT(0),
            SUB(1),
            REAR(2);
            
            private static SRSTrueBassSizeType[] sTypes;
            private final int nativeInt;

            static {
                sTypes = new SRSTrueBassSizeType[]{FRONT, SUB, REAR};
            }

            private SRSTrueBassSizeType(int ni) {
                this.nativeInt = ni;
            }

            public static SRSTrueBassSizeType nativeToType(int ni) {
                return sTypes[ni];
            }
        }

        public enum SpdifOutputType {
            AOUT1(0),
            DVD_OUT(1),
            OFF(2);
            
            private static SpdifOutputType[] sTypes;
            private final int nativeInt;

            static {
                sTypes = new SpdifOutputType[]{AOUT1, DVD_OUT, OFF};
            }

            private SpdifOutputType(int ni) {
                this.nativeInt = ni;
            }

            public static SpdifOutputType nativeToType(int ni) {
                return sTypes[ni];
            }
        }

        public static class SpeakerLayout {
            public static int SPEAKER_LAYOUT_LR = 1;
            public static int SPEAKER_LAYOUT_LRC = 8;
            public static int SPEAKER_LAYOUT_LRCLSRS = 128;
            public static int SPEAKER_LAYOUT_LRCS = 32;
            public static int SPEAKER_LAYOUT_LRLSRS = 64;
            public static int SPEAKER_LAYOUT_LRS = 16;
            public static int SPEAKER_LAYOUT_MAX = HDMI.RCP_KEY_INVAILD;
            public static int SPEAKER_LAYOUT_MIN = 0;
            public static int SPEAKER_LAYOUT_MONO = 2;
            public static int SPEAKER_LAYOUT_STEREO = 4;
            public static int SPEAKER_LAYOUT_SUBWOOFER = 256;
        }

        public static class SpeakerSize {
            public static int SPEAKER_LAYOUT_C_LARGE = 1;
            public static int SPEAKER_LAYOUT_LS_LARGE = 8;
            public static int SPEAKER_LAYOUT_L_LARGE = 2;
            public static int SPEAKER_LAYOUT_RS_LARGE = 16;
            public static int SPEAKER_LAYOUT_R_LARGE = 4;
        }

        public enum TestToneMainType {
            FRONT(0),
            REAR(1),
            OFF(2);
            
            private static TestToneMainType[] sTypes;
            private final int nativeInt;

            static {
                sTypes = new TestToneMainType[]{FRONT, REAR, OFF};
            }

            private TestToneMainType(int ni) {
                this.nativeInt = ni;
            }

            public static TestToneMainType nativeToType(int ni) {
                return sTypes[ni];
            }
        }

        public enum TestToneSubType {
            PINK_NOISE(0),
            TRIANGLE_WAVE(1),
            SINE_WAVE(2),
            WHITE_NOISE(3),
            PINK_NOISE_DOLBY(4);
            
            private static TestToneSubType[] sTypes;
            private final int nativeInt;

            static {
                sTypes = new TestToneSubType[]{PINK_NOISE, TRIANGLE_WAVE, SINE_WAVE, WHITE_NOISE, PINK_NOISE_DOLBY};
            }

            private TestToneSubType(int ni) {
                this.nativeInt = ni;
            }

            public static TestToneSubType nativeToType(int ni) {
                return sTypes[ni];
            }
        }

        public static native int ChooseSpdifOutput(SpdifOutputType spdifOutputType);

        public static native int SelectDAC(int i, int i2);

        public static native int SetBTHFPVolume(int i);

        public static native int SetBalance(BalanceType balanceType, int i);

        public static native int SetDecFeatureType(DecFeatureType decFeatureType);

        public static native int SetDspMixCh(int i);

        public static native int SetDtmfCtrlType(int i, int i2);

        public static native int SetDtmfInValidTime(int i, int i2);

        public static native int SetDtmfMaxScale(int i);

        public static native int SetDtmfNewSamples(int i);

        public static native int SetDtmfNoiseRatio(int i);

        public static native int SetDtmfThreshold(double d, double d2);

        public static native int SetDtmfValidTime(int i, int i2);

        public static native int SetEQValues(int[] iArr);

        public static native int SetLoudness(LoudnessMode loudnessMode, int[] iArr);

        public static native int SetMicMute(boolean z);

        public static native int SetMute(boolean z);

        public static native int SetPCMConfig(int[] iArr);

        public static native int SetPCMDevVolume(int i, int i2);

        public static native int SetPL2(PL2Type pL2Type);

        public static native int SetPrimaryMic(int i);

        public static native int SetRearVolume(int i);

        public static native int SetReverb(ReverbType reverbType, int[] iArr);

        public static native int SetSRSFocusOn(SRSFocusType sRSFocusType, boolean z);

        public static native int SetSRSFullBandOn(boolean z);

        public static native int SetSRSMode(SRSMode sRSMode);

        public static native int SetSRSPhantomOn(boolean z);

        public static native int SetSRSSwitchType(SRSSwitchType sRSSwitchType);

        public static native int SetSRSTrueBassOn(boolean z);

        public static native int SetSRSTrueBassSize(SRSTrueBassSizeType sRSTrueBassSizeType, int i);

        public static native int SetSpeakerLayout(int i, int i2);

        public static native int SetTestTone(TestToneMainType testToneMainType, TestToneSubType testToneSubType);

        public static native int SetUpMix(boolean z, int[] iArr);

        public static native int SetVolume(int i);

        static {
            Log.i(AtcSettings.TAG, "[AtcSettings.Audio]: System.loadLibrary(\"libmtkset.so\");");
            System.loadLibrary("mtkset");
            Log.i(AtcSettings.TAG, "load ok");
        }

        public static boolean getGISAudioStatus() {
            return AudioTrack.getGISAudioStatus();
        }

        public static void setAudHWVolMax(int value) {
            AudioManager.setAudHWVolMax(value);
        }
    }

    public static class DVP {
        public static native int SetAudioLanType(int i);

        public static native int SetDialogType(int i);

        public static native int SetDisplayType(int i);

        public static native int SetDualMonoType(int i);

        public static native int SetDynamicType(int i);

        public static native int SetMenuLanType(int i);

        public static native int SetPBCType(int i);

        public static native int SetParentalType(int i);

        public static native int SetPwdModeType(int i);

        public static native int SetSpdifOutputType(int i);

        public static native int SetSpeakerLayout(int i, int i2);

        public static native int SetSubLanType(int i);

        public static native int SetTVType(int i);

        static {
            Log.i(AtcSettings.TAG, "[AtcSettings.DVP]: System.loadLibrary(\"libmtkset.so\");");
            System.loadLibrary("mtkset");
            Log.i(AtcSettings.TAG, "load ok");
        }
    }

    public static class Display {
        public static native int GetBrightnessLevel();

        public static native int GetContrastLevel();

        public static native int GetGammaTable(byte[] bArr);

        public static native int GetHueLevel();

        public static native int GetSaturationLevel();

        public static native int GetUGainLevel();

        public static native int GetVGainLevel();

        public static native int GetYGainLevel();

        public static native int SetBackLightLevel(int i);

        public static native int SetBrightnessLevel(int i);

        public static native int SetContrastLevel(int i);

        public static native int SetFrontRearDisplayFollow(boolean z);

        public static native int SetGammaTable(byte[] bArr);

        public static native int SetHueLevel(int i);

        public static native int SetSaturationLevel(int i);

        public static native int SetUGainLevel(int i);

        public static native int SetVGainLevel(int i);

        public static native int SetYGainLevel(int i);

        static {
            Log.i(AtcSettings.TAG, "[AtcSettings.Display]: System.loadLibrary(\"libmtkset.so\");");
            System.loadLibrary("mtkset");
            Log.i(AtcSettings.TAG, "load ok");
        }
    }

    public static class VCP {

        public static class ContrBritSatr {
            public int i4Brit;
            public int i4Contr;
            public int i4Satr;
            public int srctype;
        }

        public static class HUE {
            public int i4hue;
            public int srctype;
        }

        public static class SrcType {
            public static final int AVIN_1 = 12;
            public static final int AVIN_2 = 18;
            public static final int AVIN_3 = 19;
            public static final int AVIN_4 = 20;
            public static final int AVIN_5 = 21;
            public static final int BACKCAR = 13;
            public static final int DGI = 16;
            public static final int DVD = 11;
            public static final int HDMI = 17;
            public static final int USB = 10;
            public static final int VGA = 15;
            public static final int YPBPR = 14;
        }

        public static class YUVGain {
            public int i4UGain;
            public int i4VGain;
            public int i4YGain;
            public int srctype;
        }

        public static native int GetVcpContrBritSatrLevel(ContrBritSatr contrBritSatr);

        public static native int GetVcpHUELevel();

        public static native int GetVcpYUVGainLevel(YUVGain yUVGain);

        public static native int SetVcpContrBritSatrLevel(ContrBritSatr contrBritSatr);

        public static native int SetVcpHUELevel(HUE hue);

        public static native int SetVcpOff(int i);

        public static native int SetVcpOn(int i);

        public static native int SetVcpYUVGainLevel(YUVGain yUVGain);

        static {
            Log.i(AtcSettings.TAG, "[AtcSettings.VCP]: System.loadLibrary(\"libmtkset.so\");");
            System.loadLibrary("mtkset");
            Log.i(AtcSettings.TAG, "load ok");
        }
    }

    static {
        Log.i(TAG, "[AtcSettings]: System.loadLibrary(\"libmtkset.so\");");
        System.loadLibrary("mtkset");
        Log.i(TAG, "load ok");
    }
}
