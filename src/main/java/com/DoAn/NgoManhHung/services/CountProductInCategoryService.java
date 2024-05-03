package com.DoAn.NgoManhHung.services;

import org.springframework.stereotype.Service;
import com.DoAn.NgoManhHung.model.CountProductInCategory;

@Service
public class CountProductInCategoryService extends BaseService<CountProductInCategory>{

	@Override
	protected Class<CountProductInCategory> clazz() {
		
		return CountProductInCategory.class;
	}
    
}
