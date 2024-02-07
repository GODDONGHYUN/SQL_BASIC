USE practice_sql;

# 서브 쿼리 : 쿼리 내부에 위치하는 또 다른 쿼리 -> 쿼리 결과를 조건이나 테이블로 사용 할 수 있도록 함

# WHERE 절에서의 서브쿼리 : 쿼리 결과를 조건으로 사용하여 조건을 동적으로 지정
-- WHERE 절에서 비교 연산으로 사용될 때 조회하는 컬럼의 개수 및 레코드 개수 주의
SELECT * FROM employee
WHERE department_code = (
	SELECT code FROM department WHERE name = '인사부'
);

# FROM 절에서의 서브쿼리 : 쿼리 결과 테이블을 다시 FROM 절에 사용하여 복합적인 테이블 조회
SELECT * FROM (
	SELECT name, department_code
    FROM employee
    WHERE department_code IS NOT NULL
) AS SQ
WHERE name = '홍길동';

SELECT * FROM (
	SELECT name, department_code
    FROM employee
    WHERE department_code IS NULL
) AS SQ
WHERE name = '홍길동';
SELECT * FROM (
	SELECT name AS employee_name, department_code
    FROM employee
    WHERE department_code IS NULL
) AS SQ
WHERE employee_name = '홍길동';

# =================================================================================================================================================================== #

-- 위에 조건은 테이블 하나만으로 조회를 할 수가 없고, 두 개의 테이블을 사용해야해서 JOIN을 쓰는게 맞고,
-- 밑에 조건은 테이블 하나만으로 조회가 가능하기 때문에 서브쿼리를 사용하는게 맞다.

-- 부서 이름이 '개발부'인 사원이름, 부서코드, 부서명을 조회

-- 부서 이름이 '개발부'인 사원이름, 부서코드를 조회 -> 조건으로 사용 가능한 코드를 먼저 작성하고 메인 쿼리 테이블에 대한 관계를 찾아주는게 좋다 
SELECT name, department_code
FROM employee
WHERE department_code = (
SELECT code
FROM department
WHERE name = '개발부'
);


