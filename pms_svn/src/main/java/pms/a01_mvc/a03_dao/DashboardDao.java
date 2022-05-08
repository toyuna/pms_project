package pms.a01_mvc.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.a02_vo.Project;

@Repository
public interface DashboardDao {
	public ArrayList<Project> getProjectName();
	
}
