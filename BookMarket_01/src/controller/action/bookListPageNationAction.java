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

public class bookListPageNationAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		int page_num = Integer.parseInt(request.getParameter("page_num"));
		
		
		page_num = (page_num - 1) * 3;
        System.out.println(page_num);
		
		BookDao bdo = BookDao.getInstance();
		List<Book> bookList = new ArrayList<>();
		
		bookList = bdo.selectbookByPagenation(page_num);

		MemberDao mdo = MemberDao.getInstance();
		List<Member> memberList = new ArrayList<Member>();
		
		
		Member member = null;
		for (int i = 0; i < bookList.size(); i++) {

			member = mdo.getMember(bookList.get(i).getSeller());
			memberList.add(member);
		}

		Gson gson = new Gson();
		String send_bookLIst = gson.toJson(bookList);
		String send_memberList = gson.toJson(memberList);
		String result = "{\"bookList\":" + send_bookLIst + ",\"memberList\":" + send_memberList + "}";
		System.out.println(result);
		PrintWriter pw = response.getWriter();
		pw.println(result);
		pw.flush();
		return;

	}

}
