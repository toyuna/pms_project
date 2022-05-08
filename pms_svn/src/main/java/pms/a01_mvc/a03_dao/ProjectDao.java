package pms.a01_mvc.a03_dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import pms.a02_vo.BoardSch;
import pms.a02_vo.FileInfo;
import pms.a02_vo.Meeting;
import pms.a02_vo.Project;

@Repository
public interface ProjectDao {
	
	
	public List<Project> getProjectList(BoardSch sch);
	
	public int totCnt(BoardSch sch);
	
	public void insertFileInfo(FileInfo ins);
	
	public ArrayList<String> getFileInfo(int fno);
	
	public void updateReadCnt(int project_list_num);
	
	public Project getProject(int project_list_num);
	
	public void uptProject(Project upt);
	
	public void delProject(int project_list_num);
	
	public void insertProject(Project ins);
	
	public ArrayList<Project> getProjectList2();
	 
}
