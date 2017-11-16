package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import dao.DealDao;
import dto.Book;

public class BookUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url = "book/deleteBook.jsp";
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		BookDao bDao = BookDao.getInstance();
		Book book = bDao.getBook(book_id);
		
		if(book.getPrice_type()==1) {
			DealDao dDao = DealDao.getInstance();
			int deal_count = dDao.countDealbyBookId(book_id);
			request.setAttribute("deal_count", deal_count);
			System.out.println("경매참여자 수: " + deal_count);
		}

		request.setAttribute("book", book);
		request.getRequestDispatcher(url).forward(request, response);

	}

}
