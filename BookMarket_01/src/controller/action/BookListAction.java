package controller.action;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import dto.Book;

public class BookListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/book/bookList.jsp";
		BookDao bdo = BookDao.getInstance();
		List<Book> bookList =  bdo.selectAllBookList();
		request.setAttribute("bookList", bookList);
		request.getRequestDispatcher(url).forward(request, response);		
	} 

} 
