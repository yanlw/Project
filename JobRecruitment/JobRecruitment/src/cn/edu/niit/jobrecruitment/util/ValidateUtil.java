package cn.edu.niit.jobrecruitment.util;

import java.util.Collection;

/**
 * 验证工具类
 */
public class ValidateUtil {
	/**
	 * 判断字符串有效性
	 */
	public static boolean isValid(String src) {
		if (src == null || "".equals(src.trim())) {
			return false;
		}
		return true;
	}

	/**
	 * 判断集合有效性
	 */
	public static boolean isValid(Collection col) {
		if (col == null || col.isEmpty()) {
			return false;
		}
		return true;
	}
}
