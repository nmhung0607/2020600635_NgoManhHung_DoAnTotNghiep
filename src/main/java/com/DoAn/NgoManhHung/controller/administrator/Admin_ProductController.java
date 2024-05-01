package com.DoAn.NgoManhHung.controller.administrator;

import java.io.File;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.DoAn.NgoManhHung.controller.Base_Controller;
import com.DoAn.NgoManhHung.model.Categories;
import com.DoAn.NgoManhHung.model.Contact;
import com.DoAn.NgoManhHung.model.Products;
import com.DoAn.NgoManhHung.services.PagerData;
import com.DoAn.NgoManhHung.services.ProductService;
import com.DoAn.NgoManhHung.services.categoriesService;

import com.DoAn.NgoManhHung.dto.ProductSearchModel;

@Controller
public class Admin_ProductController extends Base_Controller{
     @Autowired
     private ProductService productService;
     @RequestMapping(value = { "admin/admin_addProduct" }, method = RequestMethod.GET)
 	 public String defaultViewAddProducts(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
    	model.addAttribute("product",new Products());
 		return "administrator/admin_addProduct";
 	}
    @RequestMapping(value = { "/admin/admin_addProduct/{productId}" }, method = RequestMethod.GET)
 	public String adminProductEdit(final Model model, 
 								   final HttpServletRequest request,
 								   final HttpServletResponse response, 
 								   @PathVariable("productId") int productId) throws IOException {		
 		// lấy product trong db theo ID
 		Products addedProduct = productService.getById(productId);
 		model.addAttribute("product",addedProduct);
 		
 		return "administrator/admin_addProduct";
 	}
    @RequestMapping(value = { "admin/admin_addProduct" }, method = RequestMethod.POST)
 	public String post_spring_form(final Model model, 
 								   final HttpServletRequest request,
 							   	   final HttpServletResponse response, 
 							   	   final @ModelAttribute("product") Products product,
 							   	   final @RequestParam("productAvatar") MultipartFile productAvatar,
								   final @RequestParam("productPictures") MultipartFile[] productPictures
 							   	   ) throws IOException {
 		productService.saveOrUpdate(product);
 	 
 		
 		if (product.getId() == null || product.getId() <= 0) { // thêm mới
			productService.add(product, productAvatar, productPictures);
		}
		else // chỉnh sửa
		{ 
			productService.update(product, productAvatar, productPictures);
		}
 		return "redirect:/admin/admin_viewProducts";
 	}
    @RequestMapping(value = { "/admin/product/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody Products product) {
		
		Products productInDb = productService.getById(product.getId());
		productInDb.setStatus(false);
		productService.saveOrUpdate(productInDb);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
    @RequestMapping(value = { "/admin/admin_viewProducts" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setCategoryId(getInteger(request, "categoryId"));
		searchModel.setPage(getCurrentPage(request));
		PagerData<Products>pdProducts=productService.search(searchModel);
		model.addAttribute("pdProducts",pdProducts);
		model.addAttribute("searchModel", searchModel);
		return "administrator/admin_viewProducts";
	}
}
