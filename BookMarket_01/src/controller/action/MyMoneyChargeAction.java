package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dto.Member;

public class MyMoneyChargeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("MyMoneyChargeAction/loginUser: "+loginUser);
	    MemberDao mDao = MemberDao.getInstance();
	    int chargeBookMoney = Integer.parseInt(request.getParameter("charge"));
	    loginUser.setMoney(loginUser.getMoney()+chargeBookMoney);
		int result = mDao.updateMember(loginUser);
		System.out.println("MyMoneyChargeAction/result: "+result);
//		new MyMoneyAction().execute(request, response);
		if(result >0) {
			PrintWriter pw = response.getWriter();
			pw.println("true");
			pw.flush();
		}
		else {
			PrintWriter pw = response.getWriter();
			pw.println("false");
			pw.flush();
		}
	}

}
