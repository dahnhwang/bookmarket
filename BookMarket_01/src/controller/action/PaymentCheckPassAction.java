package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Member;

public class PaymentCheckPassAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String seller_email = request.getParameter("seller_email");

		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();
		Member buyer = null;
		int result = 0;
		// 로그인 상태일 때
		if (session.getAttribute("loginUser") != null) {
			buyer = (Member) session.getAttribute("loginUser");
			// 구매자 == 판매자 일때
			if (buyer.getEmail().equals(seller_email)) {
				System.out.println("value :" + result);
				pw.println(result);
				pw.flush();
				return;
			}

			// 구매자 != 판매자일 때

			else {
				result = 1;
				pw.println(result);
				pw.flush();
				return;

			}
		}

		else //비로그인 일때 
		   {
			result = 1;
			pw.println(result);
			pw.flush();
			return;

		}

	}
}