SELECT SYSDATE FROM dual;
-- ctrl + enter : 현재 커서 줄 실행
-- 블락지정 alt x : 선택된문장 한꺼번에 실행

SELECT LENGTH('안녕하세요') FROM dual;

-- CREATE TABLE 테이블이름(
--    컬럼명 데이터타입 조건,
--    컬럼명 데이터타입 조건,
--    ...
--);
--테이블 삭제 
DROP TABLE 테이블명;
DROP TABLE EMPLOYEE;
			--테이블 생성
--직원 테이블
DROP TABLE EMPLOYEE;
CREATE TABLE EMPLOYEE
(
	ID VARCHAR2(20) ,
	NAME VARCHAR2(20) NOT NULL,
	AGE NUMBER(3),
	GENDER VARCHAR2(1),
	DEPT_ID VARCHAR2(20),
	CONSTRAINT pkAsEmp PRIMARY KEY(ID),
	CONSTRAINT uniqueName UNIQUE (NAME),
	CONSTRAINT foreignDeptId FOREIGN KEY(DEPT_ID) REFERENCES DEPT(ID)
);

-- 제약조건 삭제
ALTER TABLE EMPLOYEE DROP CONSTRAINT foreignDeptId;   

--외래키 제약조건에 CASCADE 조건 달기
ALTER TABLE EMPLOYEE 
ADD FOREIGN KEY (DEPT_ID) 
REFERENCES DEPT (ID)
ON DELETE CASCADE;

CREATE TABLE EMPLOYEES
(


)
INSERT INTO EMPLOYEES VALUES (


)

--부서 테이블
DROP TABLE DEPT;
CREATE TABLE DEPT
(
	ID VARCHAR2(20),
	NAME VARCHAR2(20),
	UPPER_DEPT_ID VARCHAR2(20),
	MAX_EMPLOYEE NUMBER(3),
	CONSTRAINT pkAsDept PRIMARY KEY(ID)
);


-- 데이터 삽입 문법 INSERT INTO 테이블명(컬럼1, 컬럼2, ...) VALUES( 데이터1, 데이터2, ...)
INSERT INTO EMPLOYEE (ID, NAME, AGE, GENDER, DEPT_ID) VALUES ('bae001', '배성원', 35, 'm', '001');
INSERT INTO EMPLOYEE (ID, NAME, AGE, GENDER, DEPT_ID) VALUES ('bruceLee', '이소룡', 35, 'm', '002');
INSERT INTO EMPLOYEE (ID, NAME, AGE, GENDER, DEPT_ID) VALUES ('steveJobs', '스티브잡스', 42, 'm', '003');
INSERT INTO EMPLOYEE (ID, NAME, AGE, GENDER, DEPT_ID) VALUES ('iu', '아이유', 25, 'w', '004');
INSERT INTO EMPLOYEE (ID, NAME, AGE, GENDER, DEPT_ID) VALUES ('leesengchul', '이승철', 43, 'm', '002');
INSERT INTO EMPLOYEE (ID, NAME, AGE, GENDER, DEPT_ID) VALUES ('Machel Jordan', '마이클조던', 40, 'm', null);
INSERT INTO EMPLOYEE (ID, NAME, AGE, GENDER, DEPT_ID) VALUES ('jisungPark', '박지성', 39, 'm', '007');
INSERT INTO EMPLOYEE (ID, NAME, AGE, GENDER, DEPT_ID) VALUES ('chulsooPark', '박철수', 20, 'm', null);
COMMIT;
INSERT INTO DEPT (ID, NAME, UPPER_DEPT_ID, MAX_EMPLOYEE) VALUES('001', '기획부', null, 300);
INSERT INTO DEPT (ID, NAME, UPPER_DEPT_ID, MAX_EMPLOYEE) VALUES('002', '기획재정부', 001, 50);
INSERT INTO DEPT (ID, NAME, UPPER_DEPT_ID, MAX_EMPLOYEE) VALUES('003', '홍보부', null, 300);
INSERT INTO DEPT (ID, NAME, UPPER_DEPT_ID, MAX_EMPLOYEE) VALUES('004', '마케팅부', 003, 30);
INSERT INTO DEPT (ID, NAME, UPPER_DEPT_ID, MAX_EMPLOYEE) VALUES('005', '개발부', null, 600);
INSERT INTO DEPT (ID, NAME, UPPER_DEPT_ID, MAX_EMPLOYEE) VALUES('006', '프론트개발', 005, 100);
INSERT INTO DEPT (ID, NAME, UPPER_DEPT_ID, MAX_EMPLOYEE) VALUES('007', '백엔드개발', 005, 100);
INSERT INTO DEPT (ID, NAME, UPPER_DEPT_ID, MAX_EMPLOYEE) VALUES('000', 'CClass', null, 10);
-- 모든 컬럼에 대해서 넣을때는 컬럼을 안써줘도된다.

