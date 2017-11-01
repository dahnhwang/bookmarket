package dao;

import java.util.List;

import dto.Deal;

public interface IDealDao {
	public int insertDeal(Deal deal); // 거래내역 추가하는 메소드
	public List<Deal> selectDeal(int mem_id); //거래내역 얻어오는메소드 
}
