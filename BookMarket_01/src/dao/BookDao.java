package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Book;

public class BookDao implements IBookDao{
	
		private Connection conn;

	private static BookDao instance;

	public static BookDao getInstance() {
		if (instance == null)
			instance = new BookDao();
		return instance;
	}

	private BookDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:8080/bookmarket_db", "root", "mysql");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	@Override
	public List<Book> selectAllBookList() {
		// TODO Auto-generated method stub
		List<dto.Book> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM books";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto.Book b = new dto.Book();
				b.setBook_id(rs.getInt("book_id"));
				b.setIsbn(rs.getString("isbn"));
				b.setPublisher(rs.getString("publisher"));
				b.setPublished_date(rs.getString("published_date"));	
				b.setGenre(rs.getInt("genre"));
				b.setBook_condition(rs.getInt("conditon"));
				b.setSold(rs.getBoolean("isSold"));
				b.setPrice(rs.getInt("price"));
				b.setSeller(rs.getInt("seller"));
				b.setImage(rs.getBoolean("image"));
				b.setSubmit_date(rs.getDate("submit_date"));
				b.setPrice_type(rs.getInt("price_type"));
				b.setComment(rs.getString("comment"));
				b.setComment_img(rs.getString("comment_img"));
				list.add(b);
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
	public Book getBook(int book_id) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO books VALUES(0,?,?,?,?)";
//		이 부분 에러있어요.
//		int result = 0;
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, b.getBook_id());
//			pstmt.setString(2, b.getIsbn());
//			pstmt.setString(3, b.getAuthor());
//			pstmt.setString(4, b.getTitle());
//			pstmt.setString(5, b.getPublisher());
//			pstmt.setString(6, b.getPublished_date());
//			pstmt.setInt(6, b.getGenre());
//			pstmt.setInt(7, b.getCondition());
//			pstmt.setBoolean(8, b.getisSold());
//			pstmt.setInt(9, b.getPrice());
//			pstmt.setInt(10, b.getSeller());
//			pstmt.setBoolean(11, b.getisSold));
//			pstmt.setInt(12, b.getprice));
//			pstmt.setInt(13, b.getseller));
//			pstmt.setboolean(14, b.getimage));
//		}
		return null;
	}

	@Override
	public int insertBook(Book book) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBook(Book book) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBook(int book_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Book> selectBookByGenre(int genre) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> selectBookByTitle(String title) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> selectBookByAuthor(String author) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> selectBookByPublisher(String publisher) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> selectBookBySeller(int seller) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> selectBookOrderBy(int genre, String order, String seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> selectBookByPriceType(int genre, int price_type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> selectBookByCondition(int genre, int book_condition) {
		// TODO Auto-generated method stub
		return null;
	}

}
