package com.DoAn.NgoManhHung.services;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TemporalType;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import com.DoAn.NgoManhHung.dto.OderSearchModel;

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
	public BigDecimal getTotalRevenue() {
	    String sql = "SELECT SUM(s.total) AS totalRevenue FROM tbl_sale_orders s";
	    // Tạo truy vấn từ EntityManager
	    Query query = entityManager.createNativeQuery(sql);
	    // Thực hiện truy vấn và lấy kết quả
	    BigDecimal totalRevenue = (BigDecimal) query.getSingleResult();
	    return totalRevenue;
	}
	public BigInteger getTotalOrder() {
	    String sql = "SELECT COUNT(s.id) FROM tbl_sale_orders s";
	    // Tạo truy vấn từ EntityManager
	    Query query = entityManager.createNativeQuery(sql);
	    // Thực hiện truy vấn và lấy kết quả
	    BigInteger totalOrder = (BigInteger) query.getSingleResult();
	    return totalOrder;
	}
	public BigInteger getTotalOrderByDay(String formattedDate) {
	    String sql = "SELECT COUNT(s.id) FROM tbl_sale_orders s WHERE s.created_date= :date";
	    
	    // Tạo truy vấn từ EntityManager
	    Query query = entityManager.createNativeQuery(sql);
	    query.setParameter("date", formattedDate);
	    // Thực hiện truy vấn và lấy kết quả
	    BigInteger totalOrder = (BigInteger) query.getSingleResult();
	    return totalOrder;
	}
	public BigDecimal getTotalRevenueByDate(String formattedDate) {
	    String sql = "SELECT SUM(s.total) FROM tbl_sale_orders s WHERE s.created_date= :date";
	    // Tạo truy vấn từ EntityManager
	    Query query = entityManager.createNativeQuery(sql);
	    query.setParameter("date", formattedDate);
	    // Thực hiện truy vấn và lấy kết quả
	    BigDecimal totalRevenueByDay = (BigDecimal) query.getSingleResult();
	    return totalRevenueByDay;
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
	private Date getStartOfDay(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return (Date) calendar.getTime();
    }

    private Date getEndOfDay(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        calendar.set(Calendar.MILLISECOND, 999);
        return (Date) calendar.getTime();
    }
}
