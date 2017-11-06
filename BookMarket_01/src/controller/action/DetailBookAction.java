package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import dto.Book;

public class DetailBookAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "book/detailBook.jsp?book_id=";
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		System.out.println(url + book_id);
		BookDao dao = BookDao.getInstance();
		Book book = dao.getBook(book_id);

		// 가져온 책의 카테고리 정보를 int로 받아 String으로 알려주는 category parser 입니다.
		int genreInt = book.getGenre();
		String genreStr = null;
		if (genreInt == 100) {
			genreStr = "소설";
		} else if (genreInt == 110) {
			genreStr = "시/에세이";
		} else if (genreInt == 160) {
			genreStr = "경제/경영";
		} else if (genreInt == 170) {
			genreStr = "자기계발";
		} else if (genreInt == 120) {
			genreStr = "인문";
		} else if (genreInt == 190) {
			genreStr = "역사문화";
		} else if (genreInt == 180) {
			genreStr = "사회";
		} else if (genreInt == 250) {
			genreStr = "과학/공학";
		} else if (genreInt == 210) {
			genreStr = "예술/대중문화";
		} else if (genreInt == 200) {
			genreStr = "종교";
		} else if (genreInt == 310) {
			genreStr = "유아";
		} else if (genreInt == 320) {
			genreStr = "어린이";
		} else if (genreInt == 130) {
			genreStr = "가정/생활/요리";
		} else if (genreInt == 140) {
			genreStr = "건강";
		} else if (genreInt == 150) {
			genreStr = "취미/레저";
		} else if (genreInt == 270) {
			genreStr = "여행/지도";
		} else if (genreInt == 230) {
			genreStr = "국어/외국어";
		} else if (genreInt == 240) {
			genreStr = "사전";
		} else if (genreInt == 280) {
			genreStr = "컴퓨터/IT";
		} else if (genreInt == 300) {
			genreStr = "청소년";
		} else if (genreInt == 220) {
			genreStr = "학습/참고서";
		} else if (genreInt == 260) {
			genreStr = "취업/수험서";
		}else if (genreInt == 330) {
			genreStr = "만화";
		}else if (genreInt == 290) {
			genreStr = "잡지";
		}else if (genreInt == 340) {
			genreStr = "해외도서";
		}

		request.setAttribute("book", book);
		request.getRequestDispatcher(url + book_id).forward(request, response);
	}

}
