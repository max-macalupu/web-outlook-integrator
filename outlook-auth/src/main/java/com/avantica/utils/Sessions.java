package com.avantica.utils;

import java.util.HashMap;

import com.avantica.web.model.BodyToken;

public class Sessions extends HashMap<String, BodyToken>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Sessions sessions;
	
	private Sessions(){
		super();
	}
	
	private static Sessions getInstance(){
		if( sessions == null){
			sessions = new Sessions();
		}
		return sessions;
	}

	public synchronized static void nuevo(BodyToken info){
		getInstance().put(info.getOid(), info);
	}
	
	public static BodyToken getSession(String key){
		return getInstance().get(key);
	}
}