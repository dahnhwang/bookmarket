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

public class BiddingFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url = "bookmarket?command=login_form";

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		System.out.println("요기까지 왔니?");

		if (member != null) {
			url = "/payment/bidding.jsp";
			int book_id = Integer.parseInt(request.getParameter("book_id"));
			BookDao bdo = BookDao.getInstance();
			Book book = bdo.getBook(book_id);
			System.out.println("아님 요기까지 왔니?");

			MemberDao mdo = MemberDao.getInstance();

			Member seller = mdo.getMember(book.getSeller());
			Member bidder = mdo.getMember(member.getMem_id());

			request.setAttribute("biddingBook", book);
			request.setAttribute("bidder", bidder);
			request.setAttribute("seller", seller);

		}

		request.getRequestDispatcher(url).forward(request, response);

	}

}
