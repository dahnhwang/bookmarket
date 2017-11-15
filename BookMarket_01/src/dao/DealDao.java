package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Book;
import dto.Deal;

public class DealDao implements IDealDao {
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
		String sql = "INSERT INTO deal VALUES(0,?,?,sysdate(),?,?)";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deal.getBook_id());
			pstmt.setInt(2, deal.getParticipant_id());
			pstmt.setInt(3, deal.getDeal_price());
			pstmt.setInt(4, deal.getSold_state());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public List<Deal> selectDealListbypartId(int participant_id) {
		// TODO Auto-generated method stub
		List<Deal> list = new ArrayList<Deal>();
		Deal deal = null;
		String sql = "SELECT * FROM deal WHERE participant_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, participant_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				deal = new Deal();
				deal.setDeal_idx(rs.getInt("deal_idx"));
				deal.setBook_id(rs.getInt("book_id"));
				deal.setParticipant_id(rs.getInt("participant_id"));
				deal.setDeal_date(rs.getDate("deal_date"));
				deal.setDeal_price(rs.getInt("deal_price"));
				deal.setSold_state(rs.getInt("sold_state"));
				list.add(deal);
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
		return list;
	}

	@Override // 상품번호로 얻어오는 거래 내역,날짜순으로
	public List<Deal> selectDealListbyBookId(int book_id) {
		// TODO Auto-generated method stub
		List<Deal> list = new ArrayList<Deal>();
		Deal deal = null;
		String sql = "SELECT * FROM deal WHERE book_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, book_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				deal = new Deal();
				deal.setDeal_idx(rs.getInt("deal_idx"));
				deal.setBook_id(rs.getInt("book_id"));
				deal.setParticipant_id(rs.getInt("participant_id"));
				deal.setDeal_date(rs.getDate("deal_date"));
				deal.setDeal_price(rs.getInt("deal_price"));
				deal.setSold_state(rs.getInt("sold_state"));
				list.add(deal);
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
		return list;
	}

	@Override // 상품번호에 대한 리스트 배열로 평균 값,최소, 최대 구하기
	public int[] getDealPriceFigure(int book_id) {
		return null;
		// TODO Auto-generated method stub

	}

}
