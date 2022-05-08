package pms.a01_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a01_mvc.a02_service.DashboardService;

@Controller
public class DashboardController {
	@Autowired
	private DashboardService service;
	
	
	
	// http://localhost:5080/pms/dash.do
	@RequestMapping("dash.do")
	public String dash(){
		return "WEB-INF\\views\\a30_Dashboard.jsp";
	}
	
	
	// http://localhost:5080/pms/projectName.do
	@RequestMapping("/projectName.do")
	public String dashboard(Model d) {
		
		
		d.addAttribute("pname", service.getProjectName());
		
		
		return "pageJsonReport";
	}
}
