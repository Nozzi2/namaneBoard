package member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberLoginService implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String pwd = request.getParameter("pwd");
		String id = request.getParameter("id");
		
		Map<String,String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = memberDAO.loginMember(map);
		
		if(memberDTO != null) {
			HttpSession session = request.getSession(); //세션 생성
			session.setAttribute("memberDTO", memberDTO);
		}

		return "/member/memberLoginFail.jsp";
		//memberLoginFail.jsp는 로그인 결과가 fail이 아니라 Ok인지 fail인지 알려주는 jsp이다.
	}
}