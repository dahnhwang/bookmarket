package dto;

import java.util.Date;

public class Deal {

	private int deal_idx;
	private int	book_id;
	private int participant_id;
	private Date deal_date;
	private int deal_price;
	private int sold_state;
	
	public int getDeal_idx() {
		return deal_idx;
	}
	public void setDeal_idx(int deal_idx) {
		this.deal_idx = deal_idx;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getParticipant_id() {
		return participant_id;
	}
	public void setParticipant_id(int participant_id) {
		this.participant_id = participant_id;
	}
	public Date getDeal_date() {
		return deal_date;
	}
	public void setDeal_date(Date deal_date) {
		this.deal_date = deal_date;
	}
	public int getDeal_price() {
		return deal_price;
	}
	public void setDeal_price(int deal_price) {
		this.deal_price = deal_price;
	}
	public int getSold_state() {
		return sold_state;
	}
	public void setSold_state(int sold_state) {
		this.sold_state = sold_state;
	}
	@Override
	public String toString() {
		return "Deal [deal_idx=" + deal_idx + ", book_id=" + book_id + ", participant_id=" + participant_id
				+ ", deal_date=" + deal_date + ", deal_price=" + deal_price + ", sold_state=" + sold_state + "]";
	}
	
	
	
}
