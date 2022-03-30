package cn.tool;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Const {
    public static final String ROOT="/firmweb/";
    public static final String ROOT01="/";
    public static final Integer pageSize=8;
    public static String getCurrentTime(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(new Date());
    }
}
