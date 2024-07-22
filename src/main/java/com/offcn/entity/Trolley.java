package com.offcn.entity;

public class Trolley {
	private int tid;//主键自增
	private int uid;//关联用户表中用户编号
	private User user;//辅助查询
	private int gid;//关联商品表中商品编号
	private Goods goods;//辅助查询
	private int number;//商品数量
	private String orders_number;//订单编号，默认为空
	
	public Trolley(int uid, int gid) {
		super();
		this.uid = uid;
		this.gid = gid;
	}
	
	public Trolley(int tid, int uid, User user, int gid, Goods goods, int number, String orders_number) {
		super();
		this.tid = tid;
		this.uid = uid;
		this.user = user;
		this.gid = gid;
		this.goods = goods;
		this.number = number;
		this.orders_number = orders_number;
	}
	
	public Trolley() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "Trolley [tid=" + tid + ", uid=" + uid + ", user=" + user + ", gid=" + gid + ", goods=" + goods
				+ ", number=" + number + ", orders_number=" + orders_number + "]";
	}
	
	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getOrders_number() {
		return orders_number;
	}

	public void setOrders_number(String orders_number) {
		this.orders_number = orders_number;
	}

	
}
