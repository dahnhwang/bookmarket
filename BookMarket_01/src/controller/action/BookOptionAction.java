package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.BookDao;
import dao.MemberDao;
import dto.Book;
import dto.Member;
import util.GenreParser;

public class BookOptionAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		String option = request.getParameter("option");
		int genre = Integer.parseInt(request.getParameter("genre"));
	     System.out.println(option+genre);
	 
	     MemberDao mdo = MemberDao.getInstance();
		 BookDao bdo = BookDao.getInstance();
		
		List<Book> bookList = new ArrayList<Book>();
		List<Member> memberList = new ArrayList<Member>();
		Member member = null;
		List<String> genreList  =new ArrayList<>();
	
		
		
		//처음으로 북navigation을 누르는 거라 page 0 
		if(option.equals("only_genre")) { 
			bookList = bdo.selectBookByGenre(genre);
		}
		
		else if (option.equals("fixedPrice")) {
			bookList = bdo.selectBookByPriceType(genre, 0);
    
		}

		else if (option.equals("biddingPrice")) {
			bookList = bdo.selectBookByPriceType(genre, 1);

		}

		else if (option.equals("Condition")) {
          bookList = bdo.selectBookOrderBy(genre, "book_condition", "desc");
		}

		else if (option.equals("lower")) {
			bookList = bdo.selectBookOrderBy(genre, "price", "asc");
		}

		else if (option.equals("lately")) {

			bookList = bdo.selectBookOrderBy(genre, "submit_date", "desc");
		}
  
		 GenreParser gp = new GenreParser();
         String get_genre ="";
		for (int i = 0; i < bookList.size(); i++) {

			member = mdo.getMember(bookList.get(i).getSeller());
			memberList.add(member);
			
			get_genre = gp.getGenreStr(bookList.get(i).getGenre());
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
