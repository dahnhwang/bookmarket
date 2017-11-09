SET CHARACTER SET 'EUCKR';

DROP TABLE IF EXISTS member; 
CREATE TABLE member(
mem_id INT NOT NULL AUTO_INCREMENT,
email varchar(25) default null,
pwd varchar(18),
name varchar(18),
money INT default 10000,
join_date DATE,
PRIMARY KEY (mem_id)
);

DROP TABLE IF EXISTS book;
CREATE TABLE book(
book_id INT NOT NULL AUTO_INCREMENT,
isbn VARCHAR(20) NOT NULL,
author VARCHAR(20) NOT NULL,
title VARCHAR(100) NOT NULL,
publisher VARCHAR(20),
published_date VARCHAR(20), 
description VARCHAR(500),
genre INT,
book_condition INT DEFAULT 0,
isSold INT DEFAULT 0,
price INT DEFAULT 0,
seller_id INT,
image VARCHAR(1000),
submit_date DATE, 
price_type INT default 0,
comment VARCHAR(1000),
PRIMARY KEY (book_id)
);

DROP TABLE IF EXISTS sold;
CREATE TABLE sold(
order_id INT AUTO_INCREMENT,
seller_id INT,
book_id INT, 
sold_date DATE, 
sold_price INT,
buyer_id INT,
PRIMARY KEY (order_id)
);

DROP TABLE IF EXISTS deal;
CREATE TABLE deal(
deal_idx INT AUTO_INCREMENT, 
book_id INT, 
participant_id INT,
deal_date DATE,
deal_price INT,
sold_state INT DEFAULT 0,
PRIMARY KEY (deal_idx)
);

DROP TABLE IF EXISTS keepBook;
CREATE TABLE keepBook(
keepBook_id	int AUTO_INCREMENT,
book_id	int,
mem_id	int,
keep_date DATE,
PRIMARY KEY (keepBook_id)
);

DROP TABLE IF EXISTS money;

CREATE TABLE money(
money_idx INT AUTO_INCREMENT,
mem_id	int,
money	int,
money_update_day DATE,
PRIMARY KEY (money_idx)
);

INSERT INTO member VALUES ('0','a1@gmail.com','111','a1A1',10000,'1980-12-17');
INSERT INTO member VALUES ('0','a2@gmail.com','222','a2A2',10000,'1980-12-17');
INSERT INTO member VALUES ('0','a3@gmail.com','333','a3A3',10000,'1980-12-17');
INSERT INTO member VALUES ('0','a4@gmail.com','444','a4A4',10000,'1980-12-17');
INSERT INTO member VALUES ('0','a5@gmail.com','555','a5A5',10000,'1980-12-17');
INSERT INTO member VALUES ('0','a6@gmail.com','666','a6A6',10000,'1980-12-17');
INSERT INTO member VALUES ('0','a7@gmail.com','777','a7A7',10000,'1980-12-17');
INSERT INTO member VALUES ('0','a8@gmail.com','888','a8A8',10000,'1980-12-17');

INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (1,'9791187165286','Carol Dweck', 'Mind Set', 5, 9900);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (1,'9791187165286','Carol Dweck', 'Mind Set', 4, 5900);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (2,'9791187165286','Carol Dweck', 'Mind Set', 1, 3000);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (3,'9788959894826','커넥팅 랩', '모바일 트렌드 2018', 4, 8000);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (4,'9788959894826','커넥팅 랩', '모바일 트렌드 2018', 2, 5000);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (5,'9788925561776','주홍식', '스타벅스, 공간을 팝니다 하워드 슐츠가 감탄한 스타벅스커피 코리아 1조 매출의 비밀 ', 5, 10000);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (6,'9788950959227','데릭 톰슨', '히트 메이커스 세상을 사로잡은 히트작은 어떻게 만들어졌는가', 4, 14000);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (7,'9788959894178','브렛 킹', '증강현실 현실 위의 현실, 슈퍼 리얼리티의 세계가 열린다,Life in the Smart Lane', 4, 18000);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (8,'9791155323076','권광현, 박영훈', '디지털 노마드 직장 없이 자유롭게 돈 버는 사람들', 5, 10000);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (9,'9788984373327','조엘 디케르', '볼티모어의 서', 5, 10000);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (1,'9788984371231','더글라스 케네디', '리빙 더 월드', 3, 5000);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (1,'9788984371224','안데르스 데 라 모테', '게임', 4, 7700);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (2,'9780062464316','HARARI, YUVAL NOAH', 'Homo Deus A History of Tomorrow', 5, 30000);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (3,'0070856133','Rudin', 'Principles of Mathematical Analysis, 3/E International Series in Pure & Applied Mathematics', 5, 30000);
INSERT INTO book (seller_id, isbn, author, title, book_condition, price) VALUES (4,'0684853949','Sacks, Oliver W.', 'The Man Who Mistook His Wife for a Hat And Other Clinical Tales', 3, 3000);
INSERT INTO book VALUES(
0,
'9788937473135',
'조남주',
'82년생 김지영',
'민음사',
'2016.10.14',
'공포, 피로, 당황, 놀람, 혼란, 좌절의 연속에 대한 한국 여자의 인생 현장 보고서! 문학성과 다양성, 참신성을 기치로 한국문학의 미래를 이끌어 갈 신예들의 작품을 엄선한 「오늘의 젊은 작가」의 열세 번째 작품 『82년생 김지영』. 서민들의 일상 속 비극을 사실적이면서 공감대...',
100,
5,
0,
10000,
1,
'http://bookthumb.phinf.naver.net/cover/112/111/11211133.jpg?type=m140&amp;udate=20170921',
sysdate(),
0,
'not yet'
);
