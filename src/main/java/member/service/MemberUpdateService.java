package member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberUpdateService implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String pwd = request.getParameter("pwd_update");
		String id = request.getParameter("id_update");
		String name = request.getParameter("name_update");
		String email = request.getParameter("email_update");
		String tel = request.getParameter("tel_update");
		
		Map<String,String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("name", name);
		map.put("email", email);
		map.put("tel", tel);
		
		MemberDAO memberDAO = new MemberDAO();
		int su = memberDAO.updateMember(map);
		
				
		//꼭! 회원정보 수정 후 로그아웃 처리하기
		HttpSession session = request.getSession();
		session.removeAttribute("memberDTO");
		session.invalidate();
		
		request.setAttribute("su", su);
		return "/member/memberUpdate.jsp";
	}
}