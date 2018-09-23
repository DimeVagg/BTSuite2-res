package com.autochips.bluetooth.PbSyncManager;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class PBRecord implements Parcelable {
    public static final Creator<PBRecord> CREATOR = new C00051();
    private String calltime;
    private String name;
    private String number;
    private int type;

    /* renamed from: com.autochips.bluetooth.PbSyncManager.PBRecord$1 */
    static class C00051 implements Creator<PBRecord> {
        C00051() {
        }

        public PBRecord createFromParcel(Parcel source) {
            return new PBRecord(source);
        }

        public PBRecord[] newArray(int size) {
            return new PBRecord[size];
        }
    }

    public PBRecord(Parcel pl) {
        this.type = pl.readInt();
        this.name = pl.readString();
        this.number = pl.readString();
        this.calltime = pl.readString();
    }

    public PBRecord(int type, String name, String number, String calltime) {
        this.type = type;
        this.name = name;
        this.number = number;
        this.calltime = calltime;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getType() {
        return this.type;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getNumber() {
        return this.number;
    }

    public void setCalltime(String calltime) {
        this.calltime = calltime;
    }

    public String getCalltime() {
        return this.calltime;
    }

    public String toString() {
        return "PBRecord [type=" + this.type + ",name=" + this.name + ",number=" + this.number + ",calltime=" + this.calltime + "]";
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.type);
        dest.writeString(this.name);
        dest.writeString(this.number);
        dest.writeString(this.calltime);
    }
}
