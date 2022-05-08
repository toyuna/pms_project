package pms.a01_mvc.a01_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import pms.a01_mvc.a02_service.LoginService;
import pms.a01_mvc.a02_service.MainService;
import pms.a01_mvc.a02_service.MyjobService;
import pms.a02_vo.PmsMember;

@SessionAttributes("member")
@Controller
public class LoginController {
	
	//사용할 session 모델을 선언
	@ModelAttribute("member")
	public PmsMember getMember() {
		return new PmsMember();
	}
	@Autowired
	private LoginService service;
	
	
	//초기화면 호출 test/1234
	// http://localhost:3081/pms/loginFrm.do
	// http://localhost:5080/pms/loginFrm.do
	// http://49.238.170.24:5080/pms/loginFrm.do
	
	@GetMapping("/loginFrm.do")
	public String loginFrm() {
		return "\\WEB-INF\\views\\a23_login.jsp";
	}
	// 로그인을 통해 session값 설정

	@PostMapping("/login.do")
	public String login(@ModelAttribute("member") PmsMember sch, Model d) {

		PmsMember member = service.login(sch);
		if(member!=null) {
			d.addAttribute("loginMsg","로그인 성공");
			d.addAttribute("member", member);
			
			
			return "forward:/main.do";
		}else {
			d.addAttribute("loginMsg","로그인 실패");
			return "\\WEB-INF\\views\\a23_login.jsp";
		}
	}
	@RequestMapping("/main.do")
	public String main( Model d) {
		d.addAttribute("myjoblist2",service3.getMyjobList2());
		return "\\WEB-INF\\views\\a25_mainpage.jsp";
		
	}
	@Autowired
	private MainService service2;
	
	@Value("${photoupload}")
	private String photoupload;
	// 마이페이지 화면 호출
	// http://localhost:5080/pms/mypage.do
	@RequestMapping("/mypage.do")
	public String mypage(@ModelAttribute("member") PmsMember sch, Model d) {
		PmsMember member = service.login(sch);
		d.addAttribute("member",member);	
		d.addAttribute("imgPath",photoupload);
		return "WEB-INF\\views\\a24_mypage2.jsp";
	}
	//마이페이지 수정
	@RequestMapping("/uptMypage.do")
	public String uptMypage(PmsMember upt, Model d) {
		d.addAttribute("proc","수정 완료");
		service2.updateMember(upt);
		return "forward:/mypage.do";
	}


	@Autowired
	private MyjobService service3;
}












