package com.bky.model;

public class RoomType {
	private Integer roomTypeId;//房间类型id
	private String roomNum;//房间类型编号
	private String roomTypeName;//房间类型名称
	private String roomTypeshow;//展示房间图片url
	private Float roomTypeMoney;//房间价格
	private Integer roomTypeNum;//数量
	public RoomType() {
		super();
	}
	public RoomType(Integer roomTypeId, String roomNum, String roomTypeName, String roomTypeshow, Float roomTypeMoney,
			Integer roomTypeNum) {
		super();
		this.roomTypeId = roomTypeId;
		this.roomNum = roomNum;
		this.roomTypeName = roomTypeName;
		this.roomTypeshow = roomTypeshow;
		this.roomTypeMoney = roomTypeMoney;
		this.roomTypeNum = roomTypeNum;
	}
	public Integer getRoomTypeId() {
		return roomTypeId;
	}
	public void setRoomTypeId(Integer roomTypeId) {
		this.roomTypeId = roomTypeId;
	}
	public String getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}
	public String getRoomTypeshow() {
		return roomTypeshow;
	}
	public void setRoomTypeshow(String roomTypeshow) {
		this.roomTypeshow = roomTypeshow;
	}
	public Float getRoomTypeMoney() {
		return roomTypeMoney;
	}
	public void setRoomTypeMoney(Float roomTypeMoney) {
		this.roomTypeMoney = roomTypeMoney;
	}
	public String getRoomTypeName() {
		return roomTypeName;
	}
	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}
	public Integer getRoomTypeNum() {
		return roomTypeNum;
	}
	public void setRoomTypeNum(Integer roomTypeNum) {
		this.roomTypeNum = roomTypeNum;
	}
}
