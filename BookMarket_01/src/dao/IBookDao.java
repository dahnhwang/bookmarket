package dao;

import java.util.List;

import dto.Book; 

public interface IBookDao {
  
	public List<Book> selectAllBookList(); //도서 전체목록 가져오기
	public Book getBook(int book_id); //도서 번호로 도서정보 가져오는 메소드
	public int insertBook(Book book); //도서 추가하는 메소드
	public int updateBook(Book book); //도서 정보를 수정하는 메소드
	public int deleteBook(int book_id); //도서  정보를 삭제하는 메소드
	public List<Book> selectBookGenre(int genre); //장르로 검색하는 메소드 
	public List<Book> selectBookTitle(String title); //제목으로 검색하는 메소드 <%title%>로 select
	public List<Book> selectBookAuthor(String author); //저자로 검색하는 메소드 <%ahthor%>로 select
	public List<Book> selectBookPublisher(String publisher); // 출판사로 검색하는 메소드 <%publisher%>로 select
	public List<Book> selectBookSeller(int seller); //seller id로 검색하는 메소드 
    public List<Book> selectBookOrderBy(int genre, String order, String seq); //genre 내에서 order 기준으로  seq(desc, asc)로 정렬되는 메소드 
    public List<Book> selectBookPriceType(int genre, int price_type);//genre 내에서 price_type으로 정렬
}
