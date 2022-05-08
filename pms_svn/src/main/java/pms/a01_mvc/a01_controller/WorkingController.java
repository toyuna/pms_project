package pms.a01_mvc.a01_controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a01_mvc.a02_service.MeetingService;
import pms.a01_mvc.a02_service.ProjectService;
import pms.a01_mvc.a02_service.WorkingService;
import pms.a02_vo.BoardSch;
import pms.a02_vo.Meeting;
import pms.a02_vo.Working;



@RequestMapping("/working.do")
@Controller
public class WorkingController {
	
	@Autowired
	private WorkingService service;
	
	@Autowired
	private ProjectService service2;
	// http://localhost:5080/pms/working.do?method=list
	@RequestMapping(params="method=list")
	public String working(BoardSch sch, Model d) {
		d.addAttribute("workingList", service.getWorkingList(sch));
		return "WEB-INF\\views\\a05_working.jsp";
	}
	
	@RequestMapping(params="method=insertFrm")
	public String workingInsertFrm(Working working, Model d) { 
		d.addAttribute("projectList2", service2.getProjectList2());
		return "WEB-INF\\views\\a08_working_write.jsp";
	}
	
	// 등록 처리 후 화면 호출
	@RequestMapping(params="method=insert")
	public String insertWorking(Working ins, Model d) {
		d.addAttribute("msg", service.insertWorking(ins));
		return "WEB-INF\\views\\a08_working_write.jsp";
	}
	
	
	@RequestMapping(params="method=detail")
	public String workingDetail(int working_list_num, Model d) {		
		d.addAttribute("working", service.getWorking(working_list_num));
		return "WEB-INF\\views\\a10_working_detail.jsp";
	}
	

	@RequestMapping(params="method=del")
	public String delWorking(int working_list_num, Model d){
		service.delWorking(working_list_num);
		d.addAttribute("msg", "삭제되었습니다");
		return "redirect:/working.do?method=list";
	}
	
	
	@RequestMapping(params="method=upt")
	public String uptWorking(Working upt, Model d) {
		service.uptWorking(upt);
		d.addAttribute("msg", "수정되었습니다");		
		return "forward:/working.do?method=detail";
	}
	
	

	
}
