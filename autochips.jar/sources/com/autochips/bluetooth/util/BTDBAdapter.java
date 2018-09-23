package com.autochips.bluetooth.util;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import com.autochips.bluetooth.BtEmulatorDebug;
import com.autochips.bluetooth.PbSyncManager.PBRecord;
import com.autochips.bluetooth.dundt.SMSRecord;
import com.autochips.bluetooth.pbapclient.BluetoothPbapClientPath;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BTDBAdapter {
    private static final String DATABASE_NAME = "BTDATABASE";
    private static final String DATABASE_PATH = "/data4write/bluetooth/";
    private static final int DATABASE_VERSION = 1;
    public static boolean DBG = (BtEmulatorDebug.mDebugAll & BtEmulatorDebug.mDebugPB);
    public static final String KEY_CALLTIME = "calltime";
    public static final String KEY_INDEX = "smsindex";
    public static final String KEY_MESSAGECOUNT = "messagecount";
    public static final String KEY_ORDER = "ordernum";
    public static final String KEY_PERSONNAME = "personname";
    public static final String KEY_PHONENO = "phoneno";
    public static final String KEY_PHONENUMBER = "phonenumber";
    public static final String KEY_ROWID = "_id";
    public static final String KEY_SCTIME = "sctime";
    public static final String KEY_SMSBody = "smsbody";
    public static final String KEY_SMSROWID = "_id";
    public static final String KEY_SMSTYPE = "smstype";
    public static final String KEY_TYPE = "phonebooktype";
    private static final String PBAP_DB_CREATE = "create table PBAPTABLE (_id integer primary key,phonebooktype integer,personname Text,phonenumber Text,calltime Text,ordernum integer)";
    private static final String SMSTABLE_NAME = "SMSTABLE";
    private static final String SMS_DB_CREATE = "create table SMSTABLE (_id integer primary key,smstype integer,phoneno Text,sctime Text,smsbody Text,smsindex integer)";
    private static final String TABLE_NAME = "PBAPTABLE";
    public static final String TAG = "BTDBAdapter";
    private static boolean mOpened = false;
    private static final BTDBAdapter m_Instance = new BTDBAdapter();
    private DatabaseHelper DBHelper;
    private Context context;
    private SQLiteDatabase db;

    private static class DatabaseHelper extends SQLiteOpenHelper {
        DatabaseHelper(Context context) {
            super(context, null, null, 1);
        }

        public void onCreate(SQLiteDatabase db) {
            if (BTDBAdapter.DBG) {
                Log.d(BTDBAdapter.TAG, "onCreate()");
            }
            db.execSQL(BTDBAdapter.PBAP_DB_CREATE);
            db.execSQL(BTDBAdapter.SMS_DB_CREATE);
        }

        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            if (BTDBAdapter.DBG) {
                Log.d(BTDBAdapter.TAG, "onUpgrade()");
            }
            db.execSQL("DROP TABLE IF EXISTS PBAPTABLE");
            db.execSQL("DROP TABLE IF EXISTS SMSTABLE");
            onCreate(db);
        }
    }

    private BTDBAdapter() {
    }

    public static BTDBAdapter getInstance() {
        return m_Instance;
    }

    public void setContext(Context ctx) {
        this.context = ctx;
    }

    public BTDBAdapter open() throws SQLException {
        if (DBG) {
            Log.d(TAG, "open() mOpened = " + mOpened);
        }
        if (!mOpened) {
            this.DBHelper = new DatabaseHelper(this.context);
            mOpened = true;
        }
        return this;
    }

    public void close() {
        if (DBG) {
            Log.d(TAG, "close()");
        }
        if (mOpened) {
            this.DBHelper.close();
            mOpened = false;
        }
    }

    public long insertOneRecord(int type, String name, String phonenum, String calltime, int order) {
        if (DBG) {
            Log.d(TAG, "insertOneRecord()");
        }
        String phoneNumTrimed = phonenum.replaceAll("\\D+", BluetoothPbapClientPath.PBAP_ROOT_NAME);
        this.db = this.DBHelper.getWritableDatabase();
        ContentValues initialValues = new ContentValues();
        initialValues.put(KEY_TYPE, Integer.valueOf(type));
        initialValues.put(KEY_PERSONNAME, name);
        initialValues.put(KEY_PHONENUMBER, phoneNumTrimed);
        initialValues.put(KEY_CALLTIME, calltime);
        initialValues.put(KEY_ORDER, Integer.valueOf(order));
        return this.db.insert(TABLE_NAME, null, initialValues);
    }

    public long insertOneRecord(PBRecord record, int order) {
        if (DBG) {
            Log.d(TAG, "insertOneRecord()");
        }
        String phoneNumTrimed = record.getNumber().replaceAll("\\D+", BluetoothPbapClientPath.PBAP_ROOT_NAME);
        this.db = this.DBHelper.getWritableDatabase();
        ContentValues initialValues = new ContentValues();
        initialValues.put(KEY_TYPE, Integer.valueOf(record.getType()));
        initialValues.put(KEY_PERSONNAME, record.getName());
        initialValues.put(KEY_PHONENUMBER, phoneNumTrimed);
        initialValues.put(KEY_CALLTIME, record.getCalltime());
        initialValues.put(KEY_ORDER, Integer.valueOf(order));
        return this.db.insert(TABLE_NAME, null, initialValues);
    }

    public long insertOneSmsRecord(SMSRecord record) {
        if (DBG) {
            Log.d(TAG, "insertOneSmsRecord()");
        }
        this.db = this.DBHelper.getWritableDatabase();
        String strSql = "select * from SMSTABLE where smsindex=? and smsbody=?";
        if (DBG) {
            Log.d(TAG, "Sql string is:" + strSql);
        }
        Cursor cursor = this.db.rawQuery(strSql, new String[]{String.valueOf(record.getIndex()), record.getBody()});
        if (cursor.getCount() > 0) {
            cursor.close();
            return -1;
        }
        cursor.close();
        ContentValues initialValues = new ContentValues();
        initialValues.put(KEY_SMSTYPE, Integer.valueOf(record.getType()));
        initialValues.put(KEY_PHONENO, record.getPhoneNum());
        initialValues.put(KEY_SCTIME, record.getTime());
        initialValues.put(KEY_SMSBody, record.getBody());
        initialValues.put(KEY_INDEX, Integer.valueOf(record.getIndex()));
        return this.db.insert(SMSTABLE_NAME, null, initialValues);
    }

    public List<PBRecord> getPbRecords(int type, int firstIdx, int maxResult) {
        if (DBG) {
            Log.d(TAG, "getPbRecords(" + type + "," + firstIdx + "," + maxResult + ")");
        }
        this.db = this.DBHelper.getReadableDatabase();
        List<PBRecord> records = new ArrayList();
        Cursor cursor = this.db.rawQuery("select personname,phonenumber,calltime from PBAPTABLE where phonebooktype=? order by ordernum asc limit ?,?", new String[]{String.valueOf(type), String.valueOf(firstIdx), String.valueOf(maxResult)});
        if (cursor != null) {
            if (cursor.getCount() > 0) {
                cursor.moveToFirst();
                do {
                    PBRecord oneRecord = new PBRecord();
                    oneRecord.setType(type);
                    oneRecord.setName(cursor.getString(cursor.getColumnIndex(KEY_PERSONNAME)));
                    oneRecord.setNumber(cursor.getString(cursor.getColumnIndex(KEY_PHONENUMBER)));
                    oneRecord.setCalltime(cursor.getString(cursor.getColumnIndex(KEY_CALLTIME)));
                    records.add(oneRecord);
                } while (cursor.moveToNext());
            }
            cursor.close();
        }
        if (DBG) {
            Log.d(TAG, "records.size()=" + records.size());
        }
        return records;
    }

    public boolean SearchPhonebookByString(String search, List<PBRecord> records) {
        records.clear();
        this.db = this.DBHelper.getReadableDatabase();
        String sql = "select personname,phonenumber from PBAPTABLE where (phonebooktype=16 or phonebooktype=32) and (personname like '%" + search + "%' or " + KEY_PHONENUMBER + " like '%" + search + "%')";
        String tmpSearch = "%" + search + "%";
        Cursor cursor = this.db.rawQuery("select personname,phonenumber from PBAPTABLE where (phonebooktype=? or phonebooktype=?) and (personname like ? or phonenumber like ?)", new String[]{String.valueOf(16), String.valueOf(32), tmpSearch, tmpSearch});
        if (cursor != null) {
            if (cursor.getCount() > 0) {
                cursor.moveToFirst();
                do {
                    PBRecord oneRecord = new PBRecord();
                    oneRecord.setName(cursor.getString(cursor.getColumnIndex(KEY_PERSONNAME)));
                    oneRecord.setNumber(cursor.getString(cursor.getColumnIndex(KEY_PHONENUMBER)));
                    records.add(oneRecord);
                } while (cursor.moveToNext());
            }
            cursor.close();
        }
        if (DBG) {
            Log.d(TAG, "records.size()=" + records.size());
        }
        return true;
    }

    public List<SMSRecord> getSmsRecords(int type, int firstIdx, int maxResult) {
        Cursor cursor;
        if (DBG) {
            Log.d(TAG, "getSmsRecords(" + type + "," + firstIdx + "," + maxResult + ")");
        }
        this.db = this.DBHelper.getReadableDatabase();
        List<SMSRecord> records = new ArrayList();
        String strSql;
        if (type == 4) {
            strSql = "select smstype,smsbody,phoneno,sctime from SMSTABLE order by sctime desc limit ?,?";
            if (DBG) {
                Log.d(TAG, "Sql string is:" + strSql);
            }
            cursor = this.db.rawQuery(strSql, new String[]{String.valueOf(firstIdx), String.valueOf(maxResult)});
        } else {
            strSql = "select smsbody,phoneno,sctime from SMSTABLE where smstype=? order by sctime desc limit ?,?";
            if (DBG) {
                Log.d(TAG, "Sql string is:" + strSql);
            }
            cursor = this.db.rawQuery(strSql, new String[]{String.valueOf(type), String.valueOf(firstIdx), String.valueOf(maxResult)});
        }
        if (cursor != null) {
            if (cursor.getCount() > 0) {
                cursor.moveToFirst();
                do {
                    SMSRecord oneRecord = new SMSRecord();
                    if (type == 4) {
                        oneRecord.setType(Integer.parseInt(cursor.getString(cursor.getColumnIndex(KEY_SMSTYPE))));
                    } else {
                        oneRecord.setType(type);
                    }
                    oneRecord.setPhoneNum(cursor.getString(cursor.getColumnIndex(KEY_PHONENO)));
                    oneRecord.setTime(cursor.getString(cursor.getColumnIndex(KEY_SCTIME)));
                    oneRecord.setBody(cursor.getString(cursor.getColumnIndex(KEY_SMSBody)));
                    records.add(oneRecord);
                } while (cursor.moveToNext());
            }
            cursor.close();
        }
        if (DBG) {
            Log.d(TAG, "records.size()=" + records.size());
        }
        return records;
    }

    public int getCount(int type) {
        if (DBG) {
            Log.d(TAG, "getCount()");
        }
        this.db = this.DBHelper.getReadableDatabase();
        Cursor cursor = this.db.rawQuery("select count(*) from PBAPTABLE where phonebooktype=?", new String[]{String.valueOf(type)});
        cursor.moveToFirst();
        int count = cursor.getInt(0);
        cursor.close();
        return count;
    }

    public int getSmsNo(int type) {
        Cursor cursor;
        if (DBG) {
            Log.d(TAG, "getSmsNo(),type is:" + type);
        }
        this.db = this.DBHelper.getReadableDatabase();
        if (type == 4) {
            cursor = this.db.rawQuery("select count(*) from SMSTABLE", null);
        } else {
            cursor = this.db.rawQuery("select count(*) from SMSTABLE where smstype=?", new String[]{String.valueOf(type)});
        }
        cursor.moveToFirst();
        int count = cursor.getInt(0);
        cursor.close();
        return count;
    }

    public void delete(int type) {
        if (DBG) {
            Log.d(TAG, "delete(" + type + ")");
        }
        this.db = this.DBHelper.getWritableDatabase();
        this.db.execSQL("delete from PBAPTABLE where phonebooktype=?", new Object[]{Integer.valueOf(type)});
    }

    public void deleteOneSms(int type) {
        if (DBG) {
            Log.d(TAG, "deleteOneSms(" + type + ")");
        }
        this.db = this.DBHelper.getWritableDatabase();
        if (type == 4) {
            this.db.execSQL("delete from SMSTABLE");
            return;
        }
        this.db.execSQL("delete from SMSTABLE where smstype=?", new Object[]{Integer.valueOf(type)});
    }

    public List<Map<String, String>> getTelbyName(String name) {
        this.db = this.DBHelper.getReadableDatabase();
        List<Map<String, String>> tel = new ArrayList();
        Cursor cursor = this.db.rawQuery("select * from PBAPTABLE where (phonebooktype=16 or phonebooktype=32) and personname like ?", new String[]{"%" + name + "%"});
        if (cursor != null) {
            if (cursor.getCount() > 0) {
                cursor.moveToFirst();
                do {
                    Map<String, String> map = new HashMap();
                    map.put("PHONENumber", cursor.getString(cursor.getColumnIndex(KEY_PHONENUMBER)));
                    map.put("PHONEName", cursor.getString(cursor.getColumnIndex(KEY_PERSONNAME)));
                    tel.add(map);
                } while (cursor.moveToNext());
            }
            cursor.close();
        }
        return tel;
    }

    public String getNamebyTel(String tel) {
        this.db = this.DBHelper.getReadableDatabase();
        String sName = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        Cursor cursor = this.db.rawQuery("select personname from PBAPTABLE where (phonebooktype=16 or phonebooktype=32) and phonenumber=?", new String[]{tel});
        if (cursor.getCount() == 0) {
            sName = BluetoothPbapClientPath.PBAP_ROOT_NAME;
        } else {
            cursor.moveToNext();
            sName = cursor.getString(cursor.getColumnIndex(KEY_PERSONNAME));
        }
        cursor.close();
        return sName;
    }

    public void updateOrderNumber(int type) {
        this.db = this.DBHelper.getWritableDatabase();
        this.db.execSQL("update PBAPTABLE set ordernum=ordernum+1 where phonebooktype=?", new Object[]{Integer.valueOf(type)});
    }

    public void updateType(int type) {
        this.db = this.DBHelper.getWritableDatabase();
        this.db.execSQL("update SMSTABLE set smsindex=smsindex+1 where smstype=?", new Object[]{Integer.valueOf(type)});
    }

    public void flushPhonebookTable() {
        if (DBG) {
            Log.d(TAG, "flushPhonebookTable");
        }
        SQLiteDatabase dbObj = null;
        this.db = this.DBHelper.getReadableDatabase();
        try {
            dbObj = SQLiteDatabase.openOrCreateDatabase("/data4write/bluetooth/BTDATABASE.db", null);
            dbObj.execSQL("DROP TABLE IF EXISTS PBAPTABLE");
            dbObj.execSQL(PBAP_DB_CREATE);
            try {
                dbObj.close();
            } catch (SQLException e) {
            }
            try {
                this.db.execSQL("ATTACH DATABASE '/data4write/bluetooth/BTDATABASE.db' as dbObj");
                this.db.execSQL("INSERT INTO dbObj.PBAPTABLE SELECT * FROM PBAPTABLE");
                try {
                    this.db.execSQL("DETACH DATABASE dbObj");
                } catch (SQLException e2) {
                }
            } catch (SQLException e3) {
                if (DBG) {
                    Log.e(TAG, "flushPhonebookTable, exception2");
                }
                try {
                    this.db.execSQL("DETACH DATABASE dbObj");
                } catch (SQLException e4) {
                }
            } catch (Throwable th) {
                try {
                    this.db.execSQL("DETACH DATABASE dbObj");
                } catch (SQLException e5) {
                }
            }
        } catch (SQLException e6) {
            if (DBG) {
                Log.e(TAG, "flushPhonebookTable, exception1");
            }
            try {
                dbObj.close();
            } catch (SQLException e7) {
            }
        } catch (Throwable th2) {
            try {
                dbObj.close();
            } catch (SQLException e8) {
            }
            throw th2;
        }
    }

    public void loadPhonebookTable() {
        if (DBG) {
            Log.d(TAG, "loadPhonebookTable");
        }
        this.db = this.DBHelper.getWritableDatabase();
        try {
            this.db.execSQL("DROP TABLE IF EXISTS PBAPTABLE");
            this.db.execSQL(PBAP_DB_CREATE);
            this.db.execSQL("ATTACH DATABASE '/data4write/bluetooth/BTDATABASE.db' as dbObj");
            this.db.execSQL("INSERT INTO PBAPTABLE SELECT * FROM dbObj.PBAPTABLE");
            try {
                this.db.execSQL("DETACH DATABASE dbObj");
            } catch (SQLException e) {
            }
        } catch (SQLException e2) {
            if (DBG) {
                Log.e(TAG, "loadPhonebookTable, exception");
            }
            try {
                this.db.execSQL("DETACH DATABASE dbObj");
            } catch (SQLException e3) {
            }
        } catch (Throwable th) {
            try {
                this.db.execSQL("DETACH DATABASE dbObj");
            } catch (SQLException e4) {
            }
        }
    }
}
