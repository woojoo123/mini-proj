package service.member;

import dto.MemberDto;

public interface MemberService {
	void changePassword(String email, String curPassword, String newPassword) throws Exception;

	void changeProfile(MemberDto memberDto) throws Exception;
	MemberDto getMemberByEmail(String email) throws Exception;
	MemberDto getMemberByUsername(String username) throws Exception;
}
