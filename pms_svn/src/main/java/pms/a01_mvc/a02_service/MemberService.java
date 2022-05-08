package pms.a01_mvc.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a01_mvc.a03_dao.MemberDao;
import pms.a02_vo.PmsMember;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	// 관리자만 전체 회원리스트 Service 
	public ArrayList<PmsMember> getMemberList(PmsMember sch){
		if(sch.getName()==null) sch.setName("");
		
		return dao.getMemberList(sch);
	}
	
	// 관리자만 회원 상세 Service
	public PmsMember getMemnum(int mem_num) {
		return dao.getMemnum(mem_num);
	}
	
	// 관리자만 회원 정보 수정 Service
	public void uptMem(PmsMember upt) {
		dao.uptMem(upt);
	}
	
	// 관리자만 회원 정보 삭제 Service
	public void delMem(int mem_num) {
		dao.delMem(mem_num);
	}
	
	// 관리자만 회원 정보 등록 Service
	public void insertMem(PmsMember ins) {
		dao.insertMem(ins);
	}
}
