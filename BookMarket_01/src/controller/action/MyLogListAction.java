package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.BookDao;
import dao.SoldDao;
import dto.Book;
import dto.Member;
import dto.Sold;

public class MyLogListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json; charset=UTF-8");
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		if(loginUser == null) {
			return;
		}
		List<Sold> logList = SoldDao.getInstance()
				.selectSoldListByLoginUser(loginUser.getMem_id());
		List<Book> bookList = new ArrayList<>();
		List<Book> allBook = new ArrayList<>();
		allBook = BookDao.getInstance().selectAllBookList();
		
		for(int i=0; i<logList.size();i++) {
			int book_id = logList.get(i).getBook_id();
			for(Book book : allBook	) {
				System.out.println(book);
				if(book.getBook_id() == book_id) {
					bookList.add(book);
				}
			}
		}
		Gson gson = new Gson();
		String send = null;
		PrintWriter pw = response.getWriter();
		if(logList.size()>0) {
			String send_bookList= gson.toJson(bookList);
			String send_logList = gson.toJson(logList);
			send = "{\"bookList\":" + send_bookList + 
					",\"logList\":"+send_logList+"}";
		}
		System.out.println("MyLogAction/result: "+send);
		pw.println(send);
		pw.flush();
		return;		
	}

}
