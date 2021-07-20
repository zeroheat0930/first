CREATE DATABASE untact;
USE untact;

create table tbl_qaboard(
qa_seq int(10) PRIMARY KEY,
	qa_category VARCHAR (50) NOT NULL,
	qa_title VARCHAR(30) NOT NULL,
	qa_content varchar(3000) not null,
	qa_writer varchar(30) not null,
	qa_regdate date,
    qa_readcnt int(10) default 0,
    qa_updatedate date,
    qa_secret varchar(50) default '공개',
    qa_status varchar(50) default '답변 예정',
    qa_replycnt int(10) default 0,
    qa_replycnt_admin int(10) default 0,
    qa_filename varchar(3000)
    );
    
create table tbl_freeboard(
free_seq int(10) PRIMARY KEY,
	free_title VARCHAR (50) NOT NULL,
	free_content VARCHAR(3000) NOT NULL,
	free_writer varchar(30) not null,
	free_nickname varchar(30) not null,
	free_notice int(10) default 0,
    free_readCnt int(10) default 0,
    free_regdate date,
    free_updatedate date,
    free_replyCnt int(10) default 0
    ); 
    
    create table tbl_reply(
reply_seq int(10) PRIMARY KEY,
	reply_content VARCHAR(3000) NOT NULL,
	reply_writer VARCHAR(30) NOT NULL,
	reply_regdate DATE,
	reply_updatedate DATE,
	reply_boardname VARCHAR(10) NOT NULL,
    reply_boardseq int(10) NOT NULL,
    reply_filename VARCHAR(3000),
    reply_nickname varchar (30) not null
    );

 create table tbl_user(
user_seq int(10) PRIMARY KEY,
	user_id varchar(30) NOT NULL,
	user_name VARCHAR(30) NOT NULL,
	user_nickname VARCHAR(30) NOT NULL,
	user_password VARCHAR(100) NOT NULL,
	user_address VARCHAR(100) NOT NULL,
    user_addresscode VARCHAR(30) NOT NULL,
    user_email VARCHAR(100),
    user_phone VARCHAR(30) NOT NULL,
    user_gender VARCHAR(30),
    user_birth VARCHAR(30) NOT NULL,
    user_grade int(38),
    user_point int(38),
    user_regdate date,
    eventCheck int(38)
    );

 create table tbl_productlike(
product_seq int(10),
	user_seq int(10)
    );

create table tbl_order(
order_seq int(10) primary key,
order_status int(38) default 0,
order_date date,
order_productseq int(10) default 0,
order_filename varchar(100) default 0,
order_poseq int(10) not null,
order_poname varchar(100) not null,
order_poprice int(38) not null,
order_quantity int(38) not null,
order_userseq int(10) not null,
order_username varchar(100) not null,
order_useraddress varchar(100) not null,
order_userphone varchar(100) not null
);

create table tbl_productoption(
productoption_seq int(10) primary key,
product_seq int(10) not null,
po_name varchar(100) not null,
po_quantity int(38) not null,
po_price int(38) not null
);


create table tbl_reviewboard(
rev_seq int(10) primary key,
rev_category varchar(100) not null,
rev_title varchar(100) not null,
rev_content varchar(100) not null,
rev_writer varchar(100) not null,
rev_readCnt int(10) default 0,
rev_filename varchar(100) not null,
rev_good int(10) not null,
rev_hate int(10) not null,
rev_regdate varchar(100) not null,
rev_updatedate varchar(100) not null,
rev_replyCnt int(10) default 0
);

create table tbl_product(
product_seq int(10) primary key,
product_price int(38) not null,
product_quantity int(38) not null,
product_seller int(38) not null,
product_name varchar(100) not null,
user_nickname varchar(100) not null,
product_filename varchar(100) not null,
product_info varchar(100) not null,
category_seq int(10) not null,
product_readcnt int(38) default 0,
product_status int(38) default 0,
product_regdate date,
product_updatedate date,
product_like int(38) default 0
);


create table tbl_category(
category_seq int(10) primary key,
category_main varchar(100) not null,
category_sub varchar(100) not null
);



insert into tbl_category 
    values (category_seq.nextval, '카테고리', '먼지차단마스크');
    insert into tbl_category 
    values (category_seq.nextval, '카테고리', '위생마스크');
    insert into tbl_category 
    values (category_seq.nextval, '카테고리', '마스크액세사리');
    insert into tbl_category 
    values (category_seq.nextval, '브랜드', 'AER');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', '에어데이즈');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', '크리넥스');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', '언더아머');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', '푸름웰니스');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', '미마마스크');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', '해오름');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', '미마');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', '에어퀸');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', '웰킵스');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', 'ETIQA');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', '애니가드');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', '네퓨어');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', '휴안청');
        insert into tbl_category 
    values (category_seq.nextval, '브랜드', '닥터퓨리');
         insert into tbl_category 
    values (category_seq.nextval, '차단지수', 'KF94/N95');
            insert into tbl_category 
    values (category_seq.nextval, '차단지수', 'KA-AD');
            insert into tbl_category 
    values (category_seq.nextval, '차단지수', 'KF80');
            insert into tbl_category 
    values (category_seq.nextval, '차단지수', 'KF99/N99');
            insert into tbl_category 
    values (category_seq.nextval, '키워드추천', '덴탈마스크');
              insert into tbl_category 
    values (category_seq.nextval, '키워드추천', '새부리형마스크');
                insert into tbl_category 
    values (category_seq.nextval, '키워드추천', '비말차단마스크');
              insert into tbl_category 
    values (category_seq.nextval, '키워드추천', '스포츠마스크');
                insert into tbl_category 
    values (category_seq.nextval, '키워드추천', '컬러마스크');
              insert into tbl_category 
    values (category_seq.nextval, '키워드추천', '검정마스크');
                insert into tbl_category 
    values (category_seq.nextval, '키워드추천', '국산마스크');
              insert into tbl_category 
    values (category_seq.nextval, '키워드추천', '여름마스크');
                insert into tbl_category 
    values (category_seq.nextval, '키워드추천', '유아마스크');
              insert into tbl_category 
    values (category_seq.nextval, '키워드추천', '운동');
                insert into tbl_category 
    values (category_seq.nextval, '키워드추천', '쿨마스크');
              insert into tbl_category 
    values (category_seq.nextval, '키워드추천', '어린이마스크');
