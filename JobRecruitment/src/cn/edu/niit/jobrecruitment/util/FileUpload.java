package cn.edu.niit.jobrecruitment.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.struts2.ServletActionContext;
/**
 *上传文件类
 */
public class FileUpload {
	
	/**
	 *上传文件方法
	 */
	public static void fileUpload(String filePath, String fileName) {
		InputStream is = null;
		OutputStream os = null;
		String outPath = ServletActionContext.getServletContext().getRealPath("upload");
		try {
			is = new FileInputStream(filePath);
			File file = new File(outPath, fileName);
			os = new FileOutputStream(file);
			byte[] buffer = new byte[400];
			int length = 0;
			while ((length = is.read(buffer)) > 0) {
				os.write(buffer, 0, length);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (is != null) {
					is.close();
				}
				if (os != null) {
					os.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
