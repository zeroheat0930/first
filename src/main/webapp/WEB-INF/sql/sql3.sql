use untact;

CREATE TABLE tbl_product (
product_seq int(10) PRIMARY KEY,
	product_price int(255)  NOT NULL,
	product_quantity int(255)  NOT NULL,
	product_seller int(255)  NOT NULL,
	product_name VARCHAR(255) NOT NULL,
	user_nickname VARCHAR(255) NOT NULL,
	product_filename VARCHAR(255) NOT NULL,
	product_info VARCHAR(255) NOT NULL,
    category_seq int(255)  NOT NULL,
    product_readcnt	int(255)  NOT NULL,
    product_status int(255)  NOT NULL,
    product_regdate DATE,
    product_updatedate DATE,
    product_like int(255)  NOT NULL
    );
  
  
  SELECT     product_seq, product_name, product_price, product_quantity, product_seller, product_filename,      product_info, category_seq, product_readcnt, product_status, product_regdate, product_updatedate,      user_nickname, product_like     FROM     (      SELECT        ROW_NUMBER() OVER ( ORDER BY                 product_readcnt DESC                ) rn, product_seq, product_name, product_price, product_quantity, product_seller,        product_filename, product_info, category_seq, product_readcnt, product_status, product_regdate,        product_updatedate, user_nickname, product_like    FROM       tbl_product                          )    WHERE     rn BETWEEN (? - 1) * ? + 1 AND ? * ?
