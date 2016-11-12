package com.bky.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bky.dao.RoleDao;
import com.bky.model.Role;
import com.bky.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;
	
	@Override
	public List<Role> selAllRole() {
		return roleDao.selAll();
	}

}
