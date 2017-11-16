package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import dto.Book;

public class BookUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url = "book/updateBook.jsp";
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		BookDao bDao = BookDao.getInstance();
		Book book = bDao.getBook(book_id);
		request.setAttribute("book", book);
		request.getRequestDispatcher(url).forward(request, response);

	}

}
