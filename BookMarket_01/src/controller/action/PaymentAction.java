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

public class PaymentAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/member/login.jsp";

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
   
		if (member != null) {
			url="/payment/payment.jsp";
			int book_id =  Integer.parseInt(request.getParameter("book_id"));
			BookDao bdo = BookDao.getInstance();	
			Book book = bdo.getBook(book_id);
			
			MemberDao  mdo = MemberDao.getInstance();
			
			Member seller = mdo.getMember(book.getSeller());
			Member buyer = mdo.getMember(member.getMem_id());
			
		    int book_condition = book.getBook_condition();
		    String condition = "";
		    
		    if(book_condition==5) {
		    	condition = "A";
		    }
		    else if(book_condition==4) {
		    	condition = "B";
		    }
		    else if(book_condition==3) {
		    	condition = "C";
		    }
		    else if(book_condition==2) {
		    	condition = "D";
		    }
		    else if(book_condition==1) {
		    	condition = "E";
		    }
			
			request.setAttribute("purchaseBook", book);
			request.setAttribute("buyer", buyer);
			request.setAttribute("seller", seller);
			request.setAttribute("book_condition",condition);
			
		}
		
		
		request.getRequestDispatcher(url).forward(request, response);
		
		
	}

}
