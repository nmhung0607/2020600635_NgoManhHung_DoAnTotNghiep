package com.DoAn.NgoManhHung.dto;

public class OderSearchModel extends BaseSearchModel{
	public String keyword;
    public String orderAddress;
    
	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getKeyword() {
		return keyword;
	}
    
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
