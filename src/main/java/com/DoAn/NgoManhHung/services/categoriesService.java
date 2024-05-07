package com.DoAn.NgoManhHung.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.DoAn.NgoManhHung.dto.CategorySearchModel;
import com.DoAn.NgoManhHung.model.Categories;
@Service
public class categoriesService extends BaseService<Categories> {
	
        @Override
		protected Class<Categories> clazz() {
			return Categories.class;
		}
        public PagerData<Categories> search(CategorySearchModel searchModel) {

    		// khởi tạo câu lệnh
    		String sql = "SELECT * FROM tbl_category p WHERE p.status=1";
            
    		if (searchModel != null) {
   
    			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
    				sql += " and (p.name like '%" + searchModel.getKeyword() + "%')";
    			}
    		}

    		// chi lay san pham chua xoa
//               				sql += " and p.status=1 ";

    		return getEntitiesByNativeSQL(sql, searchModel.getPage());

    	}
}
