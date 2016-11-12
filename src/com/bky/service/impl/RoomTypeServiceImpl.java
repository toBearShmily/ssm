package com.bky.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bky.dao.RoomTypeMapper;
import com.bky.model.RoomType;
import com.bky.service.RoomTypeService;

@Service("roomTypeService")
@Transactional
public class RoomTypeServiceImpl implements RoomTypeService {
	@Autowired
	private RoomTypeMapper roomTypeMapper;

	@Override
	public String saveRoomType(RoomType roomtype) {
		return roomTypeMapper.addRoomType(roomtype)==1?"success":"fail";
	}

	@Override
	@Transactional(rollbackFor = {Exception.class}, readOnly = false)
	public Boolean delRoomType(String roomtypeIds) {
		String[] rIds = null;
		Boolean result = true;
		rIds = roomtypeIds.split(",");
		if(null != rIds && rIds.length > 0){
			for(int i = 0;i < rIds.length ; i++){
				if(i==1){
					throw new RuntimeException("自己抛的异常信息");
				}
				if(roomTypeMapper.deleteRoomType(Integer.valueOf(rIds[i])) != 1){
					
					System.out.println("批量删除操作失败,回滚");
					result = false;
					throw new RuntimeException("批量删除操作失败,回滚");
				}
			}
		}
		return result;
	}

	@Override
	public String upRoomType(RoomType roomtype) {
		return roomTypeMapper.updateRoomType(roomtype)==1?"success":"fail";
	}
	
	@Override
	public RoomType selByid(Integer roomtypeId){
		return roomTypeMapper.selById(roomtypeId);
	}

	@Override
	public List<RoomType> getAllRoomType() {
		return roomTypeMapper.selAll();
	}

}
