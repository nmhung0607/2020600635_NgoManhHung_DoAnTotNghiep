package com.DoAn.NgoManhHung.controller.customer;

import java.io.File;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import com.DoAn.NgoManhHung.model.Role;
import com.DoAn.NgoManhHung.model.User;
import com.DoAn.NgoManhHung.services.RegisterService;
import com.DoAn.NgoManhHung.services.UserDetailsServiceImpl;


@Controller
public class RegisterController {
   @Autowired
   private RegisterService registerService;
  
   @RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public String registerGet(final Model model, 
			   				  final HttpServletRequest request, 
			   				  final HttpServletResponse response) {
	    model.addAttribute("user", new User());
		return "customer/register";
	}
   @RequestMapping(value = { "/register" }, method = RequestMethod.POST)
   public String registerSpringForm(final Model model, 
                                    final HttpServletRequest request,
                                    final HttpServletResponse response, 
                                    final @ModelAttribute("user") User user
                                 ) {
       try {
           BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(4);
           user.setPassword(passwordEncoder.encode(user.getPassword()));
           registerService.registerNewUser(user);
           registerService.saveOrUpdate(user);
           model.addAttribute("message", "Đăng kí thành công, xin mời bạn đăng nhập");
           model.addAttribute("user", new User());
           return "customer/register";
       } catch (Exception e) {
           model.addAttribute("errorMessage", "Tên đăng nhập đã tồn tại");
           return "customer/register";
       }
   }
    @Autowired
	private UserDetailsServiceImpl userDetailsService;
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
	}
   
}

