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
import dao.IBookDao;
import dao.IMemberDao;
import dao.ISoldDao;
import dao.MemberDao;
import dao.SoldDao;
import dto.Book;
import dto.Member;
import dto.Sold;

public class MySellListAction implements Action {
	Member loginUser = null;
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		loginUser = (Member) session.getAttribute("loginUser");
		int mem_id = loginUser.getMem_id();
		System.out.println("MySellListAction/mem_id"+ mem_id);
		
		IMemberDao mDao = MemberDao.getInstance();
		IBookDao bDao = BookDao.getInstance();
		ISoldDao sDao = SoldDao.getInstance();
		
		List<Book> bookList = new ArrayList<Book>();
		List<Sold> soldList = new ArrayList<Sold>();
		
		bookList = mySellList(bDao.selectAllBookList());
		soldList = sDao.selectSoldListBySeller(mem_id);
		
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		String send = null;
		if(bookList.size()>0) {
		
			String send_bookList= gson.toJson(bookList);
			String send_soldList = gson.toJson(soldList);
			send = "{\"bookList\":" + send_bookList + 
					",\"soldList\":"+send_soldList+"}";
		}
		System.out.println("MySellListAction/result: "+send);
		pw.println(send);
		pw.flush();
		return;
	}
	List<Book> mySellList(List<Book> bl){
		List<Book> bookList = new ArrayList<Book>();
		for(Book book : bl) {
			if(book.getSeller() == loginUser.getMem_id()) {
				bookList.add(book);
			}
		}
		return bookList;
	}
	
}
