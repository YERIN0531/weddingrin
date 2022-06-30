package com.lec.weddingrin.dto;

public class AdminDto {

	private String aid;
	private String apw;
	private String acode;
	
	public AdminDto(){}

	public AdminDto(String aid, String apw, String acode) {
		this.aid = aid;
		this.apw = apw;
		this.acode = acode;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getApw() {
		return apw;
	}

	public void setApw(String apw) {
		this.apw = apw;
	}

	public String getAcode() {
		return acode;
	}

	public void setAcode(String acode) {
		this.acode = acode;
	}

	@Override
	public String toString() {
		return "AdminDto [aid=" + aid + ", apw=" + apw + ", acode=" + acode + "]";
	}
	
	
}
