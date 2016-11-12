package com.bky.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bky.model.RoomInfo;
import com.bky.model.RoomType;
import com.bky.service.RoomInfoService;
import com.bky.service.RoomTypeService;

@Controller
@RequestMapping("roomInfo")
public class RoomInfoController {
	@Autowired
	private RoomInfoService roomInfoService;
	@Autowired
	private RoomTypeService roomTypeService;

	@RequestMapping("roomInfoShow")
	public String roomInfoShow(HttpServletRequest req, Model model) {
		List<RoomInfo> roomInfoList = null;
		RoomType roomType = null;
		Map<Integer, String> map = new HashMap<Integer, String>();
		roomInfoList = roomInfoService.getAll();
		// req.setAttribute("roomInfoList", roomInfoList);传值方式二
		if (null != roomInfoList && roomInfoList.size() > 0) {
			for (RoomInfo roomInfo : roomInfoList) {
				roomType = roomTypeService.selByid(roomInfo.getRoomType());
				map.put(roomInfo.getRoomId(), roomType.getRoomTypeName());
			}
		} else {
			String InfoMessage = "----not data for list!";
			model.addAttribute("InfoMessage", InfoMessage);
			return "result";
		}
		model.addAttribute("roomInfoList", roomInfoList);
		req.setAttribute("map", map);
		return "houtai/roomStateList";
	}
}
