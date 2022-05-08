package pms.a01_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.a01_mvc.a02_service.MemberService;
import pms.a02_vo.PmsMember;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	// 관리자가 사용자 리스트 보는 페이지
	// http://localhost:5080/pms/memberList.do	
	@RequestMapping("/memberList.do")
	public String memberList(PmsMember sch, Model d) {
		
		d.addAttribute("memberlist", service.getMemberList(sch));
		
		return "WEB-INF\\views\\a19_memList.jsp";
	}
	
	// 사용자 리스트 상세 보는 페이지
	// http://localhost:5080/pms/memdetail.do?mem_num=2
	@RequestMapping("/memdetail.do")
	public String getMemnum(@RequestParam("mem_num") int mem_num, Model d) {
		System.out.println("상세mem_num:"+mem_num);
		d.addAttribute("member", service.getMemnum(mem_num));
		
		return "WEB-INF\\views\\a22_memdetail.jsp";
	}
	
	// 사용자 정보 업데이트  
	// http://localhost:5080/pms/uptMem.do?name=허윤석
	@RequestMapping("/uptMem.do")
	public String uptMem(PmsMember upt, Model d){
		d.addAttribute("proc","수정완료");
		service.uptMem(upt);
		
		return "forward:/memdetail.do";
	}
	
	
	// 사용자 정보 삭제
	@RequestMapping("/delMem.do")
	public String delMem(@RequestParam("mem_num") int mem_num, Model d){
		d.addAttribute("proc","삭제되었습니다");
		service.delMem(mem_num);
		return "WEB-INF\\views\\a22_memdetail.jsp";
	}
	
	// 사용자 등록
	@RequestMapping("/insertMem.do")
	public String insertMem(PmsMember ins, Model d) {
		d.addAttribute("proc", "등록완료");
		service.insertMem(ins);
		
		return "WEB-INF\\views\\a19_memList.jsp";
	}
}
