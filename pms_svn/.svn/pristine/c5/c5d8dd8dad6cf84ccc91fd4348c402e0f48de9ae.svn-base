package pms.a01_mvc.a02_service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a01_mvc.a03_dao.GanttDao;
import pms.a02_vo.Gantt;
import pms.a02_vo.GanttList;
import pms.a02_vo.Link;

@Service
public class GanttService {
	
	@Autowired
	private GanttDao dao;
	
	
	//
	public GanttList getGantt(int project_num){
		   GanttList  glist = new GanttList();
		   ArrayList<Gantt>  list =dao.getGantt(project_num); 
		   glist.setData(list);
		   glist.setLinks(dao.getLink(project_num));
		   return glist;
	}
	public void insertGantt(Gantt insert) {
		dao.insertGantt(insert);
	}
	public void updateGantt(Gantt update) {
		dao.updateGantt(update);
	}
	public void deleteGantt(Gantt delete) {
		dao.deleteGantt(delete);
	}

	public void insertLink(Link insert) {
		dao.insertLink(insert);
	}
	public void updateLink(Link update) {
		dao.updateLink(update);
	}
	public void deleteLink(Link del) {
		dao.deleteLink(del);
	}
}
