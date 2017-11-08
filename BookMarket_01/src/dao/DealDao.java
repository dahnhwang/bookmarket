package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Book;
import dto.Deal;

public class DealDao implements IDealDao{
	private Connection conn;

private static Deal instance;

public static Deal getInstance() {
	if (instance == null)
		instance = new Deal();
	return instance;
}   
	
	@Override
	public int insertDeal(Deal deal) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO DEAL VALUES(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deal.getDeal_idx());
			pstmt.setInt(2, deal.getBook_id());
			pstmt.setInt(3, deal.getParticipant_id());
			pstmt.setDate(4, deal.getDeal_date());
			pstmt.setInt(5, deal.getDeal_price());
			pstmt.setInt(6, deal.getSold_state());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
		
		
	@Override //경매구매자가 얻어오는 거래 내역 
	public List<Deal> selectDealListbypartId(int parti_id) {
		// TODO Auto-generated method stub
		List<Deal> deallist = new ArrayList<Deal>();
		Deal deal = null;
		
		String sql = "SELECT * FROM DEAL";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try { 
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
					deal = new Deal();
					deal.setBook_id(rs.getInt("book_id"));
					deal.setParticipant_id(rs.getInt("participant_id"));
					deal.setDeal_price(rs.getDate("deal_price"));
					deal.setSold_state(rs.getInt("sold_state"));
					deallist.add(deal);
// 변수가 뭐가 들어가야하는지 확실치 않다.
// 일단 dealidx boodid particpantid, dealdate, deal price, sold state중 
// 인덱스는 줄세우기위한 수단이라 생각하고 뺴고, 책아아디와 경매참가자계정
// 경매를 참가자기 입찰했던 시간들이라생각할수도?  마김시간이라 생각할수도 있
// soldstate는 완료되서 판매완료된 여부인가 싶어 일단 인풋
		
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
return deallist;
}


	@Override //상품번호로 얻어오는 거래 내역,날짜순으로
	public List<Deal> selectDealListbyBookId(int book_id) {
		// TODO Auto-generated method stub
		List<Deal> deallist = new ArrayList<Deal>();
		Deal deal = null;
		
		String sql = "SELECT * FROM DEAL";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try { 
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				List<Deal> deallist = new ArrayList<Deal>();
				Deal deal = null;
				
				String sql = "SELECT * FROM DEAL";
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			
				try { 
					
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
							deal = new Deal();
							deal.setBook_id(rs.getInt("book_id"));
							deal.setParticipant_id(rs.getInt("participant_id"));
							deal.setDeal_price(rs.getDate("deal_price"));
							deal.setSold_state(rs.getInt("sold_state"));
							deallist.add(deal);
							// 역시나 변수를 뭐 넣어야할지 명확하지 않음				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return deallist;
		}


	@Override //상품번호에 대한 리스트 배열로 평균 값,최소, 최대 구하기
	public int[] getDealPriceFigure(int book_id) {
		// TODO Auto-generated method stub
		
		List<Deal> deallist = new ArrayList<Deal>();
		Deal deal = null;
		
		String sql = "SELECT * FROM DEAL";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int deal_max = 0;
		int deal_min = 0;
		int deal_avg = 0;
	
		
		try { 
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				deal = new Deal();
				deal.setBook_id(rs.getInt("book_id"));
				deal.setParticipant_id(rs.getInt("participant_id"));
				deal.setDeal_price(rs.getInt("deal_price"));
				deal.setSold_state(rs.getInt("sold_state"));
				deallist.add(deal);
// 무슨값을 넣어주지...?
	}
		} catch (Exception e) {
	e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		return deallist;
		
		// deal price가 어떤 값인지 모르겠다라는 게 크다.
		// 그리고 dao 단에서 최소,최대, 평균값을 구해야하나?
		// service단이나 servlet단에서 한걸 가져와야하나...?
}
	
