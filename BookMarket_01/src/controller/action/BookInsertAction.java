package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.BookDao;
import dto.Book;

public class BookInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String comment = request.getParameter("comment");
		System.out.println(comment);
		Book book = new Book();
		book.setComment(comment);
		book.setIsSold(0);
		book.setPrice(8888);
		book.setBook_id(1);

		BookDao dao = BookDao.getInstance();
		int result = dao.updateBook(book);
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
