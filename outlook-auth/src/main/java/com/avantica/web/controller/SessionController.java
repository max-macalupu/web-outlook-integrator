package com.avantica.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.avantica.utils.Sessions;
import com.avantica.web.model.BodyToken;
import com.avantica.web.model.DecodeUtil;

@Controller
public class SessionController {

	@RequestMapping(value = "/saveSession", method = RequestMethod.GET)
	public @ResponseBody
	BodyToken getUrlVideo(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="idToken", required = false) String token) throws Exception {
		BodyToken bodyToken = DecodeUtil.decodeToken(token);
		Sessions.nuevo(bodyToken);
		return bodyToken;
	}
	
	@RequestMapping(value = "/getSessionInfo", method = RequestMethod.GET)
	public @ResponseBody
	BodyToken getSession(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="oid", required = false) String oid) throws Exception {
		return Sessions.getSession(oid);
	}
	
}