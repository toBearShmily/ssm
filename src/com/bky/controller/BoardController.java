package com.bky.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bky.model.Board;
import com.bky.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	private BoardService boardService;

	public BoardService getBoardService() {
		return boardService;
	}
	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping("getAll")
	public String getAll(HttpServletRequest request){
		List<Board> bList = new ArrayList<Board>();
		bList= boardService.selectList();
		if(bList!=null && bList.size()>0){
			request.setAttribute("bList", bList);
		}
		return "boardList";
	}
}
