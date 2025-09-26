package service.member;

import java.util.HashMap;
import java.util.Map;

import dao.member.MemberDao;
import dao.member.MemberDaoImpl;
import dto.MemberDto;

public class MemberServiceImpl implements MemberService {
	private MemberDao memberDao;
	public MemberServiceImpl() {
		memberDao = new MemberDaoImpl();
	}

	@Override
	public void changePassword(String email, String curPassword, String newPassword) throws Exception {
		MemberDto member = memberDao.selectMemberByEmail(email);
		if(member == null) throw new Exception("이메일 오류");
		if(!member.getPasswordHash().equals(curPassword)) throw new Exception("현재 비밀번호 오류");
		Map<String,String> param = new HashMap<>();
		param.put("email", email);
		param.put("password", newPassword);
		memberDao.updatePassword(param);
	}


	@Override
	public void changeProfile(MemberDto memberDto)	throws Exception {
		memberDao.updateMemberByUsename(memberDto);
	}

	@Override
	public MemberDto getMemberByEmail(String email) throws Exception {
		return memberDao.selectMemberByEmail(email);
	}

	@Override
	public MemberDto getMemberByUsername(String username) throws Exception {
		return memberDao.selectMemberByUsername(username);
	}
}
