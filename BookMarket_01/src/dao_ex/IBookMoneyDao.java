package dao_ex;

import java.util.List;

import dto.BookMoney;

public interface IBookMoneyDao { 
	public int insertBookMoney(BookMoney money); // 북머니 내역  추가하는 메소드 
	public List<BookMoney> selectBookMoneyList(int mem_id); //북머니 리스트 얻어오는 메소드 날짜순으로 order
}
