package pms.a01_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.a01_mvc.a02_service.GanttService;
import pms.a01_mvc.a02_service.ProjectService;
import pms.a02_vo.Gantt;
import pms.a02_vo.Link;

@Controller
public class GanttController {
	
	@Autowired
	private GanttService service;
	
	@Autowired
	private ProjectService service2;
	// http://localhost:5080/pms/gantt.do
	// http://localhost:5080/pms/gantt.do
	// http://localhost:3081/pms/gantt.do
	@GetMapping("/gantt.do")
	public String gantt(Model d) {
		d.addAttribute("projectList2", service2.getProjectList2());	
		return "\\WEB-INF\\views\\a21_gantt.jsp";
	}
	
	// http://localhost:5080/pms/ganttList.do
	// http://localhost:3081/pms/ganttList.do
	@RequestMapping("ganttList.do")
	public String ganttList(@RequestParam("project_num") int project_num, Model d) {
		d.addAttribute("ganttList",service.getGantt(project_num));
		return "pageJsonReport";
	}
	@RequestMapping("insertGantt.do")
	public String insertGantt(Gantt insert, Model d) {

		service.insertGantt(insert);
		
		d.addAttribute("msg","등록성공");
		System.out.println("등록:"+insert.getText());
		return "pageJsonReport";
	
	}
	@RequestMapping("updateGantt.do")
	public String updateGantt(Gantt update, Model d) {
		service.updateGantt(update);
		d.addAttribute("msg","수정성공");
		return "pageJsonReport";
	}
	@RequestMapping("deleteGantt.do")
	public String deleteGantt(Gantt delete, Model d) {
		service.deleteGantt(delete);
		d.addAttribute("msg","삭제성공");
		return "pageJsonReport";
	}
	@RequestMapping("insertLink.do")
	public String insertLink(Link insert, Model d) {
		service.insertLink(insert);
		System.out.println("####################타입:"+insert.getType());
		d.addAttribute("msg","등록성공");
		return "pageJsonReport";
	}
	@RequestMapping("updateLink.do")	
	public String updateLink(Link update, Model d) {
		service.updateLink(update);
		d.addAttribute("msg","수정성공");
		return "pageJsonReport";
	}
	@RequestMapping("deleteLink.do")
	public String deleteLink(Link del, Model d) {
		service.deleteLink(del);
		d.addAttribute("msg","삭제성공");
		return "pageJsonReport";
	}	
	/*
	@RequestMapping("jsonexp01.do")
	public String jsonexp01(Model d) {
		//1 단계 객체/배열
		//d.addAttribute("arry",new String[]["사과","바나나","딸기"]);
		//d.addAttribute("msg","삭제성공");
		// 2.단계 service/dao
		
		return "pageJsonReport";
	}	
	*/
	/*
	$.ajax({
		url:"${path}/jsonexp01.do}",
		success:function(data){
			console.log(data.array);
			// chart..
			 * 
			
		}
	});
	
	[4000,3000,2000]
	
	 * */
	
}
