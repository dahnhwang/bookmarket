package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookDao;
import dao.MemberDao;
import dto.Book;
import dto.Member;
import util.GenreParser;

public class DetailBookAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "book/detailBook.jsp?book_id=";
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		BookDao dao = BookDao.getInstance();
		Book book = dao.getBook(book_id);
		request.setAttribute("book", book);

		MemberDao mDao = MemberDao.getInstance();
		Member member = mDao.getMember(dao.getBook(book_id).getSeller());
		request.setAttribute("member", member);

		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") != null) {
			Member user = (Member) session.getAttribute("loginUser");
			int user_id = user.getMem_id();
			request.setAttribute("user_id", user_id);
		}

		GenreParser parser = new GenreParser();
		String genre = parser.getGenreStr(book.getGenre());
		System.out.println(genre);
		request.setAttribute("genre", genre);

		request.getRequestDispatcher(url + book_id).forward(request, response);
	}

}
