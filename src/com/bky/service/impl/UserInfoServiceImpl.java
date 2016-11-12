package com.bky.service.impl;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bky.dao.UserInfoDao;
import com.bky.model.UserInfo;
import com.bky.service.UserInfoService;
import com.util.MD5Util;

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoDao userInfoDao;
	private MD5Util md5 = null;
	
	/**
	 * @author wuxubiao
	 * @deprecated 注册
	 * */
	@Override
	public String saveUser(UserInfo userInfo) {
		String newPass="";
		//加密后存入实体
		md5 = new MD5Util();
		try {
			newPass = md5.EncoderByMd5(userInfo.getPassword());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		userInfo.setPassword(newPass);
		return userInfoDao.insertUser(userInfo)==1?"success":"error";
	}

	/**
	 * @author wuxubia
	 * @param userName，pass:登录时的用户密码
	 * @return true：登录成功，否则失败
	 * */
	@Override
	public UserInfo selAll(String userName,String pass) {
//		Boolean fag = false;
		md5 = new MD5Util();
		UserInfo user = null;
		String newPassString = "";
		try {
			newPassString = md5.EncoderByMd5(pass);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<UserInfo> userList = new ArrayList<UserInfo>();
		userList = userInfoDao.selAll();
		for(UserInfo userInfo : userList){
			if(userInfo.getUserName().equals(userName) && userInfo.getPassword().equals(newPassString)){//验证正确，登入成功
//				fag = true;
				user = userInfo;
			}
		}
		return user;
	}
	
	/**
	 * @author wuxubiao
	 * @deprecated 验证用户名
	 * */
	@Override
	public Boolean CheckUser(String userName) {
		Boolean fag = false;
		List<String> strList = userInfoDao.selAllName();
		for(String str : strList){
			if(str.equals(userName)){//匹配成功，有重复
				fag = true;
			}
		}
		return fag;
	}

}
