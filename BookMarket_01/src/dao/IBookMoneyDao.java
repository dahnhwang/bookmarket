package dao;

import java.util.List;

import dto.Money;

public interface IBookMoneyDao { 
	public int insertBookMoney(Money money); // 북머니 내역  추가하는 메소드 
	public List<Money> selectBookMoneyList(int mem_id); //북머니 리스트 얻어오는 메소드 
}
