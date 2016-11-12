package com.bky.service;

import org.springframework.stereotype.Service;

import com.bky.model.UserInfo;

public interface UserInfoService {
	/**
	 * @author wuxubiao
	 * 注册
	 * */
	String saveUser(UserInfo userInfo);
	/**
	 * @author wuxubiao
	 * 登录
	 * */
	UserInfo selAll(String userName,String pass);
	/**
	 * @author wuxubiao
	 * 验证用户名重复
	 * */
	Boolean CheckUser(String userName);
}
