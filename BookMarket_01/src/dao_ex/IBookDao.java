package dao_ex;

import java.util.List;

import dto.Book; 

public interface IBookDao {
    public int countAllbook(); //전체 개수 알려주는 메소드 
	public List<Book> selectAllBookList(); //도서 전체목록 가져오기
	public Book getBook(int book_id); //도서 번호로 도서정보 가져오는 메소드
	public int insertBook(Book book); //도서 추가하는 메소드
	public int updateBook(Book book); //도서 정보를 수정하는 메소드
	public int deleteBook(int book_id); //도서  정보를 삭제하는 메소드
	public List<Book> selectBookByGenre(int genre); //장르로 검색하는 메소드 
	public List<Book> selectBookByTitle(String title); //제목으로 검색하는 메소드 <%title%>로 select
	public List<Book> selectBookByAuthor(String author); //저자로 검색하는 메소드 <%ahthor%>로 select
	public List<Book> selectBookByPublisher(String publisher); // 출판사로 검색하는 메소드 <%publisher%>로 select
	public List<Book> selectBookBySellerEmail(String email); //seller id로 검색하는 메소드 
    public List<Book> selectBookOrderBy(int genre, String order, String seq); //genre 내에서 order 기준으로  seq(desc, asc)로 정렬되는 메소드 
    public List<Book> selectBookByPriceType(int genre, int price_type);//genre 내에서 price_type으로 정렬
    public int getNewBookId(); //새롭게 저장될 데이터의 book_id를 알려줌
    public int updateSoldType(int book_id); //판매된 도서 isSold-> 1 값으로  수정하는 메소드 
    public List<Book> selectbookByPagenation(int num); //bookList pagenation
    
}

