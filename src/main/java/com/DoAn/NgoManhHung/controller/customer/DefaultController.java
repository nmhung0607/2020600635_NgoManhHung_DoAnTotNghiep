package com.DoAn.NgoManhHung.controller.customer;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.security.Principal;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.DoAn.NgoManhHung.controller.Base_Controller;
import com.DoAn.NgoManhHung.dto.ProductSearchModel;
import com.DoAn.NgoManhHung.model.Categories;
import com.DoAn.NgoManhHung.model.Contact;
import com.DoAn.NgoManhHung.model.ProductImages;
import com.DoAn.NgoManhHung.model.Products;
import com.DoAn.NgoManhHung.model.User;
import com.DoAn.NgoManhHung.services.PagerData;
import com.DoAn.NgoManhHung.services.ProductImagesService;
import com.DoAn.NgoManhHung.services.ProductService;
import com.DoAn.NgoManhHung.services.UserService;
import com.DoAn.NgoManhHung.services.categoriesService;
@Controller
public class DefaultController extends Base_Controller{
	@Autowired
	private ProductService productService;
	@Autowired
	private categoriesService cateService;
	@Autowired
	private UserService userService;
	@Autowired
	private ProductImagesService productimgService;
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
		List<Products> productsList = pdProducts.getData();
		List<BigDecimal> discountPercentages = new ArrayList<>();// Lấy danh sách sản phẩm từ PagerData
		for (Products product : productsList) {
		    BigDecimal price = product.getPrice(); // Lấy giá của sản phẩm
		    BigDecimal priceSale = product.getPrice_sale();
		    BigDecimal discountPercentage = price.subtract(priceSale)
                    .divide(price, 2, RoundingMode.HALF_UP)
                    .multiply(BigDecimal.valueOf(100));
		    discountPercentages.add(discountPercentage);
		    // Tiến hành xử lý với giá và giá giảm ở đây
		}
		model.addAttribute("giamgia",discountPercentages);
		model.addAttribute("pdProducts", pdProducts);
		model.addAttribute("searchModel", searchModel);
    	return "customer/index"; //WEB-INF/views/customer/index.jsp
    }
	@RequestMapping(value = "/danh-muc", method = RequestMethod.GET)
    public String categoryView(final Model model,
                               final HttpServletRequest request,
                               final HttpServletResponse response
                              ) {
        // Logic để hiển thị trang danh mục và danh sách sản phẩm của danh mục này
        // ...
		String cateId=request.getParameter("categoryId");
		int categoryId=Integer.parseInt(cateId);
		ProductSearchModel searchModel1=new ProductSearchModel();
		searchModel1.setKeyword(request.getParameter("keyword"));
		searchModel1.setSort_by(request.getParameter("sort_by"));
		searchModel1.setCategoryId(categoryId);
		searchModel1.setPage(getCurrentPage(request));
		
		PagerData<Products> pdProducts1 = productService.searchbyCategory(searchModel1);
		model.addAttribute("pdProducts1", pdProducts1);
		model.addAttribute("searchModel1", searchModel1);
        return "customer/findbycategory";
    }
	
	@RequestMapping(value = {"/categories/{categorySeo}"}, method = RequestMethod.GET)
	public String defaultViewCate(final Model model,
            final HttpServletRequest request,
            final HttpServletResponse response,
            @PathVariable("categorySeo") String categorySeo ) {
		// lấy sản phẩm theo product seo 
		Categories category =cateService.getEntityByNativeSQL("select * from tbl_products where seo='"+categorySeo+"'");
		model.addAttribute("category", category);
		List<Products> products = productService.getEntitiesByNativeSQL("select *from tbl_products p where p.status=1");
		model.addAttribute("products", products);
    return "customer/findbycategory";
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
		List<Products> products = productService.getEntitiesByNativeSQL("select *from tbl_products p where p.status=1");
		model.addAttribute("products", products);
		List<ProductImages> productImg = productimgService.getEntitiesByNativeSQL("select *from tbl_product_images e where e.product_id = " +product.getId());
		model.addAttribute("productImg", productImg);
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
	@RequestMapping(value = { "/cap-nhat-account/{username}" }, method = RequestMethod.POST)
	public String updatedacc(final Model model, 
								   final HttpServletRequest request,
							   	   final HttpServletResponse response, 
							   	   final @PathVariable("username") String username,
							   	   @ModelAttribute("user") User userForm) throws IOException {
		User user1 = userService.loadUserByUsername(username);
		user1.setEmail(userForm.getEmail());
		user1.setPhone(userForm.getPhone());
		user1.setShipping_address(userForm.getShipping_address());
		userService.saveOrUpdate(user1);
		
		model.addAttribute("message", "Cảm ơn bạn đã cập nhật");
		return "customer/updateAccount";
	}
	@RequestMapping(value = { "/cap-nhat-account/{username}" }, method = RequestMethod.GET)
	public String updatedaccGet(final Model model, 
								   final HttpServletRequest request,
								   Principal principal,
							   	   final HttpServletResponse response,
							   	   @ModelAttribute("user") User userForm) throws IOException {
		String username = principal.getName();
	    User currentUser = userService.loadUserByUsername(username);
	    
	    // Truyền thông tin của người dùng hiện tại vào biểu mẫu để cập nhật
	    model.addAttribute("user", currentUser);
		return "customer/updateAccount";
	}
}
