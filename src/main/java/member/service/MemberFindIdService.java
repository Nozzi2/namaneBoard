package member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberFindIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {		
		String name = request.getParameter("name_findid");
		String email = request.getParameter("email_findid");
		
		Map<String,String> map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = memberDAO.findIdMember(map);
		
		request.setAttribute("memberDTO", memberDTO);
		return "/member/memberFindId.jsp";
	}

}
