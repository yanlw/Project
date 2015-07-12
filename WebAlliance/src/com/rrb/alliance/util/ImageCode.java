package com.rrb.alliance.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.Serializable;
import java.util.Random;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.rrb.alliance.exception.EmptyParamException;

public class ImageCode implements Serializable {

	/**
	 * 用户验证码的生成的工具类
	 */
	private static final long serialVersionUID = 1L;
	private static final int SIZE=4;
	private static final int LINES=5;
	private static final int WIDTH=60;
	private static final int HEIGHT=30;
	private static final int FONT0_SIZE=20;
	private static final int COLOR_MAX=150;
	private String number;
	private BufferedImage image;

	public BufferedImage getImage() {
		number="";
		image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_4BYTE_ABGR);
		Graphics2D g = image.createGraphics();
		g.setColor(Color.WHITE);
		g.setFont(new Font(null, Font.BOLD,FONT0_SIZE));
		g.fillRect(0, 0, WIDTH, HEIGHT);
		String strs = "AaBbCcDdEeFfGgHhiJjKkLMmNnPpQqRrSsTtUuVvWwXxYyZz1345678";
		Random random = new Random();
		for (int i = 0; i < SIZE; i++) {
			String str = strs.charAt(random.nextInt(strs.length()))+"";
			g.setColor(new Color(random.nextInt(COLOR_MAX), random.nextInt(COLOR_MAX),
					random.nextInt(COLOR_MAX)));
			g.drawString(str, 15*i, 20);
			number+=str;
		}
		for (int j = 0; j < LINES; j++) {
			g.setColor(new Color(random.nextInt(COLOR_MAX), random.nextInt(COLOR_MAX),
					random.nextInt(COLOR_MAX)));
			g.drawLine(random.nextInt(WIDTH), random.nextInt(HEIGHT), random
					.nextInt(WIDTH), random.nextInt(HEIGHT));
		}
		return image;
	}

	public String getNumber() {
		return number;
	}

	/*
	 * 用于把图片写入到文件
	 */
//	@PostConstruct
//	public void generateCode() {
//		
//		File f = new File(number + ".png");
//		try {
//			ImageIO.write(image, "png", f);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}

	/*
	 * 检验验证码的方法
	 */
	public boolean check(String code) throws EmptyParamException {
		if(code==null){
			throw new EmptyParamException("");
		}
		if(code.trim().equals("")){
			throw new EmptyParamException("验证码为空!");
		}
		return code.equalsIgnoreCase(number);
	}
	@Override
	public String toString() {
		return image+","+number;
	}

}
