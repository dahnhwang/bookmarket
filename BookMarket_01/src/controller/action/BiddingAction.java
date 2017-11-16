package controller.action;

import java.io.IOException;
import java.util.Date;

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

public class BiddingAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url = "bookmarket?command=login_form";

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");

		if (member != null) {
			url = "/payment/biddingComplete.jsp";
			int participant_id = Integer.parseInt(request.getParameter("participant_id"));
			int book_id = Integer.parseInt(request.getParameter("book_id"));
			int bidding_price = Integer.parseInt(request.getParameter("bidding_price"));

			DealDao dDao = DealDao.getInstance();
			Deal deal = new Deal();
			deal.setBook_id(book_id);
			deal.setParticipant_id(participant_id);
			deal.setDeal_price(bidding_price);
			deal.setDeal_date(new java.util.Date());
			int result = dDao.insertDeal(deal);
			request.setAttribute("result", result);
			System.out.println("Result of BiddingAction: "+result);
			
		}

		request.getRequestDispatcher(url).forward(request, response);
	}

}
