//package com.devpro.NgoManhHungFECuoiKhoa.controller.customer;
//import java.io.IOException;
//import java.text.NumberFormat;
//import java.math.BigDecimal;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Locale;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.devpro.NgoManhHungFECuoiKhoa.controller.Base_Controller;
//import com.devpro.NgoManhHungFECuoiKhoa.dto.Cart;
//import com.devpro.NgoManhHungFECuoiKhoa.dto.CartItem;
//import com.devpro.NgoManhHungFECuoiKhoa.model.Products;
//import com.devpro.NgoManhHungFECuoiKhoa.model.SaleOrder;
//import com.devpro.NgoManhHungFECuoiKhoa.model.SaleOrderProducts;
//import com.devpro.NgoManhHungFECuoiKhoa.services.ProductService;
//import com.devpro.NgoManhHungFECuoiKhoa.services.SaleOrderService;
//
//
//
//@Controller
//public class CartController extends Base_Controller {
//
//	@Autowired
//	private ProductService productService;
//	@Autowired
//	private SaleOrderService saleOrderService;
//	
//	
//	
//	
//	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.GET)
//	public String cartCheckout(final Model model, 
//						   final HttpServletRequest request, 
//						   final HttpServletResponse response) throws IOException {
//		return "customer/cart"; // -> đường dẫn tới View.
//	}
//	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
//	public String cartFinished(final Model model, 
//						   final HttpServletRequest request, 
//						   final HttpServletResponse response) throws IOException {
//		
//		// Lấy thông tin khách hàng
//		String customerFullName = request.getParameter("customerFullName");
//		String customerEmail = request.getParameter("customerEmail");
//		String customerPhone = request.getParameter("customerPhone");
//		String customerAddress = request.getParameter("customerAddress");
//
//		// tạo hóa đơn + với thông tin khách hàng lấy được
//		SaleOrder saleOrder = new SaleOrder();
//		saleOrder.setCustomerName(customerFullName);
//		saleOrder.setCustomerEmail(customerEmail);
//		saleOrder.setCustomerAddress(customerAddress);
//		saleOrder.setCustomerPhone(customerPhone);	
//		saleOrder.setCode(String.valueOf(System.currentTimeMillis())); // mã hóa đơn
//		
//		// lấy giỏ hàng
//		HttpSession session = request.getSession();
//		Cart cart = (Cart) session.getAttribute("cart");
//		
//		// lấy sản phẩm trong giỏ hàng
//		for (CartItem cartItem : cart.getCartItems()) {
//			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
//			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
//			saleOrderProducts.setQuality(cartItem.getQuanlity());
//
//			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
//			saleOrder.addSaleOrderProducts(saleOrderProducts);
//		}
//		
//		// lưu vào database
//		saleOrderService.saveOrUpdate(saleOrder);
//		model.addAttribute("thongbao", "Cảm ơn bạn đã mua hàng");
//		// Xóa dữ liệu giỏ hàng trong secction
//		session.setAttribute("cart", null);
//		session.setAttribute("totalItems", 0);
//		return "customer/cart__success"; // -> đường dẫn tới View.
//		
//	}
//	/**
//	 * Thêm 1 sản phẩm vào trong giỏ hàng khi click nút "Add To Cart"
//	 */
//	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model,
//														      final HttpServletRequest request,
//														      final HttpServletResponse response, 
//														      final @RequestBody CartItem cartItem) {
//
//		// để lấy session sử dụng thông qua request
//		// session tương tự như kiểu Map và được lưu trên main memory.
//		HttpSession session = request.getSession();
//
//		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
//		Cart cart = null;
//		
//		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
//		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
//			cart = (Cart) session.getAttribute("cart");
//		} else {// chưa có giỏ hàng nào trên session
//			cart = new Cart(); //khởi tạo giỏ hàng mới
//			session.setAttribute("cart", cart);
//		}
//
//		// Lấy danh sách sản phẩm đang có trong giỏ hàng
//		List<CartItem> cartItems = cart.getCartItems();
//
//		// kiểm tra nếu sản phẩm muốn bổ sùng vào giỏ hàng có trong giỏ hàng nếu có thì tăng số lượng
//		boolean isExists = false;
//		for (CartItem item : cartItems) {
//			if (item.getProductId() == cartItem.getProductId()) {
//				isExists = true;
//				// tăng số lượng sản phẩm lên
//				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
//			}
//		}
//
//		// nếu sản phẩm chưa có trong giỏ hàng thì thực hiện add sản phẩm đó vào giỏ hàng
//		if (!isExists) {
//			// trước khi thêm mới thì lấy sản phẩm trong db
//			// và thiết lập tên + đơn giá cho cart item
//			Products productInDb = productService.getById(cartItem.getProductId());
//
//			cartItem.setProductName(productInDb.getTitle());
//			cartItem.setPriceUnit(productInDb.getPrice());
//
//			cart.getCartItems().add(cartItem); // thêm mới sản phẩm vào giỏ hàng
//		}
//
//		// tính tổng tiền
//		this.calculateTotalPrice(request);
//		
//		// trả về kết quả
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("code", 200);
//		jsonResult.put("status", "TC");
//		jsonResult.put("totalItems", getTotalItems(request));
//		session.setAttribute("totalItems", getTotalItems(request));
//		
//		return ResponseEntity.ok(jsonResult);
//	}
//	
//	/**
//	 * Tổng số lượng sản phẩm trong giỏ hàng
//	 */
//	private int getTotalItems(final HttpServletRequest request) {
//		HttpSession httpSession = request.getSession();
//
//		if (httpSession.getAttribute("cart") == null) {
//			return 0;
//		}
//
//		Cart cart = (Cart) httpSession.getAttribute("cart");
//		List<CartItem> cartItems = cart.getCartItems();
//
//		int total = 0;
//		for (CartItem item : cartItems) {
//			total += item.getQuanlity();
//		}
//
//		return total;
//	}
//	private int getQuanlity(final HttpServletRequest request) {
//		HttpSession httpSession = request.getSession();
//
//		if (httpSession.getAttribute("cart") == null) {
//			return 0;
//		}
//
//		Cart cart = (Cart) httpSession.getAttribute("cart");
//		List<CartItem> cartItems = cart.getCartItems();
//
//		int quanlity = 0;
//		for (CartItem item : cartItems) {
//			quanlity = item.getQuanlity()+1;
//		}
//		return quanlity;
//	}
//	
//	/**
//	 * Tính tổng tiền của giỏ hàng
//	 */
//	private BigDecimal calculateTotalPrice(final HttpServletRequest request) {
//
//		// để lấy session sử dụng thông qua request
//		// session tương tự như kiểu Map và được lưu trên main memory.
//		HttpSession session = request.getSession();
//
//		// Lấy thông tin giỏ hàng.
//		Cart cart = null;
//		if (session.getAttribute("cart") != null) {
//			cart = (Cart) session.getAttribute("cart");
//		} else {
//			cart = new Cart();
//			session.setAttribute("cart", cart);
//		}
//
//		// Lấy danh sách sản phẩm có trong giỏ hàng
//		List<CartItem> cartItems = cart.getCartItems();
//		BigDecimal total = BigDecimal.ZERO;
//		
//		for(CartItem ci : cartItems) {
//			total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity())));
//		}
//
//		cart.setTotalPrice(total);
//		
//		return total;
//	}
//	@RequestMapping(value = { "/cart-delete" }, method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> deleteItemInCart(final ModelMap model, final HttpServletRequest request,
//			final HttpServletResponse response, @RequestBody CartItem cartItem) {
//		HttpSession httpSession = request.getSession();
//
//		Cart cart = (Cart) httpSession.getAttribute("cart");
//
//		List<CartItem> cartItems = cart.getCartItems();
//		BigDecimal totalPrice = BigDecimal.ZERO;
//
//		for (int i = 0; i < cartItems.size(); i++) {
//			if (cartItems.get(i).getProductId() == cartItem.getProductId()) {
//				cartItems.remove(i);
//				break;
//			}
//		}
//		for (CartItem item : cartItems) {
//			totalPrice = totalPrice.add(item.getPriceUnit().multiply(BigDecimal.valueOf(item.getQuanlity())));
//		}
//		httpSession.setAttribute("totalItems", getTotalItems(request));
//		cart.setTotalPrice(totalPrice);
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("code", 200);
//		jsonResult.put("status", "TC");
//		jsonResult.put("totalItems", getTotalItems(request));
//		return ResponseEntity.ok(jsonResult);
//	}
//	@RequestMapping(value = { "/ajax/updateQuanlityCart" }, method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> ajax_UpdateQuanlityCart(final Model model, 
//																	   final HttpServletRequest request,
//																	   final HttpServletResponse response, 
//																	   final @RequestBody CartItem cartItem) {
//
//		// để lấy session sử dụng thông qua request
//		// session tương tự như kiểu Map và được lưu trên main memory.
//		HttpSession session = request.getSession();
//
//		// Lấy thông tin giỏ hàng.
//		Cart cart = null;
//		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
//		if (session.getAttribute("cart") != null) {
//			cart = (Cart) session.getAttribute("cart");
//		} else {
//			cart = new Cart();
//			session.setAttribute("cart", cart);
//		}
//
//		// Lấy danh sách sản phẩm có trong giỏ hàng
//		List<CartItem> cartItems = cart.getCartItems();
//
//		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
//		int currentProductQuality = 0;
//		for (CartItem item : cartItems) {
//			if (item.getProductId() == cartItem.getProductId()) {
//				currentProductQuality = item.getQuanlity() + cartItem.getQuanlity();
//				item.setQuanlity(currentProductQuality);				
//			}
//		}
//
//		// tính tổng tiền
//		this.calculateTotalPrice(request);
//		
//		// trả về kết quả
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("code", 200);
//		jsonResult.put("status", "TC");
//		jsonResult.put("totalItems", getTotalItems(request));
//		jsonResult.put("currentProductQuality", currentProductQuality);
//		jsonResult.put("totalPrice", formatCurrency(calculateTotalPrice(request)));
//
//		session.setAttribute("totalItems", getTotalItems(request));
//		return ResponseEntity.ok(jsonResult);
//	}
//	private String formatCurrency(BigDecimal value) {
//		Locale loc = new Locale("vi", "VN");
//	    NumberFormat nf = NumberFormat.getCurrencyInstance(loc);
//	    return nf.format(value);
//	}
//}
