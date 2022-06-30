package com.lec.weddingrin.dto;

public class WeddingDto {

	private int wno;
	private String wname;
	private String waddress;
	private String wcontent;
	private int wprice;
	private String wimage;
	private String wloc;
	
	public WeddingDto(){}

	public WeddingDto(int wno, String wname, String waddress, String wcontent, int wprice, String wimage, String wloc) {
		this.wno = wno;
		this.wname = wname;
		this.waddress = waddress;
		this.wcontent = wcontent;
		this.wprice = wprice;
		this.wimage = wimage;
		this.wloc = wloc;
	}

	public int getWno() {
		return wno;
	}

	public void setWno(int wno) {
		this.wno = wno;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getWaddress() {
		return waddress;
	}

	public void setWaddress(String waddress) {
		this.waddress = waddress;
	}

	public String getWcontent() {
		return wcontent;
	}

	public void setWcontent(String wcontent) {
		this.wcontent = wcontent;
	}

	public int getWprice() {
		return wprice;
	}

	public void setWprice(int wprice) {
		this.wprice = wprice;
	}

	public String getWimage() {
		return wimage;
	}

	public void setWimage(String wimage) {
		this.wimage = wimage;
	}

	public String getWloc() {
		return wloc;
	}

	public void setWloc(String wloc) {
		this.wloc = wloc;
	}

	@Override
	public String toString() {
		return "WeddingDto [wno=" + wno + ", wname=" + wname + ", waddress=" + waddress + ", wcontent=" + wcontent
				+ ", wprice=" + wprice + ", wimage=" + wimage + ", wloc=" + wloc + "]";
	}
	
	
	
}
