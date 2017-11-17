package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookDao;
import dao.DealDao;
import dao.IDealDao;
import dao.ISoldDao;
import dao.SoldDao;
import dto.Book;
import dto.Deal;
import dto.Member;
import dto.Sold;

public class BiddingChoiceAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		System.out.println("1235655465");
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int participant_id = Integer.parseInt(request.getParameter("participant_id"));
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		
		IDealDao dDao = DealDao.getInstance();
		ISoldDao sDao = SoldDao.getInstance();
		//deal, sold 추가 & book update
		List<Deal> dealList = dDao.selectDealListbyBookId(book_id);
		for(Deal deal : dealList) {
			if(deal.getParticipant_id() == participant_id) {
				System.out.println(deal);
				deal.setSold_state(1);
				deal.setDeal_date(new java.util.Date());
				int result = dDao.insertDeal(deal);
				System.out.println("BiddingChoiceAction/insertDeal: "+result);
				Sold sold = new Sold();
				sold.setBook_id(book_id);
				sold.setBuyer_id(participant_id);
				sold.setSeller_id(loginUser.getMem_id());
				sold.setSold_price(deal.getDeal_price());
				result = sDao.insertSold(sold);
				System.out.println("BiddingChoiceAction/insertSold: "+result);
				BookDao.getInstance().updateSoldType(book_id);
			}
		}
		PrintWriter out = response.getWriter();
		out.println("낙찰 완료!");
		out.flush();
		return;
	}

}
