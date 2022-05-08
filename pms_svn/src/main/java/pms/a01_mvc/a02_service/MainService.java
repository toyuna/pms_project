package pms.a01_mvc.a02_service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import pms.a01_mvc.a03_dao.MainDao;
import pms.a02_vo.PmsMember;

@Service
public class MainService {

	@Autowired
	private MainDao dao;
	
	public PmsMember mypage(PmsMember mypage) {
		return dao.mypage(mypage);
	}
	@Value("${photoupload}")
	private String photoupload;
	
	public void updateMember(PmsMember upt) {
		
		String fname="";
		if(upt.getReport()!=null) {
			fname = upt.getReport().getOriginalFilename();
			if (fname != null && !fname.equals("")) {
				System.out.println("경로명:" + photoupload);
				System.out.println("첨부파일명:" + fname);
				File file = new File(photoupload + fname);
				try {
					upt.getReport().transferTo(file);
					System.out.println("1파일 있는지?"+(file.length()));
					System.out.println("1파일 있는지?"+(file.length()/200+3000));
					Thread.sleep(6000);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				upt.setPhoto(fname);
			}			
		}
		
		dao.updateMember(upt);
		
	}
}
