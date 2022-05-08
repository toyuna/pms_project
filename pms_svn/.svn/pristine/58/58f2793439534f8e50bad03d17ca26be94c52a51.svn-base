package pms.a01_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import pms.a01_mvc.a02_service.FileService;
import pms.a02_vo.FileVo;

@Controller
public class FileController {

	@Autowired
	private FileService service;
	
		// http://localhost:5080/pms/upload.do
		@GetMapping("/upload.do")
		public String uploadFrm(Model d) {
			d.addAttribute("flist", service.getFileList());
			return "WEB-INF\\views\\a24_mypage2.jsp";
		}
		@PostMapping("/upload.do")
		public String upload( @RequestParam("report") MultipartFile report,
								Model d) {
			System.out.println("파일명:"+report.getOriginalFilename());
			d.addAttribute("msg", service.uploadFile(report));
			d.addAttribute("upFile", report.getOriginalFilename());
			// 현재 등록된 파일 리스트 가져온다.
			d.addAttribute("flist", service.getFileList());
			
			
			return "WEB-INF\\views\\a24_mypage2.jsp";
		}
		@PostMapping("/uploadVo.do")
		public String uploadVo(FileVo vo) {
			System.out.println("내용:"+vo.getTitle());
			System.out.println("파일명:"+vo.getReport().getOriginalFilename());
			return "WEB-INF\\views\\a24_mypage2.jsp";
		}	
	
}
