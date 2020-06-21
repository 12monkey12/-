package com.yc.springblog.service.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.springblog.entity.Admin;
import com.yc.springblog.entity.Contact;
import com.yc.springblog.mapper.IManagerMapper;
import com.yc.springblog.service.IManagerService;

@Service
public class ManagerServiceImpl implements IManagerService {
	
	@Autowired
	private IManagerMapper managerMapper;
	
	@Override
	public Admin login(String count, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", count);
		map.put("password", password);
		return managerMapper.login(map);
	}
	
	
	@Override
	public int insertBlog(String title, String content, Date date, int aid, String pic) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("content", content);
		map.put("date", date);
		map.put("aid", aid);
		map.put("pic", pic);
		
		return managerMapper.insertBlog(map);
	}
	
	//删除博客
	@Override
	public int deleteBlog(int id) {
		return managerMapper.deleteBlog(id);
	}
	@Override
	public int deleteCommentByCid(int cid) {
		return managerMapper.deleteCommentByCid(cid);
	}
	@Override
	public int deleteReplyByCid(int cid) {
		return managerMapper.deleteReplyByCid(cid);
	}
	@Override
	public int deleteGreatByCid(int cid) {
		return managerMapper.deleteGreatByCid(cid);
	}

	@Override
	public Contact getContactById(int id) {
		return managerMapper.getContactById(id);
	}

	@Override
	public int insertSys_notice(String content, Date date) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("content", content);
		map.put("date", date);
		return managerMapper.insertSys_notice(map);
	}

	@Override
	public int updateContact(int id) {
		return managerMapper.updateContact(id);
	}

	
}
