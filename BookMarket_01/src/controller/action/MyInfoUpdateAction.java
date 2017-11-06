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
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("updateAction/loginUser: "+loginUser);
	    MemberDao mDao = MemberDao.getInstance();
	    
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		loginUser.setEmail(email); 
		loginUser.setName(name);
		loginUser.setPwd(pwd);
		
		int result = mDao.updateMember(loginUser);
		  
		System.out.println("updateAction/result: "+result);
		new MyPageAction().execute(request, response);
	}

}
