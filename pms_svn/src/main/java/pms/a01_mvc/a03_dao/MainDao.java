package pms.a01_mvc.a03_dao;

import org.springframework.stereotype.Repository;

import pms.a02_vo.PmsMember;

@Repository
public interface MainDao {
	public PmsMember mypage(PmsMember mypage); //마이페이지 출력
	public void updateMember(PmsMember upt); //마이페이지 수정

}
