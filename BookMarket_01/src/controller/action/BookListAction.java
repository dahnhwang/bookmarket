package controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import dao.MemberDao;
import dto.Book;
import dto.Member;

public class BookListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/book/bookList.jsp";
		BookDao bdo = BookDao.getInstance();	
	    MemberDao mdo = MemberDao.getInstance(); 
	     
     	List<Book> bookList =  bdo.selectAllBookList();
	    List<Member> memberList = new ArrayList<Member>();
	     
	    Member member = null;
	     
	    for(int i= 0; i<bookList.size(); i++) {
	   
	    	member = mdo.getMember(bookList.get(i).getSeller());
	        memberList.add(member);
	    } 
	    
		request.setAttribute("bookList", bookList);
		request.setAttribute("memberList", memberList);
		request.getRequestDispatcher(url).forward(request, response);		
	} 
 
} 
