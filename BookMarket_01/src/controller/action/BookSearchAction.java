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
import com.mysql.fabric.xmlrpc.base.Array;

import dao.BookDao;
import dao.DealDao;
import dao.MemberDao;
import dto.Book;
import dto.Member;
import util.GenreParser;

public class BookSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
	

		String selectSel = request.getParameter("searchSel");
		String searchInput = request.getParameter("searchInput");
		MemberDao mdo = MemberDao.getInstance();
		BookDao bdo = BookDao.getInstance();
    
        List<Book> bookList = new ArrayList<Book>();
		List<Member> memberList = new ArrayList<Member>();
		List<String> genreList  =new ArrayList<>();
		
		
		
		Member member = null;

		if (selectSel.equals("all")) {
			bookList = bdo.selectAllBookList();
		}

		else if (selectSel.equals("title")) {
			bookList = bdo.selectBookByTitle(searchInput);

		} else if (selectSel.equals("author")) {

			bookList = bdo.selectBookByAuthor(searchInput);
 
		} else if (selectSel.equals("publisher")) {

			bookList = bdo.selectBookByPublisher(searchInput);

		} else if (selectSel.equals("seller_email")) {

			bookList = bdo.selectBookBySellerEmail(searchInput);

		}

		 GenreParser gp = new GenreParser();
         String get_genre ="";
     
		for (int i = 0; i < bookList.size(); i++) {
		
			member = mdo.getMember(bookList.get(i).getSeller());
			memberList.add(member);
			
			get_genre = gp.getGenreStr(bookList.get(i).getGenre());
			System.out.println(get_genre);
			genreList.add(get_genre);
		
		
		}

		Gson gson = new Gson();
		String send_bookLIst= gson.toJson(bookList);
		String send_memberList = gson.toJson(memberList);
		String send_genreList = gson.toJson(genreList);
		String result = "{\"bookList\":" + send_bookLIst + ",\"memberList\":"+send_memberList+  ",\"genreList\":"+send_genreList +"}";
		System.out.println(result);
		PrintWriter pw = response.getWriter();
		pw.println(result);
		pw.flush();
		return;

	}

}
