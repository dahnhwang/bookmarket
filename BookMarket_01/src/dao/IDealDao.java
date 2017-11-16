package dao;

import java.util.List;

import dto.Deal;

public interface IDealDao {  
	public int insertDeal(Deal deal); // 거래내역 추가하는 메소드
	public List<Deal> selectDealListbypartId(int parti_id); //경매구매자가 얻어오는 거래 내역 
	public List<Deal> selectDealListbyBookId(int book_id); //상품번호로 얻어오는 거래 내역,날짜순으로
	public int[] getDealPriceFigure(int book_id); //상품번호에 대한 리스트 배열로 평균 값,최소, 최대 구하기
	public int getNewDealId();
	public int selectBiddingPricebyBookId(int book_id);
	public int countDealbyBookId(int book_id);
	//book_id를 주면 해당 도서상품에 해당되는 입찰제시가 몇건있는지 카운트해서 돌려준다.
	public int averagePricebyBookId(int book_id);
	
	
}
