package member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import mail.service.MailSend;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberFindPwdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String id = request.getParameter("name_findpwd");
		String email = request.getParameter("email_findpwd");
		
		Map<String,String> map = new HashMap<>();
		map.put("id", id);
		map.put("email", email);
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = memberDAO.findPwdMember(map);
		
		if(memberDTO != null) {
			MailSend mailSend = new MailSend();
			mailSend.setEmailAddr(email);
			mailSend.setCode(memberDTO.getPwd());
			mailSend.send();
		}
		
		request.setAttribute("memberDTO", memberDTO);		
		return "/member/memberFindPwd.jsp";
	}

}
