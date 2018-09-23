package com.autochips.media;

import android.graphics.Bitmap;
import android.media.TimedText;

public final class AtcTimedText {
    private TimedText mTimedText;

    public AtcTimedText(TimedText timedText) {
        this.mTimedText = timedText;
    }

    public Bitmap getPicture() {
        return this.mTimedText.getPicture();
    }

    public int getVideoWidth() {
        return this.mTimedText.getVideoWidth();
    }

    public int getVideoHeight() {
        return this.mTimedText.getVideoHeight();
    }
}
