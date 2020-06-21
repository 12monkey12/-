package com.yc.springblog.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.springblog.entity.Admin;
import com.yc.springblog.entity.Comments;
import com.yc.springblog.entity.Contact;
import com.yc.springblog.entity.Contents;
import com.yc.springblog.entity.Great;
import com.yc.springblog.entity.Reply;
import com.yc.springblog.entity.User;
import com.yc.springblog.mapper.IContentMapper;
import com.yc.springblog.service.IContentService;

@Service
public class ContentServiceImpl implements IContentService {
	
	@Autowired
	private IContentMapper contentMapper;

	@Override
	public List<Contents> getAllContent() {
		return contentMapper.getAllContent();
	}
	
	@Override
	public List<Contents> getContentByC(String condition, int page, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("count", count);
		map.put("condition", condition);
		return contentMapper.getContentByC(map);
	}
	
	@Override
	public List<Contents> getContentByAid(int id) {
		return contentMapper.getContentByAid(id);
	}
	
	@Override
	public List<Contents> getContentByAC(int aid, int page, int count) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("count", count);
		map.put("aid", aid);
		return contentMapper.getContentByAC(map);
	}
	
	@Override
	public List<Contact> getAllAdvise() {
		return contentMapper.getAllAdvise();
	}
	
	@Override
	public List<User> getAllUser() {
		return contentMapper.getAllUser();
	}
	
	@Override
	public List<Comments> getCommentAndReply(int cid, int uid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (uid != 0) {
			map.put("uid", uid);
		} else {
			map.put("uid", null);
		}
		map.put("cid", cid);
		
		return contentMapper.getCommentAndReply(map);
	}
	/*
	public Map<String, Object> getCommentAndReply(int id){
		return contentMapper.getCommentAndReply(id);
	}*/
	
	@Override
	public Contents getContentById(int id, int uid) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (uid != 0) {
			map.put("uid", uid);
		} else {
			map.put("uid", null);
		}
		map.put("id", id);
		return contentMapper.getContentById(map);
	}

	@Override
	public List<Great> getGreat(int uid, int cid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("cid", cid);
		return contentMapper.getGreat(map);
	}

	@Override
	public List<Admin> getAdmin() {
		return contentMapper.getAdmin();
	}

	@Override
	public List<Reply> getReply(int cid, int comment_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comment_id", comment_id);
		map.put("cid", cid);
		return contentMapper.getReply(map);
	}

}
