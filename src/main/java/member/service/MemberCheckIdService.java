package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberCheckIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		System.out.println("MemberCheckIdService로 넘어오나? id : "+id);
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = memberDAO.checkIdMember(id);
		int result = 1;
		
		if(memberDTO != null) {
			System.out.println("중복된거 있음 ㅡ,.ㅡ");
			result = 0;
		} else {
			System.out.println("중복된거 없음 ^-^");
			result = 1;
			request.setAttribute("id", id);
		}
		
		request.setAttribute("result", result);
		return "/member/memberCheckId.jsp";
	}

}
