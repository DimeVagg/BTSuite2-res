package com.autochips.storage;

import android.content.Context;
import android.os.IBinder;
import android.os.ServiceManager;
import android.os.storage.IMountService;
import android.os.storage.IMountService.Stub;
import android.os.storage.StorageManager;
import android.util.Log;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;

public class EnvironmentATC {
    private static final String LOG_TAG = "EnvironmentATC";
    private static final String SD_PATH_MARK = "ext_sd";
    private static final String USB_PATH_MARK = "udisk";
    IMountService mMountService;
    private StorageManager sm;

    public EnvironmentATC(Context ctx) {
        this.sm = (StorageManager) ctx.getSystemService("storage");
    }

    public String[] getStorageAllPaths() {
        String[] paths = null;
        try {
            return (String[]) this.sm.getClass().getMethod("getVolumePaths", new Class[0]).invoke(this.sm, new Object[0]);
        } catch (Exception e) {
            Log.e(LOG_TAG, "Call getMethod of getVolumePaths Error");
            e.printStackTrace();
            return paths;
        }
    }

    public String[] getSdAllPaths() {
        ArrayList<String> arrayPath = new ArrayList();
        String[] paths = null;
        try {
            paths = (String[]) this.sm.getClass().getMethod("getVolumePaths", new Class[0]).invoke(this.sm, new Object[0]);
        } catch (Exception e) {
            Log.e(LOG_TAG, "Call getMethod of getVolumePaths Error");
            e.printStackTrace();
        }
        if (paths == null) {
            return null;
        }
        int i;
        for (i = 0; i < paths.length; i++) {
            if (-1 != paths[i].indexOf(SD_PATH_MARK)) {
                arrayPath.add(paths[i]);
            }
        }
        int count = arrayPath.size();
        String[] pathsReturn = new String[count];
        for (i = 0; i < count; i++) {
            pathsReturn[i] = (String) arrayPath.get(i);
        }
        return pathsReturn;
    }

    public String[] getUsbAllPaths() {
        ArrayList<String> arrayPath = new ArrayList();
        String[] paths = null;
        try {
            paths = (String[]) this.sm.getClass().getMethod("getVolumePaths", new Class[0]).invoke(this.sm, new Object[0]);
        } catch (Exception e) {
            Log.e(LOG_TAG, "Call getMethod of getVolumePaths Error");
            e.printStackTrace();
        }
        if (paths == null) {
            return null;
        }
        int i;
        for (i = 0; i < paths.length; i++) {
            if (-1 != paths[i].indexOf(USB_PATH_MARK)) {
                arrayPath.add(paths[i]);
            }
        }
        int count = arrayPath.size();
        String[] pathsReturn = new String[count];
        for (i = 0; i < count; i++) {
            pathsReturn[i] = (String) arrayPath.get(i);
        }
        return pathsReturn;
    }

    public String[] getStorageMountedPaths() {
        ArrayList<String> arrayPath = new ArrayList();
        String[] paths = getStorageAllPaths();
        if (paths == null) {
            return null;
        }
        int i;
        for (i = 0; i < paths.length; i++) {
            String strState = getStorageState(paths[i]);
            if (strState != null && strState.equals("mounted")) {
                arrayPath.add(paths[i]);
            }
        }
        int count = arrayPath.size();
        String[] pathsReturn = new String[count];
        for (i = 0; i < count; i++) {
            pathsReturn[i] = (String) arrayPath.get(i);
        }
        return pathsReturn;
    }

    public String[] getSdMountedPaths() {
        ArrayList<String> arrayPath = new ArrayList();
        String[] paths = getSdAllPaths();
        if (paths == null) {
            return null;
        }
        int i;
        for (i = 0; i < paths.length; i++) {
            String strState = getStorageState(paths[i]);
            if (strState != null && strState.equals("mounted")) {
                arrayPath.add(paths[i]);
            }
        }
        int count = arrayPath.size();
        String[] pathsReturn = new String[count];
        for (i = 0; i < count; i++) {
            pathsReturn[i] = (String) arrayPath.get(i);
        }
        return pathsReturn;
    }

    public String[] getUsbMountedPaths() {
        ArrayList<String> arrayPath = new ArrayList();
        String[] paths = getUsbAllPaths();
        if (paths == null) {
            return null;
        }
        int i;
        for (i = 0; i < paths.length; i++) {
            String strState = getStorageState(paths[i]);
            if (strState != null && strState.equals("mounted")) {
                arrayPath.add(paths[i]);
            }
        }
        int count = arrayPath.size();
        String[] pathsReturn = new String[count];
        for (i = 0; i < count; i++) {
            pathsReturn[i] = (String) arrayPath.get(i);
        }
        return pathsReturn;
    }

    public void getStorageMountedPaths(ArrayList<String> arrayList) {
        arrayList.clear();
        String[] paths = getStorageAllPaths();
        if (paths != null) {
            for (int i = 0; i < paths.length; i++) {
                String strState = getStorageState(paths[i]);
                if (strState != null && strState.equals("mounted")) {
                    arrayList.add(paths[i]);
                }
            }
        }
    }

    public String getStorageState(String mountPoint) {
        String strState = null;
        try {
            return (String) this.sm.getClass().getMethod("getVolumeState", new Class[]{String.class}).invoke(this.sm, new Object[]{mountPoint});
        } catch (Exception e) {
            Log.e(LOG_TAG, "Call getMethod of getVolumeState Error");
            e.printStackTrace();
            return strState;
        }
    }

    private synchronized IMountService getMountService() {
        if (this.mMountService == null) {
            IBinder service = ServiceManager.getService("mount");
            if (service != null) {
                this.mMountService = Stub.asInterface(service);
            } else {
                Log.e(LOG_TAG, "Can't get mount service");
            }
        }
        return this.mMountService;
    }

    public boolean unmount(String mountPoint) {
        try {
            getMountService().unmountVolume(mountPoint, true, false);
            Log.i(LOG_TAG, "unmount  " + mountPoint);
            return true;
        } catch (Exception e) {
            Log.e(LOG_TAG, "Can't unmount  " + mountPoint + "\n" + e.getMessage());
            return false;
        }
    }

    public boolean mount(String mountPoint) {
        IMountService mountService = getMountService();
        if (mountService != null) {
            try {
                int rc = mountService.mountVolume(mountPoint);
                if (rc != 0) {
                    Log.e(LOG_TAG, "Can't mount  " + mountPoint + "\n" + rc);
                    return false;
                }
                Log.i(LOG_TAG, "mount  " + mountPoint);
                return true;
            } catch (Exception e) {
                Log.e(LOG_TAG, "Can't mount  " + mountPoint + "\n" + e.getMessage());
                return false;
            }
        }
        Log.e(LOG_TAG, "Mount service is null, can't mount");
        return false;
    }

    public String ReportStorageState(String mountPoint) {
        File FILE_DIR;
        String strState = null;
        Log.i(LOG_TAG, "ReportStorageState - mountPoint = " + mountPoint);
        if ("/mnt/udisk2".equals(mountPoint)) {
            FILE_DIR = new File("/sys/udisk2detect/usb_state");
        } else if (!"/mnt/udisk1".equals(mountPoint)) {
            return "0";
        } else {
            FILE_DIR = new File("/sys/udisk1detect/usb_state");
        }
        if (FILE_DIR.exists()) {
            try {
                BufferedReader reader = new BufferedReader(new FileReader(FILE_DIR));
                strState = reader.readLine();
                reader.close();
            } catch (Exception e) {
            }
            if (strState != null) {
                return strState;
            }
        }
        return "0";
    }
}
