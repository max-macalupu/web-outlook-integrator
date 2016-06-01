package com.avantica.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.avantica.utils.QueryString;
import com.avantica.web.model.OutlookParameters;

@Controller
public class RedirectAuth{

	/**
	 * 
	 */
	
	@RequestMapping(value = "/redirectAuth", method = RequestMethod.GET)
	public String printWelcome() {
		String completeURL =  QueryString.withDomain(OutlookParameters.TOKEN_LOGIN.getCodigo())
										 .andParameter(OutlookParameters.CLIEND_ID)
										 .andParameter(OutlookParameters.REDIRECT)
										 .andParameter(OutlookParameters.AUTHORIZ)
										 .andParameter(OutlookParameters.SCOPE)
										 .andParameter(OutlookParameters.RESPONSE_TYPE_TOKEN)
										 .giveMeURL();
	     return "redirect:" + completeURL;
	}

}
