package com.bky.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.bky.dao.RoomInfoDao;
import com.bky.model.RoomInfo;
import com.bky.service.RoomInfoService;

@Service("roomInfoService")
public class RoomInfoServiceImpl implements RoomInfoService {

	@Autowired
	private RoomInfoDao roomInfoDao;
	
	@Override
	public List<RoomInfo> getAll() {
		return roomInfoDao.selAll();
	}

	@Override
	public Boolean delIsRoomInfo(String ids) {
		String[] strArry = null;
		Boolean result = false;
		strArry = ids.split(",");
		for(String id : strArry){
			System.out.println("当前id为："+id);
			if(roomInfoDao.delRoomInfo(Integer.valueOf(id)) == 1){//返回true则删除成功，返回false则失败
				result = true;
			}else{
				System.out.println("当前删除失败的id为：-----"+id);
			}
		}
		return result;
	}

}
