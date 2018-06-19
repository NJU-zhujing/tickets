package cn.edu.nju.tickets.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    public static Date datetimeLocalToDate(String str)  {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date date = null;
        try {
            date = sdf.parse(str.replace("T"," "));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;


    }


}
