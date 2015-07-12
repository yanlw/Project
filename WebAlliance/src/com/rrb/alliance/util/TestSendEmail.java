package com.rrb.alliance.util;

import java.io.IOException;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

/**
 *发送邮件的类
 */
public class TestSendEmail {
	
	/**
	 * 发送邮件
	 */
	public static int sendEmail(String tipic, String email, String content)
			throws HttpException, IOException {
		String url = "https://sendcloud.sohu.com/webapi/mail.send.xml";
		HttpClient httpclient = new HttpClient();
		PostMethod httpost = new PostMethod(url);
		httpost.addRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=utf8");
		NameValuePair apiUser = new NameValuePair("api_user",
				"postmaster@chebao2.sendcloud.org"); // 使用api_user和api_key进行验证
		NameValuePair apiKey = new NameValuePair("api_key", "Y6HUEr09swUxvOzw");
		NameValuePair from = new NameValuePair("from",
				"no-reply@chebao.sendcloud.org"); // 发信人，用正确邮件地址替代
		NameValuePair address = new NameValuePair("to", email); // 收件人地址，用正确邮件地址替代，多个地址用';'分隔
		NameValuePair tip = new NameValuePair("subject", tipic);// 主题
		NameValuePair con = new NameValuePair("html", content);// 内容
		httpost.setRequestBody(new NameValuePair[] { apiUser, apiKey, from,
				address, tip, con });
		return httpclient.executeMethod(httpost);
	}
}
