package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.BookDao;
import dao.MemberDao;
import dto.Book;
import dto.Member;

public class BookSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String url = "/book/bookList.jsp";

		String selectSel = request.getParameter("searchSel");
		String searchInput = request.getParameter("searchInput");
		MemberDao mdo = MemberDao.getInstance();
		BookDao bdo = BookDao.getInstance();

		List<Book> bookList = new ArrayList<Book>();
		List<Member> memberList = new ArrayList<Member>();
		Member member = null;

		if(selectSel.equals("all")) {
			bookList = bdo.selectAllBookList();
		}
		
		else if  (selectSel.equals("title")) {
			bookList = bdo.selectBookByTitle(searchInput);

		} else if (selectSel.equals("author")) {
			
			bookList = bdo.selectBookByAuthor(searchInput);
	
		} else if (selectSel.equals("publisher")) {
			
			bookList = bdo.selectBookByPublisher(searchInput);

		} else if (selectSel.equals("seller_email")) {
			
			bookList= bdo.selectBookBySellerEmail(searchInput);

		}


		for (int i = 0; i < bookList.size(); i++) {

			member = mdo.getMember(bookList.get(i).getSeller());
			memberList.add(member);
		}
		
		
		Gson gson = new Gson();
		String send_bookLIst= gson.toJson(bookList);
		String send_memberList = gson.toJson(memberList);
		String result = "{\"bookList\":" + send_bookLIst + ",\"memberList\":"+send_memberList+"}";
		System.out.println(result);
		PrintWriter pw = response.getWriter();
		pw.println(result);
		pw.flush();
		return;

	}

}
