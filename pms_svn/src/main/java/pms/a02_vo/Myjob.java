package pms.a02_vo;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Myjob {
	/*
	 * CREATE TABLE myjob(
   myjob_list_num int,
   myjob_refno int,
   myjob_title varchar2(30),
   writer varchar2(30), -- 작성자 즉 pm 이다
   dname varchar2(30), -- 부서는 담당자 부서를 입력
   myjob_content varchar2(50),
   project_name varchar2(30),
   mname varchar2(30), -- 담당자 
   myjob_reg DATE,
   myjob_upt DATE,
   readcnt number
);
	 */
	private int cnt;
	private int level;
	private int myjob_list_num; // no
	private int myjob_refno; //refno
	private String myjob_title; //title
	private String myjob_content;
	private String project_name;
	private String dname;
	private String writer;
	private String mname;
	private Date myjob_reg;
	private Date myjob_upt;
	private MultipartFile[] report;
	private ArrayList<String> fnames;
	
	
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getMyjob_list_num() {
		return myjob_list_num;
	}
	public void setMyjob_list_num(int myjob_list_num) {
		this.myjob_list_num = myjob_list_num;
	}
	public int getMyjob_refno() {
		return myjob_refno;
	}
	public void setMyjob_refno(int myjob_refno) {
		this.myjob_refno = myjob_refno;
	}
	public String getMyjob_title() {
		return myjob_title;
	}
	public void setMyjob_title(String myjob_title) {
		this.myjob_title = myjob_title;
	}
	public String getMyjob_content() {
		return myjob_content;
	}
	public void setMyjob_content(String myjob_content) {
		this.myjob_content = myjob_content;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public Date getMyjob_reg() {
		return myjob_reg;
	}
	public void setMyjob_reg(Date myjob_reg) {
		this.myjob_reg = myjob_reg;
	}
	public Date getMyjob_upt() {
		return myjob_upt;
	}
	public void setMyjob_upt(Date myjob_upt) {
		this.myjob_upt = myjob_upt;
	}
	public MultipartFile[] getReport() {
		return report;
	}
	public void setReport(MultipartFile[] report) {
		this.report = report;
	}
	public ArrayList<String> getFnames() {
		return fnames;
	}
	public void setFnames(ArrayList<String> fnames) {
		this.fnames = fnames;
	}
	
	
	
	
	
}
