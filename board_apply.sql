use board;

-- 1번
INSERT INTO USER 
(email, password, nickname, tel_number, address, address_detail, agreed_personal)
VALUES ('email@email.com', 'P!ssw0rd','rose','010-1234-5678','부산광역시 사하구','낙동대로',true  );

-- 2번
UPDATE user
SET profile_image = 'https://cdn.onews.tv/news/photo/202103/62559_62563_456.jpg'
WHERE email = 'email@email.com';

-- 3번
INSERT INTO board (title, contents, write_datetime, favorite_count, comment_count, view_count, writer_email)
VALUES ('첫번째 게시물', '반갑습니다. 처음뵙겠습니다.', NOW(), 0, 0, 0, 'email2@email.com');

-- 외래키 제약 조건 위반 : user 테이블에 존재하지 않는 email 값을 입력해서 오류 발생

-- 4번

INSERT INTO board (title, contents, writer_email)
VALUES ('첫번째 게시물', '반갑습니다. 처음뵙겠습니다.', 'email@email.com');

-- 외래키 제약 조건 위반 : user 테이블에 존재하지 않는 email 값을 입력해서 오류 발생

-- 5번
INSERT INTO board_image (board_number, image_url)
VALUES (2, 'https://image.van-go.co.kr/place_main/2022/04/04/12217/035e1737735049018a2ed2964dda596c_750S.jpg');

-- 6번 
INSERT INTO favorite (user_email, board_number)
VALUES ('email@email.com', 2);

-- 7번
SELECT 
    b.board_number,
    b.title,
    b.contents,
    b.view_count,
    b.comment_count,
    b.favorite_count,
    b.write_datetime,
    u.email AS writer_email,
    u.profile_image AS writer_profile_image,
    u.nickname AS writer_nickname
FROM 
    board AS b
JOIN 
    user u ON b.writer_email = u.email;
    
-- 8번

CREATE VIEW board_view AS
SELECT 
    b.board_number,
    b.title,
    b.contents,
    b.view_count,
    b.comment_count,
    b.favorite_count,
    b.write_datetime,
    u.email AS writer_email,
    u.profile_image AS writer_profile_image,
    u.nickname AS writer_nickname
FROM 
    board AS b
JOIN 
    user u ON b.writer_email = u.email;

-- 9번 
SELECT *
FROM board_view
WHERE title LIKE '%반갑%' OR contents LIKE '%반갑%';

-- 10번
CREATE INDEX board_title_idx ON board (title);