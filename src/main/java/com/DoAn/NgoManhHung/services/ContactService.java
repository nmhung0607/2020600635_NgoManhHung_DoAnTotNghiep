package com.DoAn.NgoManhHung.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.DoAn.NgoManhHung.dto.ContactSearchModel;
import com.DoAn.NgoManhHung.dto.ProductSearchModel;
import com.DoAn.NgoManhHung.model.Contact;
import com.DoAn.NgoManhHung.model.Products;

/**
 * Service dùng cho Entity Contact
 * @author daing
 *
 */
@Service
public class ContactService extends BaseService<Contact> {

	@Override
	protected Class<Contact> clazz() {
		return Contact.class;
	}
	public PagerData<Contact>  search(ContactSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_contact p WHERE p.status=1";

		if (searchModel != null) {
			// tìm theo seo
//			if (!StringUtils.isEmpty(searchModel.seo)) {
//				sql += " and p.seo = '" + searchModel.seo + "'";
//			}

			// tìm kiếm sản phẩm hot
//			if (searchModel.isHot != null) {
//				sql += " and p.is_hot = '" + searchModel.seo + "'";
//			}
			
			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.last_name like '%" + searchModel.getKeyword() + "%')";
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		
		return getEntitiesByNativeSQL(sql,searchModel.getPage());
		
	}
	
}

