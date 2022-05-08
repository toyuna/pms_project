package pms.a01_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a01_mvc.a03_dao.FullCalDao;
import pms.a02_vo.Calendar;

@Service
public class FullCalService {
	
	@Autowired
	private FullCalDao dao;
	
	public List<Calendar> getCalendarList(){
		return dao.getCalendarList();
	}
	public void insertCalendar(Calendar ins){
		dao.insertCalendar(ins);
	}
	public void updateCalendar(Calendar upt){
		dao.updateCalendar(upt);
	}
	public void deleteCalendar(int id){
		dao.deleteCalendar(id);
	}
}
