package pms.a01_mvc.a03_dao;

import java.util.ArrayList;
import java.util.List;

import pms.a02_vo.BoardSch;
import pms.a02_vo.FileInfo;
import pms.a02_vo.Output;

public interface OutputDao {
	public List<Output> getOutputList(BoardSch sch);
	 
	public int totCnt(BoardSch sch); 
	
	public void insertFileInfo(FileInfo ins);
	
	public ArrayList<String> getFileInfo(int fno);
	
	public void updateReadCnt(int output_list_num);
	
	public Output getOutput(int output_list_num);
	
	public void uptOutput(Output upt);
	
	public void delOutput(int output_list_num);
	
	public void insertOutput(Output ins);
}

