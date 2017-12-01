package dao2;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Sold;
 
public class SoldDao implements ISoldDao{
	private Connection conn;
 
	private static SoldDao instance;
 
	public static SoldDao getInstance() {
		if (instance == null)
			instance = new SoldDao();
		return instance;
	}
 
	private SoldDao() {
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookmarket_db", "root", "mysql");
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}
	public Connection getConnection() throws Exception {
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/bookmarket_db");
		conn = ds.getConnection();
		return conn;
	}
	
	@Override
	public int insertSold(Sold sold) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO sold VALUES(0,?,?,sysdate(),?,?)";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sold.getSeller_id());
			pstmt.setInt(2, sold.getBook_id());
			//sold.getSold_date().getTime())
			pstmt.setInt(3, sold.getSold_price());
			pstmt.setInt(4, sold.getBuyer_id());
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if(conn !=null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
 
	@Override
	public List<Sold> selectSoldListBySeller(int seller_id) {
		// TODO Auto-generated method stub
		List<Sold> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM sold WHERE seller_id=?";
 
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seller_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Sold sd = new Sold();
				
				sd.setOrder_id(rs.getInt("order_id"));
				sd.setSeller_id(rs.getInt("seller_id"));
				sd.setBook_id(rs.getInt("book_id"));
				sd.setSold_date(rs.getDate("sold_date"));
				sd.setSold_price(rs.getInt("sold_price"));
				sd.setBuyer_id(rs.getInt("buyer_id"));
				sd.setSold_date_string(rs.getString("sold_date"));
				
				list.add(sd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if(conn !=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
 
		return list;
	}
 
	@Override
	public List<Sold> selectSoldListByBuyer(int buyer_id) {
		// TODO Auto-generated method stub
		List<Sold> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM sold WHERE buyer_id=?";
 
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, buyer_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Sold sd = new Sold();
				
				sd.setOrder_id(rs.getInt("order_id"));
				sd.setSeller_id(rs.getInt("seller_id"));
				sd.setBook_id(rs.getInt("book_id"));
				sd.setSold_date(rs.getDate("sold_date"));
				sd.setSold_price(rs.getInt("sold_price"));
				sd.setBuyer_id(rs.getInt("buyer_id"));
				sd.setSold_date_string(rs.getString("sold_date"));
				list.add(sd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if(conn !=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
 
		return list;
	}
	public List<Sold> selectSoldListByLoginUser(int mem_id){
		String sql = "select * from (select * from sold where seller_id = ? UNION select * from sold where buyer_id = ?) j order by sold_date desc limit 5";
		List<Sold> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			pstmt.setInt(2, mem_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Sold sd = new Sold();
				
				sd.setOrder_id(rs.getInt("order_id"));
				sd.setSeller_id(rs.getInt("seller_id"));
				sd.setBook_id(rs.getInt("book_id"));
				sd.setSold_date(rs.getDate("sold_date"));
				sd.setSold_price(rs.getInt("sold_price"));
				sd.setBuyer_id(rs.getInt("buyer_id"));
				sd.setSold_date_string(rs.getString("sold_date"));
				list.add(sd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if(conn !=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
 
		return list;
	}
}