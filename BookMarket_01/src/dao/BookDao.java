package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Book;
import dto.Member;

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
	public List<Book> selectAllBookList() {
		// TODO Auto-generated method stub
		
	    List<Book> bookList = new ArrayList<Book>();
	    Book book = null;
		String sql = "SELECT * FROM book";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				
				book = new Book();
				book.setBook_id(rs.getInt("book_id"));
				book.setIsbn(rs.getString("isbn"));
				book.setAuthor(rs.getString("author"));
				book.setTitle(rs.getString("title"));
				book.setPublisher(rs.getString("publisher"));
				book.setPublished_date(rs.getString("published_date"));
				book.setDescription(rs.getString("description"));
				book.setGenre(rs.getInt("genre"));
				book.setBook_condition(rs.getInt("book_condition"));
				book.setIsSold(rs.getInt("isSold"));
				book.setPrice(rs.getInt("price"));
				book.setSeller(rs.getInt("seller_id"));
				book.setImage(rs.getInt("image"));
				book.setSubmit_date(rs.getDate("submit_date"));
				book.setPrice_type(rs.getInt("price_type"));
				book.setComment(rs.getString("comment"));
				book.setComment_img(rs.getString("comment_img"));
				
				bookList.add(book);
				
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
		return bookList;
	}

	@Override
	public Book getBook(int book_id) {

	    Book book = null;
		String sql = "select * from book where book_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				
				book = new Book();
				book.setBook_id(rs.getInt("book_id"));
				book.setIsbn(rs.getString("isbn"));
				book.setAuthor(rs.getString("author"));
				book.setTitle(rs.getString("title"));
				book.setPublisher(rs.getString("publisher"));
				book.setPublished_date(rs.getString("published_date"));
				book.setDescription(rs.getString("description"));
				book.setGenre(rs.getInt("genre"));
				book.setBook_condition(rs.getInt("book_condition"));
				book.setIsSold(rs.getInt("isSold"));
				book.setPrice(rs.getInt("price"));
				book.setSeller(rs.getInt("seller_id"));
				book.setImage(rs.getInt("image"));
				book.setSubmit_date(rs.getDate("submit_date"));
				book.setPrice_type(rs.getInt("price_type"));
				book.setComment(rs.getString("comment"));
				book.setComment_img(rs.getString("comment_img"));
				
				
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
		return book;
	}

	@Override
	public int insertBook(Book book) {
		

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
