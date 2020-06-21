package com.yc.springblog.mapper;

import java.util.List;
import java.util.Map;

import com.yc.springblog.entity.Message;
import com.yc.springblog.entity.User;

public interface IUserMapper {

	//登录
	public User login(Map<String, Object> map);
	
	//添加评论
	public int addComment(Map<String, Object> map);
	//博客评论数加一
	public int Updatecontent(int id);
	
	//添加回复
	public int addReply(Map<String, Object> map);
	//评论回复数加一
	public int commentUpdate(int id);
	
	//点赞
	public int addStar(Map<String, Object> map);
	public int insertStar(Map<String, Object> map);
	
	//取消赞
	public int subtractStar(Map<String, Object> map);
	public int deleteStar(Map<String, Object> map);
	
	//提交建议
	public int submitAdvise(Map<String, Object> map);
	
	// 注册
	public int register(Map<String, Object> map);
	
	//博客访问数加1
	public int addView(int cid);
	
	//获取用户回复
	public List<Message> getReply(int id);
	//获取用户点赞
	public List<Message> getGreat(int id);
	//获取系统通知
	public List<Message> getSys_notice();
	
	//修改消息为已读
	public int updateMessage(Map<String, Object> map);
}
