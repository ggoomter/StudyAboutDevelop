set sql_safe_updates=0;
use movieproject;
/* 해야되는것 */
-- 1. ID, NAME, AGE, GENDER, SCORE, DEPT_ID를 컬럼으로 가지는 USER 테이블 생성
-- 2. USER테이블에 4,5개 정도의 데이터 넣기 (중복된 데이터 넣어보기)
-- 3. 중복된 데이터 제거하고 중복없이 다시 insert
-- 4. PK추가
-- 5. 중복된 데이터 넣어보기
-- 6. 부서테이블 마찬가지 작업으로 4,5개 데이터 넣기
-- 이까지를 스스로할수있고, 데이터가 세팅되어있어야 JOIN연습으로 넘어감.



/* 테이블 삭제*/
DROP TABLE USER;

/* 테이블 생성 */
CREATE TABLE USER
(
    ID VARCHAR(20),
    NAME VARCHAR(20),
    AGE INT(3),
    GENDER VARCHAR(1),
    SCORE INT(3),
    DEPT_ID VARCHAR(20)
);

CREATE TABLE DEPT
(
    ID VARCHAR(20),
    NAME VARCHAR(20),
    UPPER_DEPT VARCHAR(20),
    MAX_EMPLOYEE INT(3)
);


/* 제약조건. pk추가 */
CONSTRAINT [제약조건명] [제약조건]([컬럼명])
ALTER TABLE 테이블명 ADD CONSTRAINT PK명 PRIMARY KEY (컬럼명1, 컬럼명2,...);   -- PK를 생성한다.
ALTER TABLE USER ADD CONSTRAINT PK1 PRIMARY KEY(ID);
ALTER TABLE DEPT ADD CONSTRAINT PK1 PRIMARY KEY(ID);
CONSTRAINT [FK명] foreign key(FK가 될 컬럼명) references PK가 위치하는 테이블 ([PK컬럼명])


/* 데이터입력 */
/*INSERT INTO 테이블명 VALUES(데이터1, 데이터2, ...)*/
INSERT INTO USER VALUES('ggoomter', '배성원', 30, '남', 90, '0002');
INSERT INTO USER VALUES('ggoomter2', '박진호', 70, '여', 55, '0005');
INSERT INTO USER VALUES('iu', '아이유', 20, '여', 93, '0021');
INSERT INTO USER VALUES('ujae', '유재석', 40, '남', 66, '0011');
INSERT INTO USER VALUES('gangho', '강호동', 50, '남', 50, '0012');
INSERT INTO USER VALUES('iu', '아이유', 20, '여', 93, '00021');

INSERT INTO DEPT VALUES ('0001', '기획부', NULL, 200);
INSERT INTO DEPT VALUES ('0002', '영업부', NULL, 200);
INSERT INTO DEPT VALUES ('0003', '개발부', NULL, 200);
INSERT INTO DEPT VALUES ('0004', '홍보부', NULL, 200);
INSERT INTO DEPT VALUES ('0005', '연구개발부', NULL, 200);
INSERT INTO DEPT VALUES ('0011', '기획재정부', '0001', 200);
INSERT INTO DEPT VALUES ('0021', '해외영업부', '0002', 200);

/* 데이터 수정 */
# UPDATE 테이블명 SET 컬럼명=바꿀값 WHERE 조건;
;UPDATE USER SET DEPT_ID = '00021' WHERE ID = 'iu';



/* 데이터 삭제 */
# DELETE FROM 테이블명 WHERE 조건;
;
DELETE FROM USER;
DELETE FROM USER WHERE id='iu' and dept_id = '00021';

/* 데이터 조회 */
SELECT * FROM USER;
SELECT * FROM DEPT;


# 1. id가 oo인 사람의 부서명이 무엇인가요?
SELECT DEPT.NAME FROM DEPT
LEFT JOIN USER
ON DEPT.ID = USER.DEPT_ID
WHERE USER.ID='ggoomter';

# 2. 성별이 '여'인 사원의 숫자는 몇명인가요?
SELECT COUNT(*) FROM USER WHERE GENDER = '여';

# 3. 상위부서가 없는 부서의 갯수는 몇개인가요?
SELECT COUNT(*) FROM DEPT WHERE UPPER_DEPT IS NOT NULL;

# 4. 부서ID가 '0011'에 속해있는 사원의 이름을 모두 보여주세요.
SELECT USER.NAME FROM USER INNER JOIN DEPT ON DEPT.ID = USER.DEPT_ID
WHERE DEPT.ID = '0011';

# 5. 당신회사의 모든 부서가 감당할수있는 최대사원의 합은 몇명인가요?
SELECT SUM(MAX_EMPLOYEE) FROM DEPT;
