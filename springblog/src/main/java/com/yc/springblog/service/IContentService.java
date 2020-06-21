package com.yc.springblog.service;

import java.util.List;

import com.yc.springblog.entity.Admin;
import com.yc.springblog.entity.Comments;
import com.yc.springblog.entity.Contact;
import com.yc.springblog.entity.Contents;
import com.yc.springblog.entity.Great;
import com.yc.springblog.entity.Reply;
import com.yc.springblog.entity.User;

public interface IContentService {

	// 获得所有博客
	public List<Contents> getAllContent();
	
	//获取指定数量的博客 分页
	public List<Contents> getContentByC(String condition, int page, int count);
	
	//获取指定管理员的博客
	public List<Contents> getContentByAid(int aid);
	
	//获取指定管理员指定数量的博客 分页
	public List<Contents> getContentByAC(int aid, int page, int count);
	
	//得到所有建议
	public List<Contact> getAllAdvise();
	
	//得到所有用户
	public List<User> getAllUser();
	
	//获取评论
	public List<Comments> getCommentAndReply(int cid, int uid);
	//public Map<String, Object> getCommentAndReply(int id);
	
	//获取回复
	public List<Reply> getReply(int cid, int comment_id);
	
	//根据博客编号获得博客数据，用于阅读更多页面
	public Contents getContentById(int id, int uid);
	
	//根据用户号和博客号查询点赞信息
	public List<Great> getGreat(int uid, int cid);
	
	//得到所有管理员
	public List<Admin> getAdmin();

	
}
