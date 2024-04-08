//package com.devpro.NgoManhHungFECuoiKhoa.controller.administrator;
//
//import java.io.File;
//
//import java.io.IOException;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.devpro.NgoManhHungFECuoiKhoa.controller.Base_Controller;
//import com.devpro.NgoManhHungFECuoiKhoa.dto.ContactSearchModel;
//import com.devpro.NgoManhHungFECuoiKhoa.dto.OderSearchModel;
//import com.devpro.NgoManhHungFECuoiKhoa.model.Contact;
//import com.devpro.NgoManhHungFECuoiKhoa.model.Item;
//import com.devpro.NgoManhHungFECuoiKhoa.model.Products;
//import com.devpro.NgoManhHungFECuoiKhoa.model.SaleOrder;
//import com.devpro.NgoManhHungFECuoiKhoa.services.ContactService;
//import com.devpro.NgoManhHungFECuoiKhoa.services.PagerData;
//import com.devpro.NgoManhHungFECuoiKhoa.services.ProductService;
//import com.devpro.NgoManhHungFECuoiKhoa.services.SaleOrderService;
//import com.mysql.cj.protocol.Resultset;
//
//@Controller
//
//public class AdminController extends Base_Controller {
//	@Autowired
//	private ContactService contactService;
//	@Autowired
//	private ProductService productService;
//	@Autowired
//	private SaleOrderService saleOrderService;
//
//	@RequestMapping(value = { "admin/administrator" }, method = RequestMethod.GET)
//	public String defaultView(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
//		model.addAttribute("item", new Item());
//		List<Contact> contactList= contactService.findAll();
//		model.addAttribute("contactList", contactList);
//		return "administrator/administrator"; // WEB-INF/views/customer/index.jsp
//	}
//	@RequestMapping(value = { "admin/admin_viewContact" }, method = RequestMethod.GET)
//	public String defaultViewContact(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
//		ContactSearchModel searchModel = new ContactSearchModel();
//		searchModel.setKeyword(request.getParameter("keyword"));
//		searchModel.setPage(getCurrentPage(request));
//		PagerData<Contact> contactList= contactService.search(searchModel);
//		model.addAttribute("contactList", contactList);
//		return "administrator/admin_viewContact"; // WEB-INF/views/customer/index.jsp
//	}
////	@RequestMapping(value = { "admin/admin_viewProducts" }, method = RequestMethod.GET)
////	public String defaultViewProducts(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
////		List<Products> productList= productService.findAll();
////		model.addAttribute("productList", productList);
////        model.addAttribute("product", new Products());
////        return "administrator/admin_viewProducts"; // WEB-INF/views/customer/index.jsp
////	}
//	@RequestMapping(value = { "/admin/contact/delete" }, method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
//															final HttpServletRequest request,
//															final HttpServletResponse response, 
//															final @RequestBody Contact contact) {
//		
//		Contact contactInDb = contactService.getById(contact.getId());
//		contactInDb.setStatus(false);
//		contactService.saveOrUpdate(contactInDb);
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("code", 200);
//		jsonResult.put("message", "Đã xóa thành công");
//		return ResponseEntity.ok(jsonResult);
//		
//	}
//	@RequestMapping(value = { "admin/administrator" }, method = RequestMethod.POST)
//	public String post_spring_form(final Model model, final HttpServletRequest request,
//			final HttpServletResponse response, final @ModelAttribute("item") Item item,
//			final @RequestParam("attachment") MultipartFile attachmentFile) throws ServletException, IOException {
//
//		
//		if (!attachmentFile.isEmpty()) {
//			attachmentFile.transferTo(new File("C:/upload/" + attachmentFile.getOriginalFilename()));
//		}
//		model.addAttribute("item", new Item());
//		return "administrator/administrator";
//	}
//	@RequestMapping(value = { "admin/admin_viewOrder" }, method = RequestMethod.GET)
//	public String defaultViewOrder(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
//		OderSearchModel searchModel = new OderSearchModel();
//		searchModel.setKeyword(request.getParameter("keyword"));
//		searchModel.setOrderAddress(request.getParameter("orderAddress"));
//		searchModel.setPage(getCurrentPage(request));
//		PagerData<SaleOrder> orderList= saleOrderService.search(searchModel);
//		model.addAttribute("orderList", orderList);
//		return "administrator/admin_viewOrder"; // WEB-INF/views/customer/index.jsp
//	}
//}
