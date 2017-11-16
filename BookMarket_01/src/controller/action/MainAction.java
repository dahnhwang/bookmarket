package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookDao;
import dto.Book;
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
		
		List<Book> section1_list = new ArrayList<>();
		List<Book> section2_list = new ArrayList<>();
	    List<Book> section3_list = new ArrayList<>();
		
		
		 BookDao bdo = BookDao.getInstance();
		 section1_list = bdo.selectbookByMain(1);  
		 section2_list = bdo.selectbookByMain(2);
		 section3_list = bdo.selectbookByMain(3);
	
		
	    request.setAttribute("section1_list", section1_list);
	    request.setAttribute("section2_list", section2_list);
	    request.setAttribute("section3_list", section3_list);
	 

		request.getRequestDispatcher(url).forward(request, response);
	
	}

}
