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
		System.out.println(comment);
		Book book = new Book();
		HttpSession session = request.getSession();
		book = (Book) session.getAttribute("book");
		System.out.println("잘 넘어왔수"+book.toString());
		book.setComment(comment);
		book.setPrice(8888); //더미 데이터

		BookDao dao = BookDao.getInstance();
		int result = dao.insertBook(book);
		System.out.println("저장 성공(1) : "+result);
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
