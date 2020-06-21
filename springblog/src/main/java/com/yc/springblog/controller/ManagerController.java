package com.yc.springblog.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.springblog.entity.Admin;
import com.yc.springblog.entity.Contact;
import com.yc.springblog.entity.Contents;
import com.yc.springblog.service.IContentService;
import com.yc.springblog.service.IManagerService;
import com.yc.springblog.util.FileUtils;

@Controller
@RequestMapping("/manager")
public class ManagerController{
	
	@Autowired
	private IManagerService managerService;
	
	@Autowired
	private IContentService contentService;
	
	@Autowired
	private ContentController contentController;

	// 登录
	@ResponseBody
	@RequestMapping("/login")
	public int alogin(String count, String password, HttpSession session) {
		Admin admin = managerService.login(count, password);
		
		if (admin != null) {
			// 登录成功，把admin存到session中
			session.setAttribute("admin", admin);
			return 1;
		} else {
			return 0;
		}
	}
	
	//注销
	@ResponseBody
	@RequestMapping("/logout")
	public int logout(HttpSession session) {
		session.removeAttribute("admin");
		return 1;
	}
	
	//删除博客
	@ResponseBody
	@Transactional
	@RequestMapping("/deleteblog")
	public int deleteblog(int cid, HttpSession session, HttpServletRequest request) {
		//删除回复
		managerService.deleteReplyByCid(cid);
		//删除评论
		managerService.deleteCommentByCid(cid);
		//删除点赞信息
		managerService.deleteGreatByCid(cid);
		//删除博客的图片
		Contents content = contentService.getContentById(cid, 0);
		String str = content.getContent();
		Document document = Jsoup.parseBodyFragment(str);
		Elements elements = document.getElementsByTag("img");
		List<String> imgPaths = new ArrayList<String>();
		if (elements != null && elements.size() != 0) {
			
			for(Element element:elements) {
				imgPaths.add(element.attr("src"));
			}
		}
		String basePath = new File(request.getServletContext().getRealPath("/")).getParent();
		for(String imgPath:imgPaths) {
			String path = basePath + imgPath;
			File file = new File(path);
			if (file.exists() && file.isFile()) {
				file.delete();
			}
		}
		//删除博客
		int result = managerService.deleteBlog(cid);
		if (result > 0) {
			//博客删除成功，修改session中content的值
			Admin admin = (Admin) session.getAttribute("admin");
			int aid = admin.getId();
			contentController.getContentsByPage(session, aid, 1);
		} else {
			//手动回滚
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return result;
	}
	
	//添加博客
	@ResponseBody
	@RequestMapping("/insertBlog")
	public int insertBlog(String content, String title, HttpServletRequest request, HttpSession session) {
		Document document = Jsoup.parseBodyFragment(content);
		Elements elements = document.getElementsByTag("img");
		String basePath = new File(request.getServletContext().getRealPath("/")).getParent();
		Admin admin = (Admin) session.getAttribute("admin");
		//博客中有图片，则存放图片
		String pic = null;
		if (elements != null && elements.size() > 0) {
			for (Element element : elements) {
				String oldSrc = element.attr("src"); //老的图片url
				String oldPath = basePath + oldSrc;
				if (oldSrc.startsWith("/upload")) {  //图片已存在,复制一份保存
					String fileExt = oldSrc.substring(oldSrc.lastIndexOf('.')+1);
					SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
					String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
					String newSrc = oldSrc.replace(oldSrc.substring(oldSrc.lastIndexOf('/')+1), newFileName);
					String newFilePath = basePath + newSrc;
					FileUtils.saveFile(new File(oldPath), new File(newFilePath));
					element.attr("src", newSrc);
					continue;
				}
				System.out.println("oldsrc:"+oldSrc+"\noldpath:"+oldPath);
				
				String temp = oldSrc.replace("/springblog/attached", "");
				String newSrc = "/upload" + temp;
				String newPath = basePath + "/upload" + temp;
				System.out.println("newSrc:"+newSrc+"\nnewPath:"+newPath);
				//限制图片的宽高
				try {
					BufferedImage bufferedImage = ImageIO.read(new File(oldPath));
					int width = bufferedImage.getWidth();
					int height = bufferedImage.getHeight();
					if (width > 600 || height > 600) {
						String styleString = "width:600px;";
						element.attr("style", styleString);
					}
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				
				//移动图片
				File oldFile = new File(oldPath);
				if (!oldFile.exists()) {
					return -1;
				}
				//创建文件夹
				File newFileDir = new File(newPath).getParentFile();
				if (!newFileDir.exists()) {
					newFileDir.mkdirs();
				}
				File newFile = new File(newPath);
				FileUtils.saveFile(oldFile, newFile);
				//修改src
				element.attr("src", newSrc);
			}
			pic = elements.first().attr("src");
			//删除缓存图片
			String cachePath = request.getServletContext().getRealPath("/") + "attached/" + admin.getDepartment();
			String[] filelist = new File(cachePath).list();
			if (filelist!=null || filelist.length > 0) {
				deleteFile(new File(cachePath));
			}
		}
		content = document.body().html();
		java.sql.Date date = new java.sql.Date(new Date().getTime());
		int aid = admin.getId();
		int result = managerService.insertBlog(title, content, date, aid, pic);
		if (result > 0) {
			// 修改session中content的值
			contentController.getContentsByPage(session, aid, 1);
		}
		return result;
	}
	
	//重新提交博客
	@ResponseBody
	@Transactional
	@RequestMapping("/resubmitBlog")
	public int resubmitBlog(int cid, String content, String title, HttpServletRequest request, HttpSession session) {
		//重新添加博客
		insertBlog(content, title, request, session);
		//删除博客
		deleteblog(cid, session, request);
		
		//提交博客成功
		// 修改session中content的值
		Admin admin = (Admin) session.getAttribute("admin");
		int aid = admin.getId();
		contentController.getContentsByPage(session, aid, 1);
		return 1;
		
	}
	
	//根据建议号获取建议
	@ResponseBody
	@RequestMapping(value="/getContactById", produces="text/html;charset=UTF-8")
	public String getContactById(int id, int status, HttpSession session) {
		
		Contact contact = managerService.getContactById(id);
		//System.out.println(contact+"\n=====================================================================");
		String result = "";
		if (contact != null) {
			//未读修改为已读
			if (status == 0) {
				managerService.updateContact(id); 
			}
			JSONObject jsonObject = new JSONObject(contact);
			result = jsonObject.toString();
			//重新获取建议信息
			List<Contact> advises = contentService.getAllAdvise();
			session.setAttribute("advises", advises);
		}
		
		return result;
	}
	
	//删除文件夹下文件
	private void deleteFile(File file) {
		if (file.isFile()) return; 
		File[] files = file.listFiles();
		
		if (files != null && files.length > 0) {
			for (int i = 0; i < files.length; i++) {
				files[i].delete();
			}
		}
	}
	
	//系统通知
	@ResponseBody
	@RequestMapping("/insertSys_notice")
	public int insertSys_notice(String content, HttpSession session) {
		java.sql.Date date = new java.sql.Date(new Date().getTime());
		int result = managerService.insertSys_notice(content, date);
		
		return result;
	}

}
