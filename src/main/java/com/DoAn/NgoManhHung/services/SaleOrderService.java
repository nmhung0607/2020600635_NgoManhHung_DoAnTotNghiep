package com.DoAn.NgoManhHung.services;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.DoAn.NgoManhHung.dto.ContactSearchModel;
import com.DoAn.NgoManhHung.dto.OderSearchModel;
import com.DoAn.NgoManhHung.model.Contact;
import com.DoAn.NgoManhHung.model.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {
	@PersistenceContext
    private EntityManager entityManager;
	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}
	public List<Date> getDate() {
		String sql ="SELECT DISTINCT DATE(s.created_date) FROM tbl_sale_orders s";
		Query query = entityManager.createNativeQuery(sql);
		List<Date> dates = query.getResultList();
        return dates;
	}
	public List<BigDecimal> getRevenue() {
        String sql = "SELECT SUM(s.total) AS totalRevenue " +
                     "FROM tbl_sale_orders s " +
                     "GROUP BY DATE(s.created_date)";
        Query query = entityManager.createNativeQuery(sql);
        List<BigDecimal> results = query.getResultList();
        return results;
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
