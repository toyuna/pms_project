package pms.a01_mvc.a03_dao;

import java.util.ArrayList;
import java.util.List;

import pms.a02_vo.BoardSch;
import pms.a02_vo.FileInfo;
import pms.a02_vo.Notice;

public interface NoticeDao {
	public List<Notice> getNoticeList(BoardSch sch);
	 
	public int totCnt(BoardSch sch); 
	
	public void insertFileInfo(FileInfo ins);
	
	public ArrayList<String> getFileInfo(int fno);
	
	public void updateReadCnt(int notice_list_num);
	
	public Notice getNotice(int notice_list_num);
	
	public void uptNotice(Notice upt);
	
	public void delNotice(int notice_list_num);
	
	public void insertNotice(Notice ins);
}

