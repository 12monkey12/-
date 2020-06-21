package com.yc.springblog.mapper;

import java.util.Map;

import com.yc.springblog.entity.Admin;
import com.yc.springblog.entity.Contact;

public interface IManagerMapper {

	// 管理员登录
	public Admin login(Map<String, Object> map);
	
	// 删除博客
	public int deleteBlog(int id);
	// 删除评论
	public int deleteCommentByCid(int cid);
	//删除博客下所有回复
	public int deleteReplyByCid(int cid);
	//根据博客号删除点赞信息
	public int deleteGreatByCid(int cid);

	// 添加博客
	public int insertBlog(Map<String, Object> map);

	//根据建议号获取建议信息
	public Contact getContactById(int id);
	//修改反馈为已读
	public int updateContact(int id);
	
	//系统通知
	public int insertSys_notice(Map<String, Object> map);
}
