package com.bky.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bky.dao.BoardMapper;
import com.bky.model.Board;
import com.bky.service.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper boardMapper;
	
	public BoardMapper getBoardMapper() {
		return boardMapper;
	}
	@Autowired
	public void setBoardMapper(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}

	@Override
	public List<Board> selectList() {
		return boardMapper.selectList();
	}

}
