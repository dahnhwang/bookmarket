package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookMoneyDao;
import dao.IBookMoneyDao;
import dao.IMemberDao;
import dao.MemberDao;
import dto.BookMoney;
import dto.Member;

public class MyMoneyChargeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("MyMoneyChargeAction/loginUser: "+loginUser);
		
		
		IBookMoneyDao bmDao = BookMoneyDao.getInstance();
	    IMemberDao mDao = MemberDao.getInstance();
	    int charging = Integer.parseInt(request.getParameter("charge"));
	    System.out.println("MyMoneyChargeAction/charging: "+charging);
	    
	    
	    BookMoney bm = new BookMoney();
	    bm.setMem_id(loginUser.getMem_id());
	    bm.setBookMoney(loginUser.getMoney()+charging);
	    bm.setMoney_type(2);
	    bm.setTransMoney(charging);
		int result = bmDao.insertBookMoney(bm);
		
		System.out.println("MyMoneyChargeAction/result: "+result);
		if(result >0) {
			loginUser.setMoney(bm.getBookMoney());   
			mDao.updateMember(loginUser);
			PrintWriter pw = response.getWriter();
			pw.println(result);
			pw.flush();
		}
		else {
			PrintWriter pw = response.getWriter();
			pw.println(result);
			pw.flush();
		}
		return;
	}

}
