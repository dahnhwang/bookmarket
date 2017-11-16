package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookDao;
import dao.DealDao;
import dao.MemberDao;
import dto.Book;
import dto.Deal;
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

		if (book.getPrice_type() == 1) {
			// 경매상품인 경우에 deal 데이터 쏘아줌
			DealDao dDao = DealDao.getInstance();
			List<Deal> dealList = dDao.selectDealListbyBookId(book_id);
			request.setAttribute("dealList", dealList);
			int dealCount = dDao.countDealbyBookId(book_id);
			request.setAttribute("dealCount", dealCount);
			int avgPrice = dDao.averagePricebyBookId(book_id);
			request.setAttribute("avgPrice", avgPrice);
			
		}

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
