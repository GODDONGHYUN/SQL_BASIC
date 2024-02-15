use practice_sql;



CREATE TABLE user (
 email VARCHAR(50) PRIMARY KEY,
 password VARCHAR(100) NOT NULL,
 nickname VARCHAR(20) NOT NULL UNIQUE ,
 tel_number VARCHAR(15) NOT NULL UNIQUE,
 address TEXT NOT NULL,
 adresss_detail TEXT ,
 profile_image TEXT,
 agreed_personal BOOLEAN NOT NULL
);

CREATE TABLE board (
	board_number INT PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
    contents TEXT NOT NULL,
    write_datetime DATETIME DEFAULT now() NOT NULL,
    favorite_count INT NOT NULL,
    comment_count INT NOT NULL,
    view_count 
);
