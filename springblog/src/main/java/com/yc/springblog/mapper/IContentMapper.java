package com.yc.springblog.mapper;

import java.util.List;
import java.util.Map;

import com.yc.springblog.entity.Admin;
import com.yc.springblog.entity.Comments;
import com.yc.springblog.entity.Contact;
import com.yc.springblog.entity.Contents;
import com.yc.springblog.entity.Great;
import com.yc.springblog.entity.Reply;
import com.yc.springblog.entity.User;

public interface IContentMapper {

	//获得所有博客
	public List<Contents> getAllContent();
	
	//得到所有管理员信息
	public List<Admin> getAdmin();
	
	//获取指定数量的博客 分页
	public List<Contents> getContentByC(Map<String, Object> map);
	
	//获取指定管理员的博客 分类
	public List<Contents> getContentByAid(int id);
	
	//获取指定管理员指定数量的博客 分页
	public List<Contents> getContentByAC(Map<String, Object> map);
	
	// 得到所有建议
	public List<Contact> getAllAdvise();
	
	// 得到所有用户
	public List<User> getAllUser();
	
	//获取评论
	public List<Comments> getCommentAndReply(Map<String, Object> map);
	//public Map<String, Object> getCommentAndReply(int id);
	
	public List<Reply> getReply(Map<String, Object> map);
	
	//得到用户的点赞信息
	//public List<Great> getGreatByUid(int uid);
	
	//根据页数来得到博客内容,用于分页
	//public List<Contents> getContentByPage(Map<String, Object> map);
	
	//根据博客编号获得博客数据，用于阅读更多页面
	public Contents getContentById(Map<String, Object> map);
	
	//根据用户号和博客号查询点赞信息
	public List<Great> getGreat(Map<String, Object> map);
	
	
	
}
