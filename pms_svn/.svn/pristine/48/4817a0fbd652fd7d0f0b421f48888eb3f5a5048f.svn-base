package pms.a01_mvc.a03_dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import pms.a02_vo.BoardSch;
import pms.a02_vo.FileInfo;
import pms.a02_vo.Myjob;
import pms.a02_vo.Project;

@Repository
public interface MyjobDao {

	public List<Myjob> getMyjobList(BoardSch sch);
	
	public int totCnt(BoardSch sch);
	
	public void insertFileInfo(FileInfo ins);
	
	public void insertMyjob(Myjob ins);
	
	public ArrayList<String> getFileInfo(int fno);

	public void updateReadCnt(int myjob_list_num);
	
	public Myjob getMyjob(int myjob_list_num);
	
	public void uptMyjob(Myjob upt);
	
	public void delMyjob(int myjob_list_num);
	
	public List<Project> getProjectList(BoardSch sch);
	
	public List<Myjob> getMyjobList2();
}
