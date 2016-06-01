package com.avantica.utils;

import java.util.HashMap;
import java.util.Map;

import com.avantica.web.model.OutlookParameters;

public class QueryString {
	
	private Map<String,String> parameters;
	private String domain;
	
	private QueryString(){
		parameters = new HashMap<>();
	}
	
	private QueryString(String domain){
		this();
		this.domain = domain;
	}
	
	public static QueryString withDomain(String domain){
		return new QueryString(domain);
	}
	
	public QueryString andParameter(OutlookParameters outLookPameter){
		parameters.put(outLookPameter.getCodigo(), outLookPameter.getDescripcion());
		return this;
	}
	
	public String giveMeURL(){
		StringBuilder finalUrl = new StringBuilder();
		finalUrl.append(domain+"?");
		for(String key: parameters.keySet()){
			finalUrl.append(buildParameter(parameters.get(key),key));
		}
		return finalUrl.toString();
	}
	
	private String buildParameter(String code, String value){
		return code.concat("=").concat(value).concat("&");
	}
}