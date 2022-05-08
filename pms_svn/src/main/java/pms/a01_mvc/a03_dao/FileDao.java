package pms.a01_mvc.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.a02_vo.FileInfo;

@Repository
public interface FileDao {
	public ArrayList<FileInfo> getFileList(int fno);
	public void insertFileInfo(FileInfo ins);
	
}
