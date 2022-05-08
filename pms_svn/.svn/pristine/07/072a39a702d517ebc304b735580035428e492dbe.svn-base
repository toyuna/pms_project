package pms.a01_mvc.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a01_mvc.a03_dao.DashboardDao;
import pms.a02_vo.Project;

@Service
public class DashboardService {
	@Autowired
	private DashboardDao dao;
	
	public ArrayList<Project> getProjectName() {
		return dao.getProjectName();
	}
	
}
