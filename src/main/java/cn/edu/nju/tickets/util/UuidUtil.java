package cn.edu.nju.tickets.util;

import java.util.UUID;

public class UuidUtil {

    public static String getUuidString7(){
        String str = UUID.randomUUID().toString().replace("-","").substring(0,7);
        return str;
    }

    public static String getUuidString32(){
        String str = UUID.randomUUID().toString().replace("-","");
        return str;
    }

}
