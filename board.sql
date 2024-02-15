CREATE DATABASE board;
use board;
CREATE TABLE user (
    email VARCHAR(50) PRIMARY KEY,
    password VARCHAR(100) NOT NULL,
    nickname VARCHAR(20) NOT NULL UNIQUE,
    tel_number VARCHAR(15) NOT NULL UNIQUE,
    address TEXT NOT NULL,
    address_detail TEXT,
    profile_image TEXT, 
    agreed_personal TINYINT NOT NULL
);

CREATE TABLE board (
    board_number INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    contents TEXT NOT NULL,
    write_datetime DATETIME DEFAULT NOW() NOT NULL,
    favorite_count INT NOT NULL DEFAULT 0,
    comment_count INT NOT NULL DEFAULT 0, 
    view_count INT NOT NULL DEFAULT 0,
    writer_email VARCHAR(50) NOT NULL,
    FOREIGN KEY (writer_email)
    REFERENCES user (email)
);


CREATE INDEX idx_writer_email ON board (writer_email);

CREATE TABLE favorite (
    user_email VARCHAR(50),
    board_number INT AUTO_INCREMENT,
    PRIMARY KEY (user_email, board_number),
    FOREIGN KEY (user_email)
    REFERENCES user (email),
    FOREIGN KEY (board_number)
    REFERENCES board (board_number)
);
CREATE INDEX idx_user_email ON favorite (user_email);
CREATE INDEX idx_board_number ON favorite (board_number);


CREATE TABLE board_image (
    sequence INT AUTO_INCREMENT NOT NULL,
    board_number INT  AUTO_INCREMENT NOT NULL,
    image_url TEXT NULL,
    PRIMARY KEY (sequence),
    FOREIGN KEY (board_number)
    REFERENCES board (board_number)
);
CREATE INDEX idx_board_image_board_number ON board_image (board_number);


CREATE TABLE comment (
    comment_number INT AUTO_INCREMENT NOT NULL,
    contents TEXT NOT NULL,
    write_datetime DATETIME NOT NULL,
    comment_writer VARCHAR(50) NOT NULL,
    board_number INT NOT NULL,
    PRIMARY KEY (comment_number),
    FOREIGN KEY (comment_writer)
    REFERENCES user (email),
    FOREIGN KEY (board_number)
    REFERENCES board (board_number)
);
CREATE INDEX idx_comment_writer ON comment (comment_writer);
CREATE INDEX idx_board_number ON comment (board_number);


CREATE TABLE search_log (
    sequence INT AUTO_INCREMENT NOT NULL,
    search_word TEXT NOT NULL,
    relation_word VARCHAR(45) NULL,
    search_logcol TEXT NULL,
    relation TINYINT NOT NULL,
    PRIMARY KEY (sequence)
);
