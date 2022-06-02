package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class MemberLogoutService implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//세션
		HttpSession session = request.getSession();
		
		//각각의 세션 삭제
		session.removeAttribute("memberDTO");
		
		//모든 세션 삭제
		session.invalidate(); //무효화
				
		return "/index.jsp";
	}
}