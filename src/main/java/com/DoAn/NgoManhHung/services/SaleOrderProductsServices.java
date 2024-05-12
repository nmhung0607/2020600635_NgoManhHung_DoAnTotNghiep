package com.DoAn.NgoManhHung.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.DoAn.NgoManhHung.dto.OderSearchModel;
import com.DoAn.NgoManhHung.dto.ProductSearchModel;
import com.DoAn.NgoManhHung.model.Products;
import com.DoAn.NgoManhHung.model.SaleOrder;
import com.DoAn.NgoManhHung.model.SaleOrderProducts;


@Service
public class SaleOrderProductsServices extends BaseService<SaleOrderProducts>  {
	@PersistenceContext
    private EntityManager entityManager;

    public SaleOrderProducts getSaleOrderProductById(Integer id) {
        return entityManager.find(SaleOrderProducts.class, id);
    }
    public PagerData<SaleOrderProducts> search(OderSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_sale_orders_products p WHERE p.status=1";
        
		if (searchModel != null) {
			
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.name like '%" + searchModel.getKeyword() + "%')";
			}
		}return getEntitiesByNativeSQL(sql, searchModel.getPage());
    }
    public SaleOrder searchSaleOrder(Integer id) {

    	String sql = "SELECT * FROM tbl_sale_orders so JOIN tbl_sale_orders_products sop ON so.id = sop.saleorder_id WHERE sop.saleorder_id = :id";
        Query query = entityManager.createNativeQuery(sql, SaleOrder.class);
        query.setParameter("id", id);
        List<SaleOrder> resultList = query.getResultList();
        if (!resultList.isEmpty()) {
            return resultList.get(0);
        } else {
            return null; // hoặc thực hiện xử lý nếu không tìm thấy SaleOrder
        }
		
	}
	@Override
	protected Class<SaleOrderProducts> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProducts.class;
	}
	public List<SaleOrderProducts> findBySaleOrder(SaleOrder saleOrder) {
        TypedQuery<SaleOrderProducts> query = entityManager.createQuery(
            "SELECT sop FROM SaleOrderProducts sop WHERE sop.saleOrder = :saleOrder", 
            SaleOrderProducts.class
        );
        query.setParameter("saleOrder", saleOrder);
        return query.getResultList();
    }
}
