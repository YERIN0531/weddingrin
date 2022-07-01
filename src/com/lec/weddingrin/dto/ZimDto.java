package com.lec.weddingrin.dto;

import java.sql.Date;

public class ZimDto {

	private int zno;
	private String mid;
	private int wno;
	private Date zdate;
	
	public ZimDto() {}

	public ZimDto(int zno, String mid, int wno, Date zdate) {
		this.zno = zno;
		this.mid = mid;
		this.wno = wno;
		this.zdate = zdate;
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

	@Override
	public String toString() {
		return "ZimDto [zno=" + zno + ", mid=" + mid + ", wno=" + wno + ", zdate=" + zdate + "]";
	}
	
	
}
