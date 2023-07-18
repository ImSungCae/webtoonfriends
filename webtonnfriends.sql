drop table t_shop_member;
drop table t_shop_goods;
drop table t_shop_cart;
drop table t_goods_image;

--------------------------------------------------------
-- create t_shop_member
--------------------------------------------------------

CREATE TABLE t_shop_member(
    member_id VARCHAR2(20) primary key,
    member_pwd VARCHAR2(20),
    member_name VARCHAR2(50),
    hp1 VARCHAR2(20),
    zipcode VARCHAR2(20),
    address VARCHAR2(500),
    subAddress VARCHAR2(500),
    joinDate DATE DEFAULT sysdate,
    del_yn VARCHAR2(20) DEFAULT 'N'
);

--------------------------------------------------------
-- create t_shop_goods
--------------------------------------------------------

CREATE TABLE t_shop_goods(
    goods_id NUMBER(20) primary key,
    goods_sort VARCHAR2(50),
    goods_title VARCHAR2(100),
    goods_writer_intro VARCHAR2(2000),
    goods_price NUMBER(10),
    goods_delivery_price NUMBER(5),
    goods_delivery_date DATE,
    goods_status varchar(50)
);

--------------------------------------------------------
-- create t_goods_image
--------------------------------------------------------

CREATE TABLE t_goods_image(
    image_id NUMBER(20) primary key,
    goods_id NUMBER(20),
    fileName VARCHAR2(50),
    reg_id VARCHAR2(20),
    fileType VARCHAR2(40),
    credate DATE DEFAULT sysdate
);

--------------------------------------------------------
-- create t_shop_cart
--------------------------------------------------------

CREATE TABLE t_shop_cart(
    cart_id NUMBER(10) primary key,
    goods_id NUMBER(20),
    member_id VARCHAR2(20),
    cart_goods_qty NUMBER(4) DEFAULT 1,
    credate DATE DEFAULT sysdate
);

--------------------------------------------------------
-- create t_shop_order
--------------------------------------------------------

CREATE TABLE t_shop_order(
    order_seq_num NUMBER(20) primary key,
    order_id NUMBER(20),
    goods_id NUMBER(20),
    goods_title VARCHAR2(100),
    goods_price NUMBER(5),
    goods_fileName VARCHAR2(60),
    order_goods_qty NUMBER(5),
    delivery_state VARCHAR2(20),
    member_id VARCHAR2(20),
    order_hp VARCHAR2(20),
    receiver_name VARCHAR2(50),
    receiver_hp1 VARCHAR2(20),
    delivery_address VARCHAR2(500),
    pay_method VARCHAR2(200),
    card_com_name VARCHAR2(50),
    pay_order_hp_num VARCHAR2(20) DEFAULT 'delivery_prepared',
    pay_order_time DATE DEFAULT sysdate
);


--------------------------------------------------------
-- insert t_goods_image
--------------------------------------------------------

insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(300,001,'자유형 아크릴 키링 (투명)_메인.jpg','admin','main_image',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(301,001,'자유형 아크릴 키링 (투명)_서브1.jpg','admin','sub_image1',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(302,002,'화산귀환 아이폰 하드케이스_메인.jpg','admin','main_image',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(303,002,'화산귀환 아이폰 하드케이스_서브1.jpg','admin','sub_image1',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(304,003,'화산귀환 갤럭시 하드케이스_메인.jpg','admin','main_image',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(305,003,'화산귀환 갤럭시 하드케이스_서브1.jpg','admin','sub_image1',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(306,004,'화산귀환 린넨 그레이 에코백_메인.jpg','admin','main_image',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(307,004,'화산귀환 린넨 그레이 에코백_서브1.jpg','admin','sub_image1',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(308,005,'물위의 우리 아크릴 키링 A_메인.jpg','admin','main_image',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(309,005,'물위의 우리 아크릴 키링 A_서브1.jpg','admin','sub_image1',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(310,006,'물위의 우리 아크릴 키링 B_메인.jpg','admin','main_image',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(311,006,'물위의 우리 아크릴 키링 B_서브1.jpg','admin','sub_image1',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(312,007,'물위의 우리 자유형 스티커_메인.jpg','admin','main_image',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(313,007,'물위의 우리 자유형 스티커_서브1.jpg','admin','sub_image1',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(314,008,'물위의 우리 A5 노트_메인.jpg','admin','main_image',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(315,008,'물위의 우리 A5 노트_서브1.jpg','admin','sub_image1',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(316,009,'언덕 위의 제임스 스마트톡_메인.jpg','admin','main_image',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(317,009,'언덕 위의 제임스 스마트톡_서브1.jpg','admin','sub_image1',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(318,010,'언덕 위의 제임스 폰스트랩_메인.jpg','admin','main_image',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(319,010,'언덕 위의 제임스 폰스트랩_서브1.jpg','admin','sub_image1',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(320,011,'언덕 위의 제임스 아이폰 하드 케이스_메인.jpg','admin','main_image',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(321,011,'언덕 위의 제임스 아이폰 하드 케이스_서브1.jpg','admin','sub_image1',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(322,012,'언덕 위의 제임스 갤럭시 하드 케이스_메인.jpg','admin','main_image',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(323,012,'언덕 위의 제임스 갤럭시 하드 케이스_서브1.jpg','admin','sub_image1',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(324,013,'바른연애 길잡이 티셔츠 A_메인.jpg','admin','main_image',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(325,013,'바른연애 길잡이 티셔츠 A_서브1.jpg','admin','sub_image1',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(326,014,'바른연애 길잡이 티셔츠 B_메인.jpg','admin','main_image',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(327,014,'바른연애 길잡이 티셔츠 B_서브1.jpg','admin','sub_image1',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(328,015,'바른연애 길잡이 린넨 그레이 에코백_메인.jpg','admin','main_image',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(329,015,'바른연애 길잡이 린넨 그레이 에코백_서브1.jpg','admin','sub_image1',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(330,016,'바른연애 길잡이 세로 패브릭 포스터_메인.jpg','admin','main_image',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(331,016,'바른연애 길잡이 세로 패브릭 포스터_서브1.jpg','admin','sub_image1',TO_DATE('22/10/19','RR/MM/DD'));


--------------------------------------------------------
-- insert t_shop_goods
--------------------------------------------------------

insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (1,'화산귀환','자유형 아크릴 키링 (투명)','자유형 아크릴 키링 (투명)',10000,3000,TO_DATE('22/10/16','RR/MM/DD'),'bestgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (2,'화산귀환','화산귀환 아이폰 하드케이스','아이폰 13 하드케이스 (유광)',18000,3000,TO_DATE('22/10/16','RR/MM/DD'),NULL);
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (3,'화산귀환','화산귀환 갤럭시 하드케이스','갤럭시 S21 하드케이스 (무광)',18000,3000,TO_DATE('22/10/16','RR/MM/DD'),'bestgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (4,'화산귀환','화산귀환 린넨 그레이 에코백','린넨 그레이 에코백',25000,3000,TO_DATE('22/10/16','RR/MM/DD'),'newgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (5,'물위의우리','물위의 우리 아크릴 키링 A','자유형 아크릴 키링 (투명)',11400,3000,TO_DATE('22/10/17','RR/MM/DD'),'bestgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (6,'물위의우리','물위의 우리 아크릴 키링 B','자유형 아크릴 키링 (투명)',11400,3000,TO_DATE('22/10/17','RR/MM/DD'),'bestgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (7,'물위의우리','물위의 우리 자유형 스티커','자유형 스티커 - 아트지',3000,3000,TO_DATE('22/10/17','RR/MM/DD'),NULL);
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (8,'물위의우리','물위의 우리 A5 노트','A5 노트',3200,3000,TO_DATE('22/10/17','RR/MM/DD'),'newgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (9,'언덕위의제임스','언덕 위의 제임스 스마트톡','스마트톡 화이트 (무광/유광)',10000,3000,TO_DATE('22/10/18','RR/MM/DD'),'bestgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (10,'언덕위의제임스','언덕 위의 제임스 폰스트랩','폰 스트랩 (아이폰 예시)',11000,3000,TO_DATE('22/10/18','RR/MM/DD'),NULL);
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (11,'언덕위의제임스','언덕 위의 제임스 아이폰 하드 케이스','아이폰 14 PRO 하드케이스 (무광)',18000,3000,TO_DATE('22/10/18','RR/MM/DD'),NULL);
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (12,'언덕위의제임스','언덕 위의 제임스 갤럭시 하드 케이스','갤럭시 S21 하드케이스 (무광)',18000,3000,TO_DATE('22/10/18','RR/MM/DD'),'newgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (13,'바른연애길잡이','바른연애 길잡이 티셔츠 A','길단 76600 링거 티셔츠',37000,3000,TO_DATE('22/10/19','RR/MM/DD'),NULL);
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (14,'바른연애길잡이','바른연애 길잡이 티셔츠 B','컴포트 컬러즈 1717',29000,3000,TO_DATE('22/10/19','RR/MM/DD'),'bestgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (15,'바른연애길잡이','바른연애 길잡이 린넨 그레이 에코백','린넨 그레이 에코백',32000,3000,TO_DATE('22/10/19','RR/MM/DD'),NULL);
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (16,'바른연애길잡이','바른연애 길잡이 세로 패브릭 포스터','세로 패브릭 포스터 (70X110)',26000,3000,TO_DATE('22/10/19','RR/MM/DD'),'newgoods');


drop sequence ORDER_SEQ_NUM;
drop sequence SEQ_GOODS_ID;
drop sequence SEQ_IMAGE_ID;
drop sequence SEQ_ORDER_ID;
--------------------------------------------------------
--  DDL for Sequence ORDER_SEQ_NUM
--------------------------------------------------------

   CREATE SEQUENCE  "ORDER_SEQ_NUM"  MINVALUE 0 MAXVALUE 10000000 INCREMENT BY 1 START WITH 400 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GOODS_ID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_GOODS_ID"  MINVALUE 100 MAXVALUE 1000000 INCREMENT BY 1 START WITH 400 CACHE 20 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_IMAGE_ID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_IMAGE_ID"  MINVALUE 1 MAXVALUE 11111111 INCREMENT BY 1 START WITH 400 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ORDER_ID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ORDER_ID"  MINVALUE 0 MAXVALUE 10000000 INCREMENT BY 1 START WITH 400 NOCACHE  ORDER  NOCYCLE ;



insert into t_shop_member(member_id,
				 					 member_pwd,
                                     member_name,
                                     hp1)
							 values('admin','admin','관리자','010');







