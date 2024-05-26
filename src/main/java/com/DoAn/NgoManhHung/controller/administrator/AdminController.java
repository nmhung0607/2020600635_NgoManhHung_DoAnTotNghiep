package com.DoAn.NgoManhHung.controller.administrator;

import java.io.File;


import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
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
import com.DoAn.NgoManhHung.dto.CategorySearchModel;
import com.DoAn.NgoManhHung.dto.ContactSearchModel;
import com.DoAn.NgoManhHung.dto.OderSearchModel;
import com.DoAn.NgoManhHung.dto.UserSearchModel;
import com.DoAn.NgoManhHung.model.Categories;
import com.DoAn.NgoManhHung.model.Contact;
import com.DoAn.NgoManhHung.model.Item;
import com.DoAn.NgoManhHung.model.Products;
import com.DoAn.NgoManhHung.model.SaleOrder;
import com.DoAn.NgoManhHung.model.SaleOrderProducts;
import com.DoAn.NgoManhHung.model.User;
import com.DoAn.NgoManhHung.services.ContactService;
import com.DoAn.NgoManhHung.services.PagerData;
import com.DoAn.NgoManhHung.services.ProductService;
import com.DoAn.NgoManhHung.services.SaleOrderProductsServices;
import com.DoAn.NgoManhHung.services.SaleOrderService;
import com.DoAn.NgoManhHung.services.UserService;
import com.DoAn.NgoManhHung.services.categoriesService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller

