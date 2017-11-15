package dao;

import java.util.List;

import dto.Deal;

public interface IDealDao {  
	public int insertDeal(Deal deal); // 거래내역 추가하는 메소드
	public List<Deal> selectDealListbypartId(int parti_id); //경매구매자가 얻어오는 거래 내역 
	public List<Deal> selectDealListbyBookId(int book_id); //상품번호로 얻어오는 거래 내역,날짜순으로
	public int[] getDealPriceFigure(int book_id); //상품번호에 대한 리스트 배열로 평균 값,최소, 최대 구하기
	public int getNewDealId();
	
}
