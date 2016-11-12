package com.bky.dao;

import java.util.List;

import com.bky.model.RoomInfo;

/**
 * @author wuxubiao
 * @category 房间信息管理
 * */
public interface RoomInfoDao {
	List<RoomInfo> selAll();//查询所有房间信息
	RoomInfo selByroomId(int id);//详细信息显示
	int updateRoomInfo(RoomInfo roomInfo);//修改具体房间信息
	int delRoomInfo(int id);//删除房间信息
}
