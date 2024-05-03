package com.DoAn.NgoManhHung.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.DoAn.NgoManhHung.dto.ContactSearchModel;
import com.DoAn.NgoManhHung.dto.OderSearchModel;
import com.DoAn.NgoManhHung.model.Contact;
import com.DoAn.NgoManhHung.model.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {
	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}

	public PagerData<SaleOrder> search(OderSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_sale_orders p WHERE p.status=1";
        
		if (searchModel != null) {
			if(searchModel.getOrderAddress()!= null){
				sql += " and (p.customer_address  like '%" + searchModel.getOrderAddress() + "%' )";
			
			}
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.customer_name like '%" + searchModel.getKeyword() + "%')";
			}
		}

		// chi lay san pham chua xoa
//           				sql += " and p.status=1 ";

		return getEntitiesByNativeSQL(sql, searchModel.getPage());

	}
}
