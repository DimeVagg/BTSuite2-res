package com.autochips.bluetooth.hf;

import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;
import com.autochips.dvp.MultiMediaConstant;
import java.util.ArrayList;
import java.util.HashMap;

public class BluetoothHfAtParser {
    private static final int COMMAND_NORMAL = 0;
    private static final int COMMAND_SPECIAL = 1;
    private static final int COMMAND_SPECIAL_COMMBINE = 3;
    private static final int COMMAND_SPECIAL_INCOMPLETE = 2;
    private static boolean DEBUG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugHF);
    private static final String TAG = "BluetoothHfAtParser";
    private static final int TYPE_ACTION = 0;
    private static final int TYPE_READ = 1;
    private static final int TYPE_RESULT = 4;
    private static final int TYPE_SET = 2;
    private static final int TYPE_TEST = 3;
    private static String mIgnoreRsp;
    private HashMap<Character, HfAtCommandHandler> mBasicHandlers = new HashMap();
    private boolean mCombineCommand = false;
    private HashMap<String, HfAtCommandHandler> mExtHandlers = new HashMap();
    private ArrayList<String> mSpecialAtCommands = new ArrayList();
    private String mcacheCommandBuffer;

    public BluetoothHfAtParser() {
        this.mSpecialAtCommands.add("+MMGL");
        this.mSpecialAtCommands.add("+CMGL");
        this.mSpecialAtCommands.add("+CMGR");
        this.mSpecialAtCommands.add("+CPMS");
        this.mSpecialAtCommands.add("+CMSERROR");
    }

    public void register(Character command, HfAtCommandHandler handler) {
        this.mBasicHandlers.put(command, handler);
    }

    public void register(String command, HfAtCommandHandler handler) {
        this.mExtHandlers.put(command, handler);
    }

    private static String clean(String input) {
        StringBuilder out = new StringBuilder(input.length());
        int i = 0;
        while (i < input.length()) {
            char c = input.charAt(i);
            if (c == '\"') {
                int j = input.indexOf(34, i + 1);
                if (j == -1) {
                    out.append(input.substring(i, input.length()));
                    out.append('\"');
                    break;
                }
                out.append(input.substring(i, j + 1));
                i = j;
            } else if (c != ' ') {
                out.append(Character.toUpperCase(c));
            }
            i++;
        }
        return out.toString();
    }

    private static boolean isAtoZ(char c) {
        return c >= 'A' && c <= 'Z';
    }

    private static int findChar(char ch, String input, int fromIndex) {
        int i = fromIndex;
        while (i < input.length()) {
            char c = input.charAt(i);
            if (c == '\"') {
                i = input.indexOf(34, i + 1);
                if (i == -1) {
                    return input.length();
                }
            } else if (c == ch) {
                return i;
            }
            i++;
        }
        return input.length();
    }

    private static Object[] generateArgs(String input) {
        int i = 0;
        ArrayList<Object> out = new ArrayList();
        while (i <= input.length()) {
            int j = findChar(',', input, i);
            String arg = input.substring(i, j);
            try {
                out.add(new Integer(arg));
            } catch (NumberFormatException e) {
                out.add(arg);
            }
            i = j + 1;
        }
        return out.toArray();
    }

    private static int findEndExtendedName(String input, int index) {
        for (int i = index; i < input.length(); i++) {
            char c = input.charAt(i);
            if (!isAtoZ(c) && (c < '0' || c > '9')) {
                switch (c) {
                    case '!':
                    case '%':
                    case MultiMediaConstant.DVDANGLE /*45*/:
                    case MultiMediaConstant.DVDAUDIO /*46*/:
                    case MultiMediaConstant.PLAYSTATE /*47*/:
                    case MultiMediaConstant.LMCLICK_ITEM_TYPE /*95*/:
                        break;
                    default:
                        return i;
                }
            }
        }
        return input.length();
    }

    private int checkSpecialCommands(String raw_input) {
        String input = clean(raw_input);
        for (int index = 0; index < input.length(); index++) {
            char c = input.charAt(index);
            if (isAtoZ(c)) {
                return 0;
            }
            if (c == '+') {
                this.mCombineCommand = false;
                String commandName = input.substring(index, findEndExtendedName(input, index + 1));
                if (!this.mSpecialAtCommands.contains(commandName)) {
                    return 0;
                }
                if (!commandName.contains("CMGR") || input.length() >= 29) {
                    return 1;
                }
                if (DEBUG) {
                    Log.i(TAG, "command is not complete!" + commandName);
                }
                this.mCombineCommand = true;
                return 2;
            }
            if (c >= '0' && c <= '9') {
                if (DEBUG) {
                    Log.i(TAG, "numerical string!" + input);
                }
                if (this.mCombineCommand) {
                    return 3;
                }
            }
        }
        return 0;
    }

    public void processHfAtCommands(String raw_input) {
        String CRLF = "\r\n";
        StringBuilder sb = new StringBuilder();
        int commandType = checkSpecialCommands(raw_input);
        if (commandType == 1) {
            if (DEBUG) {
                Log.i(TAG, "is a special command ");
            }
            process(raw_input);
        } else if (commandType == 2) {
            this.mcacheCommandBuffer = raw_input;
            if (DEBUG) {
                Log.i(TAG, "command is not complete!" + this.mcacheCommandBuffer);
            }
        } else if (commandType == 3) {
            if (DEBUG) {
                Log.i(TAG, "process COMMAND_SPECIAL_COMMBINE" + this.mcacheCommandBuffer + raw_input);
            }
            process(this.mcacheCommandBuffer + raw_input);
        } else {
            String[] lineCmd = raw_input.split(CRLF);
            int i = 0;
            while (i < lineCmd.length) {
                if (DEBUG) {
                    Log.i(TAG, "processHfAtCommands: " + lineCmd[i]);
                }
                if (lineCmd[i].indexOf("CMGR") < 0 || lineCmd[i].length() > 29) {
                    sb.append(lineCmd[i]);
                    if (sb.toString().indexOf("CMGR") > 0 && sb.toString().indexOf(CRLF) < 29) {
                        if (DEBUG) {
                            Log.w(TAG, "String end without CRLF,add it");
                        }
                        sb.append(CRLF);
                    }
                    process(sb.toString());
                    sb = new StringBuilder();
                } else {
                    sb.append(lineCmd[i]);
                    sb.append(CRLF);
                }
                i++;
            }
        }
    }

    public void process(String raw_input) {
        String input = clean(raw_input);
        int index = 0;
        if (!input.equals(BluetoothPbapClientPath.PBAP_ROOT_NAME)) {
            while (index < input.length()) {
                char c = input.charAt(index);
                if (isAtoZ(c)) {
                    if (!this.mExtHandlers.containsKey(input)) {
                        if (DEBUG) {
                            Log.i(TAG, "ignore the basic AT command " + input);
                        }
                        mIgnoreRsp = input;
                        return;
                    } else if (this.mExtHandlers.get(input) != null) {
                        ((HfAtCommandHandler) this.mExtHandlers.get(input)).handleResponseCode();
                        return;
                    } else {
                        return;
                    }
                } else if (c == '+') {
                    int i = findEndExtendedName(input, index + 1);
                    String commandName = input.substring(index, i);
                    if (this.mExtHandlers.containsKey(commandName)) {
                        HfAtCommandHandler handler = (HfAtCommandHandler) this.mExtHandlers.get(commandName);
                        if (handler != null) {
                            int type;
                            int endIndex = findChar(';', input, index);
                            if (i >= endIndex) {
                                type = 0;
                            } else if (input.charAt(i) == '?') {
                                type = 1;
                            } else if (input.charAt(i) == ':') {
                                type = 4;
                            } else if (input.charAt(i) != '=') {
                                type = 0;
                            } else if (i + 1 >= endIndex) {
                                type = 2;
                            } else if (input.charAt(i + 1) == '?') {
                                type = 3;
                            } else {
                                type = 2;
                            }
                            switch (type) {
                                case 0:
                                    handler.handleActionCommand();
                                    break;
                                case 1:
                                    handler.handleReadCommand();
                                    break;
                                case 2:
                                    handler.handleSetCommand(generateArgs(input.substring(i + 1, endIndex)));
                                    break;
                                case 3:
                                    handler.handleTestCommand();
                                    break;
                                case 4:
                                    handler.handleResponseCode(generateArgs(input.substring(i + 1, endIndex)));
                                    break;
                                default:
                                    break;
                            }
                            index = endIndex;
                        } else {
                            return;
                        }
                    }
                    if (DEBUG) {
                        Log.i(TAG, "ignore the Ext AT command " + input);
                    }
                    mIgnoreRsp = input;
                    return;
                } else {
                    index++;
                }
            }
        } else if (DEBUG) {
            Log.i(TAG, "process empty line ");
        }
    }

    public static String getRawData() {
        return mIgnoreRsp;
    }

    public static void resetRawData() {
        mIgnoreRsp = BluetoothPbapClientPath.PBAP_ROOT_NAME;
    }
}
