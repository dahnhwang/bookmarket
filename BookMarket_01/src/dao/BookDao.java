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

		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBook_id());
			pstmt.setString(2, b.getIsbn());
			pstmt.setString(3, b.getAuthor());
			pstmt.setString(4, b.getTitle());
			pstmt.setString(5, b.getPublisher());
			pstmt.setString(6, b.getPublished_date());
			pstmt.setInt(6, b.getGenre());
			pstmt.setInt(7, b.getCondition());
			pstmt.setBoolean(8, b.getisSold());
			pstmt.setInt(9, b.getPrice());
			pstmt.setInt(10, b.getSeller());
			pstmt.setBoolean(11, b.getisSold());
			pstmt.setInt(12, b.getprice());
			pstmt.setInt(13, b.getseller());
			pstmt.setboolean(14, b.getimage());
			pstmt.setInt(15, b.getsubmit_date());
			pstmt.setString(16. b.getprice_type());
			pstmt.setString(17. b.getcomment());
			pstmt.setString(18. b.getcommne_img());
                        result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public int insertBook(Book b) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO books VALUES(?,?,?,?,?)";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getIsbn());
			pstmt.setString(2, b.getAuthor());
			pstmt.setString(3, b.getTitle());
			pstmt.setString(4, b.getPublisher());
			pstmt.setString(5, b.getPublished_date());
			pstmt.setInt(6, b.getGenre());
			pstmt.setInt(7, b.getBook_condition());
			pstmt.setBoolean(8, b.getIssold);
			pstmt.setInt(9, b.getPrice());
			pstmt.setInt(10, b.getSeller());
			pstmt.setBoolean(11, b.getImage());
			pstmt.setdate(12,b.getSubmit_date());
			pstmt.setInt(13, b.getPrice_type());
			pstmt.setString(14,  b.getComment());
			pstmt.setString(15, b.getComment_img());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}


	@Override
	public int updateBook(Book book) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		String sql = "UPDATE books SET author=? "
				+ "title =?, publisher=?, published_date=?,"
				+ "genre =?, book_conditon=?, price=? "
				+ "comment =? commmnet_img=?" 
				"WHERE book_id = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getAuthor());
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getPublisher());
			pstmt.setString(4, b.getpublished_date());
			pstmt.setInt(5, b.getgenre());
			pstmt.setInt(6, getBook_condition()));
			pstmt.setInt(7, b.getPrice());
			pstmt.setString(8, b.getComment());
			pstmt.setString(9, b.getComment_img());
			result = pstmt.executeUpdate());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public int deleteBook(int book_id) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM books WHERE book_id = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
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
