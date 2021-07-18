CREATE SEQUENCE reply_seq
increment by 1
start with 1;

/*drop sequence reply_Seq;*/

create sequence user_seq
increment by 1
start with 1;

/*drop sequence user_Seq;*/

create sequence reply_boardseq
increment by 1
start with 1;

/*drop sequence reply_boardseq;*/

create sequence Qa_seq
increment by 1
start with 1;

/*drop sequence qa_seq;*/

create sequence free_seq
increment by 1
start with 1;

/*drop sequence free_seq;*/

create sequence category_seq
increment by 1
start with 1;

/*drop sequence category_seq;*/

create sequence order_seq
increment by 1
start with 1;

/*drop sequence order_seq;*/

create sequence product_seq
increment by 1
start with 1;

/*drop sequence product_seq;*/

create sequence productOption_seq
increment by 1
start with 1;

/*drop sequence productoption_seq;*/

create sequence order_productseq
increment by 1
start with 1;

/*drop sequence order_productseq;*/

create sequence order_userseq
increment by 1
start with 1;

/*drop sequence order_userseq;*/

create sequence order_poseq
increment by 1
start with 1;

/*drop sequence order_poseq;*/

create sequence rev_seq
increment by 1
start with 1;

/*drop sequence rev_seq;*/


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


create table tbl_category(
category_seq number(10) primary key,
category_main varchar2(100) not null,
category_sub varchar2(100) not null
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
    
    commit;
    






        


