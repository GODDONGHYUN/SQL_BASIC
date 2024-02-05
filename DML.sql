use practice_sql;
# DML
-- 테이블에 데이터를 삽입, 조회, 수정, 삭제할때 사용

# INSERT : 테이블에 데이터를 삽입하는 명령어

-- 1. 모든 열에 대하여 데이터 삽입
-- INSERT INTO 테이블 명 VALUES (데이터1, 데이터2 ... );
-- 반드시 그 해당 테이블에 대한 컬럼 타입에 맞는 데이터를 넣어줘야함 !
INSERT INTO example_table VALUES('문자열데이터', '텍스트데이터', 99, 3.14, 3.14, true, '2024-02-05', now());

-- 2. 특정 열에 데이터 삽입
-- INSERT INTO 테이블 명 (column1, column2, column3, ...) VALUES (데이터1, 데이터2, 데이터3 ...);
INSERT INTO example_table (int_column, boolean_column) VALUES (50, false);