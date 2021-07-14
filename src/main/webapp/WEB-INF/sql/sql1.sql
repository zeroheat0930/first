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
    
INSERT INTO tbl_reply (reply_seq,reply_boardname,reply_boardseq,reply_content,reply_writer,reply_regdate) 
VALUES (reply_seq.nextval, 'RevBoard', 5, '댓글테스트', '정동준', sysdate);
        
 SELECT * FROM tbl_reply WHERE reply_boardname = 'RevBoard' AND reply_boardseq = 5;
 UPDATE tbl_reply SET reply_content = '댓글을 수정해보자' , reply_updatedate = SYSDATE WHERE reply_boardname = 'RevBoard' AND reply_seq = 21;
DELETE FROM tbl_reply WHERE reply_seq = 21;
        
SELECT reply_seq, reply_boardname, reply_boardseq, reply_content, reply_writer, reply_regdate, reply_updatedate 
FROM tbl_reply 
WHERE reply_boardseq = 231
AND reply_boardname = 'qaboard'
ORDER BY reply_seq ASC;