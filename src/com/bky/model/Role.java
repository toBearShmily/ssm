package com.bky.model;

public class Role {
	private Integer id;
	private String roleId;
	private String roleName;
	public Role() {
		super();
	}
	public Role(Integer id, String roleId, String roleName) {
		super();
		this.id = id;
		this.roleId = roleId;
		this.roleName = roleName;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
}
