package com.lec.weddingrin.dto;

import java.sql.Date;

public class ReplyDto {

	private int wreno;
	private String wmemo;
	private String mid;
	private int wno;
	private Date wredate;
	
	public ReplyDto(int wreno, String wmemo, String mid, int wno, Date wredate) {
		this.wreno = wreno;
		this.wmemo = wmemo;
		this.mid = mid;
		this.wno = wno;
		this.wredate = wredate;
	}
	public int getWreno() {
		return wreno;
	}
	public void setWreno(int wreno) {
		this.wreno = wreno;
	}
	public String getWmemo() {
		return wmemo;
	}
	public void setWmemo(String wmemo) {
		this.wmemo = wmemo;
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
	public Date getWredate() {
		return wredate;
	}
	public void setWredate(Date wredate) {
		this.wredate = wredate;
	}
	@Override
	public String toString() {
		return "ReplyDto [wreno=" + wreno + ", wmemo=" + wmemo + ", mid=" + mid + ", wno=" + wno + ", wredate="
				+ wredate + "]";
	}
	
	
}
