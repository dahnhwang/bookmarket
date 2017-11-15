package dao;

import java.util.List;

import dto.KeepBook;
 

public interface IKeepBookDao {
	public int insertKeepBook(KeepBook keepBook); // 찜내역 추가하는 메소드
	public List<KeepBook> selectKeepBookList(int mem_id); // 멤버 번호로 찜 내역 얻어오는메소드 날짜순으로 order

}
