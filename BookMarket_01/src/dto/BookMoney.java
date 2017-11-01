package dto;

import java.util.Date;

public class BookMoney {

	private int mem_id;
	private int bookMoney;
	private Date bookMoney_update_day;
	
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}
	
	public int getBookMoney() {
		return bookMoney;
	}
	public void setBookMoney(int bookMoney) {
		this.bookMoney = bookMoney;
	}
	public Date getBookMoney_update_day() {
		return bookMoney_update_day;
	}
	public void setBookMoney_update_day(Date bookMoney_update_day) {
		this.bookMoney_update_day = bookMoney_update_day;
	}
	@Override
	public String toString() {
		return "BookMoney [mem_id=" + mem_id + ", bookMoney=" + bookMoney + ", bookMoney_update_day="
				+ bookMoney_update_day + "]";
	}
	
	
	
}
