package com.autochips.bluetooth.hf;

import android.bluetooth.AtCommandResult;

public abstract class HfAtCommandHandler {
    public void handleBasicCommand(String arg) {
    }

    public AtCommandResult handleActionCommand() {
        return new AtCommandResult(1);
    }

    public AtCommandResult handleReadCommand() {
        return new AtCommandResult(1);
    }

    public void handleResponseCode(Object[] args) {
    }

    public void handleResponseCode() {
    }

    public AtCommandResult handleSetCommand(Object[] args) {
        return new AtCommandResult(1);
    }

    public AtCommandResult handleTestCommand() {
        return new AtCommandResult(0);
    }
}
