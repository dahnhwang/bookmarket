package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.Member;

public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member member = new Member();
	    MemberDao mDao = MemberDao.getInstance();
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		member.setEmail(email); 
		member.setName(name);
		member.setPwd(pwd);
		member.setMoney(10000);
   
	   int result = mDao.insertMember(member);
	  
	   System.out.println(result);
	   new MainAction().execute(request, response);
	
	}

}

