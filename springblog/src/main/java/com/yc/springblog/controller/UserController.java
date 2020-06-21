package com.yc.springblog.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.springblog.entity.Comments;
import com.yc.springblog.entity.Message;
import com.yc.springblog.entity.User;
import com.yc.springblog.service.IContentService;
import com.yc.springblog.service.IUserService;
import com.yc.springblog.util.StringConvert;

@RestController
@RequestMapping("/user")
public class UserController{
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IContentService contentService;
	
	@Autowired
	private ContentController contentController;
	
	//用户注销
	@RequestMapping("/logout")
	public int logout(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("great");
		
		return 1;
	}

	//用户注册
	@RequestMapping("/register")
	public int register(User user) {
		System.out.println(user.toString());
		//检查邮箱和用户名是否已经存在
		List<User> list = contentService.getAllUser();
		if (list == null || list.isEmpty()) {
			return 1;
		}
		//检查邮箱是否重复
		for ( User u : list ) {
			if ( user.getEmail().equals(u.getEmail()) ) {
				return -1;
			}
		}
		//检查用户名是否重复
		for ( User u : list ) {
			if ( user.getName().equals(u.getName()) ) {
				return -2;
			}
		}
		int result = userService.register(user.getName(), user.getEmail(), user.getPassword(), user.getTelephone());
		return result;
	}
	//用户登录
	@RequestMapping("/login")
	public String login(String email, String password, HttpSession session) {
		User user = userService.login(email, password);
		if ( user != null ) {
			//登录成功,把user存到session中
			session.setAttribute("user", user);
			return "1";
		} else {
			//登录失败
			return "0";
		}
	}
	
	
	// 提交建议
	@RequestMapping("/submitAdvise")
	public int submitAdvise(String content, String title, HttpSession session) {
		User user = (User) session.getAttribute("user");
		int uid = user.getId();
		// 替换字符串，防止js注入攻击
		content = StringConvert.StrConvert(content);
		title = StringConvert.StrConvert(title);
		java.sql.Date date = new java.sql.Date(new Date().getTime());
		
		int result = userService.submitAdvise(uid, title, content, date);
		return result;
	}
	
	// 点赞
	@RequestMapping("/addStar")
	@Transactional
	public int addStar(int type, int cid, int type_id ,HttpSession session) {
		User user = (User) session.getAttribute("user");
		int uid = user.getId();
		java.sql.Date date = new java.sql.Date(new Date().getTime());

		int result1 = userService.addStar(type_id, type);
		int result2 = userService.insertStar(uid, cid, type_id, type, date);
		if (result1 == 0 || result2 == 0) {
			// 手动回滚
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println("回滚数据。。。。。。。。。。。。");
			return 0;
		} else {
			return 1;
		}
	}
	
	// 取消赞
	@RequestMapping("/subtractStar")
	@Transactional
	public int subtractStar(int type, int cid, int type_id ,HttpSession session) {
		User user = (User) session.getAttribute("user");
		int uid = user.getId();
		int result1 = userService.subtractStar(type_id, type);
		int result2 = userService.deleteStar(uid, type_id, type);
		if (result1 == 0 || result2 == 0) {
			// 手动回滚
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println("回滚数据。。。。。。。。。。。。");
			return 0;
		} else {
			return 1;
		}
	}
	
	// 添加评论
	@RequestMapping("/addComment")
	public int addComment(int id, String content, HttpSession session) {
		User user = (User) session.getAttribute("user");
		int uid = user.getId();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		// 替换字符串，防止js注入攻击
		content = StringConvert.StrConvert(content);
		int result = userService.addComment(uid, id, content, date);
		if (result > 0) {
			//博客评论数加一
			int result1 = userService.Updatecontent(id);
			if (result1 == 0) {
				// 手动回滚
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				System.out.println("回滚数据。。。。。。。。。。。。");
				return 0;
			}
			//更新session中的comments
			List<Comments> comments = contentService.getCommentAndReply(id, uid);
			session.setAttribute("comments", comments);
		}
		return result;
	}
	
	//添加回复
	@RequestMapping("/addReply")
	@Transactional
	public int addReply(int cid, int comment_id, int to_uid, String content, HttpSession session) {
		User user = (User) session.getAttribute("user");
		int from_uid = user.getId();
		java.sql.Date date = new java.sql.Date(new Date().getTime());
		
		int result = userService.addReply(cid, comment_id, to_uid, from_uid, date, content);
		if (result > 0) {
			//评论回复数加一
			int result1 = userService.commentUpdate(comment_id);
			if (result1 == 0) {
				// 手动回滚
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				System.out.println("回滚数据。。。。。。。。。。。。");
				return 0;
			}
			// 更新session中的comments
			List<Comments> comments = contentService.getCommentAndReply(cid, from_uid);
			session.setAttribute("comments", comments);
		}
		return result;
	}
	
	//获取用户消息
	@RequestMapping("/getMessage")
	public int getMessage(int id, int type, HttpSession session) {
		List<Message> messages = null;
		if (type == 0) {
			//获取用户回复
			messages = userService.getReply(id);
			if (messages != null && messages.size() > 0) {
				session.setAttribute("type", type);
				session.setAttribute("messages", messages);
			}
		} else if (type == 1) {
			//获取用户点赞
			messages = userService.getGreat(id);
			if (messages != null && !messages.isEmpty()) {
				session.setAttribute("type", type);
				session.setAttribute("messages", messages);
			}
		} else {
			//获取系统通知
			messages = userService.getSys_notice();
			if (messages != null && !messages.isEmpty()) {
				session.setAttribute("type", type);
				session.setAttribute("messages", messages);
			}
		}
		return 1;
	}
	
	//修改消息为已读
	@RequestMapping("/updateMessage")
	@Transactional
	public int updateMessage(int id, int cid, int type, HttpSession session) {
		
		int result1 = userService.updateMessage(id, type);
		int result2 = contentController.getContentById(cid, session);
		
		if (result1 == 0 || result2 == 0) {
			//手动回滚
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println("回滚数据。。。。。。。。。。。。");
			return 0;
		}
		
		return 1;
	}
}
