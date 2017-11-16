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
import dao.IKeepBookDao;
import dao.IMemberDao;
import dao.KeepBookDao;
import dao.MemberDao;
import dto.Book;
import dto.KeepBook;
import dto.Member;

public class MyKeepBookListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		int mem_id = loginUser.getMem_id();
		System.out.println("MyKeepBookListAction/mem_id"+ mem_id);
		IKeepBookDao kbDao = KeepBookDao.getInstance();
		IMemberDao mDao = MemberDao.getInstance();
		IBookDao bDao = BookDao.getInstance();
		
		List<Member> memberList = new ArrayList<Member>();
		List<Book> bookList = new ArrayList<Book>();
		List<KeepBook> kbList = new ArrayList<KeepBook>();
		
		kbList = kbDao.selectKeepBookList(mem_id);
		for (int i = 0; i < kbList.size(); i++) {
			Book book = bDao.getBook(kbList.get(i).getBook_id());
			if(book.getIsSold()==0) {
				Member seller = mDao.getMember(book.getSeller());
				memberList.add(seller);
				bookList.add(book);
			}
		}
		
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		String send = null;
		if(kbList.size()>0) {
			String send_memberList = gson.toJson(memberList);
			String send_bookList= gson.toJson(bookList);
			String send_kbList = gson.toJson(kbList);
			send = "{\"bookList\":" + send_bookList + 
					",\"memberList\":"+send_memberList+
					",\"keepBookList\":"+send_kbList+"}";
		}
		System.out.println("MyKeepBookListAction/result: "+send);
		pw.println(send);
		pw.flush();
		return;
	}

}
