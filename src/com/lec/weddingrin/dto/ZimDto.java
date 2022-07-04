package com.lec.weddingrin.dto;

import java.sql.Date;

public class ZimDto {

	private int zno;
	private String mid;
	private int wno;
	private Date zdate;
	private String wname;
	private String waddress;
	private String wloc;
	
	public ZimDto() {}

	public ZimDto(int zno, String mid, int wno, Date zdate) {
		this.zno = zno;
		this.mid = mid;
		this.wno = wno;
		this.zdate = zdate;
	}
	
	

	public ZimDto(int zno, String mid, int wno, Date zdate, String wname, String waddress, String wloc) {
		this.zno = zno;
		this.mid = mid;
		this.wno = wno;
		this.zdate = zdate;
		this.wname = wname;
		this.waddress = waddress;
		this.wloc = wloc;
	}

	public int getZno() {
		return zno;
	}

	public void setZno(int zno) {
		this.zno = zno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getWno() {
		return wno;
	}

	public void setWno(int wno) {
		this.wno = wno;
	}

	public Date getZdate() {
		return zdate;
	}

	public void setZdate(Date zdate) {
		this.zdate = zdate;
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

	public String getWloc() {
		return wloc;
	}

	public void setWloc(String wloc) {
		this.wloc = wloc;
	}

	@Override
	public String toString() {
		return "ZimDto [zno=" + zno + ", mid=" + mid + ", wno=" + wno + ", zdate=" + zdate + ", wname=" + wname
				+ ", waddress=" + waddress + ", wloc=" + wloc + "]";
	}

	
	
	
}
