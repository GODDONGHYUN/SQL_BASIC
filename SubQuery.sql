USE practice_sql;

# 서브 쿼리 : 쿼리 내부에 위치하는 또 다른 쿼리 -> 쿼리 결과를 조건이나 테이블로 사용 할 수 있도록 함

# WHERE 절에서 서브쿼리 : 쿼리 결과를 조건으로 사용하여 조건을 동적으로 지정
-- from에서 code를 입력해야 하는게 컬럼 하나에 대해서 하나의 값을 사용해야하는데 *나 다른 걸 넣게되면 작동 안돼
-- 서브 쿼리에서 받아오려는게 하나의 값을 필요로하는지 확인을 해야함 ! -> 여러 개 사용시 in이나 다른 연산자 사용 가능
SELECT * FROM employee
WHERE department_code = (
	SELECT code FROM department WHERE name = '인사부'
);