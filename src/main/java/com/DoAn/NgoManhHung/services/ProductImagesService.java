package com.DoAn.NgoManhHung.services;

import org.springframework.stereotype.Service;

import com.DoAn.NgoManhHung.model.ProductImages;
@Service
public class ProductImagesService extends BaseService<ProductImages> {

	@Override
	protected Class<ProductImages> clazz() {
		return ProductImages.class;
	}

}