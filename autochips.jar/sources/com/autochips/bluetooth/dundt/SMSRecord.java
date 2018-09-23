package com.autochips.bluetooth.dundt;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class SMSRecord implements Parcelable {
    public static final Creator<SMSRecord> CREATOR = new C00311();
    private String Sms_Body;
    private int Sms_Index;
    private String Sms_PhoneNum;
    private int Sms_Status;
    private String Sms_Time;

    /* renamed from: com.autochips.bluetooth.dundt.SMSRecord$1 */
    static class C00311 implements Creator<SMSRecord> {
        C00311() {
        }

        public SMSRecord createFromParcel(Parcel source) {
            return new SMSRecord(source);
        }

        public SMSRecord[] newArray(int size) {
            return new SMSRecord[size];
        }
    }

    public SMSRecord(Parcel pl) {
        this.Sms_PhoneNum = pl.readString();
        this.Sms_Index = pl.readInt();
        this.Sms_Status = pl.readInt();
        this.Sms_Body = pl.readString();
        this.Sms_Time = pl.readString();
    }

    public SMSRecord(String Sms_PhoneNum, String Sms_Name, int Sms_Index, int Sms_Status, String Sms_Body, String Sms_Time, int Sms_ConversationId) {
        this.Sms_PhoneNum = Sms_PhoneNum;
        this.Sms_Index = Sms_Index;
        this.Sms_Status = Sms_Status;
        this.Sms_Body = Sms_Body;
        this.Sms_Time = Sms_Time;
    }

    public void setPhoneNum(String Sms_PhoneNum) {
        this.Sms_PhoneNum = Sms_PhoneNum;
    }

    public String getPhoneNum() {
        return this.Sms_PhoneNum;
    }

    public void setIndex(int Sms_Index) {
        this.Sms_Index = Sms_Index;
    }

    public int getIndex() {
        return this.Sms_Index;
    }

    public void setType(int Sms_Status) {
        this.Sms_Status = Sms_Status;
    }

    public int getType() {
        return this.Sms_Status;
    }

    public void setBody(String Sms_Body) {
        this.Sms_Body = Sms_Body;
    }

    public String getBody() {
        return this.Sms_Body;
    }

    public void setTime(String Sms_Time) {
        this.Sms_Time = Sms_Time;
    }

    public String getTime() {
        return this.Sms_Time;
    }

    public String toString() {
        return "SMSRecord [Sms_PhoneNum=" + this.Sms_PhoneNum + ",Sms_Index=" + this.Sms_Index + ",Sms_Status=" + this.Sms_Status + ",Sms_Body=" + this.Sms_Body + ",Sms_Time=" + this.Sms_Time + "]";
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.Sms_PhoneNum);
        dest.writeInt(this.Sms_Index);
        dest.writeInt(this.Sms_Status);
        dest.writeString(this.Sms_Body);
        dest.writeString(this.Sms_Time);
    }
}
