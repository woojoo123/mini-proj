package dao.member;

import java.util.Map;

import dto.MemberDto;

public interface MemberDao {
	MemberDto selectMemberByEmail(String email) throws Exception;
	MemberDto selectMemberByUsername(String username) throws Exception;
	void updatePassword(Map<String,String> param) throws Exception;
	void updateMemberByUsename(MemberDto memberDto) throws Exception;
}