SELECT * FROM EMPLOYEE;
SELECT * FROM dept;

--!!!!UPDATE 문법!!!!     테이블명 SET 컬럼명=바꿀값 WHERE 조건;
--1. 최대사원수가 100명인 부서들의 최대사원수를 110명으로 늘려주세요.
UPDATE DEPT SET MAX_EMPLOYEE = 110 WHERE MAX_EMPLOYEE = 100;
--2. 박철수의 성별을 'w'로 바꿔주세요.
UPDATE EMPLOYEE SET GENDER = 'w' WHERE NAME = '박철수';
--3. 박철수의 나이를 박지성의 나이와 같게 바꿔주세요.
UPDATE EMPLOYEE SET AGE = (SELECT AGE FROM EMPLOYEE e WHERE NAME = '박지성') WHERE NAME='박철수';
--4. 부서명이 '프론트개발'과 '백엔드개발'의 이름을 각각 '프론트 개발', '백엔드 개발'로 바꿔주세요.
UPDATE DEPT SET NAME = '프론트 개발' WHERE NAME = '프론트개발';
UPDATE DEPT SET NAME = '백엔드 개발' WHERE NAME = '백엔드개발';
--5. 부서명이 개발로 끝나는 컬럼을 찾아 '개발' 문자열을 'DEV' 문자열로 바꿔주세요.
SELECT REPLACE (NAME, '개발', 'DEV') FROM DEPT;
UPDATE DEPT SET NAME = REPLACE (NAME, '개발', 'DEV') WHERE NAME LIKE '%개발';
SELECT * FROM DEPT;
--6. (아무사원도 없을때 )부서명이 'CClass'인 부서ID를 '008'로 바꿔주세요.
UPDATE DEPT SET ID = '008' WHERE NAME = 'CClass';
ROLLBACK;
COMMIT;
--6. (들어있는 사원이 있을때)부서명이 'CClass'인 부서ID를 '008'로 바꿔주세요.
		-- 박철수를 '000. CClass' 부서로 넣어주세요.
		-- 000을 008로 바꿔주세요.
UPDATE EMPLOYEE SET DEPT_ID = '000' WHERE NAME = '박철수' ;
UPDATE DEPT SET ID = '008' WHERE ID='000';
DELETE FROM DEPT WHERE ID = '000';	--000부서를 지웠다. 000부서에 등록되어있던 사원이 지워졌음.

-- 지우기전에 SELECT를 값을 확보해놓고 다시 고친내용으로 INSERT 하면되는데
-- 사실 이건 안좋은 방법.   PK는 이 테이블에서 이 행이 유일함을 식별해주는 역할.
	-- 업데이트든 딜리트든 PK는 건들지 않는다. 변하게 하면 시스템에 큰 문제를 불러일으킬수 있기 때문.
	-- 그래서 처음에 설계를 잘해야한다. 



- 먼저 딸린 자식들을 삭제하고 나도 삭제;
select CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME
from user_constraints
where CONSTRAINT_NAME = 'FOREIGNDEPTID' ; --이걸로 찾은 R_CONSTRAINT_NAME으로 다시 검색

select CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME
from user_constraints
where CONSTRAINT_NAME = 'PKASDEPT' ;	--PKASDEPT 나옴   테이블명은 DEPT

select * from EMPLOYEE where DEPT_ID = 'PK값';



