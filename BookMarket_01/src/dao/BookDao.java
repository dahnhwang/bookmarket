package dao;

import java.util.List;

import dto.Book;

public class BookDao implements IBookDao{

	@Override
	public List<Book> selectAllBookList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book getBook(int book_id) {
		// TODO Auto-generated method stub
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
