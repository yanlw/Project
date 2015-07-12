package cn.edu.niit.jobrecruitment.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

	/**
	 * 时间类型转换成String类型。
	 */
	public static String dateToString(Date date) {
		String dateStr = "";
		if (date != null) {
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			dateStr = sf.format(date);
		}
		return dateStr;
	}

	/**
	 * 日期相减，返回年
	 */
	public static String DateSubtract(Date endDate, Date startDate) {
		if (startDate == null || endDate == null) {
			return "0";
		}
		long startTime = startDate.getTime();
		long endTime = endDate.getTime();
		DecimalFormat df = new DecimalFormat("0.0");
		float result = endTime - startTime;
		result = result / (1000 * 60 * 60 * 24) / 365;
		return df.format(result);
	}
}
