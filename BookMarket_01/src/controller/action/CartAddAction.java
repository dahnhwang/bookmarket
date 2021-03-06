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
import dto.Member;

public class CartAddAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		System.out.println(book_id);
		String text = null;

		PrintWriter pw = response.getWriter();

		BookDao bdo = BookDao.getInstance();
		Book book = bdo.getBook(book_id);
		List<Book> cartList = new ArrayList<Book>();

		HttpSession session = request.getSession();

		Member member = null;

		if (session.getAttribute("loginUser") != null) { // loginUser가 존재하면
			member = (Member) session.getAttribute("loginUser");
			if (member.getMem_id() == book.getSeller()) {

				text = "본인이 판매하는 책은 장바구니에 담을 수 없습니다!";
				pw.println(text);
				pw.flush();
				return;
			}

		}


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
