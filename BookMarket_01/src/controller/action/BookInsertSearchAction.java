package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Member;

public class BookInsertSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/member/login.jsp";
		HttpSession session =request.getSession();
		if(session.getAttribute("loginUser") != null) {
			url = "/book/insertBookForm.jsp";
			Member mb = (Member) session.getAttribute("loginUser");
			System.out.println("insertBook/loginUser: "+mb);
		}
		RequestDispatcher disp = request.getRequestDispatcher(url);
		disp.forward(request, response);
		
		
		
	}

}
