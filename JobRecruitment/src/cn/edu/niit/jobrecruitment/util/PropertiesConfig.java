package cn.edu.niit.jobrecruitment.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Properties;

/**
 * Java读写修改Property文件
 */
public class PropertiesConfig {
	/**
	 * 读取文件
	 */
	public static Properties readFile(String fileName) {
		InputStream is = PropertiesConfig.class.getClassLoader().getResourceAsStream(fileName);
		BufferedReader read = new BufferedReader(new InputStreamReader(is));
		Properties props = new Properties();
		try {
			props.load(read);
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return props;
	}
	
	/**
	 * 修改键值对
	 */
	public static void writeFile(String fileName, String key,
			String value) {
		try {
			InputStream is = PropertiesConfig.class.getClassLoader().getResourceAsStream(fileName);
			BufferedReader read = new BufferedReader(new InputStreamReader(is));
			Properties props = new Properties();
			props.load(read);
			is.close();
			// 写入属性文件
			String filePath = PropertiesConfig.class.getClassLoader().getResource(fileName).getFile();
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath)));
			props.setProperty(key, value);
			props.store(bw, "update password");
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
