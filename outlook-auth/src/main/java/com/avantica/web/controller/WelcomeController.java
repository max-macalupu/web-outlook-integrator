package com.avantica.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.avantica.utils.QueryString;
import com.avantica.web.model.OutlookParameters;

@Controller
public class WelcomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		return "welcome";
	}
	
	@RequestMapping(value = "/autenticate")
	public String autenticate() {
		return "redirect";
	}
}