package com.bky.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bky.model.RoomType;
import com.bky.service.RoomTypeService;

@Controller
@RequestMapping("roomType")
public class RoomTypeController {
	/**
	 * @author wuxubiao
	 * @deprecated 房间类型管理
	 * @serialData 2015-10-23
	 * */ 
	@Autowired
	private RoomTypeService roomTypeService;
	
	//log管理
	private static Logger logger = Logger.getLogger(RoomTypeController.class);
	
	@RequestMapping("roomTypeList")
	public String roomTypeList(HttpServletRequest req){
		List<RoomType> roomtypeList = new ArrayList<RoomType>();
		roomtypeList = roomTypeService.getAllRoomType();
		if(null != roomtypeList){
			req.setAttribute("roomtypeList", roomtypeList);
		}else{
			String InfoMessage = "----not data for list!";
			req.setAttribute("InfoMessage", InfoMessage);
			return "result";
		}
		return "houtai/roomtypeList";
	}
	
	@RequestMapping(value = "delRoomtype", method = RequestMethod.POST)
	public void delRoomtype(HttpServletRequest req,PrintWriter out){
		String roomtypeIds = req.getParameter("roomtypeids");
		Boolean result = roomTypeService.delRoomType(roomtypeIds);
		if(result == true){
			System.out.println("批量删除成功！");
			out.write("true");
		}else{
			System.out.println("批量删除失败！");
			out.write("false");
		}
	}
	
	public static void main(String[] args) {
		logger.debug("debug");
		logger.info("info");
		logger.error("error");
		logger.warn("warn");
	}
	
}
