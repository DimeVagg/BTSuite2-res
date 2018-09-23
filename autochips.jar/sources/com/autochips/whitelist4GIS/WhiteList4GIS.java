package com.autochips.whitelist4GIS;

import android.util.Log;
import com.autochips.whitelist.WhiteList;
import java.io.File;
import java.io.FileInputStream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class WhiteList4GIS {
    public static final String TAG = "whitelist4GIS";
    public static final String XMLPATH = "/data4write/whitelist4gis_conf.xml";

    public static boolean addToWhiteList4GIS(String name) {
        return WhiteList.addToWhiteList4GIS(name);
    }

    public static boolean removeFromWhiteList4GIS(String name) {
        return WhiteList.removeFromWhiteList4GIS(name);
    }

    public static String getWhiteList4GISName(int index) throws Exception {
        DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
        File file = new File(XMLPATH);
        if (file.exists()) {
            NodeList nodeList = builder.parse(new FileInputStream(file)).getDocumentElement().getElementsByTagName("GISName");
            if (nodeList == null || nodeList.getLength() == 0) {
                Log.e(TAG, "root can not find:/data4write/whitelist4gis_conf.xmlnodeList:" + nodeList + "getLength:" + nodeList.getLength());
                return null;
            } else if (nodeList.getLength() >= index) {
                return ((Element) nodeList.item(index)).getTextContent();
            } else {
                Log.e(TAG, "index is:" + index + ", it is larger than whitelist count:" + nodeList.getLength());
                return null;
            }
        }
        Log.e(TAG, "can not find:/data4write/whitelist4gis_conf.xml");
        return null;
    }

    public static int getWhiteList4GISNameCount(int index) throws Exception {
        DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
        File file = new File(XMLPATH);
        if (file.exists()) {
            NodeList nodeList = builder.parse(new FileInputStream(file)).getDocumentElement().getElementsByTagName("GISName");
            if (nodeList != null && nodeList.getLength() != 0) {
                return nodeList.getLength();
            }
            Log.e(TAG, "root can not find:/data4write/whitelist4gis_conf.xmlnodeList:" + nodeList + "getLength:" + nodeList.getLength());
            return 0;
        }
        Log.e(TAG, "can not find:/data4write/whitelist4gis_conf.xml");
        return 0;
    }
}
