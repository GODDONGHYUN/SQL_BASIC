USE practice_sql;

CREATE TABLE jeju2 AS SELECT * FROM jeju;
DROP TABLE jeju2;

UPDATE jeju2 
SET observe_date = '7월 상반기' WHERE observe_date 
BETWEEN '2023-07-01' AND '2023-07-15';
UPDATE jeju2 
SET observe_date = '7월 하반기' WHERE observe_date
BETWEEN '2023-07-16' AND '2023-07-31';
UPDATE jeju2 
SET observe_date = '8월 상반기' WHERE observe_date 
BETWEEN '2023-08-01' AND '2023-08-15';
UPDATE jeju2
 SET observe_date = '8월 하반기' WHERE observe_date 
 BETWEEN '2023-08-16' AND '2023-08-31';
UPDATE jeju2 
SET observe_date = '9월 상반기' WHERE observe_date 
BETWEEN '2023-09-01' AND '2023-09-15';
UPDATE jeju2 
SET observe_date = '9월 하반기' WHERE observe_date 
BETWEEN '2023-09-16' AND '2023-09-31';

SELECT * FROM jeju2;

# 그룹화(GROUP BY) :  레코드를 하나 이상의 컬럼으로 그룹화하여 결과를 도출하고자 할때 사용
-- 일반적으로 집계함수와 함께 사용됨
SELECT observe_date FROM jeju2 GROUP BY observe_date;
-- 이렇게 묶어서 쓰는건 의미가 없음
SELECT observe_date, speed_80m FROM jeju2 GROUP BY observe_date;
SELECT observe_date, speed_80m FROM jeju2 GROUP BY observe_date, speed_80m;

-- 각 월의 상, 하반기를 그룹화 하여 speed_80m의 평균 값 구하기
SELECT observe_date, AVG(speed_80m) FROM jeju2 GROUP BY observe_date;

# =================================================================================================================================================#

# 필터링 (HAVING) : 그룹화된 결과에 필터링을 적용하는 명령어
-- 주의 ! WHERE 절과 사용방법이 같지만 WHERE 절은 SELECT 이전에 실행 되고 HAVING 절은 SELECT 이후에 실행됨

-- 각 월의 speed_80m 평균 값들을 구해서 그 평균값을 조건에 맞게 필터링 
SELECT observe_date,
 AVG(speed_80m)
 AS avg FROM jeju2 
 GROUP BY observe_date 
 HAVING avg > 5.5;

-- 요건 에러발생 
SELECT observe_date,
 AVG(speed_80m) 
 AS avg FROM jeju2 
 GROUP BY observe_date 
 HAVING speed_80m > 5.5;
 
 -- speed_80m 가 5.5보다 큰 애들만 평균을 내서 그룹화
 SELECT observe_date,
 AVG(speed_80m) 
 AS avg FROM jeju2 
 WHERE speed_80m > 5.5
 GROUP BY observe_date;


