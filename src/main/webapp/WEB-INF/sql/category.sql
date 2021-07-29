
CREATE TABLE tbl_category (
	category_seq INT(20) primary key auto_increment not null,
    category_main varchar(100) NOT NULL,
    category_sub varchar(100) NOT NULL
);

insert INTO tbl_category (category_main, category_sub)
values ('자가진단키트', '진단키트');

select * FROM tbl_category;