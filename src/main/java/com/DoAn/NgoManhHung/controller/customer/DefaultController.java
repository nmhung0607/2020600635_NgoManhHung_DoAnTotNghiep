package com.DoAn.NgoManhHung.controller.customer;

import java.util.List;




import javax.servlet.http.HttpServletRequest;



import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.DoAn.NgoManhHung.controller.Base_Controller;
import com.DoAn.NgoManhHung.dto.ProductSearchModel;
import com.DoAn.NgoManhHung.model.Products;
import com.DoAn.NgoManhHung.services.PagerData;
import com.DoAn.NgoManhHung.services.ProductService;
@Controller
public class DefaultController extends Base_Controller{
	@Autowired
	private ProductService productService;
	@RequestMapping(value = {"/trang-chu"}, method = RequestMethod.GET)
     public String defaultView(final Model model,
    		                   final HttpServletRequest request,
    		                   final HttpServletResponse response
    		                   ) {
		
		ProductSearchModel searchModel=new ProductSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setSort_by(request.getParameter("sort_by"));
		searchModel.setPage(getCurrentPage(request));
		PagerData<Products> pdProducts = productService.sort(searchModel);
		model.addAttribute("pdProducts", pdProducts);
    	return "customer/index"; //WEB-INF/views/customer/index.jsp
    }
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		}
		catch(Exception E) {
			return 1;
		}
	}

	/**
//	 * @param model
//	 * @param request
//	 * @param response
//	 * @return
//	 */
	@RequestMapping(value = {"/details"}, method = RequestMethod.GET)
	public String defaultViewDeTails(final Model model,
            final HttpServletRequest request,
            final HttpServletResponse response) {
		List<Products> products = productService.findAll();
		model.addAttribute("products", products);
    return "customer/product_detailss"; //WEB-INF/views/customer/index.jsp
    }
	@RequestMapping(value = {"/details/{productSeo}"}, method = RequestMethod.GET)
	public String defaultViewDeTail(final Model model,
            final HttpServletRequest request,
            final HttpServletResponse response,
            @PathVariable("productSeo") String productSeo ) {
		// lấy sản phẩm theo product seo 
		Products product = productService.getEntityByNativeSQL("select * from tbl_products where seo='"+productSeo+"'");
		model.addAttribute("product", product);
    return "customer/product_detailss";
    }
	@RequestMapping(value = {"/trang-chu/{categoryName}"}, method = RequestMethod.GET)
	public String defaultViewCategory(final Model model,
            final HttpServletRequest request,
            final HttpServletResponse response,
            @PathVariable("categoryName") String categoryName ) {
		ProductSearchModel searchModel=new ProductSearchModel();
		searchModel.setCategoryName(request.getParameter("categoryName"));
		searchModel.setPage(getCurrentPage(request));
		PagerData<Products> pdProducts = productService.searchCategory(searchModel);
		model.addAttribute("pdProducts", pdProducts);
    return "customer/index";
    }
	@RequestMapping(value = {"/subcribers"}, method = RequestMethod.GET)
	public String defaultViewSub(final Model model,
            final HttpServletRequest request,
            final HttpServletResponse response) {
    return "customer/subcriber";
    }	
}
