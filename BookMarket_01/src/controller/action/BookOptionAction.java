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
