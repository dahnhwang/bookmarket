package controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Book;
import util.NaverApi;

public class BookInsertFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="book/insertBook.jsp?isbn=";
		String isbn = request.getParameter("isbn");
		NaverApi api = new NaverApi();
		List<HashMap<String, Object>> list = api.getJson(isbn);
		Iterator iter = list.iterator();
		Book book = null;
		while(iter.hasNext()) {
			Map<String, Object> map = (HashMap<String, Object>)iter.next();
			book = new Book();
			book.setTitle((String)map.get("title"));
			book.setIsbn((String)map.get("isbn"));
			book.setImage((String)map.get("image"));
			book.setAuthor((String)map.get("author"));
			book.setPublisher((String)map.get("publisher"));
			book.setPublished_date((String)map.get("pubdate"));
			book.setDescription((String)map.get("description"));
		}
		System.out.println(book.toString());
		request.setAttribute("book", book);
		request.getRequestDispatcher(url+isbn).forward(request, response);
	}

}
