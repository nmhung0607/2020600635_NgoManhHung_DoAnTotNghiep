package com.DoAn.NgoManhHung.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.DoAn.NgoManhHung.model.Categories;
//import com.devpro.NgoManhHungFECuoiKhoa.model.SaleOrder;
//import com.devpro.NgoManhHungFECuoiKhoa.model.User;
//import com.devpro.NgoManhHungFECuoiKhoa.services.SaleOrderService;
import com.DoAn.NgoManhHung.services.categoriesService;

public abstract class Base_Controller {
     @Autowired
     private categoriesService CategoriesService;
     @Autowired
 //    private SaleOrderService saleOrderService;
     @ModelAttribute("categories")
     public List<Categories> getAllCategories(){
    	 return CategoriesService.findAll();
     }
//     @ModelAttribute("saleOrders")
//     public List<SaleOrder> getAllSaleOrder(){
//    	 return saleOrderService.findAll(); 
//     }
     public Integer getInteger(HttpServletRequest request, String paramName) {
 		try {
 			return Integer.parseInt(request.getParameter(paramName));
 		} catch (Exception e) {
 			return null;
 		}
 	}
// 	@ModelAttribute("isLogined")
// 	public boolean isLogined() {
// 		boolean isLogined=false;
// 		Object principal=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
// 		if(principal instanceof UserDetails) {
// 			isLogined=true;
// 		}
// 		return isLogined;
// 	}
// 	@ModelAttribute("userLogined")
// 	public User getUserLogined() {
// 		Object userLogined =SecurityContextHolder.getContext().getAuthentication().getPrincipal();
// 		if(userLogined!=null && userLogined instanceof UserDetails) {
// 			return (User) userLogined;
// 		}
// 		return new User();
// 	}
 	public Integer getCurrentPage(HttpServletRequest request) {
 		try {
 			return Integer.parseInt(request.getParameter("page"));
 		} catch (Exception e) {
 			return 1;
 		}
 	}
}
