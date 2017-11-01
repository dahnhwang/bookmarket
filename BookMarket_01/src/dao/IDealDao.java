package dao;

import java.util.List;

import dto.Deal;

public interface IDealDao {  
	public int insertDeal(Deal deal); // 거래내역 추가하는 메소드
	public List<Deal> selectDealList(int parti_id); //경매구매자가 얻어오는 거래 내역 
}
