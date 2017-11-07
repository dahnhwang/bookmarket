package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import dto.Book;

public class BookSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setCharacterEncoding("UTF-8");
		  
		String selectSel = request.getParameter("searchSel");
		String searchInput = request.getParameter("searchInput");
		 
		
		BookDao bdo =BookDao.getInstance();
		List<Book>bookList = new ArrayList<Book>();
		
		if(selectSel.equals("title")) {
			bookList = bdo.selectBookByTitle(searchInput);
			
			for(Book b: bookList) {
				System.out.println(b.toString());
			}
			 
		}
		else if(selectSel.equals("author")) {
			
		}
		else if(selectSel.equals("publisher")) {
			
		}
		else if(selectSel.equals("seller_email")) {
			
		}
	}
 
}
