package com.bky.dao;

import java.util.List;

import com.bky.model.Board;

/**
 * 公告管理
 * */
public interface BoardMapper {
	List<Board> selectList();
}
