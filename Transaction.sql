USE practice_sql;

# Transaction : SQL로 작업하는 작업 단위

-- Transaction의 4가지 특성
-- Atomicity (원자성) : 트랜잭션은 모두 성공하거나 모두 실패해야 한다.
-- Consistency (일관성) : 트랜잭션의 작업 결과는 항상 일관성이 있어야 한다.
-- Isolation (독립성) : 트랜잭션은 모두 독립적이어야 한다.
-- Durablity (영구성) : 트랜잭션이 성공적으로 완료되면 영구히 반영되어야 한다.
-- 
-- 조회를 제외한 삽입, 수정 삭제 작업은 트랜잭션 작업을 해줘야 함 !

-- --------------------------------------------------------------------------------
-- 회원가입 : USER - email_authentication
-- 사용자는 아이디를 입력하고 중복 확인을 함
-- 만약 입력한 아이디가 중복된 아이디가 아니라면 
-- 비밀번호, 비밀번호 확인, 이메일을 입력 하고 이메일로 인증 번호를 전송
-- 사용자는 이메일에 전송된 인증 번호를 확인 후 입력하여 이메일 인증을 진행함
-- 이메일 인증을 완료한 후에 회원가입 버튼을 눌러서 회원가입을 마무리 함
-- 이 과정을 통해 진행되는 회원가입이라는 작업은 하나의 트랜잭션

CREATE TABLE user (
	id VARCHAR(100) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE email_authentication (
	email VARCHAR(255) PRIMARY KEY,
    authentication_code VARCHAR(4) NOT NULL
);

-- 사용자가 아이디를 'idddd'로 입력했다.

-- 1. 아이디 중복확인
SELECT * FROM user WHERE id = 'idddd';

-- 사용자가 비밀번호를 'p!ssw0rd', 비밀번호 확인을 'p!SSw0rd',
-- 이메일을 'emai@email.com', 서버가 생성한 코드는 'OCMD'이다.
-- 2. 이메일 인증 
INSERT email_authentication VALUES ('emai@email.com', 'OCMD');
SELECT * FROM email_authentication;

-- 서버가 지정한 이메일로 인증코드를 전송하고 사용자는 그 코드를 확인한 후 인증코드를 입력하여 인증함

-- 3. 이메일 인증확인
SELECT * FROM email_authentication WHERE email = 'emai@email.com' AND authentication_code = 'OCMD';

-- 4. 회원 가입 처리
INSERT user VALUES('idddd' ,'p!SSw0rd', 'emai@email.com');

# ------------------------------------------------------------------------------------------------
SHOW variables like '%commit%';
set AUTOCOMMIT = 0;

-- 트랜잭션 시작
START TRANSACTION; 

-- 사용자가 아이디를 'idddd'로 입력했다.

-- 1. 아이디 중복확인
SELECT * FROM user WHERE id = 'idddd3';

-- 사용자가 비밀번호를 'p!ssw0rd', 비밀번호 확인을 'p!SSw0rd',
-- 이메일을 'emai@email.com', 서버가 생성한 코드는 'OCMD'이다.
-- 2. 이메일 인증 
INSERT email_authentication VALUES ('email3@email.com', 'OCMD');
SELECT * FROM email_authentication;

-- 트랜잭션 초기상태로 변경 (최근 커밋 상태로 롤백  - 트랜잭션 취소)
ROLLBACK;

-- 트랜잭션 롤백 위치 지정 
SAVEPOINT A;

-- 서버가 지정한 이메일로 인증코드를 전송하고 사용자는 그 코드를 확인한 후 인증코드를 입력하여 인증함

-- 3. 이메일 인증확인
SELECT * FROM email_authentication WHERE email = 'email3@email.com' AND authentication_code = 'OCMD';

-- 4. 회원 가입 처리
INSERT user VALUES('idddd3' ,'p!SSw0rd3', 'email3@email.com');

-- 특정 세이브 보인트로 롤백
ROLLBACK TO SAVEPOINT A;

-- 트랜잭션 성공 처리(영구히 적용)
COMMIT;

SELECT * FROM user;
SELECT * FROM email_authentication;

# -----------------------------------------------------------------------------------------------

# LIMIT 갯수 : 결과 테이블에서ㅏ 지정한 갯수만큼의 상위 데이터만 보여줌
SELECT * FROM jeju LIMIT 10;

# LIMIT 제외 레코드 갯수, 갯수  : 상위에서 제외 레코드 갯수만큼 제외후 갯수만큼의 데이터만 보여줌 


SELECT * FROM jeju LIMIT 10, 3;
