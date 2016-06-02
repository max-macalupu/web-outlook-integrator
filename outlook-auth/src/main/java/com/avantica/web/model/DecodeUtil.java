package com.avantica.web.model;

import org.apache.commons.codec.binary.Base64;

import com.google.gson.Gson;

public class DecodeUtil {
	
    private static final Base64 base64Url = new Base64();


	public static BodyToken decodeToken(String token){
		String[] jwtTokenValues = token.split("\\.");
        String value = new String(base64Url.decode(jwtTokenValues[1].getBytes()));
        Gson gsonObject = new Gson();
		return gsonObject.fromJson(value,BodyToken.class);
	}
}