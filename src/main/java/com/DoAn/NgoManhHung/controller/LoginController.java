package com.DoAn.NgoManhHung.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController extends Base_Controller {
    @RequestMapping(value= {"/login"}, method = RequestMethod.GET)
    public String home(final Model model,
    		            final HttpServletRequest request,
    		            final HttpServletResponse response)
           throws IOException{
    	
    	return "customer/login";
    }
}
