package com.rrb.alliance.entity.page;

public class Page {

	//分页时需要输入的条件
	private int currentPage = 1;	//当前页，由客户点击页码触发输入，默认值为第1页
	private int pageSize = 10;		//每页最大行，固定的值
	
	//分页SQL所需的条件
	private int begin;				//当前页的起始行( currentPage - 1 ) * pageSize
	
	//计算总页数所依赖的条件
	private int rows;				//总行数
	
	//页面动态创建页码时需要的值
	private int totalPage;			//总页数
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getBegin() {
		begin = (currentPage-1)*pageSize;
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	
	
	public int getTotalPage() {
		if(rows % pageSize == 0){
			totalPage = rows / pageSize;		//如果能整除，总页数就是相除的结果
		} else {
			totalPage = rows / pageSize + 1;	//如果不能整除，总页数是相除结果+1
		}
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
}
