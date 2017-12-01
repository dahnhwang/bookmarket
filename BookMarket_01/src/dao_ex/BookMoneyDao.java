package dao_ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.BookMoney;
import dto.KeepBook;

public class BookMoneyDao implements IBookMoneyDao {

	private Connection conn;

	private static BookMoneyDao instance;

	public static BookMoneyDao getInstance() {
		if (instance == null)
			instance = new BookMoneyDao();
		return instance;
	}

	private BookMoneyDao() {
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
	public int insertBookMoney(BookMoney money) {
		// TODO Auto-generated method stub
				String sql = "INSERT INTO money VALUES(0,?,?,?,?,sysdate())";
				PreparedStatement pstmt = null;
				int result = 0;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, money.getMem_id());
					pstmt.setInt(2, money.getBookMoney());
					pstmt.setInt(3, money.getMoney_type());
					pstmt.setInt(4, money.getTransMoney());
					
					result = pstmt.executeUpdate();

				} catch (Exception e) {
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
	public List<BookMoney> selectBookMoneyList(int mem_id) {
		// TODO Auto-generated method stub
				List<BookMoney> list = new ArrayList<>();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT * FROM money WHERE mem_id=? ORDER BY money_idx DESC";

				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, mem_id);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						BookMoney bm = new BookMoney();

						 bm.setMoney_idx(rs.getInt("money_idx"));
						 bm.setMem_id(rs.getInt("mem_id"));
						 bm.setBookMoney(rs.getInt("money"));
						 bm.setMoney_type(rs.getInt("money_type"));
						 bm.setTransMoney(rs.getInt("trans_money"));
						 bm.setBookMoney_update_day(rs.getDate("money_update_day"));
						list.add(bm);
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
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				return list;

			}
}