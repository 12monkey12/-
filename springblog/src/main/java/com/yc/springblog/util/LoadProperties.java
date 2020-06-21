package com.yc.springblog.util;

import java.io.InputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class LoadProperties {
	private static Properties pro = new Properties();
	public static Properties getProperties() {
		InputStream is = null;
		try {
			is = LoadProperties.class.getClassLoader().getResourceAsStream("config.properties");
			pro.load(is);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return pro;
	}
}
