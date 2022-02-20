create table vam_board (
    bno number,
    title varchar2(150) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate,
    constraint pk_board PRIMARY key(bno)
);


CREATE TABLE vam_user(
    id varchar2(100),
    password varchar2(100),
    name varchar2(100),
    constraint pk_user PRIMARY key(id)
);

SELECT SYSDATE FROM DUAL;

create sequence
   vam_board_seq
  increment by 1
  start with 1;
  
insert into vam_board(bno, title, content, writer) values (vam_board_seq.NEXTVAL, '테스트 제목', '테스트 내용', '작가');
insert into vam_board(bno, title, content, writer) values (vam_board_seq.NEXTVAL, '테스트 제목', '테스트 내용', '작가');
insert into vam_board(bno, title, content, writer) values (vam_board_seq.NEXTVAL, '테스트 제목', '테스트 내용', '작가');

 
select * from vam_board;
select * from vam_board where bno = 7;


-- 재귀 복사
insert into vam_board(bno, title,content,writer)(select vam_board_seq.NEXTVAL, title,content, writer from vam_board);
 
-- 행 확인
select count(*) from vam_board;
SELECT * FROM VAM_BOARD ORDER BY bno;
select * from vam_board where bno = 8;


-- 페이징. Rownum방식1
select rn, bno, title, content, writer, regdate, updatedate from(
        select /*+INDEX_DESC(vam_board pk_board) */ rownum as rn, bno, title, content, writer, regdate, updatedate
        from vam_board)
        -- select rownum as rownum as rn, bno, title, content, writer, regdate, updatedate from vam_board order by bno desc
where rn between 11 and 20;

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
