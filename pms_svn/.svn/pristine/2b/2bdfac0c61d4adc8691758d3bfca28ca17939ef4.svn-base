package pms.a01_mvc.a01_controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a01_mvc.a02_service.MeetingService;
import pms.a01_mvc.a02_service.OutputService;
import pms.a01_mvc.a02_service.ProjectService;
import pms.a02_vo.BoardSch;
import pms.a02_vo.Meeting;
import pms.a02_vo.Output;



@RequestMapping("/output.do")
@Controller
public class OutputController {
	
	@Autowired
	private OutputService service;
	
	@Autowired
	private ProjectService service2;
	// http://localhost:5080/pms/output.do?method=list
	@RequestMapping(params="method=list")
	public String output(BoardSch sch, Model d) {
		d.addAttribute("outputList", service.getOutputList(sch));
		return "WEB-INF\\views\\a06_output.jsp";
	}
	
	@RequestMapping(params="method=insertFrm")
	public String outputInsertFrm(Output output, Model d) { 
		d.addAttribute("projectList2", service2.getProjectList2());
		return "WEB-INF\\views\\a09_output_write.jsp";
	}
	
	// 등록 처리 후 화면 호출
	@RequestMapping(params="method=insert")
	public String insertOutput(Output ins, Model d) {
		d.addAttribute("msg", service.insertOutput(ins));
		return "WEB-INF\\views\\a09_output_write.jsp";
	}
	
	
	@RequestMapping(params="method=detail")
	public String outputDetail(int output_list_num, Model d) {		
		d.addAttribute("output", service.getOutput(output_list_num));
		return "WEB-INF\\views\\a10_output_detail.jsp";
	}
	

	@RequestMapping(params="method=del")
	public String delOutput(int output_list_num, Model d){
		service.delOutput(output_list_num);
		d.addAttribute("msg", "삭제되었습니다");
		return "redirect:/output.do?method=list";
	}
	
	
	@RequestMapping(params="method=upt")
	public String uptOutput(Output upt, Model d) {
		service.uptOutput(upt);
		d.addAttribute("msg", "수정되었습니다");		
		return "forward:/output.do?method=detail";
	}
	
	

	
}
