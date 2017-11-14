package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
		String url = null;
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		IMemberDao mDao = MemberDao.getInstance();
		int mem_id = mDao.memberCheck(email, pwd);
		Member member = null;
		if(mem_id>0) { // 성공 
			member = mDao.getMember(mem_id);
			session.setAttribute("loginUser", member);
			url="main.jsp";
			if(!request.getParameter("returnUrl").equals("")) {
				url = request.getParameter("returnUrl");
				System.out.println(url); 
			}
			
		}else if (mem_id == 0) {
			request.setAttribute("message", "비밀번호가 틀렸습니다");
			url="/member/login.jsp";
		} else if(mem_id == -1){
			request.setAttribute("message", "회원이 아닙니다.");
			url="/member/login.jsp";
		}
		RequestDispatcher disp = request.getRequestDispatcher(url);
		disp.forward(request, response);
	}

}
