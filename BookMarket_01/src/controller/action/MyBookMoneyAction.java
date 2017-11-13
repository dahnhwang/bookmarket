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

import dao.BookMoneyDao;
import dao.IBookMoneyDao;
import dao.IMemberDao;
import dao.MemberDao;
import dto.Book;
import dto.BookMoney;
import dto.KeepBook;
import dto.Member;

public class MyBookMoneyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		int mem_id = loginUser.getMem_id();
		System.out.println("MyBookMoneyAction/mem_id"+ mem_id);
		
		IMemberDao mDao = MemberDao.getInstance();
		IBookMoneyDao bmDao = BookMoneyDao.getInstance();
		
		List<Member> memberList = new ArrayList<Member>();
		List<BookMoney> bmList = new ArrayList<BookMoney>();
		
		bmList = bmDao.selectBookMoneyList(mem_id);
		
		Gson gson = new Gson();
		String send_bookMoneyList= gson.toJson(bmList);
		String send = "{\"bookMoneyList\":" + send_bookMoneyList+"}";
		System.out.println("MyBookMoneyAction/send: "+send);
		PrintWriter pw = response.getWriter();
		pw.println(send);
		pw.flush();
		return;
	}

}
