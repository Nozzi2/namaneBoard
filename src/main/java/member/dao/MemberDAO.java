package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
private SqlSessionFactory sqlSessionFactory;	
	
	public MemberDAO() {
		//여기서 환경설정을 읽어야한다.
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public int signUpMember(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		int su = sqlSession.insert("memberSQL.signUpMember", map);
		sqlSession.commit();
		sqlSession.close();
		System.out.println("데이터를 삽입하였습니다.");
		
		return su;
	}


	public MemberDTO loginMember(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO dto =  sqlSession.selectOne("memberSQL.loginMember", map);
		sqlSession.close();
		
		return dto;
	}


	public MemberDTO checkIdMember(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO dto =  sqlSession.selectOne("memberSQL.checkIdMember", id);
		sqlSession.close();
		
		return dto;
	}


	public int updateMember(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		int su = sqlSession.update("memberSQL.updateMember", map);
		sqlSession.commit();
		sqlSession.close();
		System.out.println("데이터를 삽입하였습니다.");
		
		return su;
	}
	
	public MemberDTO findIdMember(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO dto =  sqlSession.selectOne("memberSQL.findIdMember", map);
		sqlSession.close();
		
		return dto;
	}
	
	public MemberDTO findPwdMember(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO dto =  sqlSession.selectOne("memberSQL.findPwdMember", map);
		sqlSession.close();
		
		return dto;
	}
}
