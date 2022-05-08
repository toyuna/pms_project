package pms.a01_mvc.a03_dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pms.a02_vo.Calendar;

@Repository
public interface FullCalDao {
	public List<Calendar> getCalendarList();
	public void insertCalendar(Calendar ins);
	public void updateCalendar(Calendar upt);
	public void deleteCalendar(int id);
}
