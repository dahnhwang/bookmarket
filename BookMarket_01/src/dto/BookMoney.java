package dto;

import java.util.Date;

public class BookMoney {

	private int mem_id;
	private int bookMoney;
	private Date bookMoney_update_day;
	private int money_type; //임금 : 0 / 출금 : 1  여부
	private int transMoney ; //추가된  or 마이너스된  북머니  
	
	
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
	public int getMoney_type() {
		return money_type;
	}
	public void setMoney_type(int money_type) {
		this.money_type = money_type;
	}
	public int getTransMoney() {
		return transMoney;
	}
	public void setTransMoney(int transMoney) {
		this.transMoney = transMoney;
	}
	@Override
	public String toString() {
		return "BookMoney [mem_id=" + mem_id + ", bookMoney=" + bookMoney + ", bookMoney_update_day="
				+ bookMoney_update_day + ", money_type=" + money_type + ", transMoney=" + transMoney + "]";
	}
	
	
	
}
