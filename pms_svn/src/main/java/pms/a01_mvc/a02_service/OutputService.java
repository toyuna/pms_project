package pms.a01_mvc.a02_service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import pms.a01_mvc.a03_dao.MeetingDao;
import pms.a01_mvc.a03_dao.OutputDao;
import pms.a02_vo.BoardSch;
import pms.a02_vo.FileInfo;
import pms.a02_vo.Meeting;
import pms.a02_vo.Output;


@Service
public class OutputService {
	@Autowired
	private OutputDao dao;
	
	
	
	public List<Output> getOutputList(BoardSch sch){
		// 1. 전체 갯수
		// 총 건수를 화면에 출력하려면 BoardSch에 설정. 모델 데이터로 활용할 수 있음
		sch.setCount(dao.totCnt(sch));
		// 2. 한번에 보일 페이지 수 초기값 설정(초기에는 0이기에 5개로 설정처리)
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		// 3. 총 페이지 수(전체 갯수, 한번에 보일 페이지 수)
		// 	ex) 15건수/5 => 3페이지
		//		16건수/5 => 4페이지
		double totPage1 = sch.getCount()/(double)sch.getPageSize();
		totPage1 = Math.ceil(totPage1); // 올림처리
		int totPage = (int)(totPage1);
		sch.setPageCount(totPage);
		// 4. 클릭한 현재 페이지 호출
		//	 현재 페이지 초기값 0=>1
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		// 5. 시작번호
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		// 6. 마지막번호
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		// 7 하단의 페이지 block 처리
				//	1) 기본 block의 크기 지정
				sch.setBlockSize(5);
				//	2) 현재 블럭 그룹 번호 : 현재 클릭한 페이지번호/블럭의 크기
				int curBlockGrpNo = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
				// 	3) 블럭 그룹의 시작 페이지 번호
				sch.setStartBlock((curBlockGrpNo-1)*sch.getBlockSize()+1);
				//  4) 블럭 그룹의 마지막 페이지 번호
				//     총페이지수 보다 크면 총 페이지수를 마지막 페이지 번호.
				int endBlockGrpNo = curBlockGrpNo*sch.getBlockSize();
				sch.setEndBlock(endBlockGrpNo>sch.getPageCount()?sch.getPageCount():endBlockGrpNo);
				return dao.getOutputList(sch);
	}
	
	
	@Value("${upload}")
	private String uploadPath;
	
	public String insertOutput(Output ins) {
		dao.insertOutput(ins);
		String msg = "등록성공";
		// 특정한 위치에 첨부파일 업로드.
		if(ins.getReport() != null && ins.getReport().length > 0) {
			try {
				for (MultipartFile mf : ins.getReport()) {
					String fname = mf.getOriginalFilename();
					if (fname != null && !fname.equals("")) {
						System.out.println("경로명:" + uploadPath);
						System.out.println("첨부파일명:" + fname);
						File file = new File(uploadPath + fname);
						mf.transferTo(file);
						// 첨부파일 정보 DB에 등록..
						dao.insertFileInfo(new FileInfo(uploadPath, fname, "게시물 제목:" + ins.getOutput_title()));
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

	
	public Output getOutput(int output_list_num) {
		// 상세화면 호출 시 조회수 증가
		dao.updateReadCnt(output_list_num);
		// notice안에 상세정보와 다운로드할 파일정보를 설정되게함.
		Output o = dao.getOutput(output_list_num);
		o.setFnames(dao.getFileInfo(output_list_num));
		return o;
	}
	
	
	public void delOutput(int output_list_num) {
		dao.delOutput(output_list_num);
	}
	
	
	
	public void uptOutput(Output upt) {
		dao.uptOutput(upt);
	}
	
	
	
	

}
