package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookDao;
import dao.DealDao;
import dao.MemberDao;
import dto.Book;
import dto.Member;
import util.GenreParser;

public class BiddingFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url = "bookmarket?command=login_form";

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");

		if (member != null) {
			url = "/payment/bidding.jsp";
			int book_id = Integer.parseInt(request.getParameter("book_id"));
			int bidding_price = Integer.parseInt(request.getParameter("bidding_price"));
			
			BookDao bDao = BookDao.getInstance();
			Book book = bDao.getBook(book_id);
			
			MemberDao mDao = MemberDao.getInstance();
			Member seller = mDao.getMember(book.getSeller());
			Member participant = mDao.getMember(member.getMem_id());
			
			GenreParser parser = new GenreParser();
			String genre = parser.getGenreStr(book.getGenre());
			System.out.println(genre);
			request.setAttribute("genre", genre);

			request.setAttribute("book", book);
			request.setAttribute("participant", participant);
			request.setAttribute("seller", seller);
			request.setAttribute("bidding_price", bidding_price);

		}

		request.getRequestDispatcher(url).forward(request, response);

	}

}
