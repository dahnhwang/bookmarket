package dao;

import java.util.List;

import dto.Sold;
 
public interface ISoldDao {
	public int insertSold(Sold sold); // 거래완료내역 추가하는 메소드
	public List<Sold> selectSoldListBySeller(int seller_id); // 판매자가 불러오는 거래완료내역  
	public  List<Sold> selectSoldListByBuyer(int buyer_id); //구매자가 불러오는 거래완료내역 
   // 거래내역 날짜순으로
	public List<Sold> selectSoldListByLoginUser(int mem_id);// 로그인유저의 거래정보
}
