package pms.a01_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a01_mvc.a02_service.MyjobService;
import pms.a01_mvc.a02_service.ProjectService;
import pms.a02_vo.BoardSch;
import pms.a02_vo.Myjob;



@Controller
@RequestMapping("/myjob.do")
public class MyjobController {
	@Autowired
	private MyjobService service;
	
	@Autowired
	private ProjectService service2;
	// 내업무보기 페이지 호출
	// 
	
	
	@RequestMapping(params="method=list")
	public String myjob(BoardSch sch, Model d) {
		d.addAttribute("myjoblist", service.getMyjobList(sch));		
		return "WEB-INF\\views\\a03_myJob.jsp";
	}
	
	@RequestMapping(params="method=insertFrm")
	public String myjobInsertFrm(Myjob myjob,Model d) { 
		d.addAttribute("projectList2", service2.getProjectList2());	
		return "WEB-INF\\views\\a26_myjobwrite.jsp";
	}
	
	// 등록 처리 후 화면 호출
	@RequestMapping(params="method=insert")
	public String insertMyjob(Myjob ins, Model d) {
		d.addAttribute("msg", service.insertMyjob(ins));
		return "WEB-INF\\views\\a26_myjobwrite.jsp";
	}
	
	
	@RequestMapping(params="method=detail")
	public String myjobDetail(int myjob_list_num, Model d) {		
		d.addAttribute("myjob", service.getMyjob(myjob_list_num));
		return "WEB-INF\\views\\a26_myJobDetail.jsp";
	}
	
	@RequestMapping(params="method=del")
	public String delMyjob(int myjob_list_num, Model d){
		service.delMyjob(myjob_list_num);
		d.addAttribute("msg", "삭제되었습니다");
		return "redirect:/myjob.do?method=list";
	}
	
	
	@RequestMapping(params="method=upt")
	public String uptMyjob(Myjob upt, Model d) {
		service.uptMyjob(upt);
		d.addAttribute("msg", "수정되었습니다");		
		return "forward:/myjob.do?method=detail";
	}
	
	
}
