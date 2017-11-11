package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.BookDao;
import dto.Book;

public class CartAddAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		BookDao bdo = BookDao.getInstance();
		Book book = bdo.getBook(book_id);
		List<Book> cartList = new ArrayList<Book>();
		String text = null;
		HttpSession session = request.getSession();
		PrintWriter pw = response.getWriter();

		if (session.getAttribute("cartList") == null) {
			cartList.add(book);
			session.setAttribute("cartList", cartList);
			
		}

		else {
			List<Book> exist_cartList = (List<Book>) session.getAttribute("cartList");

			for (int i = 0; i < exist_cartList.size(); i++) {
				Book existBook = exist_cartList.get(i);
				if (existBook.getBook_id() == book_id) {
					text = "이미 장바구니에 담으신 상품입니다!";
					pw.println(text);
					pw.flush();
					return;
				}

			}
			
			exist_cartList.add(book);
			session.setAttribute("cartList", exist_cartList);

		}
		text = "장바구니에 담았습니다!";
		pw.println(text);
		pw.flush();
		return;

	}

}
