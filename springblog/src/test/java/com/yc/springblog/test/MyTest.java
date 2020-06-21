package com.yc.springblog.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.yc.springblog.service.IUserService;

public class MyTest {
	
	@Autowired
	private IUserService userService;
	
	@Test
	@Transactional
	public void Test() {
		userService.addComment(1, 14, "测试事务", "2020/01/09");
		// 手动回滚
		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
	}

}
