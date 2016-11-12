package com.bky.dao;

import java.util.List;

import com.bky.model.UserInfo;

public interface UserInfoDao {
	int insertUser(UserInfo userInfo);
	List<UserInfo> selAll();
	List<String> selAllName();
}
