package pms.a01_mvc.a03_dao;

import java.util.ArrayList;
import java.util.List;

import pms.a02_vo.BoardSch;
import pms.a02_vo.FileInfo;
import pms.a02_vo.Meeting;

public interface MeetingDao {
	public List<Meeting> getMeetingList(BoardSch sch);
	 
	public int totCnt(BoardSch sch); 
	
	public void insertFileInfo(FileInfo ins);
	
	public ArrayList<String> getFileInfo(int fno);
	
	public void updateReadCnt(int meeting_list_num);
	
	public Meeting getMeeting(int meeting_list_num);
	
	public void uptMeeting(Meeting upt);
	
	public void delMeeting(int meeting_list_num);
	
	public void insertMeeting(Meeting ins);
}

