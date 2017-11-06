package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dto.Member;

public class MyInfoUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		System.out.println("updateAction/loginUser: "+member);
	    MemberDao mDao = MemberDao.getInstance();
	    
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		member.setEmail(email); 
		member.setName(name);
		member.setPwd(pwd);
		
		int result = mDao.updateMember(member);
		  
		System.out.println("updateAction/result: "+result);
		new MyPageAction().execute(request, response);
	}

}