DELETE EMPLOYEE WHERE DEPT_ID = '000' ON DELETE CASCADE;

--<조인문제>
--1. 이너조인 : 부서명이 기획재정부인 사원들의 이름을 보여주세요
SELECT E.NAME 
FROM EMPLOYEE E, DEPT D
WHERE E.DEPT_ID = D.ID
AND D.NAME ='기획재정부';
--2. left outer join : 모든 사원에 대해서 그 사원의 이름과 부서명을 보여주세요.
		--(단, 부서에 속해지 않은 사원도 보여주세요)
SELECT e.NAME AS 사원명 , d.NAME AS 부서
FROM EMPLOYEE e 
LEFT OUTER JOIN DEPT d 
ON e.DEPT_ID = d.ID ;

--3. 모든 사원에 대해서 그 사원의 이름과 부서명을 보여주세요. --단, 부서에 속한 사람만 보여주세요.
SELECT e.NAME AS 사원명 , d.NAME AS 속해있는부서
FROM EMPLOYEE e 
JOIN DEPT d 
ON e.DEPT_ID = d.ID ;

--4. 최고인원수가 300명 이상인 부서들에 속해있는 사원들의 아이디와 이름을 보여주세요.
--부서에 속해있지 않은 사람은 어떻게 할까요? 뺄까요? null로 표시할까요?  => null로 표시해주세요.
SELECT e.ID  AS 사원아이디 , e.NAME AS 사원명, d.NAME AS 부서명
FROM EMPLOYEE e 
RIGHT OUTER JOIN DEPT d 
ON e.DEPT_ID = d.ID 
WHERE MAX_EMPLOYEE >= 300;

--5. 사원이 할당되지 않은 부서의 max 인원을 다 합치면 몇명입니까? 
-- 1,2,3,4,7 부여.  5,6,0 사원없음. 600+100+10 = 710
--50% 힌트
SELECT D.ID, D.NAME , D.MAX_EMPLOYEE FROM DEPT D, EMPLOYEE E
WHERE E.DEPT_ID(+) = D.ID	--D가 기준이고 (+)가 낑겨옴
--80% 힌트
SELECT D.ID, D.NAME , D.MAX_EMPLOYEE FROM DEPT D, EMPLOYEE E
WHERE E.DEPT_ID(+) = D.ID	--D가 기준이고 (+)가 낑겨옴
AND E.DEPT_ID IS NULL;
--답(오라클 문법)
SELECT SUM(D.MAX_EMPLOYEE) 
  FROM DEPT D, EMPLOYEE E
WHERE E.DEPT_ID(+) = D.ID	--D가 기준이고 (+)가 낑겨옴
  AND E.DEPT_ID IS NULL;
--답(ANSI 문법)
SELECT SUM(D.MAX_EMPLOYEE) 
  FROM DEPT D LEFT JOIN EMPLOYEE E
    ON E.DEPT_ID = D.ID
  WHERE E.DEPT_ID IS NULL;
;

--6. 부서별로 등록된 사원이 몇명인지 보여주세요.  
	--등록된 사원이 없으면 어떻게할까요? 등록된 사원이 없으면 0명으로 표시

--group by 는 그룹으로 묶일놈 외에는 다 집계함수가 들어가야한다. MAX를 해봤자 값의 변화없다. 문법상 맞춘것.
SELECT d.ID , MAX(d.NAME) AS 부서명, COUNT(e.DEPT_ID) AS 사원수 
FROM EMPLOYEE e 
RIGHT OUTER JOIN DEPT d
   ON e.DEPT_ID = d.ID
GROUP BY d.ID
ORDER BY ID;

--7. 고급문제. 이승철이 속한 부서의 최고 나이많은 사람의 이름은 무엇입니까? 
SELECT e.NAME 
FROM EMPLOYEE e 
INNER JOIN DEPT d 
ON e.DEPT_ID=d.ID 
WHERE e.AGE=(
	SELECT MAX(AGE)
	  FROM EMPLOYEE 
      WHERE e.DEPT_ID=(SELECT DEPT_ID FROM EMPLOYEE WHERE name='이승철')
);
--추가문제. 상위부서가 없는 부서에 속해있는 사원들을 보여주세요.

