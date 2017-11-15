package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.IMemberDao;
import dao.MemberDao;
import dto.Member;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
//		System.out.println(email);
		IMemberDao mDao = MemberDao.getInstance();
		int mem_id = mDao.memberCheck(email, pwd);
		Member member = null;
		if(mem_id>0) { // 성공 
			member = mDao.getMember(mem_id);
			session.setAttribute("loginUser", member);
		}
		PrintWriter out = response.getWriter();
		out.println(mem_id);
		out.flush();
		return;
			
	}

}
