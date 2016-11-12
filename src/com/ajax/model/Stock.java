package com.ajax.model;
/**
 * 股票类
 * @author Administrator
 *
 */
public class Stock {
	private double yesterday;//昨天的收盘价
	private double today;//今天的开盘价
	private double now;//当前价
	private String name;//股票名称
	private String id;//股票代码
	public Stock() {
	}
	public Stock(double yesterday, double today, double now, String name,
			String id) {
		this.yesterday = yesterday;
		this.today = today;
		this.now = now;
		this.name = name;
		this.id = id;
	}
	public double getYesterday() {
		return yesterday;
	}
	public double getToday() {
		return today;
	}
	public double getNow() {
		return now;
	}
	public String getName() {
		return name;
	}
	public String getId() {
		return id;
	}
	public void setYesterday(double yesterday) {
		this.yesterday = yesterday;
	}
	public void setToday(double today) {
		this.today = today;
	}
	public void setNow(double now) {
		this.now = now;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