-- 데이터 수정 UPDATE 테이블명 SET 컬럼명=바꿀값 WHERE 조건;
UPDATE EMPLOYEE SET ID = 'SteveJobs' WHERE ID = 'steveJobs';
SELECT * FROM EMPLOYEE e ;
SELECT * FROM DEPT d ;
COMMIT;
INSERT INTO EMPLOYEE (ID, NAME, AGE, GENDER, DEPT_ID) VALUES ('가짜놈', '가짜놈', 43, 'm', 'music');
ROLLBACK;	--마지막 커밋 상황으로 되돌린다.

-- 데이터 삭제 DELETE FROM 테이블명 WHERE 조건;
DELETE FROM EMPLOYEE WHERE NAME = '배성원';

-- 제약 조건 추가
CONSTRAINT [제약조건명] [제약조건]([컬럼명])


-- PK 지정
--1. 이미만들어진 테이블에 지정하는 방법
	-- ALTER TABLE 테이블명 ADD CONSTRAINT PK명 PRIMARY KEY (컬럼명1, 컬럼명2,...);   -- PK를 생성한다.
ALTER TABLE EMPLOYEE ADD CONSTRAINT pkAsEmp PRIMARY KEY (ID);
INSERT INTO EMPLOYEE (ID, NAME, AGE, GENDER, DEPT_ID) VALUES ('bruceLee2', '이소룡', 35, 'm', 'mashalart');
--2. 테이블을 만들때부터 지정하는 방법
테이블 CREATE문장 밑에 CONSTRAINT 별명 PRIMARY KEY(식별컬럼)
-- PK삭제
ALTER TABLE 테이블명 DROP CONSTRAINT 별명 ; 

-- PK조회
SELECT A.TABLE_NAME
     , A.CONSTRAINT_NAME
     , B.COLUMN_NAME     
     , B.POSITION
  FROM ALL_CONSTRAINTS  A
     , ALL_CONS_COLUMNS B
 WHERE A.TABLE_NAME      = 'EMPLOYEE'
   AND A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
 ORDER BY B.POSITION;

--WITH절 연습 : 임시로 만든 테이블을 재활용하고 싶을때, 어떤 결과를 반환하는 블록을 재활용하고 싶을때
WITH TEMP1 AS(
      SELECT 100 AS PRICE FROM DUAL
      UNION ALL
      SELECT 200 AS PRICE FROM DUAL
      UNION ALL
      SELECT 400 AS PRICE FROM DUAL
      UNION ALL
      SELECT 1500 AS PRICE FROM DUAL
      UNION ALL
      SELECT 0 AS PRICE FROM DUAL
      UNION ALL
      SELECT NVL(NULL,0) AS PRICE FROM DUAL
     )
 SELECT SUM(PRICE) FROM TEMP1;


-- 계층형 쿼리
		문법 : START WITH 최상위조건
		      CONNECT BY 계층조건;
SELECT D.ID, D.NAME, D.UPPER_DEPT_ID  FROM DEPT D
--START WITH D.UPPER_DEPT_ID IS NULL
CONNECT BY PRIOR D.UPPER_DEPT_ID = D.ID;

WITH T(SEQ, NM, PARENT_NM) AS (
	SELECT 1, '태조', NULL FROM DUAL
	UNION ALL
	SELECT 2, '정종', '태조' FROM DUAL
	UNION ALL
	SELECT 3, '태종', '태조' FROM DUAL
	UNION ALL
	SELECT 4, '세종', '태종' FROM DUAL
	UNION ALL
	SELECT 5, '문종', '세종' FROM DUAL
	UNION ALL
	SELECT 6, '단종', '문종' FROM DUAL
	UNION ALL
	SELECT 7, '세조', '세종' FROM DUAL
)
SELECT LEVEL
     , NM
     , LPAD(NM, LEVEL * 4, 'A') AS NM_2
FROM T
START WITH PARENT_NM IS NULL
CONNECT BY PRIOR NM = PARENT_NM;
//LPAD (값, 총문자길이, 채움문자)


