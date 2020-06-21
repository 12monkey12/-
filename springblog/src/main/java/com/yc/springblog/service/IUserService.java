package com.yc.springblog.service;

import java.sql.Date;
import java.util.List;

import com.yc.springblog.entity.Message;
import com.yc.springblog.entity.User;

public interface IUserService {

	//登录
	public User login(String email, String password);
	
	//添加评论
	public int addComment(int uid, int cid, String content, String date);
	//博客评论数加一
	public int Updatecontent(int id);
	
	//添加回复
	public int addReply(int cid, int comment_id, int to_uid, int from_uid, Date date, String content);
	//评论回复数加一
	public int commentUpdate(int id);
	
	//点赞
	public int addStar(int id, int type);
	public int insertStar(int uid, int cid, int type_id, int type, Date date);
	
	//取消赞
	public int subtractStar(int id, int type);
	public int deleteStar(int uid, int type_id, int type);
	
	//提交建议
	public int submitAdvise(int uid, String title, String content, Date date);
	
	//注册
	public int register(String name, String email, String password, String telephone);

	//博客访问数加1
	public int addView(int cid);
	
	//获取用户回复
	public List<Message> getReply(int id);
	//获取用户点赞
	public List<Message> getGreat(int id);
	//获取系统通知
	public List<Message> getSys_notice();
	
	//修改消息为已读
	public int updateMessage(int id, int type);
	
}
