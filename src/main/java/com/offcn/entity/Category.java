package com.offcn.entity;

import java.util.Date;

public class Category {

	private int cid;
	private String name;
	private int state; //1表示启用 0表示未启用
	private int order_number;
	private String description;
	private Date create_time;

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Category(int cid, String name, int state, int order_number, String description, Date create_time) {
		super();
		this.cid = cid;
		this.name = name;
		this.state = state;
		this.order_number = order_number;
		this.description = description;
		this.create_time = create_time;
	}
	
	public Category(String name, int state, int order_number, String description, Date create_time) {
		super();
		this.name = name;
		this.state = state;
		this.order_number = order_number;
		this.description = description;
		this.create_time = create_time;
	}
	
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getOrder_number() {
		return order_number;
	}

	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	@Override
	public String toString() {
		return "Category [name=" + name + ", state=" + state + ", order_number=" + order_number + ", description="
				+ description + ", create_time=" + create_time + "]";
	}

	
	
}
