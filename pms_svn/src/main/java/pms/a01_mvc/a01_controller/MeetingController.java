package pms.a01_mvc.a01_controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a01_mvc.a02_service.MeetingService;
import pms.a01_mvc.a02_service.ProjectService;
import pms.a02_vo.BoardSch;
import pms.a02_vo.Meeting;



@RequestMapping("/meeting.do")
@Controller
public class MeetingController {
	
	@Autowired
	private MeetingService service;
	
	@Autowired
	private ProjectService service2;
	// http://localhost:5080/pms/meeting.do?method=list
	@RequestMapping(params="method=list")
	public String meeting(BoardSch sch, Model d) {
		System.out.println("####검색####"+sch.getSch());
		System.out.println("##검색##"+sch.getSkind());
		d.addAttribute("meetingList", service.getMeetingList(sch));
		return "WEB-INF\\views\\a04_meeting.jsp";
	}
	
	@RequestMapping(params="method=insertFrm")
	public String meetingInsertFrm(Meeting meeting, Model d) { 
		d.addAttribute("projectList2", service2.getProjectList2());	
		return "WEB-INF\\views\\a07_meeting_write.jsp";
	}
	
	// 등록 처리 후 화면 호출
	@RequestMapping(params="method=insert")
	public String insertMeeting(Meeting ins, Model d) {
		d.addAttribute("msg", service.insertMeeting(ins));
		return "WEB-INF\\views\\a07_meeting_write.jsp";
	}
	
	
	@RequestMapping(params="method=detail")
	public String meetingDetail(int meeting_list_num, Model d) {		
		d.addAttribute("meeting", service.getMeeting(meeting_list_num));
		return "WEB-INF\\views\\a10_meeting_detail.jsp";
	}
	

	@RequestMapping(params="method=del")
	public String delMeeting(int meeting_list_num, Model d){
		service.delMeeting(meeting_list_num);
		d.addAttribute("msg", "삭제되었습니다");
		return "redirect:/meeting.do?method=list";
	}
	
	
	@RequestMapping(params="method=upt")
	public String uptMeeting(Meeting upt, Model d) {
		service.uptMeeting(upt);
		d.addAttribute("msg", "수정되었습니다");		
		return "forward:/meeting.do?method=detail";
	}
	
	

	
}
