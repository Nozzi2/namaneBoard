package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory;	
	
	public BoardDAO() {
		//여기서 환경설정을 읽어야한다.
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public int writeBoard(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		int su = sqlSession.insert("boardSQL.writeBoard", map);
		sqlSession.commit();
		sqlSession.close();
		System.out.println("데이터를 삽입하였습니다.");
		
		return su;
	}


	public List<BoardDTO> getAllList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.getAllList");
		sqlSession.close();
		return list;
	}


	public BoardDTO readBoard(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO dto = sqlSession.selectOne("boardSQL.readBoard", seq);
		sqlSession.close();
		return dto;
	}
	
	
	//게시글 불러오기
	public List<BoardDTO> getBoardList(int startNum, int endNum) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<BoardDTO> list = sqlSession.selectList("boardSQL.getBoardList", map);
		sqlSession.close();
		return list;
	}//getBoardList()
	
	//게시글 작성된 수량 반환
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession(); //생성
		BoardDTO dto = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		return dto.getSeq();
	}//getTotalA()


}
