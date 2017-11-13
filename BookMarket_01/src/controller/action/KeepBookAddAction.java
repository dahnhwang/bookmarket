package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.fabric.xmlrpc.base.Array;

import dao.BookDao;
import dao.KeepBookDao;
import dto.Book;
import dto.KeepBook;
import dto.Member;

public class KeepBookAddAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String text = null;
		PrintWriter pw = response.getWriter();
		int book_id = Integer.parseInt(request.getParameter("book_id"));
        BookDao bdo =BookDao.getInstance();
        Book book = bdo.getBook(book_id);
        
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
	
		
		if (member == null) {
			text = "로그인 후 이용가능합니다!";
			pw.println(text);
			pw.flush();
			return;
		}
		
		
		else if(member.getMem_id()==book.getSeller()) {
			
			text = "본인이 판매하는 책은 찜할 수 없습니다!";
			pw.println(text);
			pw.flush();
			return;
		}
		


		KeepBookDao kbd = KeepBookDao.getInstance();
		int mem_id = member.getMem_id();
		List<KeepBook> keepBookList = new ArrayList<>();
		keepBookList = kbd.selectKeepBookList(mem_id);

		for (int i = 0; i < keepBookList.size(); i++) {
			KeepBook kb = keepBookList.get(i);
			if (kb.getBook_id() == book_id) {
				text = "이미 찜한 도서입니다 !\n자세한 내역은 마이페이지에서 확인하세요";
				pw.println(text);
				pw.flush();
				return;
			}
		}

		KeepBook keepbook = new KeepBook();
		keepbook.setBook_id(book_id);
		keepbook.setMem_id(mem_id);

		int result = kbd.insertKeepBook(keepbook);

		if (result == 1) {
			text = "도서를 찜했습니다 !\n자세한 내역은 마이페이지에서 확인하세요";
		}

		pw.println(text);
		pw.flush();
		return;

	}

}