public class AdminController extends Base_Controller {
	@Autowired
	private ContactService contactService;
    @Autowired
    private UserService userService;
	@Autowired
	private categoriesService catSer;
    @Autowired
    private SaleOrderProductsServices saleOrderProductService;
    @Autowired
    private SaleOrderService saleOrderService;
//	@RequestMapping(value = { "admin/administrator" }, method = RequestMethod.GET)
//	public String defaultView(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
//		model.addAttribute("item", new Item());
//		List<Contact> contactList= contactService.findAll();
//		model.addAttribute("contactList", contactList);
//		return "administrator/administrator"; // WEB-INF/views/customer/index.jsp
//	}
	@RequestMapping(value = { "admin/admin_viewContact" }, method = RequestMethod.GET)
	public String defaultViewContact(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
		ContactSearchModel searchModel = new ContactSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setPage(getCurrentPage(request));
		PagerData<Contact> contactList= contactService.search(searchModel);
		model.addAttribute("contactList", contactList);
		return "administrator/admin_viewContact"; // WEB-INF/views/customer/index.jsp
	}
	@RequestMapping(value = { "/admin/contact/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody Contact contact) {
		
		Contact contactInDb = contactService.getById(contact.getId());
		contactInDb.setStatus(false);
		contactService.saveOrUpdate(contactInDb);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	@RequestMapping(value = { "admin/administrator" }, method = RequestMethod.POST)
	public String post_spring_form(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @ModelAttribute("item") Item item,
			final @RequestParam("attachment") MultipartFile attachmentFile) throws ServletException, IOException {

		
		if (!attachmentFile.isEmpty()) {
			attachmentFile.transferTo(new File("C:/upload/" + attachmentFile.getOriginalFilename()));
		}
		model.addAttribute("item", new Item());
		return "administrator/administrator";
	}
	@RequestMapping(value = { "admin/admin_viewOrder" }, method = RequestMethod.GET)
	public String defaultViewOrder(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
		OderSearchModel searchModel = new OderSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setOrderAddress(request.getParameter("orderAddress"));
		searchModel.setPage(getCurrentPage(request));
		PagerData<SaleOrderProducts> orderList= saleOrderProductService.search(searchModel);
		model.addAttribute("orderList", orderList);
		return "administrator/admin_viewOrder"; // WEB-INF/views/customer/index.jsp
	}
	@RequestMapping(value = { "admin/admin_viewOrders/{id}" }, method = RequestMethod.GET)
	public String defaultViewDetailsOrder(final Model model, final HttpServletRequest request, final HttpServletResponse response,@PathVariable Integer id) {
		SaleOrderProducts sale1= saleOrderProductService.getById(id);
		
		model.addAttribute("sale1",sale1);
		return "administrator/detailsOrder"; // WEB-INF/views/customer/index.jsp
	}
	@RequestMapping(value = { "admin/admin_viewAccount" }, method = RequestMethod.GET)
	public String defaultViewAccount(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
		UserSearchModel searchModel = new UserSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setSdt(request.getParameter("sdt"));
		searchModel.setPage(getCurrentPage(request));
		PagerData<User> userList= userService.search(searchModel);
		model.addAttribute("userList", userList);
		return "administrator/admin_ViewAccount"; // WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "admin/admin_viewCategory" }, method = RequestMethod.GET)
	public String defaultViewCategory(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
		CategorySearchModel searchModel = new CategorySearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setPage(getCurrentPage(request));
		PagerData<Categories> cateList=catSer.search(searchModel);
		model.addAttribute("cateList", cateList);
		return "administrator/admin_viewCategory"; // WEB-INF/views/customer/index.jsp
	}
	@RequestMapping(value = { "/admin/update_category/{categoryId}" }, method = RequestMethod.POST)
	public String updatedCate(final Model model, 
								   final HttpServletRequest request,
							   	   final HttpServletResponse response, 
							   	   final @PathVariable("categoryId") Integer categoryId,
							   	   @ModelAttribute("category") Categories category) throws IOException {
		Categories cate1 = catSer.getById(categoryId);
		cate1.setName(category.getName());
		catSer.saveOrUpdate(cate1);
		model.addAttribute("message", "Cập nhật thành công");
		return "administrator/admin_updateCate";
	}
	@RequestMapping(value = { "/admin/update_category/{categoryId}" }, method = RequestMethod.GET)
	public String updatedcateGet(final Model model, 
								   final HttpServletRequest request,
								   Principal principal,
							   	   final HttpServletResponse response,
							   	   @PathVariable("categoryId") Integer categoryId) throws IOException {
		
	    
	    // Truyền thông tin của người dùng hiện tại vào biểu mẫu để cập nhật
		Categories category = catSer.getById(categoryId);
	    model.addAttribute("category", category);
		return "administrator/admin_updateCate";
	}
	@RequestMapping(value = { "/admin/category/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteCategory(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody Categories cat) {
		
		Categories cateInDb = catSer.getById(cat.getId());
		cateInDb.setStatus(false);
		catSer.saveOrUpdate(cateInDb);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	@RequestMapping(value = "/admin/adminViewOrderDetails/{orderId}", method = RequestMethod.GET)
	public String orderDetail(@PathVariable("orderId") Integer orderId, Model model) {
	    // Truy vấn thông tin đơn đặt hàng từ cơ sở dữ liệu
	    SaleOrder order = saleOrderService.getById(orderId);
        
	    // Truy vấn danh sách các sản phẩm đã đặt trong đơn hàng
	    List<SaleOrderProducts> orderProducts = saleOrderProductService.findBySaleOrder(order);
	    // Đặt thông tin đơn đặt hàng và danh sách sản phẩm vào model
	    model.addAttribute("order", order);
	    model.addAttribute("orderProducts", orderProducts);

	    return "administrator/detailOrder";
	}
	@RequestMapping(value = { "admin/doanhso" }, method = RequestMethod.GET)
	public String showRevenueChart(Model model) {
        List<Date> dates = saleOrderService.getDate();
        List<BigDecimal> revenues = saleOrderService.getRevenue();
        ObjectMapper mapper = new ObjectMapper();
        Date currentDate = new Date(); 
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
		String formattedDate = sdf.format(currentDate);
        BigDecimal totalRevenueByDay=saleOrderService.getTotalRevenueByDate(formattedDate);
        BigInteger totalOrderByDay = saleOrderService.getTotalOrderByDay(formattedDate);
        model.addAttribute("totalOrderByDay", totalOrderByDay);
        model.addAttribute("totalRevenueByDay", totalRevenueByDay);
        BigDecimal totalRevenue = saleOrderService.getTotalRevenue();
        model.addAttribute("totalRevenue", totalRevenue);
        BigInteger totalOrder = saleOrderService.getTotalOrder();
        model.addAttribute("totalOrder", totalOrder);
        try {
            String datesJson = mapper.writeValueAsString(dates);
            String revenuesJson = mapper.writeValueAsString(revenues);
            model.addAttribute("dates", datesJson);
            model.addAttribute("revenues", revenuesJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return "administrator/thongke";
    }
	
}
