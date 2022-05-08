package pms.a01_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a01_mvc.a02_service.ProjectService;
import pms.a02_vo.BoardSch;
import pms.a02_vo.Project;

@Controller
@RequestMapping("/project.do")
public class ProjectController {
	@Autowired
	private ProjectService service;
	
	@RequestMapping(params="method=list")
	public String project(BoardSch sch, Model d) {
		d.addAttribute("projectList", service.getProjectList(sch));	
		System.out.println("데이터 건들였음");
		return "WEB-INF\\views\\a13_pj_list.jsp";
	}
	
	@RequestMapping(params="method=insertFrm")
	public String projectInsertFrm(Project project) { 
		return "WEB-INF\\views\\a14_pj_write.jsp";
	}
	
	// 등록 처리 후 화면 호출
	@RequestMapping(params="method=insert")
	public String insertProject(Project ins, Model d) {
		d.addAttribute("msg", service.insertProject(ins));
		return "WEB-INF\\views\\a14_pj_write.jsp";
	}
	
	
	@RequestMapping(params="method=detail")
	public String projectDetail(int project_list_num, Model d) {		
		d.addAttribute("project", service.getProject(project_list_num));
		return "WEB-INF\\views\\a15_pj_detail.jsp";
	}
	
	@RequestMapping(params="method=del")
	public String delProject(int project_list_num, Model d){
		service.delProject(project_list_num);
		d.addAttribute("msg", "삭제되었습니다");
		return "redirect:/project.do?method=list";
	}
	
	
	@RequestMapping(params="method=upt")
	public String uptProject(Project upt, Model d) {
		service.uptProject(upt);
		d.addAttribute("msg", "수정되었습니다");		
		return "forward:/project.do?method=detail";
	}
	
	
	
}
