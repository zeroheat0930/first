CREATE DATABASE untact;
USE untact;

CREATE TABLE tbl_reply (
reply_seq int(10) PRIMARY KEY,
	reply_content VARCHAR(3000) NOT NULL,
	reply_writer VARCHAR(30) NOT NULL,
	reply_regdate DATE,
	reply_updatedate DATE,
	reply_boardname VARCHAR(10) NOT NULL,
	reply_boardseq INT(10) NOT NULL,
	reply_filename VARCHAR(3000)
    );
    
