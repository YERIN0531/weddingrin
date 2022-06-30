package com.lec.weddingrin.dto;

import java.sql.Timestamp;

public class ReserveDto {

	private int rsno;
	private String mid;
	private int wno;
	private Timestamp wdate;
	
	public ReserveDto(){}

	public ReserveDto(int rsno, String mid, int wno, Timestamp wdate) {
		this.rsno = rsno;
		this.mid = mid;
		this.wno = wno;
		this.wdate = wdate;
	}

	public int getRsno() {
		return rsno;
	}

	public void setRsno(int rsno) {
		this.rsno = rsno;
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

	public Timestamp getWdate() {
		return wdate;
	}

	public void setWdate(Timestamp wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "ReserveDto [rsno=" + rsno + ", mid=" + mid + ", wno=" + wno + ", wdate=" + wdate + "]";
	}
	
	
	
}
