/**
 * 
 */
package com.offcn.utils;

/** 
* @Title: PageTool.java
* @author: yanbo.deng
* @date: 2019年9月18日 下午10:00:41
* @Description:
* 数据总条数：totalCount 查询数据库得到 select count(*) from user
* 总页数：totalPages 根据每页条数和总记录数计算出来
* 每页显示条数：pageSize 
* 当前第几页：currentPage 页面传递过来
* 上一页：prePage
* 下一页：nextPage
* 起始下标：startIndex
*/
public class PageTool {
	/*
	 * 当前页码和总数据量从页面传递过来，其他数据可以通过这两个数据计算出来
	 */
	public PageTool(String currentPage, int totalCount) {
		this.totalCount = totalCount;//记录总条数从页面查询后传递过来
		initCurrentPage(currentPage);//给当前页码赋值ֵ
		pageSize=5;//每页显示条数固定为5，可修改
		initTotalPages();//初始化总页数
		initStartIndex();//设置每页起始下标 
		initPrePage();//上一页
		initNextPage();//下一页	
	}
	
	private int pageSize;//每页多少条数据
	private int currentPage;//当前页码
	private int totalCount;//数据总条数
	private int totalPages;//总页数
	private int prePage;//上一页
	private int nextPage;//下一页
	private int startIndex;//起始下标
	public int getPageSize() {
		return pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public int getPrePage() {
		return prePage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	
	private void initStartIndex(){
		this.startIndex=(currentPage-1)*pageSize;
	}
	
	private  void  initPrePage() {
		if (currentPage==1) {
			this.prePage=1;
		}else {
			this.prePage=currentPage-1;
		}
	}
	
	private void initNextPage() {
		if (currentPage==totalPages) {
			this.nextPage=totalPages;
		}else {
			this.nextPage=currentPage+1;
		}
	}
	
	/*
	 *初始化当前页码：当第一次进入显示列表页面时currentPage是没有值的，所以需要赋予初始值
	 *其他情况都是从页面传递过来的
	 */
	private void initCurrentPage(String currentPage) {
		if (currentPage==null||"".equals(currentPage)) {
			this.currentPage=1;
		}else {
			this.currentPage=Integer.valueOf(currentPage);
		}
	}
	//初始化总页数
	private void initTotalPages() {
		this.totalPages=(totalCount%pageSize==0)?(totalCount/pageSize):(totalCount/pageSize+1);
	}

}
