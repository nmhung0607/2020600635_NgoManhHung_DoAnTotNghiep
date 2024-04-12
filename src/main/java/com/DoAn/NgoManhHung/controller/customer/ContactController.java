package com.DoAn.NgoManhHung.controller.customer;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.DoAn.NgoManhHung.model.Categories;
import com.DoAn.NgoManhHung.model.Contact;
import com.DoAn.NgoManhHung.model.Products;
import com.DoAn.NgoManhHung.controller.Base_Controller;
import com.DoAn.NgoManhHung.services.ContactService;
import com.DoAn.NgoManhHung.services.categoriesService;

@Controller
public class ContactController extends Base_Controller {

	// Sử dụng @Autowired để Inject(Tiêm) một Bean vào trong Bean khác.	
	@Autowired
	private ContactService contactService;
	@Autowired
	private categoriesService CategoriesService;
	
	@RequestMapping(value = { "/contact-us" }, method = RequestMethod.GET)
	public String contactUs(final Model model, 
			   				  final HttpServletRequest request, 
			   				  final HttpServletResponse response) {
		
		// lấy contact với id = 7 và hiển thị lên.
//		Contact contact = contactService.getEntityByNativeSQL("select * from tbl_contact where id = 7");
		
		model.addAttribute("contact", new Contact());
		return "customer/contact";
	}
	/**
	 * cách 1: cách đơn giản
	 * Khi 2 Requests trùng nhau nhưng khác Method thì vẫn OK.
	 */

	
	/**
	 * cách 2: sử dụng spring-form
	 */
	@RequestMapping(value = { "/contact-us" }, method = RequestMethod.POST)
	public String post_spring_form(final Model model, 
								   final HttpServletRequest request,
							   	   final HttpServletResponse response, 
							   	   final @ModelAttribute("contact") Contact contact,
							   	   final @RequestParam("attachment") MultipartFile attachmentFile) throws IOException {
		contactService.saveOrUpdate(contact);
		if(!attachmentFile.isEmpty()) {
			attachmentFile.transferTo(new File("C:/upload/" + attachmentFile.getOriginalFilename()));
		}
		model.addAttribute("message", "Thanks for your support");
		model.addAttribute("contact", new Contact());
		return "customer/contact";
	}
	
	/**
	 * cách 3: sử dụng ajax
	 */
}
