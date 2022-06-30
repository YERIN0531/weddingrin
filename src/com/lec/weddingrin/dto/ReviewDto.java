package com.lec.weddingrin.dto;

import java.sql.Date;

public class ReviewDto {

	private int rno;
	private String mid;
	private String rtitle;
	private String rcontent;
	private String rfilename;
	private int rhit;
	private Date rdate;
	private String rip;
	
	public ReviewDto(){}

	public ReviewDto(int rno, String mid, String rtitle, String rcontent, String rfilename, int rhit, Date rdate,
			String rip) {
		this.rno = rno;
		this.mid = mid;
		this.rtitle = rtitle;
		this.rcontent = rcontent;
		this.rfilename = rfilename;
		this.rhit = rhit;
		this.rdate = rdate;
		this.rip = rip;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getRtitle() {
		return rtitle;
	}

	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRfilename() {
		return rfilename;
	}

	public void setRfilename(String rfilename) {
		this.rfilename = rfilename;
	}

	public int getRhit() {
		return rhit;
	}

	public void setRhit(int rhit) {
		this.rhit = rhit;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getRip() {
		return rip;
	}

	public void setRip(String rip) {
		this.rip = rip;
	}

	@Override
	public String toString() {
		return "ReviewDto [rno=" + rno + ", mid=" + mid + ", rtitle=" + rtitle + ", rcontent=" + rcontent
				+ ", rfilename=" + rfilename + ", rhit=" + rhit + ", rdate=" + rdate + ", rip=" + rip + "]";
	}
	
	
}
