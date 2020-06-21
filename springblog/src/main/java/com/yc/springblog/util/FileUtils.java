package com.yc.springblog.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileUtils {

	public static void saveFile(File fromFile,File toFile) {
		FileInputStream fis = null;
		FileOutputStream fos = null;
		byte[] data = new byte[1024];
		int len = -1;
		
		try {
			fis = new FileInputStream(fromFile);
			fos = new FileOutputStream(toFile);
			while((len = fis.read(data)) > 0) {
				fos.write(data, 0, len);
			}
			fos.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		
	}
}
