package dto;

import java.util.Date;

public class Book {

	private int book_id;
	private String isbn;
	private String author;
	private String title;
	private String publisher;
	private String published_date;
	private String description;
	private int genre;
	private int book_condition;
	private int isSold;
	private int price;
	private int seller;
	private String image;
	private Date submit_date;
	private int price_type;
	private String comment;
	private Date due_date;

	public int getBook_id() {
		return book_id;
	}

	public Date getDue_date() {
		return due_date;
	}

	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPublished_date() {
		return published_date;
	}

	public void setPublished_date(String published_date) {
		this.published_date = published_date;
	}

	public int getGenre() {
		return genre;
	}

	public void setGenre(int genre) {
		this.genre = genre;
	}

	public int getBook_condition() {
		return book_condition;
	}

	public void setBook_condition(int book_condition) {
		this.book_condition = book_condition;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSeller() {
		return seller;
	}

	public void setSeller(int seller) {
		this.seller = seller;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getSubmit_date() {
		return submit_date;
	}

	public void setSubmit_date(Date submit_date) {
		this.submit_date = submit_date;
	}

	public int getPrice_type() {
		return price_type;
	}

	public void setPrice_type(int price_type) {
		this.price_type = price_type;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getIsSold() {
		return isSold;
	}

	public void setIsSold(int isSold) {
		this.isSold = isSold;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Book [book_id=" + book_id + ", isbn=" + isbn + ", author=" + author + ", title=" + title
				+ ", publisher=" + publisher + ", published_date=" + published_date + ", description=" + description
				+ ", genre=" + genre + ", book_condition=" + book_condition + ", isSold=" + isSold + ", price=" + price
				+ ", seller=" + seller + ", image=" + image + ", submit_date=" + submit_date + ", price_type="
				+ price_type + ", comment=" + comment + ", due_date=" + due_date + "]";
	}

}
