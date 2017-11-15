package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Member;

public class MainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "main.jsp";
		HttpSession session = request.getSession();
		Member loginUser = null;
		if(session.getAttribute("loginUser")!=null) {
			loginUser = (Member) session.getAttribute("loginUser");
			System.out.println(loginUser);
		}
		session.setAttribute("loginUser", loginUser);
		
		response.sendRedirect(url);
	
	}

}
