package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import dto.Book;
import dto.Deal;

public class DealDao implements IDealDao {
	private Connection conn;

	private static DealDao instance;

	public static DealDao getInstance() {
		if (instance == null)
			instance = new DealDao();
		return instance;
	}

	private DealDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookmarket_db", "root", "mysql");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public int insertDeal(Deal deal) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO deal VALUES(0,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deal.getBook_id());
			pstmt.setInt(2, deal.getParticipant_id());
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			pstmt.setString(3, dateFormat.format(deal.getDeal_date()));
			pstmt.setInt(4, deal.getDeal_price());
			pstmt.setInt(5, deal.getSold_state());
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

	@Override // 회원이름 및 상품번호로 얻어오는 거래 내역
	public List<Deal> selectDealListbyBookId(int book_id) {
		// TODO Auto-generated method stub
		List<Deal> list = new ArrayList<Deal>();
		Deal deal = null;
		String sql = "SELECT m.name, d.deal_idx, d.book_id, d.participant_id, "
				+ "d.deal_date, d.deal_price, d.sold_state FROM member m, deal d "
				+ "WHERE m.mem_id = d.participant_id AND d.book_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, book_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				deal = new Deal();
				String oriName = rs.getString("m.name");
				String hiddenName = oriName.replace(oriName.charAt(1), '*');
				deal.setParticipant_name(hiddenName);
				deal.setDeal_idx(rs.getInt("d.deal_idx"));
				deal.setBook_id(rs.getInt("d.book_id"));
				deal.setParticipant_id(rs.getInt("d.participant_id"));
				deal.setDeal_date_string(rs.getString("d.deal_date"));
				deal.setDeal_price(rs.getInt("d.deal_price"));
				deal.setSold_state(rs.getInt("d.sold_state"));
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

	public int getNewDealId() {
		int result = 0;
		String sql = "SELECT MAX(deal_idx) FROM deal";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("MAX(deal_idx)") + 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		return result;
	}

	public int selectBiddingPricebyBookId(int book_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT deal_price FROM deal WHERE book_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, book_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("deal_price");
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
		return result;
	}

	@Override
	public int countDealbyBookId(int book_id) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		String sql = "SELECT COUNT(deal_idx) FROM deal WHERE book_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, book_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("COUNT(deal_idx)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

		return result;
	}

	@Override
	public int averagePricebyBookId(int book_id) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		String sql = "SELECT AVG(deal_price) FROM deal WHERE book_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, book_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("AVG(deal_price)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

		return result;
	}

}
