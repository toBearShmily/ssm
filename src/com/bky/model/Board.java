package com.bky.model;

import java.util.Date;

public class Board {
	private Integer id;
	private String boardName;
	private String context;
	private Date creteDate;
	private Date updateDate;
	public Board() {
		super();
	}
	public Board(int id, String boardName, String context, Date creteDate, Date updateDate) {
		super();
		this.id = id;
		this.boardName = boardName;
		this.context = context;
		this.creteDate = creteDate;
		this.updateDate = updateDate;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getCreteDate() {
		return creteDate;
	}
	public void setCreteDate(Date creteDate) {
		this.creteDate = creteDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	
}
