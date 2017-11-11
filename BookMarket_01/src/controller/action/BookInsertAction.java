package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.BookDao;
import dto.Book;

public class BookInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String comment = request.getParameter("comment");
		int book_condition = Integer.parseInt(request.getParameter("condition"));
		int price = Integer.parseInt(request.getParameter("price"));
		System.out.println("price: " + price);
		int price_type = Integer.parseInt(request.getParameter("price_type"));
		System.out.println("price_type: " + price_type);
		Book book = new Book();
		HttpSession session = request.getSession();
		book = (Book) session.getAttribute("book");
		book.setComment(comment);
		book.setBook_condition(book_condition);
		book.setPrice(price);
		book.setPrice_type(price_type);

		BookDao dao = BookDao.getInstance();
		int result = dao.insertBook(book);
		JsonObject jo = new JsonObject();
		jo.addProperty("result", result);
		Gson gson = new Gson();
		String jsonString = gson.toJson(jo);
		PrintWriter pw = response.getWriter();
		pw.println(jsonString);
		pw.flush();
		return;

	}

}
