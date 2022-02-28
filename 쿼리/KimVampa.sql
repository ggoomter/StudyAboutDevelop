DROP TABLE VAM_BOARD ;
create table vam_board (
    bno NUMBER generated always as IDENTITY,
    title varchar2(150) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate,
    constraint pk_board PRIMARY key(bno)
);
SELECT * FROM VAM_BOARD vb ;


CREATE TABLE vam_user(
    id varchar2(100),
    password varchar2(100),
    name varchar2(100),
    constraint pk_user PRIMARY key(id)
);
SELECT * FROM vam_user;
SELECT SYSDATE FROM DUAL;


insert into vam_board(title, content, writer) values ('테스트 제목', '테스트 내용', '작가');
insert into vam_board(title, content, writer) values ('테스트 제목', '테스트 내용', '작가');
insert into vam_board(title, content, writer) values ('테스트 제목', '테스트 내용', '작가');
COMMIT;
SELECT * FROM VAM_BOARD vb ;

create sequence
   vam_board_seq
  increment by 1
  start with 1;
  
insert into vam_board(bno, title, content, writer) values (vam_board_seq.NEXTVAL, '테스트 제목', '테스트 내용', '작가');
insert into vam_board(bno, title, content, writer) values (vam_board_seq.NEXTVAL, '테스트 제목', '테스트 내용', '작가');
insert into vam_board(bno, title, content, writer) values (vam_board_seq.NEXTVAL, '테스트 제목', '테스트 내용', '작가');


 
select * from vam_board ORDER BY bno desc;
select * from vam_board where bno = 7;


-- 재귀 복사
insert into vam_board(bno, title,content,writer)(select vam_board_seq.NEXTVAL, title,content, writer from vam_board);
INSERT INTO 테이블명(컬럼명)(데이터);
SELECT 컬럼명 FROM 테이블명;
-- 행 확인
select count(*) from vam_board;
SELECT * FROM VAM_BOARD ORDER BY bno;
select * from vam_board where bno = 8;



-- 페이징. Rownum방식1
--vam_board의 모든 데이터를 최신순으로 나열해서 숫자를 붙이고 11~20번째만 보여주세요
select rn, bno, title, content, writer, regdate, updatedate from(
        select /*+INDEX_DESC(vam_board pk_board) */ rownum as rn, bno, title, content, writer, regdate, updatedate
        from vam_board)
        -- select rownum as rownum as rn, bno, title, content, writer, regdate, updatedate from vam_board order by bno desc
where rn between 11 and 20;

SELECT * FROM vam_board;
/* 제목 검색 */
select rn, bno, title, content, writer, regdate, updatedate from(
        select /*+INDEX_DESC(vam_board pk_board) */ rownum  as rn, bno, title, content, writer, regdate, updatedate 
        from vam_board where rownum <= 20  and title like '%새로%') 
where rn >= 11;
-- rownum <= 현재페이지에서 보여줄 마지막 인덱스     ==   현재페이지에서 보여줄 첫번째 인덱스 +   한페이지에 보여줄 글의 갯수-1  == 11+10-1 = 20
--rn >= 현재페이지에서 보여줄 첫번째 인덱스

/* 주제별 검색 */
select rn, bno, title, content, writer, regdate, updatedate from(
        select /*+INDEX_DESC(vam_board pk_board) */ rownum  as rn, bno, title, content, writer, regdate, updatedate 
        from vam_board where rownum <= 20 and 
        -- 작성자
        writer like '%mapper test%'    
        )
where rn >= 11;

UPDATE vam_board 
SET title = '새로'
  , content = '새로운내용'
  , writer = '꿈털이'
WHERE 
BNO BETWEEN 11 AND 30;
COMMIT;

UPDATE vam_board 
SET title = '수정제목'
  , content = '수정 내용'
  , writer = '배성원'
WHERE 
BNO BETWEEN 50 AND 70;

COMMIT;
-- 회원
SELECT * FROM vam_user;
insert into vam_user(id, password, name) values ('ggoomter', '0070', '배성원');

COMMIT;
