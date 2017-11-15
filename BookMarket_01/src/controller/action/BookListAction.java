package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import dao.MemberDao;
import dto.Book;
import dto.Member;

public class BookListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/book/bookList.jsp";
	    BookDao bdo = BookDao.getInstance();
	    
	    Double  count =  (double) bdo.countAllbook();
	    int page =  (int) (Math.ceil(count/3.0));
	    request.setAttribute("page_num",page );
		request.getRequestDispatcher(url).forward(request, response);		
	} 
 
} 
