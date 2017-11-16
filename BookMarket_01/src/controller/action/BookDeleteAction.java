package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import dao.IBookDao;
import dao.IKeepBookDao;
import dao.KeepBookDao;

public class BookDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		// DB delete records
		IBookDao bDao = BookDao.getInstance();
		IKeepBookDao kbDao = KeepBookDao.getInstance();
		int result_book = bDao.deleteBook(book_id);
		int result_keepBook = kbDao.deleteKeepBook(book_id);
		System.out.println("BookDeleteAction/result_book: "+result_book
				+", /result_keepBook: "+result_keepBook);
		PrintWriter pw = response.getWriter();
		pw.println(result_book);
		pw.flush();
		return;
	}

}
