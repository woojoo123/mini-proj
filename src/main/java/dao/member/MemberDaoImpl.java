package dao.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.MemberDto;
import utils.MybatisSqlSessionFactory;

public class MemberDaoImpl implements MemberDao{
	private SqlSession sqlSession;
	
	public MemberDaoImpl() {
		sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	}

	@Override
	public MemberDto selectMemberByEmail(String email) throws Exception {
		return sqlSession.selectOne("dao.MemberMapper.selectMemberByEmail", email);
	}

	@Override
	public void updatePassword(Map<String, String> param) throws Exception {
		sqlSession.update("dao.MemberMapper.updatePassword", param);
		sqlSession.commit();
	}

	@Override
	public void updateMemberByUsename(MemberDto memberDto) throws Exception {
		sqlSession.update("dao.MemberMapper.updateMemberByUsename", memberDto);
		sqlSession.commit();
	}

	@Override
	public MemberDto selectMemberByUsername(String username) throws Exception {
		System.out.println(username);
		return sqlSession.selectOne("dao.MemberMapper.selectMemberByUsername", username);	
	}
}
