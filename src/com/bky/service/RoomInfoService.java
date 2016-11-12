package com.bky.service;

import java.util.List;


import com.bky.model.RoomInfo;

/**
 * @author wuxubiao
 * @category  业务逻辑
 * */
public interface RoomInfoService {
	List<RoomInfo> getAll();//列表页显示当前所有的房间信息
	
	/**
	 * @author wuxubiao
	 *  当该房间类型不存在时删除该类型下的所有房间信息;删除作为集合
	 * */
	Boolean delIsRoomInfo(String ids);
	
	
}
