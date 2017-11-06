package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.NaverApi;

public class BookInsertFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="book/insertBook.jsp?isbn=";
		
		String isbn = request.getParameter("isbn");
		isbn = "9788937473135";
		NaverApi api = new NaverApi();
		api.getJson(isbn);
		
		request.getRequestDispatcher(url+isbn).forward(request, response);
	}

}
