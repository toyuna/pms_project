package pms.a01_mvc.a03_dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import pms.a02_vo.Gantt;
import pms.a02_vo.Link;

@Repository
public interface GanttDao {
	public ArrayList<Gantt> getGantt(int project_num);
	public ArrayList<Link> getLink(int project_num);
	public void insertGantt(Gantt insert);
	public void updateGantt(Gantt update);
	public void deleteGantt(Gantt delete);

	public void insertLink(Link insert);
	public void updateLink(Link update);
	public void deleteLink(Link del);
}
