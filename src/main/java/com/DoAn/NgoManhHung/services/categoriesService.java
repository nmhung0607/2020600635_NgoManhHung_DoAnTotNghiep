package com.DoAn.NgoManhHung.services;

import org.springframework.stereotype.Service;


import com.DoAn.NgoManhHung.model.Categories;
@Service
public class categoriesService extends BaseService<Categories> {
	
        @Override
		protected Class<Categories> clazz() {
			return Categories.class;
		}
}
