package com.avantica.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.avantica.utils.QueryString;
import com.avantica.web.model.OutlookParameters;

@Controller
public class RedirectAuth{

	@RequestMapping(value = "/redirectAuth", method = RequestMethod.GET)
	public @ResponseBody String printWelcome(HttpServletRequest request,
			HttpServletResponse response) {
		String completeURL =  QueryString.withDomain(OutlookParameters.TOKEN_LOGIN.getCodigo())
										 .andParameter(OutlookParameters.CLIEND_ID)
										 .andParameter(OutlookParameters.REDIRECT)
										 .andParameter(OutlookParameters.AUTHORIZ)
										 .andParameter(OutlookParameters.SCOPE)
										 .andParameter(OutlookParameters.RESPONSE_TYPE_TOKEN)
										 .giveMeURL();
	     return completeURL;
	}

}
