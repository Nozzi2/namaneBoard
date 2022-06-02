package member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class MemberSignUpService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 받기
		String id = request.getParameter("id_signup");
		String pwd = request.getParameter("pwd_signup");
		String name = request.getParameter("name_signup");
		String email = request.getParameter("email_signup");
		String tel = request.getParameter("tel_signup");
		
		//데이터 선언
		Map<String,String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("name", name);
		map.put("email", email);
		map.put("tel", tel);
		
		//DB접근
		MemberDAO memberDAO = new MemberDAO();
		int su = memberDAO.signUpMember(map);
		
		//결과값 전달
		request.setAttribute("su", su);
		return "/member/memberSignUp.jsp";
	}
}
