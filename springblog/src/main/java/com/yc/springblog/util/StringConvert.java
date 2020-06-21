package com.yc.springblog.util;

public class StringConvert {
	
	// 防止js注入攻击
	public static String StrConvert(String str) {
		String result = str.replace("<", "&lt;").replace(">", "&gt;");
		return result;
	}

}
