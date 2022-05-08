package pms.a01_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.a01_mvc.a02_service.FullCalService;
import pms.a02_vo.Calendar;

@Controller
public class FullCalController {

	@Autowired
	private FullCalService service;
	
	// 풀캘린더 초기화면
	// http://localhost:5080/pms/calendar.do
	@GetMapping("calendar.do")
	public String calendar() {
		return "WEB-INF\\views\\a17_calender.jsp";
	}
	// http://localhost:5080/pms/calList.do
	@RequestMapping("calList.do")
	public String calList(Model d) {
		d.addAttribute("calList",service.getCalendarList());
		return "pageJsonReport";
	}
	
	@RequestMapping("insertCalendar")
	public String insertCalendar(Calendar ins){
		service.insertCalendar(ins);
		return "redirect:/calendar.do";
	}
	@RequestMapping("updateCalendar")
	public String updateCalendar(Calendar ins){
		System.out.println("수정 id:"+ins.getId());
		service.updateCalendar(ins);
		return "redirect:/calendar.do";
	}
	@RequestMapping("deleteCalendar")
	public String deleteCalendar(@RequestParam("id") int id){
		System.out.println("삭제 id:"+id);
		service.deleteCalendar(id);
		return "redirect:/calendar.do";
	}	
	
	
	
	
	
}
