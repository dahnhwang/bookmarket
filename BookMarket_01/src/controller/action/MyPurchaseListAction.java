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
import dao.DealDao;
import dao.IBookDao;
import dao.IDealDao;
import dao.IMemberDao;
import dao.ISoldDao;
import dao.MemberDao;
import dao.SoldDao;
import dto.Book;
import dto.Deal;
import dto.Member;
import dto.Sold;

public class MyPurchaseListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		int mem_id = loginUser.getMem_id();
		System.out.println("MyPurchaseListAction/mem_id"+ mem_id);
		System.out.println("MyPurchaseListAction/from: "+request.getParameter("from"));
		ISoldDao sDao = SoldDao.getInstance();
		IDealDao dDao = DealDao.getInstance();
		IMemberDao mDao = MemberDao.getInstance();
		IBookDao bDao = BookDao.getInstance();
		
		List<Member> memberList = new ArrayList<Member>();
		List<Book> bookList = new ArrayList<Book>();
		List<Sold> soldList = new ArrayList<Sold>();
		List<Deal> dealList = new ArrayList<Deal>();
		if(request.getParameter("from").equals("sold")) {
		soldList = sDao.selectSoldListByBuyer(mem_id);
			for (int i = 0; i < soldList.size(); i++) {
				Book book = bDao.getBook(soldList.get(i).getBook_id());
				Member seller = mDao.getMember(book.getSeller());
				memberList.add(seller);
				bookList.add(book);
			}
		}
		if(request.getParameter("from").equals("deal")) {
			dealList = dDao.selectDealListbypartId(mem_id);
			for (int i=0; i<dealList.size();i++) {
				Book book = bDao.getBook(dealList.get(i).getBook_id());
				if(book.getIsSold()==0) {
					Member seller = mDao.getMember(book.getSeller());
					memberList.add(seller);
					bookList.add(book);
				}
			}
			
		}
		
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		String send = null;
		if(soldList.size()>0 || dealList.size()>0) {
			String send_memberList = gson.toJson(memberList);
			String send_bookList= gson.toJson(bookList);
			String send_soldList = gson.toJson(soldList);
			String send_dealList = gson.toJson(dealList);
			send = "{\"bookList\":" + send_bookList + 
					",\"memberList\":"+send_memberList+
					",\"soldList\":"+send_soldList+
					",\"dealList\":"+send_dealList+"}";
		}
		System.out.println("MyPurchaseListAction/result: "+send);
		pw.println(send);
		pw.flush();
		return;		
	}

}
