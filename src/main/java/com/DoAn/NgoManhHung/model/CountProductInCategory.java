package com.DoAn.NgoManhHung.model;

public class CountProductInCategory extends BaseEntity{
	private int categoryId;
	private int numberOfProduct;
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getNumberOfProduct() {
		return numberOfProduct;
	}
	public void setNumberOfProduct(int numberOfProduct) {
		this.numberOfProduct = numberOfProduct;
	}
}
