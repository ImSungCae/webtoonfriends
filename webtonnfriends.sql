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

insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(300,001,'������ ��ũ�� Ű�� (����)_����.jpg','admin','main_image',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(301,001,'������ ��ũ�� Ű�� (����)_����1.jpg','admin','sub_image1',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(302,002,'ȭ���ȯ ������ �ϵ����̽�_����.jpg','admin','main_image',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(303,002,'ȭ���ȯ ������ �ϵ����̽�_����1.jpg','admin','sub_image1',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(304,003,'ȭ���ȯ ������ �ϵ����̽�_����.jpg','admin','main_image',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(305,003,'ȭ���ȯ ������ �ϵ����̽�_����1.jpg','admin','sub_image1',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(306,004,'ȭ���ȯ ���� �׷��� ���ڹ�_����.jpg','admin','main_image',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(307,004,'ȭ���ȯ ���� �׷��� ���ڹ�_����1.jpg','admin','sub_image1',TO_DATE('22/10/16','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(308,005,'������ �츮 ��ũ�� Ű�� A_����.jpg','admin','main_image',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(309,005,'������ �츮 ��ũ�� Ű�� A_����1.jpg','admin','sub_image1',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(310,006,'������ �츮 ��ũ�� Ű�� B_����.jpg','admin','main_image',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(311,006,'������ �츮 ��ũ�� Ű�� B_����1.jpg','admin','sub_image1',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(312,007,'������ �츮 ������ ��ƼĿ_����.jpg','admin','main_image',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(313,007,'������ �츮 ������ ��ƼĿ_����1.jpg','admin','sub_image1',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(314,008,'������ �츮 A5 ��Ʈ_����.jpg','admin','main_image',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(315,008,'������ �츮 A5 ��Ʈ_����1.jpg','admin','sub_image1',TO_DATE('22/10/17','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(316,009,'��� ���� ���ӽ� ����Ʈ��_����.jpg','admin','main_image',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(317,009,'��� ���� ���ӽ� ����Ʈ��_����1.jpg','admin','sub_image1',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(318,010,'��� ���� ���ӽ� ����Ʈ��_����.jpg','admin','main_image',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(319,010,'��� ���� ���ӽ� ����Ʈ��_����1.jpg','admin','sub_image1',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(320,011,'��� ���� ���ӽ� ������ �ϵ� ���̽�_����.jpg','admin','main_image',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(321,011,'��� ���� ���ӽ� ������ �ϵ� ���̽�_����1.jpg','admin','sub_image1',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(322,012,'��� ���� ���ӽ� ������ �ϵ� ���̽�_����.jpg','admin','main_image',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(323,012,'��� ���� ���ӽ� ������ �ϵ� ���̽�_����1.jpg','admin','sub_image1',TO_DATE('22/10/18','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(324,013,'�ٸ����� ������ Ƽ���� A_����.jpg','admin','main_image',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(325,013,'�ٸ����� ������ Ƽ���� A_����1.jpg','admin','sub_image1',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(326,014,'�ٸ����� ������ Ƽ���� B_����.jpg','admin','main_image',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(327,014,'�ٸ����� ������ Ƽ���� B_����1.jpg','admin','sub_image1',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(328,015,'�ٸ����� ������ ���� �׷��� ���ڹ�_����.jpg','admin','main_image',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(329,015,'�ٸ����� ������ ���� �׷��� ���ڹ�_����1.jpg','admin','sub_image1',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(330,016,'�ٸ����� ������ ���� �к긯 ������_����.jpg','admin','main_image',TO_DATE('22/10/19','RR/MM/DD'));
insert into t_goods_image (image_id,goods_id,filename,reg_id,filetype,credate) VALUES(331,016,'�ٸ����� ������ ���� �к긯 ������_����1.jpg','admin','sub_image1',TO_DATE('22/10/19','RR/MM/DD'));


--------------------------------------------------------
-- insert t_shop_goods
--------------------------------------------------------

insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (1,'ȭ���ȯ','������ ��ũ�� Ű�� (����)','������ ��ũ�� Ű�� (����)',10000,3000,TO_DATE('22/10/16','RR/MM/DD'),'bestgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (2,'ȭ���ȯ','ȭ���ȯ ������ �ϵ����̽�','������ 13 �ϵ����̽� (����)',18000,3000,TO_DATE('22/10/16','RR/MM/DD'),NULL);
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (3,'ȭ���ȯ','ȭ���ȯ ������ �ϵ����̽�','������ S21 �ϵ����̽� (����)',18000,3000,TO_DATE('22/10/16','RR/MM/DD'),'bestgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (4,'ȭ���ȯ','ȭ���ȯ ���� �׷��� ���ڹ�','���� �׷��� ���ڹ�',25000,3000,TO_DATE('22/10/16','RR/MM/DD'),'newgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (5,'�����ǿ츮','������ �츮 ��ũ�� Ű�� A','������ ��ũ�� Ű�� (����)',11400,3000,TO_DATE('22/10/17','RR/MM/DD'),'bestgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (6,'�����ǿ츮','������ �츮 ��ũ�� Ű�� B','������ ��ũ�� Ű�� (����)',11400,3000,TO_DATE('22/10/17','RR/MM/DD'),'bestgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (7,'�����ǿ츮','������ �츮 ������ ��ƼĿ','������ ��ƼĿ - ��Ʈ��',3000,3000,TO_DATE('22/10/17','RR/MM/DD'),NULL);
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (8,'�����ǿ츮','������ �츮 A5 ��Ʈ','A5 ��Ʈ',3200,3000,TO_DATE('22/10/17','RR/MM/DD'),'newgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (9,'����������ӽ�','��� ���� ���ӽ� ����Ʈ��','����Ʈ�� ȭ��Ʈ (����/����)',10000,3000,TO_DATE('22/10/18','RR/MM/DD'),'bestgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (10,'����������ӽ�','��� ���� ���ӽ� ����Ʈ��','�� ��Ʈ�� (������ ����)',11000,3000,TO_DATE('22/10/18','RR/MM/DD'),NULL);
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (11,'����������ӽ�','��� ���� ���ӽ� ������ �ϵ� ���̽�','������ 14 PRO �ϵ����̽� (����)',18000,3000,TO_DATE('22/10/18','RR/MM/DD'),NULL);
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (12,'����������ӽ�','��� ���� ���ӽ� ������ �ϵ� ���̽�','������ S21 �ϵ����̽� (����)',18000,3000,TO_DATE('22/10/18','RR/MM/DD'),'newgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (13,'�ٸ����ֱ�����','�ٸ����� ������ Ƽ���� A','��� 76600 ���� Ƽ����',37000,3000,TO_DATE('22/10/19','RR/MM/DD'),NULL);
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (14,'�ٸ����ֱ�����','�ٸ����� ������ Ƽ���� B','����Ʈ �÷��� 1717',29000,3000,TO_DATE('22/10/19','RR/MM/DD'),'bestgoods');
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (15,'�ٸ����ֱ�����','�ٸ����� ������ ���� �׷��� ���ڹ�','���� �׷��� ���ڹ�',32000,3000,TO_DATE('22/10/19','RR/MM/DD'),NULL);
insert into t_shop_goods (goods_id,goods_sort,goods_title,goods_writer_intro,goods_price,goods_delivery_price,goods_delivery_date,goods_status) VALUES (16,'�ٸ����ֱ�����','�ٸ����� ������ ���� �к긯 ������','���� �к긯 ������ (70X110)',26000,3000,TO_DATE('22/10/19','RR/MM/DD'),'newgoods');


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
							 values('admin','admin','������','010');







