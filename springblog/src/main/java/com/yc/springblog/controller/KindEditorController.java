package com.yc.springblog.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yc.springblog.entity.Admin;

@RestController
@RequestMapping("/KindEditor")
public class KindEditorController {

	@RequestMapping("/uploadImage")
	public void uploadImage(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		//文件保存路径
		String savePath = request.getServletContext().getRealPath("/") + "attached/";
		//E:\software\apache-tomcat-8.5.40\apache-tomcat-8.5.40\webapps\springblog
		//文件保存目录URL
		String saveUrl  = request.getContextPath() + "/attached/";
		//\springblog
		
		//定义允许上传的文件扩展名
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		
		//最大文件大小
		long maxSize = 1000000;
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		if(!ServletFileUpload.isMultipartContent(multiRequest)){
			out.println(getError("请选择文件。"));
			return;
		}
		
		//检查目录
		File uploadDir = new File(savePath);
		if(!uploadDir.isDirectory()){
			out.println(getError("上传目录不存在。"));
			return;
		}
		
		//检查目录写权限
		if(!uploadDir.canWrite()){
			out.println(getError("上传目录没有写权限。"));
			return;
		}
		
		//创建文件夹
		Admin admin = (Admin) session.getAttribute("admin");
		String department = admin.getDepartment();
		savePath += department + "/";
		saveUrl += department + "/";
		File dirFile = new File(savePath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}
		
		String fileType = request.getParameter("dir");
		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		// 循环遍历，取出单个文件
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			// 获取单个文件
			MultipartFile mf = entity.getValue();
			
			String fileName = mf.getOriginalFilename();
			
			//检查文件大小
			if(mf.getSize() > maxSize){
				out.println(getError("上传文件大小超过限制。"));
				return;
			}
			//检查扩展名
			String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
			if(!Arrays.<String>asList(extMap.get(fileType).split(",")).contains(fileExt)){
				out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(fileType) + "格式。"));
				return;
			}

			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
			try{
				File uploadedFile = new File(savePath, newFileName);
				mf.transferTo(uploadedFile);
			}catch(Exception e){
				out.println(getError("上传文件失败。"));
				return;
			}

			JSONObject obj = new JSONObject();
			obj.put("error", 0);
			obj.put("url", saveUrl + newFileName);
			out.println(obj.toJSONString());
		}
		
	}
	
	@RequestMapping("/managerImage")
	public int managerImage(HttpServletRequest request) {
		
		
		return 0;
	}
	
	private String getError(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj.toJSONString();
	}
}
