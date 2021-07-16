CREATE SEQUENCE reply_seq
increment by 10
start with 10;

create sequence user_seq
increment by 10
start with 10;

create sequence reply_boardseq
increment by 10
start with 10;

create sequence gq_seq
increment by 10
start with 10;

create sequence free_seq
increment by 10
start with 10;

create sequence category_seq
increment by 10
start with 10;

create sequence order_seq
increment by 10
start with 10;

create sequence product_seq
increment by 10
start with 10;

create sequence productOption_seq
increment by 10
start with 10;

create table tbl_qaboard(
qa_seq NUMBER(10) PRIMARY KEY,
	qa_category VARCHAR (50) NOT NULL,
	qa_title VARCHAR2(30) NOT NULL,
	qa_content varchar2(3000) not null,
	qa_writer varchar2(30) not null,
	qa_regdate date,
    qa_readcnt NUMBER(10) default 0,
    qa_updatedate date,
    qa_secret varchar2(50) default '공개',
    qa_status varchar2(50) default '답변 예정',
    qa_replycnt number(10) default 0,
    qa_replycnt_admin number(10) default 0,
    qa_filename varchar2(3000)
    );
    
create table tbl_freeboard(
free_seq NUMBER(10) PRIMARY KEY,
	free_title VARCHAR2 (50) NOT NULL,
	free_content VARCHAR2(3000) NOT NULL,
	free_writer varchar2(30) not null,
	free_nickname varchar2(30) not null,
	free_notice NUMBER(10) default 0,
    free_readCnt NUMBER(10) default 0,
    free_regdate date,
    free_updatedate date,
    free_replyCnt NUMBER(10) default 0
    ); 
    
    create table tbl_reply(
reply_seq NUMBER(10) PRIMARY KEY,
	reply_content VARCHAR2(3000) NOT NULL,
	reply_writer VARCHAR2(30) NOT NULL,
	reply_regdate DATE,
	reply_updatedate DATE,
	reply_boardname VARCHAR2(10) NOT NULL,
    reply_boardseq NUMBER(10) NOT NULL,
    reply_filename VARCHAR2(3000),
    reply_nickname varchar2 (30) not null
    );

 create table tbl_user(
user_seq NUMBER(10) PRIMARY KEY,
	user_id varchar2(30) NOT NULL,
	user_name VARCHAR2(30) NOT NULL,
	user_nickname VARCHAR2(30) NOT NULL,
	user_password VARCHAR2(100) NOT NULL,
	user_address VARCHAR2(100) NOT NULL,
    user_addresscode VARCHAR2(30) NOT NULL,
    user_email VARCHAR2(100),
    user_phone VARCHAR2(30) NOT NULL,
    user_gender VARCHAR2(30),
    user_birth VARCHAR2(30) NOT NULL,
    user_grade number(38),
    user_point number(38),
    user_regdate date,
    eventCheck number(38)
    );

 create table tbl_productlike(
product_seq NUMBER(10),
	user_seq number(10)
    );

create sequence order_productseq
increment by 10
start with 10;

create sequence order_userseq
increment by 10
start with 10;

create sequence order_poseq
increment by 10
start with 10;

create table tbl_order(
order_seq number(10) primary key,
order_status number(38) default 0,
order_date date,
order_productseq number(10) default 0,
order_filename varchar2(100) default 0,
order_poseq number(10) not null,
order_poname varchar2(100) not null,
order_poprice number(38) not null,
order_quantity number(38) not null,
order_userseq number(10) not null,
order_username varchar2(100) not null,
order_useraddress varchar2(100) not null,
order_userphone varchar2(100) not null
);

create table tbl_productoption(
productoption_seq number(10) primary key,
product_seq number(10) not null,
po_name varchar2(100) not null,
po_quantity number(38) not null,
po_price number(38) not null
);

create sequence rev_seq
increment by 10
start with 10;

create table tbl_reviewboard(
rev_seq number(10) primary key,
rev_category varchar2(100) not null,
rev_title varchar2(100) not null,
rev_content varchar2(100) not null,
rev_writer varchar2(100) not null,
rev_readCnt number(10) default 0,
rev_filename varchar2(100) not null,
rev_good number(10) not null,
rev_hate number(10) not null,
rev_regdate varchar2(100) not null,
rev_updatedate varchar2(100) not null,
rev_replyCnt number(10) default 0
);

create table tbl_product(
product_seq number(10) primary key,
product_price number(38) not null,
product_quantity number(38) not null,
product_seller number(38) not null,
product_name varchar2(100) not null,
user_nickname varchar2(100) not null,
product_filename varchar2(100) not null,
product_info varchar2(100) not null,
category_seq number(10) not null,
product_readcnt number(38) default 0,
product_status number(38) default 0,
product_regdate date,
product_updatedate date,
product_like number(38) default 0
);

