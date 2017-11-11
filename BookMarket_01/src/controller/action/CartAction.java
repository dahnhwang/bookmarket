package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Book;

public class CartAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		System.out.println(book_id);
		HttpSession session = request.getSession();
		List<Book> cartList = (List<Book>) session.getAttribute("cartList");

		for (int i = 0; i < cartList.size(); i++) {
			Book book = cartList.get(i);
			if (book.getBook_id() == book_id) {
				cartList.remove(i);
			}

		}
		
		session.setAttribute("cartList", cartList);
		PrintWriter pw = response.getWriter();
		pw.println(1);
		pw.flush();
		return;

	}

}
