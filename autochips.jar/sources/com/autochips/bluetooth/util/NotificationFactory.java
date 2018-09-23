package com.autochips.bluetooth.util;

import android.app.Notification;
import com.autochips.bluetooth.BluetoothProfile;
import java.util.HashMap;

public class NotificationFactory {
    private static final int CACHE_SIZE = 8;
    private static HashMap<Integer, Notification> cache = new HashMap(8);

    public static int getProfileNotificationId(int profileId, int notificationId) {
        return BluetoothProfile.getProfileStart(profileId) + notificationId;
    }

    public static synchronized Notification getProfileNotification(int id) {
        Notification n;
        synchronized (NotificationFactory.class) {
            if (!cache.containsKey(Integer.valueOf(id))) {
                if (cache.size() > 8) {
                    cache.clear();
                }
                cache.put(Integer.valueOf(id), new Notification());
            }
            n = (Notification) cache.get(Integer.valueOf(id));
            n.when = System.currentTimeMillis();
            n.defaults = 0;
        }
        return n;
    }
}
