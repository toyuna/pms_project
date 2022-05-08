package pms.a01_mvc.a02_service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import pms.a01_mvc.a03_dao.MyjobDao;
import pms.a02_vo.BoardSch;
import pms.a02_vo.FileInfo;
import pms.a02_vo.Myjob;
import pms.a02_vo.Project;


@Service
public class MyjobService {
	
	@Autowired
	private MyjobDao dao;
	
	public List<Myjob> getMyjobList(BoardSch sch){
		sch.setCount(dao.totCnt(sch));
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		double totPage1 = sch.getCount()/(double)sch.getPageSize();
		totPage1 = Math.ceil(totPage1); 
		int totPage = (int)(totPage1);
		sch.setPageCount(totPage);
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
				sch.setBlockSize(5);
				int curBlockGrpNo = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
				sch.setStartBlock((curBlockGrpNo-1)*sch.getBlockSize()+1);
				int endBlockGrpNo = curBlockGrpNo*sch.getBlockSize();
				sch.setEndBlock(endBlockGrpNo>sch.getPageCount()?sch.getPageCount():endBlockGrpNo);
				return dao.getMyjobList(sch);
	}
	
	public List<Project> getProjectList(BoardSch sch){
		return dao.getProjectList(sch);
	}
	
	public List<Myjob> getMyjobList2(){
		return dao.getMyjobList2();
	}
	
	@Value("${upload}")
	private String uploadPath;
	
	public String insertMyjob(Myjob ins) {
		dao.insertMyjob(ins);
		String msg = "등록성공";

		if(ins.getReport() != null && ins.getReport().length > 0) {
			try {
				for (MultipartFile mf : ins.getReport()) {
					String fname = mf.getOriginalFilename();
					if (fname != null && !fname.equals("")) {
						System.out.println("경로명:" + uploadPath);
						System.out.println("첨부파일명:" + fname);
						File file = new File(uploadPath + fname);
						mf.transferTo(file);
						dao.insertFileInfo(new FileInfo(uploadPath, fname, "게시물 제목:" + ins.getMyjob_title()));
					}
				}
			} catch (IllegalStateException e) {
				msg = e.getMessage();
			} catch (IOException e) {				
				msg = "파일전송오류:" + e.getMessage();
			} catch(Exception e) {
				msg = "기타예외:" + e.getMessage();
			}			
		}
		return msg;
	}

	
	public Myjob getMyjob(int myjob_list_num) {
		dao.updateReadCnt(myjob_list_num);
		Myjob m = dao.getMyjob(myjob_list_num);
		m.setFnames(dao.getFileInfo(myjob_list_num));
		return m;
	}
	
	public void delMyjob(int myjob_list_num) {
		dao.delMyjob(myjob_list_num);
	}

	
	public void uptMyjob(Myjob upt) {
		dao.uptMyjob(upt);
	}
	
	
}
