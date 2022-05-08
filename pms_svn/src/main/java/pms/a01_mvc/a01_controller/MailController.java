package pms.a01_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import pms.a01_mvc.a02_service.MailService;
import pms.a02_vo.Mail;

@Controller
public class MailController {
	@Autowired
	private MailService service;
	// http://localhost:5080/pms/mailFrm.do
	@GetMapping("mailFrm.do")
	public String mailForm() {
		return "WEB-INF\\views\\a02_mail.jsp";
	}
	@PostMapping("mailsend.do")
	public String mailsend(Mail mail, Model d) {
		System.out.println(mail.getReciever());
		d.addAttribute("msg", service.sendMail(mail));
		return "WEB-INF\\views\\a02_mail.jsp";
	}
}