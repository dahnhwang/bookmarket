//package dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//import dto.Book;
//import dto.Deal;
//
//public class DealDao implements IDealDao{
//	private Connection conn;
//
//private static Deal instance;
//
//public static Deal getInstance() {
//	if (instance == null)
//		instance = new Deal();
//	return instance;
//}   
//	
//	@Override
//	public int insertDeal(Deal deal) {
//		// TODO Auto-generated method stub
//		String sql = "INSERT INTO DEAL VALUES(?,?,?,?,?,?,?)";
//		PreparedStatement pstmt = null;
//		int result = 0;
//		int getdeal_idx = 0;
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, deal.getBook_id());
//			pstmt.setInt(2, deal.getDeal_price());
//
//			result = pstmt.executeUpdate();
//			
//			// seller_id는 book_id로 받아온다고 생각하고
//			// deal_date는 한번한번 입찰시간이니 뺴고, 낙찰마감시간 정보는?
//			
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			try {
//				if (pstmt != null)
//					pstmt.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		return result;
//	}
//		
//		
//	@Override //경매구매자가 얻어오는 거래 내역 
//	public List<Deal> selectDealListbypartId(int parti_id) {
//		// TODO Auto-generated method stub
//		List<Deal> deallist = new ArrayList<Deal>();
//		Deal deal = null;
//		
//		String sql = "SELECT * FROM DEAL where ??";
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//	
//		try { 
//			
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//					deal = new Deal();
//					deal.setBook_id(rs.getInt("book_id"));
//					deal.setParticipant_id(rs.getInt("participant_id"));
//					//참여한 본인에 대한 참가자정보인지, 타인까지 포함한 정본지?
//					deal.setDeal_price(rs.getInt("deal_price"));
//					deal.setSold_state(rs.getInt("sold_state"));
//					deallist.add(deal);
//
//	}
//} catch (Exception e) {
//	e.printStackTrace();
//} finally {
//	try {
//		if (rs != null)
//			rs.close();
//		if (pstmt != null)
//			pstmt.close();
//	} catch (Exception e) {
//		e.printStackTrace();
//	}
//}
//return deallist;
//}
//
//
//	@Override //상품번호로 얻어오는 거래 내역,날짜순으로
//	public List<Deal> selectDealListbyBookId(int book_id) {
//		// TODO Auto-generated method stub
//		List<Deal> deallist = new ArrayList<Deal>();
//		Deal deal = new Deal();
//		
//		String sql = "SELECT * FROM DEAL order by deal_date";
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//	
//		try { 
//			
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//							deal = new Deal();
//							deal.setBook_id(rs.getInt("book_id"));
//							deal.setParticipant_id(rs.getInt("participant_id"));
//							// action단에서 출력때 id일부를 **처리하겠지...
//							deal.setDeal_date(rs.getDate("deal_date"));
//							deal.setDeal_price(rs.getInt("deal_price"));
//							deal.setSold_state(rs.getBoolean("sold_state"));
//							deallist.add(deal);		
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null)
//					rs.close();
//				if (pstmt != null)
//					pstmt.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		return deallist;
//		}
//
//
//	@Override //상품번호에 대한 리스트 배열로 평균 값,최소, 최대 구하기
//	public int[] getDealPriceFigure(int book_id) {
//		// TODO Auto-generated method stub
//		
//		List<Deal> deallist = new ArrayList<Deal>();
//		Deal deal = new Deal();
//		
//		String sql = "SELECT * FROM DEAL group by ??";
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		int deal_max = 0;
//		int deal_min = 0;
//		int deal_avg = 0;
//	
//		
//		try { 
//			
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				deal = new Deal();
//				deal.setBook_id(rs.getInt("book_id"));
//				deal.setDeal_price(rs.getInt("deal_price"));
//				deallist.add(deal);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null)
//					rs.close();
//				if (pstmt != null)
//					pstmt.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		return deallist;
//		}
//	
//	
//	
//}
