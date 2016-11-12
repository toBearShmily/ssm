package com.bky.service;

import java.util.List;

import com.bky.model.RoomType;

public interface RoomTypeService {
	/**
	 * @author wuxubiao
	 * mean:dao层方法进行组合完成业务逻辑
	 * */
	String saveRoomType(RoomType roomtype);
	Boolean delRoomType(String roomtypeIds);
	String upRoomType(RoomType roomtype);
	RoomType selByid(Integer roomtypeId);
	List<RoomType> getAllRoomType();
}
