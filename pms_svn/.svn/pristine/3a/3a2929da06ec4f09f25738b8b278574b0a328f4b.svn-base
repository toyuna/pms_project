package pms.a01_mvc.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.a02_vo.PmsMember;

@Repository
public interface MemberDao {

	// 관리자만 전체 회원리스트 DAO 
	public ArrayList<PmsMember> getMemberList(PmsMember sch);
	
	// 관리자 회원 상세 DAO
	public PmsMember getMemnum(int mem_num);
	
	// 관리자 회원 수정 DAO
	public void uptMem(PmsMember upt);
	
	// 관리자 회원 삭제 DAO
	public void delMem(int mem_num);
	
	// 관리자 회원 등록 DAO
	public void insertMem(PmsMember ins);
}
