package com.DoAn.NgoManhHung.controller.customer;

import java.util.HashMap;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.DoAn.NgoManhHung.model.Contact;

public class SubcriberController {
	@RequestMapping(value = { "/ajax/subcriber" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_subcriber(final Model model,
			                                                final HttpServletRequest request,
			                                                final HttpServletResponse response,
			                                                final @RequestBody Contact contact)	{
		
	 System.out.println(contact.getEmail());
	 Map<String, Object> jsonResult= new HashMap<String, Object>();
	 jsonResult.put("statusCode",200);
	 jsonResult.put("statusMessage","Thanks " +contact.getEmail()+",for your subscription!");
	 return ResponseEntity.ok(jsonResult);
	}
}

