package pms.a01_mvc.a01_controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a01_mvc.a02_service.NoticeService;
import pms.a01_mvc.a02_service.ProjectService;
import pms.a02_vo.BoardSch;
import pms.a02_vo.Notice;


@RequestMapping("/notice.do")
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@Autowired
	private ProjectService service2;
	// http://localhost:5080/pms/notice.do?method=list
	// http://localhost:5080/pms/notice.do?method=list
	@RequestMapping(params="method=list")
	public String notice(BoardSch sch, Model d) {
		d.addAttribute("noticeList", service.getNoticeList(sch));
		return "\\WEB-INF\\views\\a27_notice.jsp";
	}
	
	@RequestMapping(params="method=insertFrm")
	public String noticeInsertFrm(Notice notice,Model d) { //모델어트리뷰트 notice설정
		d.addAttribute("projectList2", service2.getProjectList2());
		return "\\WEB-INF\\views\\a29_noticewrite.jsp";
	}
	
	// 등록 처리 후 화면 호출
	@RequestMapping(params="method=insert")
	public String insertNotice(Notice ins, Model d) {
		d.addAttribute("msg", service.insertNotice(ins));
		return "\\WEB-INF\\views\\a29_noticewrite.jsp";
	}
	
	
	@RequestMapping(params="method=detail")
	public String noticeDetail(int notice_list_num, Model d) {		
		d.addAttribute("notice", service.getNotice(notice_list_num));
		return "\\WEB-INF\\views\\a28_noticedetail.jsp";
	}
	

	@RequestMapping(params="method=del")
	public String delNotice(int notice_list_num, Model d){
		service.delNotice(notice_list_num);
		d.addAttribute("msg", "삭제되었습니다");
		return "redirect:/notice.do?method=list";
	}
	
	
	@RequestMapping(params="method=upt")
	public String uptNotice(Notice upt, Model d) {
		service.uptNotice(upt);
		d.addAttribute("msg", "수정되었습니다");		
		return "forward:/notice.do?method=detail";
	}
	
	

	
}
