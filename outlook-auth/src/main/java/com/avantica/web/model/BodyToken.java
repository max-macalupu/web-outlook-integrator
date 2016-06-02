package com.avantica.web.model;

import java.io.Serializable;

public class BodyToken implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String family_name;
	private String given_name;
	private String ipaddr;
	private String name;
	private String unique_name;
	private String upn;
	private String oid;
	public String getFamily_name() {
		return family_name;
	}
	public void setFamily_name(String family_name) {
		this.family_name = family_name;
	}
	public String getGiven_name() {
		return given_name;
	}
	public void setGiven_name(String given_name) {
		this.given_name = given_name;
	}
	public String getIpaddr() {
		return ipaddr;
	}
	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUnique_name() {
		return unique_name;
	}
	public void setUnique_name(String unique_name) {
		this.unique_name = unique_name;
	}
	public String getUpn() {
		return upn;
	}
	public void setUpn(String upn) {
		this.upn = upn;
	}
	public BodyToken() {
		super();
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
}
