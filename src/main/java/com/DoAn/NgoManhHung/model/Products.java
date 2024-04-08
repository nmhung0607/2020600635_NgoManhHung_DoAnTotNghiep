package com.DoAn.NgoManhHung.model;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_products")
public class Products extends BaseEntity {
	@Column(name = "title", length = 1000, nullable = false)
	private String title;
	@Column(name = "price", precision = 13, scale = 2, nullable = false)
	private BigDecimal price;
	@Column(name = "price_sale", precision = 13, scale = 2, nullable = true)
	private BigDecimal price_sale;
	@Column(name = "short_des", length = 3000, nullable = false)
	private String short_description;
	@Lob
	@Column(name = "details_des", columnDefinition = "LONGTEXT", nullable = false)
	private String details;
	@Column(name = "avatar", length = 300, nullable = true)
	private String avatar;
	@Column(name = "seo", length = 100, nullable = true)
	private String seo;
	@Column(name = "soluong",  nullable = false)
	private String soluong;
	public String getSoluong() {
		return soluong;
	}
	public void setSoluong(String soluong) {
		this.soluong = soluong;
	}

	@Column(name = "is_hot", nullable = false)
	private Boolean is_hot = Boolean.FALSE;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Categories categories;
	@OneToMany(cascade = CascadeType.ALL, 
			   fetch = FetchType.EAGER, 
			   mappedBy = "products")
	private Set<ProductImages> productImages = new HashSet<ProductImages>();
	public void addProductImages(ProductImages _productImages) {
		_productImages.setProduct(this);
		productImages.add(_productImages);
	}
	public Set<ProductImages> getProductImages() {
		return productImages;
	}
	public void setProductImages(Set<ProductImages> productImages) {
		this.productImages = productImages;
	}
	public void deleteProductImages(ProductImages _productImages) {
		_productImages.setProduct(null);
		productImages.remove(_productImages);
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public void setPrice_sale(BigDecimal price_sale) {
		this.price_sale = price_sale;
	}
	public Categories getCategories() {
		return categories;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public BigDecimal getPrice_sale() {
		return price_sale;
	}
	public void setCategories(Categories categories) {
		this.categories = categories;
	}

	public String getTitle() {
		return title;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getShort_description() {
		return short_description;
	}

	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Boolean getIs_hot() {
		return is_hot;
	}

	public void setIs_hot(Boolean is_hot) {
		this.is_hot = is_hot;
	}
}
