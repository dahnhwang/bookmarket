package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import dao.BookMoneyDao;
import dao.MemberDao;
import dao.SoldDao;
import dto.BookMoney;
import dto.Sold;

public class PaymentSuccessAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String url = "/payment/paymentComplete.jsp";
		
		int seller_id = Integer.parseInt(request.getParameter("seller_id"));
	    int buyer_id = Integer.parseInt(request.getParameter("buyer_id"));
	    int book_id = Integer.parseInt(request.getParameter("book_id"));
	    int book_price= Integer.parseInt(request.getParameter("book_price"));
	    
	   BookMoney s_bm = new BookMoney();
	   BookMoney b_bm = new BookMoney();
   
	    
	    MemberDao mdo = MemberDao.getInstance();
	    BookMoneyDao bmd = BookMoneyDao.getInstance();
	   
	    
	    // seller money +price  & 북머니 내역 추가 ㅇ
	    int seller_money = mdo.getMoney(seller_id);
	    seller_money+= book_price ;
	    mdo.updateMoney(seller_id, seller_money);
	    
	    s_bm.setMem_id(seller_id);
	    s_bm.setBookMoney(seller_money);
	    s_bm.setMoney_type(0); // 입금 
	    s_bm.setTransMoney(book_price); //추가된 금액 
	    
	    bmd.insertBookMoney(s_bm);
	    

	    // buyer money -price & 북머니 내역 추가 ㅇ 
	    int buyer_money = mdo.getMoney(buyer_id);
	    buyer_money-= book_price ;
	    mdo.updateMoney(buyer_id, buyer_money);
	    
	    b_bm.setMem_id(buyer_id);
	    b_bm.setBookMoney(buyer_money);
	    b_bm.setMoney_type(1); //출금
	    b_bm.setTransMoney(book_price); //빠진 금액 
	    
	    bmd.insertBookMoney(b_bm);
	    
	    //soldDao 추가ㅇ
	    
	    SoldDao sdo = SoldDao.getInstance();
	    Sold sold = new Sold();
	    sold.setSeller_id(seller_id);
	    sold.setBook_id(book_id);
	    sold.setSold_price(book_price);
	    sold.setBuyer_id(buyer_id);
	    sdo.insertSold(sold);
	    
	   
	    //book 판매여부 변경ㅇ
	    BookDao bdo = BookDao.getInstance();
	    bdo.updateSoldType(book_id);
	    
	    request.getRequestDispatcher(url).forward(request, response);
	}

}
