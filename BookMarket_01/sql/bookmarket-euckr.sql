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
isbn VARCHAR(100) NOT NULL,
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
comment VARCHAR(10000),
due_date DATE,
retail_price INT,
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
money_type int,
trans_money int,
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
3,
'http://bookthumb.phinf.naver.net/cover/112/111/11211133.jpg?type=m140&amp;udate=20170921',
sysdate(),
0,
'not yet',
sysdate()+5,
1000
);

# KeepBook DATA
insert into keepBook values(0, 2, 2, '2017-11-12');
insert into keepBook values(0, 2, 3, '2017-11-12');

# BookMoney DATA
INSERT INTO money VALUES(0, 2, 10500, 2, 500, '2017-11-13');
INSERT INTO money VALUES(0, 2, 5500, 1, 5000, '2017-11-13');
UPDATE member SET money = 5500 WHERE mem_id = 2;
INSERT INTO money VALUES(0, 1, 10500, 2, 500, '2017-11-13');
INSERT INTO money VALUES(0, 1, 15500, 2, 5000, '2017-11-13');
UPDATE member SET money = 15500 WHERE mem_id = 1;
