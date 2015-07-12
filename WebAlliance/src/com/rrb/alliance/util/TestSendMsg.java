package com.rrb.alliance.util;

import java.util.Random;

import com.jianzhou.sdk.BusinessService;

public class TestSendMsg {

	public static void sendMsg(String phone,String strRandValue) {
        // 要发送的手机号
        String strPhone = phone;
        // 要发送的短信内容
        String strMsg = String.format("验证码:%s 【车险无忧车宝】 ", strRandValue);

        BusinessService bs = new BusinessService();
        bs.setWebService("http://www.jianzhou.sh.cn/JianzhouSMSWSServer/services/BusinessService");
        int returnValue = bs.sendBatchMessage("sdk_renrenbao", "04153337", strPhone, strMsg);

        System.out.println("建周sendBatchMessage发送短信方法返回值：[" + returnValue + "],发送手机号：[" + strPhone
                + "],发送验证码：[" + strRandValue + "]");
    }

    public static String GetRoundValue() {
        Random rd = new Random();
        String strValue = "";
        do {
            char szNum = (char) (Math.abs(rd.nextInt()) % 10 + 48);// 产生数字0-9的随机数
            strValue += Character.toString(szNum);
        } while (strValue.length() < 6);
        return strValue;
    }
}
