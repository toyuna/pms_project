package pms.a02_vo;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Meeting {

	private int meeting_list_num; // no
	private int meeting_refno; //refno
	private String meeting_title; // title
	private String meeting_content; // content
	private String project_name; // pname
	private String dname; // dname
	private String writer; // writer
	private Date meeting_reg; // reg
	private Date meeting_upt; // upt
	private int readcnt; // cnt
	private int level;
	private int cnt;
	private MultipartFile[] report;
	private ArrayList<String> fnames;
	public int getMeeting_list_num() {
		return meeting_list_num;
	}
	public void setMeeting_list_num(int meeting_list_num) {
		this.meeting_list_num = meeting_list_num;
	}
	public int getMeeting_refno() {
		return meeting_refno;
	}
	public void setMeeting_refno(int meeting_refno) {
		this.meeting_refno = meeting_refno;
	}
	public String getMeeting_title() {
		return meeting_title;
	}
	public void setMeeting_title(String meeting_title) {
		this.meeting_title = meeting_title;
	}
	public String getMeeting_content() {
		return meeting_content;
	}
	public void setMeeting_content(String meeting_content) {
		this.meeting_content = meeting_content;
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
	public Date getMeeting_reg() {
		return meeting_reg;
	}
	public void setMeeting_reg(Date meeting_reg) {
		this.meeting_reg = meeting_reg;
	}
	public Date getMeeting_upt() {
		return meeting_upt;
	}
	public void setMeeting_upt(Date meeting_upt) {
		this.meeting_upt = meeting_upt;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
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
