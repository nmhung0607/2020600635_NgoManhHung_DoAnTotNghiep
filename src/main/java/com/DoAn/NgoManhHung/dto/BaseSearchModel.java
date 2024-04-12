package com.DoAn.NgoManhHung.dto;

import javax.servlet.http.HttpServletRequest;

public abstract class BaseSearchModel {
	private Integer page;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		}
		catch(Exception E) {
			return 1;
		}
	}
}
