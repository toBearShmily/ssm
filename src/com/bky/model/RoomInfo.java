package com.bky.model;


public class RoomInfo {
	private Integer roomId;//房间id
	private String roomNum;//房间编号
	private Integer roomType;//房间类型，关联
	private Integer loucengNum;//楼层编号，关联
	private Integer checkInPeopleNum;//入住人数
	private Integer bedNum;//床铺数量
	private Integer roomState;//房间状态
	private String context;//备注
	private Float price;//价格
	public RoomInfo() {
		super();
	}
	public RoomInfo(Integer roomId, String roomNum, Integer roomType, Integer loucengNum, Integer checkInPeopleNum,
			Integer bedNum, Integer roomState, String context, Float price) {
		super();
		this.roomId = roomId;
		this.roomNum = roomNum;
		this.roomType = roomType;
		this.loucengNum = loucengNum;
		this.checkInPeopleNum = checkInPeopleNum;
		this.bedNum = bedNum;
		this.roomState = roomState;
		this.context = context;
		this.price = price;
	}
	public Integer getRoomId() {
		return roomId;
	}
	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}
	public String getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}
	public Integer getRoomType() {
		return roomType;
	}
	public void setRoomType(Integer roomType) {
		this.roomType = roomType;
	}
	public Integer getLoucengNum() {
		return loucengNum;
	}
	public void setLoucengNum(Integer loucengNum) {
		this.loucengNum = loucengNum;
	}
	public Integer getCheckInPeopleNum() {
		return checkInPeopleNum;
	}
	public void setCheckInPeopleNum(Integer checkInPeopleNum) {
		this.checkInPeopleNum = checkInPeopleNum;
	}
	public Integer getBedNum() {
		return bedNum;
	}
	public void setBedNum(Integer bedNum) {
		this.bedNum = bedNum;
	}
	public Integer getRoomState() {
		return roomState;
	}
	public void setRoomState(Integer roomState) {
		this.roomState = roomState;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	
}
