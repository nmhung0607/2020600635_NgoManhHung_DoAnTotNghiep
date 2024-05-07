package com.DoAn.NgoManhHung.dto;

public class UserSearchModel extends BaseSearchModel{
	public String keyword;
    public String sdt;
    
	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt =sdt;
	}

	public String getKeyword() {
		return keyword;
	}
    
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
