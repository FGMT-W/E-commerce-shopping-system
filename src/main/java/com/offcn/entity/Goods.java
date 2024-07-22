package com.offcn.entity;

import java.util.Date;

public class Goods {

	private int gid;
	private int cid;//关联商品类型表的主键
	private Category category;//辅助查询
	private String gname;
	private String color;
	private String size;
	private double price;
	private String description;
	private String full_description;
	private String pic;
	private int state;
	private String version;
	private Date product_date;

	public Goods() {
		super();
	}
	
	public Goods(int cid, String gname, String color, String size, double price, String description,
			String full_description, String pic, int state, String version, Date product_date) {
		super();
		this.cid = cid;
		this.gname = gname;
		this.color = color;
		this.size = size;
		this.price = price;
		this.description = description;
		this.full_description = full_description;
		this.pic = pic;
		this.state = state;
		this.version = version;
		this.product_date = product_date;
	}

	public Goods(int gid, int cid, String gname, String color, String size, double price,
			String description, String full_description, String pic, int state, String version, Date product_date) {
		super();
		this.gid = gid;
		this.cid = cid;
		this.gname = gname;
		this.color = color;
		this.size = size;
		this.price = price;
		this.description = description;
		this.full_description = full_description;
		this.pic = pic;
		this.state = state;
		this.version = version;
		this.product_date = product_date;
	}

	@Override
	public String toString() {
		return "Goods [gid=" + gid + ", cid=" + cid + ", category=" + category + ", gname=" + gname + ", color=" + color
				+ ", size=" + size + ", price=" + price + ", description=" + description + ", full_description="
				+ full_description + ", pic=" + pic + ", state=" + state + ", version=" + version + ", product_date="
				+ product_date + "]";
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFull_description() {
		return full_description;
	}

	public void setFull_description(String full_description) {
		this.full_description = full_description;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public Date getProduct_date() {
		return product_date;
	}

	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}

	
}
