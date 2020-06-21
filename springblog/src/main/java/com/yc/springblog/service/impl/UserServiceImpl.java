package com.yc.springblog.service.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.springblog.entity.Message;
import com.yc.springblog.entity.User;
import com.yc.springblog.mapper.IUserMapper;
import com.yc.springblog.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private IUserMapper userMapper;

	@Override
	public User login(String email, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("password", password);
		User user = userMapper.login(map);
		return user;
	}

	@Override
	public int addComment(int uid, int cid, String content, String date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("cid", cid);
		map.put("content", content);
		map.put("date", date);
		return userMapper.addComment(map);
	}
	
	
	//点赞
	@Override
	public int addStar(int id, int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", type);
		return userMapper.addStar(map);
	}
	
	@Override
	public int insertStar(int uid, int cid, int type_id, int type, Date date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("cid", cid);
		map.put("type_id", type_id);
		map.put("type", type);
		map.put("date", date);
		return userMapper.insertStar(map);
	}

	//取消赞
	@Override
	public int subtractStar(int id, int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", type);
		return userMapper.subtractStar(map);
	}
	
	@Override
	public int deleteStar(int uid, int type_id, int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("type_id", type_id);
		map.put("type", type);
		return userMapper.deleteStar(map);
	}
	
	
	@Override
	public int submitAdvise(int uid, String title, String content, Date date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("title", title);
		map.put("content", content);
		map.put("date", date);
		return userMapper.submitAdvise(map);
	}

	@Override
	public int register(String name, String email, String password, String telephone) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("email", email);
		map.put("password", password);
		map.put("telephone", telephone);
		return userMapper.register(map);
	}

	@Override
	public int addView(int cid) {
		return userMapper.addView(cid);
	}

	@Override
	public int addReply(int cid, int comment_id, int to_uid, int from_uid, Date date, String content) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cid", cid);
		map.put("comment_id", comment_id);
		map.put("to_uid", to_uid);
		map.put("from_uid", from_uid);
		map.put("date", date);
		map.put("content", content);
		return userMapper.addReply(map);
	}

	@Override
	public int commentUpdate(int id) {
		return userMapper.commentUpdate(id);
	}

	@Override
	public int Updatecontent(int id) {
		return userMapper.Updatecontent(id);
	}

	@Override
	public List<Message> getReply(int id) {
		return userMapper.getReply(id);
	}
	@Override
	public List<Message> getGreat(int id) {
		return userMapper.getGreat(id);
	}
	@Override
	public List<Message> getSys_notice() {
		return userMapper.getSys_notice();
	}

	@Override
	public int updateMessage(int id, int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", type);
		return userMapper.updateMessage(map);
	}

}
