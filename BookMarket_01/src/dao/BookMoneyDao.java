//package dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//import dto.BookMoney;
//
//public class BookMoneyDao implements IBookMoneyDao{
//	private Connection conn;
//
//private static BookMoneyDao instance;
//
//public static BookMoneyDao getInstance() {
//	if (instance == null)
//		instance = new BookMoneyDao();
//	return instance;
//}
//
//	@Override
//	public int insertBookMoney(BookMoney money) {
//		// TODO Auto-generated method stub
//		PreparedStatement pstmt = null;
//		String sql = "INSERT INTO money VALUES(?,?,?)";
//		int result = 0;
//		
//		try {
//		pstmt = conn.prepareStatement(sql);
//		pstmt.setInt(1, money.getMem_id());
//		pstmt.setInt(2, money.getBookMoney());
//		pstmt.setDate(3, money.getBookMoney_update_day());
//		result = pstmt.executeUpdate();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			try{
//				if(pstmt != null)
//			pstmt.close();
//		}catch(Exception e ) {
//			e.printStackTrace();
//		}
//	}
//		return result;
//	}
//
//	@Override 	// 아직 날짜순으로 정렬 하진 못함.
//	public List<BookMoney> selectBookMoneyList(int mem_id) {
//		// TODO Auto-generated method stub
//		List<BookMoney> MoneyList = new ArrayList<BookMoney>();
//		BookMoney money = null;
//		
//		String sql ="SELECT * FROM MONEY";
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rs =pstmt.executeQuery();
//			while(rs.next()) {
//				
//				money = new BookMoney();
//				money.setBookMoney(rs.getInt("bookMoney"));
//				money.setMem_id(rs.getInt("mem_id"));
//				money.setBookMoney_update_day(rs.getDate("bookMoney_update_day"));
//				MoneyList.add(money);
//		}} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			try {
//			if(rs != null)
//				rs.close();
//			if(pstmt != null)
//				pstmt.close();
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//		return MoneyList;
//	}
//}