--선생님이 준 댓글 데이터를 활용해서
1번글(borad_no=1)에 쓰여진 삭제되지 않은 댓글(delete_yn = 'n')을 계층형으로 보여주세요.;
with data AS(
    select 1 as comment_no, 1 as board_no, 2 as user_no, 0 as secret_yn, '1번째 댓글' as content, null as parent, 1 as depth, sysdate as write_date, null as modifier, sysdate as modify_date, 'n' as delete_yn from dual union all
    select 3 as comment_no, 1 as board_no, 2 as user_no, 0 as secret_yn, '댓글' as content, 1 as parent, 2 as depth, sysdate as write_date, null as modifier, sysdate as modify_date, 'n' as delete_yn from dual union all
    select 4 as comment_no, 1 as board_no, 2 as user_no, 0 as secret_yn, '댓글' as content, 1 as parent, 2 as depth, sysdate as write_date, null as modifier, sysdate as modify_date, 'n' as delete_yn from dual union all
    select 2 as comment_no, 1 as board_no, 1 as user_no, 0 as secret_yn, '댓글' as content, null as parent, 1 as depth, sysdate as write_date, null as modifier, sysdate as modify_date, 'n' as delete_yn from dual union all
    select 5 as comment_no, 1 as board_no, 1 as user_no, 0 as secret_yn, '댓글' as content, 2 as parent, 2 as depth, sysdate as write_date, null as modifier, sysdate as modify_date, 'n' as delete_yn from dual union all
    select 6 as comment_no, 1 as board_no, 1 as user_no, 0 as secret_yn, '댓글' as content, 2 as parent, 2 as depth, sysdate as write_date, null as modifier, sysdate as modify_date, 'n' as delete_yn from dual union all
    select 22 as comment_no, 1 as board_no, 1 as user_no, 0 as secret_yn, '댓글' as content, null as parent, 1 as depth, sysdate as write_date, null as modifier, sysdate as modify_date, 'n' as delete_yn from dual union all
    select 26 as comment_no, 1 as board_no, 2 as user_no, 0 as secret_yn, '댓글' as content, 22 as parent, 2 as depth, sysdate as write_date, null as modifier, sysdate as modify_date, 'n' as delete_yn from dual union all
    select 28 as comment_no, 1 as board_no, 1 as user_no, 0 as secret_yn, '댓글' as content, 26 as parent, 3 as depth, sysdate as write_date, null as modifier, sysdate as modify_date, 'n' as delete_yn from dual union all
    select 29 as comment_no, 1 as board_no, 2 as user_no, 0 as secret_yn, '댓글' as content, 26 as parent, 3 as depth, sysdate as write_date, null as modifier, sysdate as modify_date, 'n' as delete_yn from dual union all
    select 24 as comment_no, 1 as board_no, 1 as user_no, 0 as secret_yn, '댓글' as content, null as parent, 1 as depth, sysdate as write_date, null as modifier, sysdate as modify_date, 'n' as delete_yn from dual union all
    select 25 as comment_no, 1 as board_no, 1 as user_no, 0 as secret_yn, '댓글' as content, null as parent, 1 as depth, sysdate as write_date, null as modifier, sysdate as modify_date, 'n' as delete_yn from dual
)SELECT * FROM DATA;

SELECT  comment_no,
        board_no,
        user_no,
        secret_yn,
        LPAD('ㄴ', 2*(depth - 1)) || content AS content,
        parent,
        depth,
        write_date,
        modifier,
        modify_date,
        delete_yn
 FROM data
WHERE board_no = 1
  AND delete_yn = 'n'
 START WITH parent IS NULL
CONNECT BY PRIOR comment_no = parent;


--유저생성 문법 create user [id] identified by [pw];
CREATE USER c##ggoomter IDENTIFIED BY 0070;

-- 권한 부여 문법    GRANT [권한] TO [아이디];
GRANT ALL PRIVILEGES TO c##ggoomter; -- 모든권한부여
COMMIT;

-- 계정생성확인
SELECT * FROM ALL_USERS WHERE LOWER(USERNAME) = 'c##ggoomter';