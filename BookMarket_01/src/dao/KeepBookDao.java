package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.KeepBook;

public class KeepBookDao implements IKeepBookDao {

	private Connection conn;

	private static KeepBookDao instance;

	public static KeepBookDao getInstance() {
		if (instance == null)
			instance = new KeepBookDao();
		return instance;
	}

	private KeepBookDao() {
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
	public int insertKeepBook(KeepBook keepBook) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO keepBook VALUES(0,?,?,sysdate())";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, keepBook.getBook_id());
			pstmt.setInt(2, keepBook.getMem_id());
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
	public List<KeepBook> selectKeepBookList(int mem_id) {
		// TODO Auto-generated method stub
		List<KeepBook> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM keepBook WHERE mem_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				KeepBook kb = new KeepBook();

				kb.setKeepBook_id(rs.getInt("keepBook_id"));
				kb.setBook_id(rs.getInt("book_id"));
				kb.setMem_id(rs.getInt("mem_id"));
				kb.setKeep_date(rs.getDate("keep_date"));

				list.add(kb);
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

	@Override
	public int deleteKeepBook(int book_id) {
		String sql = "DELETE FROM keepBook WHERE book_id = ?";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, book_id);
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
	public int deleteKeepBookbyMem_id(int book_id, int mem_id) {
		String sql = "DELETE FROM keepBook WHERE book_id = ? AND mem_id = ?";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, book_id);
			pstmt.setInt(2, mem_id);
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

}
