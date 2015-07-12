package com.rrb.alliance.util;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

	public  static String getFile(MultipartFile imgFile, String examinePhotoPath,
			String photoFileName, List<String> fileTypes) {
		String fileName = imgFile.getOriginalFilename();
		// 获取上传文件类型的扩展名,先得到.的位置，再截取从.的下一个位置到文件的最后，最后得到扩展名
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
		// 对扩展名进行小写转换
		ext = ext.toLowerCase();
		Date date = new Date();
		long time = date.getTime();
		fileName = time + "." + ext;

		File file = null;
		if (fileTypes.contains(ext)) { // 如果扩展名属于允许上传的类型，则创建文件
			file = creatFolder(examinePhotoPath, photoFileName, fileName);
			try {
				imgFile.transferTo(file); // 保存上传的文件
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return fileName;
	}

	/**
	 * 检测与创建一级、二级文件夹、文件名 这里我通过传入的两个字符串来做一级文件夹和二级文件夹名称
	 * 通过此种办法我们可以做到根据用户的选择保存到相应的文件夹下
	 */
	public static File creatFolder(String examinePhotoPath, String photoFileName, String fileName) {
		File file = null;
		File firstFolder = new File(examinePhotoPath); // 一级文件夹
		if (firstFolder.exists()) { // 如果一级文件夹存在，则检测二级文件夹
			File secondFolder = new File(firstFolder, photoFileName);
			if (secondFolder.exists()) { // 如果二级文件夹也存在，则创建文件
				file = new File(secondFolder, fileName);
			} else { // 如果二级文件夹不存在，则创建二级文件夹
				secondFolder.mkdir();
				file = new File(secondFolder, fileName); // 创建完二级文件夹后，再合建文件
			}
		} else { // 如果一级不存在，则创建一级文件夹
			firstFolder.mkdir();
			File secondFolder = new File(firstFolder, photoFileName);
			if (secondFolder.exists()) { // 如果二级文件夹也存在，则创建文件
				file = new File(secondFolder, fileName);
			} else { // 如果二级文件夹不存在，则创建二级文件夹
				secondFolder.mkdir();
				file = new File(secondFolder, fileName);
			}
		}
		return file;
	}
}
