package com.bky.dao;

import java.util.List;

import com.bky.model.RoomType;

public interface RoomTypeMapper {
	//添加房间类型
	int addRoomType(RoomType roomtype);
	//删除房间类型
	int deleteRoomType(Integer roomtypeId);
	//修改房间类型
	int updateRoomType(RoomType roomtype);
	//单独查询某个房间类型
	RoomType selById(Integer roomtypeId);
	//查询所有
	List<RoomType> selAll();
}
