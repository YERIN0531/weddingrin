package com.lec.weddingrin.dto;

import java.sql.Date;

public class QnaDto {

	private int qno;
	private String qid;
	private String qtitle;
	private String qcontent;
	private int qhit;
	private Date qdate;
	private int qgroup;
	private int qstep;
	private int qindent;
	private String qip;
	
	public QnaDto(){}

	public QnaDto(int qno, String qid, String qtitle, String qcontent, int qhit, Date qdate, int qgroup, int qstep,
			int qindent, String qip) {
		this.qno = qno;
		this.qid = qid;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qhit = qhit;
		this.qdate = qdate;
		this.qgroup = qgroup;
		this.qstep = qstep;
		this.qindent = qindent;
		this.qip = qip;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getQid() {
		return qid;
	}

	public void setQid(String qid) {
		this.qid = qid;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public int getQhit() {
		return qhit;
	}

	public void setQhit(int qhit) {
		this.qhit = qhit;
	}

	public Date getQdate() {
		return qdate;
	}

	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}

	public int getQgroup() {
		return qgroup;
	}

	public void setQgroup(int qgroup) {
		this.qgroup = qgroup;
	}

	public int getQstep() {
		return qstep;
	}

	public void setQstep(int qstep) {
		this.qstep = qstep;
	}

	public int getQindent() {
		return qindent;
	}

	public void setQindent(int qindent) {
		this.qindent = qindent;
	}

	public String getQip() {
		return qip;
	}

	public void setQip(String qip) {
		this.qip = qip;
	}

	@Override
	public String toString() {
		return "QnaDto [qno=" + qno + ", qid=" + qid + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qhit="
				+ qhit + ", qdate=" + qdate + ", qgroup=" + qgroup + ", qstep=" + qstep + ", qindent=" + qindent
				+ ", qip=" + qip + "]";
	}
	
	
	
}
