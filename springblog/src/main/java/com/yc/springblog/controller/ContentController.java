package com.yc.springblog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.springblog.entity.Admin;
import com.yc.springblog.entity.Comments;
import com.yc.springblog.entity.Contact;
import com.yc.springblog.entity.Contents;
import com.yc.springblog.entity.User;
import com.yc.springblog.service.IContentService;
import com.yc.springblog.service.IUserService;
import com.yc.springblog.util.LoadProperties;

@RestController
@RequestMapping("/content")
public class ContentController {
	
	@Autowired
	private IContentService contentService;
	
	@Autowired
	private IUserService userService;
	
	//获取所有博客按条件排序 分页
	@RequestMapping("/getAllContentByPage")
	public int getAllContent(HttpSession session, String condition, int page) {
		int count = Integer.parseInt(LoadProperties.getProperties().getProperty("count"));
		List<Contents> contents = contentService.getAllContent();
		int pages = contents.size()%count==0?contents.size()/count:contents.size()/count+1;
		
		contents = contentService.getContentByC(condition, page, count);
		
		if (contents != null) {
			//博客只获取部分文本值
			for(Contents content : contents) {
				String htmlText = content.getContent();
				String txt = htmlText.replaceAll("</?[^>]+>", "").replaceAll("\\s", "");
				int len = txt.length();
				if (len > 300) {
					txt = txt.substring(0, 300);
				}
				content.setContent(txt);
			}
		}
		
		// 将所有博客存到session中
		session.setAttribute("contents", contents);
		session.setAttribute("pages", pages);
		session.setAttribute("page", page);
		session.setAttribute("condition", condition);
		return 1;
	}
	
	//根据管理员号获取博客 分页显示
	@RequestMapping("/getContentByPage")
	public int getContentsByPage(HttpSession session, Integer aid, Integer page) {
		List<Contents> contents = contentService.getContentByAid(aid);
		int contents_size = contents.size();
		List<Admin> admins = contentService.getAdmin();
		//获取指定数量博客 分页
		int count = Integer.parseInt(LoadProperties.getProperties().getProperty("count"));
		int pages = contents.size()%count==0?contents.size()/count:contents.size()/count+1;
		contents = contentService.getContentByAC(aid, page, count);
		if (contents != null) {
			//博客只获取部分文本值
			for(Contents content : contents) {
				String htmlText = content.getContent();
				String txt = htmlText.replaceAll("</?[^>]+>", "").replaceAll("\\s", "");
				int len = txt.length();
				if (len > 300) {
					txt = txt.substring(0, 300);
				}
				content.setContent(txt);
			}
		}
		session.setAttribute("contents_size", contents_size);
		session.setAttribute("pages", pages);
		session.setAttribute("page", page);
		//将查询的管理员号存入session，专栏中选择部门时使用
		session.setAttribute("aid", aid);
		// 将所有博客存到session中
		session.setAttribute("contents", contents);
		//所有的管理员存入session，专栏中的部门动态显示
		session.setAttribute("admins", admins);
		return 1;
	}
	
	//得到所有的用户建议
	@RequestMapping("/getAllAdvise")
	public int getAllAdvise(HttpSession session) {
		List<Contact> advises = contentService.getAllAdvise();
		// 将所有博客存到session中
		session.setAttribute("advises", advises);
		return 1;
		
	}
	
	//获取所有用户
	@RequestMapping("/getAllUser")
	public int getAllUser(HttpSession session) {
		List<User> users = contentService.getAllUser();
		session.setAttribute("users", users);
		return 1;

	}
	
	//根据博客编号获得博客 阅读更多
	@RequestMapping("/getContentById")
	public int getContentById(int id, HttpSession session) {
		System.out.println("------------------------------------\n"+id);
		
		User user = (User) session.getAttribute("user");
		int uid = 0;
		if (user != null) {
			uid = user.getId();
		}
		//博客访问数加1
		int result = userService.addView(id); 
		//获取博客
		Contents content = contentService.getContentById(id, uid);
		//获取评论
		List<Comments> comments = contentService.getCommentAndReply(id, uid);
		System.out.println(content+"\n=========================================="+uid);
		System.out.println(comments+"\n==========================================");
		if (content != null && result > 0) {
			// 将博客和评论存到session中
			session.setAttribute("content", content);
			session.setAttribute("comments", comments);
			return 1;
		} else {
			//手动回滚
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println("回滚数据。。。。。。。。。。。。");
			return 0;
		}
	}
	
}
