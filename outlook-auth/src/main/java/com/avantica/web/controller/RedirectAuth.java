package com.avantica.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RedirectAuth{

	/**
	 * 
	 */
	
	@RequestMapping(value = "/redirectAuth", method = RequestMethod.GET)
	public String printWelcome(HttpServletRequest request,
			HttpServletResponse response) {
		String redirectUrl = "http://www.google.com";
	     return "redirect:" + redirectUrl;
	}

}
