package com.DoAn.NgoManhHung.dto;

public class ProductSearchModel extends BaseSearchModel{
	// tim theo keyword
	private String keyword;
	// tìm theo category
	private Integer categoryId;
	private String title;
	private String sort_by;
	private String categoryName;
	private String orderAddress;
    
	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getSort_by() {
		return sort_by;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword=keyword;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public void setSort_by(String parameter) {
		String str="" +this.sort_by;
		str=parameter;
	}
}
