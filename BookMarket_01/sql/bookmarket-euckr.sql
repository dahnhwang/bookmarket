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
1,
'http://bookthumb.phinf.naver.net/cover/112/111/11211133.jpg?type=m140&amp;udate=20170921',
sysdate(),
0,
'not yet',
'2017-12-10',
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


# 경매가격 도서판매데이터 더미 추가
INSERT INTO book VALUES(
0,'9788925561325','김학렬','대한민국 부동산 투자',
'알에이치코리아','2017.03.22',
'경제 위기 속에서도 수익이 나는 부동산이 있다! 국내 최고의 조사기관의 부동산 팀장으로 근무하면서 직접 투자와 오랜 기간 자신만의 정석 투자법을 만들어 입지분석에 근거한 부동산 투자법을 구축한 저자 김학렬(빠숑)은 낙폭과 급락의 변화 속에서 동산 투자의 새로운 시각을 전해주었다. 그는 오랜 기간 데이터와 현장 검증을 통한 입지분석을 통해 투자의 거시적 관점과 미시적 관점에 대해 확실한 개념을 정립하는 인물로 정평이 나 있다. 그런 그가 이 책 『대한민국 부동산 투자』에 자신의 모든 노하우를 담아 ‘대한민국 최고의 입지분석가’다운 통찰력으로 부동산 투자의 기본을 제시한다.',
160,5,0,10000,'1','http://bookthumb.phinf.naver.net/cover/117/952/11795290.jpg?udate=20171021',
sysdate(),1,'한번 읽고 모셔둔 새 책입니다.','2017-12-31',14000
);
INSERT INTO book VALUES(
0,'9788926364291','아오야마 고쇼','가명탐정 코난 93',
'서울문화사','2017.10.30',
'김전일 뺨치는 명석함을 지닌 고등학생 탐정 구도 신이치, 그러나 어느날 범죄조직을 추적하던 그는 이상한 약을 먹고 하루아침 새에 8살짜리 꼬마의 몸으로 줄어들고 만다. 여자친구인 란에게 조차 비밀을 털어놓지 못하고 꼬마 코난 행세를 하게된 신이치, 그러나 타고난 명석함과 불타는 정의감까지 사라진 것은 결코 아니었다. 때마침 란의 아빠인 사립탐정 모리는 이러저런 사건의 의뢰를 맡게 되고, 곁에서 모리 탐정의 무능함을 보다못한 코난은 번번히 사건에 끼여들어 탐정 모리를 마취주사로 잠재우고, 타고난 추리력을 기반으로 문제를 해결해가는데... ',
330,3,0,2000,'2','http://bookthumb.phinf.naver.net/cover/126/987/12698715.jpg?udate=20171108',
sysdate(),1,'책 모서리에 찻물이 좀 들어 있습니다','2017-11-18',4500
);
INSERT INTO book VALUES(
0,'8809479920077','유나','미니멀 가계부 × 피터래빗(2018)',
'유나 편집부','2017.03.22',
'당신의 꿈을 이루어줄 최고의 파트너, 시크하고 심플한 디자인의 최고급 가계부! 미니멀 가계부가 피터래빗과 만나 더욱 예뻐졌습니다. 당신은 꿈이 있습니다. 꿈을 이루고 싶으세요? 꿈을 현실로 이루어주는 하루 5분 법칙! 이제 가계부를 써보세요. 「2018 미니멀 가계부」는 특별한 설명 없이도 누구나 쉽게 시작할 수 있습니다. 이제 당신이 시작할 차례입니다. 당신의 꿈이 당신을 기다리고 있습니다. 「2018 미니멀 가계부」와 함께 꿈을 이루세요. ',
150,4,0,5000,'4','http://bookthumb.phinf.naver.net/cover/124/959/12495974.jpg?udate=20171018',
sysdate(),1,'가계부를 너무 많이 선물받아서 싸게 처분합니다','2017-11-28',8000
);
INSERT INTO book VALUES(
0,'8990809177','장 지글러','왜 세계의 절반은 굶주리는가',
'갈라파고스','2007.03.12',
'『왜 세계의 절반은 굶주리는가』는 유엔 인권위원회 식량특별조사관인 장 지글러가 기아의 실태와 그 배후의 원인들을 아들과 나눈 대화 형식으로 설명한다. 전쟁과 정치적 무질서로 인해 구호 조치가 무색해지는 비참한 현실, 소는 배불리 먹으면서 사람은 굶은 모순된 현실 등을 자세히 설명한다.',
180,2,0,2000,'5','http://bookthumb.phinf.naver.net/cover/028/568/02856851.jpg?udate=20140821',
sysdate(),1,'서울대 신입생 필독서로 꼽힌 인문교양서입니다','2017-11-28',9800
);

# Deal DATA
INSERT INTO deal VALUES(
0,28,
2,sysdate(),
10010,0
);
INSERT INTO deal VALUES(
0,29,
3,sysdate(),
2010,0
);
INSERT INTO deal VALUES(
0,29,
4,sysdate(),
2030,0
);
INSERT INTO deal VALUES(
0,30,
1,sysdate(),
6000,0
);
INSERT INTO deal VALUES(
0,30,
2,sysdate(),
5500,0
);
INSERT INTO deal VALUES(
0,31,
2,sysdate(),
3000,0
);