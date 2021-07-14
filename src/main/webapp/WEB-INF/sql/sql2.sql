use untact;

CREATE TABLE tbl_user (
user_seq int(10) PRIMARY KEY,
	user_id VARCHAR(255) NOT NULL,
	user_name VARCHAR(30) NOT NULL,
	user_nickname VARCHAR(255) NOT NULL,
	user_password VARCHAR(255) NOT NULL,
	user_address VARCHAR(255) NOT NULL,
	user_addresscode VARCHAR(255) NOT NULL,
	user_email	VARCHAR(255) NOT NULL,
    user_phone	VARCHAR(255) NOT NULL,
    user_gender	VARCHAR(30) NOT NULL,
    user_birth	VARCHAR(255) NOT NULL,
    user_grade	int(255)  NOT NULL,
    user_point	int(255)  NOT NULL,
    user_regdate DATE,
    eventCheck	int(255)  NOT NULL
    );
