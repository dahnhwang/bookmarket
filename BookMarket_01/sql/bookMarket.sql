SET CHARACTER SET 'UTF-8';
SET CHARACTER SET 'EUCKR';

DROP TABLE IF EXISTS member, book, sold, deal, keepBook, money;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS sold;
DROP TABLE IF EXISTS deal;
DROP TABLE IF EXISTS keepBook;
DROP TABLE IF EXISTS money;

CREATE TABLE member(
mem_id INT NOT NULL AUTO_INCREMENT,
email varchar(18) default null,
pwd varchar(18),
name varchar(18),
join_date DATE,
PRIMARY KEY (mem_id)
);

CREATE TABLE book(
book_id INT NOT NULL AUTO_INCREMENT,
isbn VARCHAR(20) NOT NULL,
author VARCHAR(20),
title VARCHAR(20) NOT NULL,
publisher VARCHAR(20),
published_date DATE,
genre INT,
book_condition INT DEFAULT 0,
isSold INT DEFAULT 0,
price INT DEFAULT 0,
seller_id INT,
image INT default 0,
submit_date DATE, 
price_type INT default 0,
comment VARCHAR(1000),
comment_img VARCHAR(1000),
PRIMARY KEY (book_id)
);

CREATE TABLE sold(
order_id INT AUTO_INCREMENT,
seller_id INT,
book_id INT, 
sold_date DATE, 
sold_price INT,
buyer_id INT,
PRIMARY KEY (order_id)
);

CREATE TABLE deal(
deal_idx INT AUTO_INCREMENT, 
participant_id INT,
deal_date DATE,
deal_price INT,
sold_state INT DEFAULT 0,
PRIMARY KEY (deal_idx)
);

CREATE TABLE keepBook(
keepBook_id	int AUTO_INCREMENT,
book_id	int,
mem_id	int,
keep_date DATE,
PRIMARY KEY (keepBook)
);

CREATE TABLE money(
money_idx INT AUTO_INCREMENT,
mem_id	int,
money	int,
money_update_day DATE
);
