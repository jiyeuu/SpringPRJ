package poly.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static String getDateTime(String fm) {
		
		Date today = new Date();
		System.out.println(today);
		
		SimpleDateFormat date = new SimpleDateFormat(fm);
		
		return date.format(today);

	}
	
	public static String getDateTime() {
		
		return getDateTime("yyyy.mm.dd");
	}
	
	
    public static String cleanXSS2(String value) {

    	value = value.replaceAll("script", "!스크립트");


    	return value;
    }
}
