CREATE DATABASE BBS;
USE BBS;

show databases;

create table USER(
    userID varchar(20),
    userPassword varchar(20),
    userName varchar(20),
    userGender varchar(20),
    userEmail varchar(50),
    primary key(userID)
);

desc user;

INSERT INTO USER VALUES('gildong', '123456', '홍길동', '남자', 'gildong@naver.com');
INSERT INTO USER VALUES('ggoomter', '0070', '배성원', '남자', 'ggoomter@naver.com');
COMMIT;
SELECT * FROM USER;


/* 게시판 */
USE BBS;

drop table BBS;

create table BBS(
	bbsID INT,
	bbsTitle VARCHAR(50),
	userID VARCHAR(20),
	bbsDate DATETIME,
	bbsContent VARCHAR(2048),
	bbsAvailable INT,
	primary key (bbsID)
);

alter table BBS add VIEWCOUNT INT default 0; 

select * from BBS;

insert into BBS values (3, '3번글', 'ggoomter', now(), '아무내용', 1);
insert into BBS values (4, '4번글', 'ggoomter', now(), '아무내용', 1);
insert into BBS values (5, '5번글', 'ggoomter', now(), '아무내용', 1);
insert into BBS values (6, '6번글', 'ggoomter', now(), '아무내용', 1);
insert into BBS values (7, '7번글', 'ggoomter', now(), '아무내용', 1);
insert into BBS values (8, '8번글', 'ggoomter', now(), '아무내용', 1);
insert into BBS values (9, '9번글', 'ggoomter', now(), '아무내용', 1);
insert into BBS values (10, '10번글', 'ggoomter', now(), '아무내용', 1);
insert into BBS values (11, '11번글', 'ggoomter', now(), '아무내용', 1);
insert into BBS values (12, '12번글', 'ggoomter', now(), '아무내용', 1);



set @bbsNum := (select MAX(bbsID) from BBS);
INSERT INTO bbs.bbs
(bbsID, bbsTitle, userID, bbsDate, bbsContent, bbsAvailable, VIEWCOUNT)
VALUES(@bbsNum+1, concat(@bbsNum+1,'번글'), 'ggoomter', '2021-11-13 19:42:52', '아무내용', 1, 0);


commit;



/* 댓글 */
drop table COMMENT;

/* 댓글 테이블 생성 */
create table comment(
    bbsID int,    
    commentID int,
    commentText varchar(100),
    userID varchar(20),
    commentDate varchar(50)
);

/* PK, FK 추가 */
alter table comment add primary key (commentID, bbsID); 
alter table comment add constraint bbsID_FK foreign key (bbsID) references bbs(bbsID);
ALTER TABLE comment MODIFY commentID INT not null auto_increment;
select max(bbsid), commentid from comment group by bbsID ;



select * from BBS;
select * from comment order by bbsid, commentID ;
select * from user;


/* 직접 대입 정석 */
insert into COMMENT (bbsID, commentID, COMMENTTEXT, USERID, commentDate) values (1, 1, "집에서 댓글", 'ggoomter', now());
insert into COMMENT (bbsID, commentID, COMMENTTEXT, USERID, commentDate) values (1, 2, "집에서 댓글", 'ggoomter', now());
insert into COMMENT (bbsID, commentID, COMMENTTEXT, USERID, commentDate) values (2, 1, "집에서 댓글", 'gildong', now());
insert into COMMENT (bbsID, commentID, COMMENTTEXT, USERID, commentDate) values (2, 3, "집에서 댓글", 'ggoomter', now());
insert into COMMENT (bbsID, commentID, COMMENTTEXT, USERID, commentDate) values (3, 1, "집에서 댓글", 'gildong', now());
insert into COMMENT (bbsID, commentID, COMMENTTEXT, USERID, commentDate) values (3, 2, "집에서 댓글", 'ggoomter', now());
insert into COMMENT (bbsID, commentID, COMMENTTEXT, USERID, commentDate) values (3, 3, "집에서 댓글", 'gildong', now());
insert into COMMENT (bbsID, commentID, COMMENTTEXT, USERID, commentDate) values (3, 4, "집에서 댓글", 'ggoomter', now());

/* 이러면 보드id와 상관없이 계속 증가함 */
insert into COMMENT (bbsID, COMMENTTEXT, USERID, commentDate) values (1, "집에서 댓글", 'ggoomter', now());
insert into COMMENT (bbsID, COMMENTTEXT, USERID, commentDate) values (1, "집에서 댓글", 'ggoomter', now());
insert into COMMENT (bbsID, COMMENTTEXT, USERID, commentDate) values (2, "집에서 댓글", 'ggoomter', now());
insert into COMMENT (bbsID, COMMENTTEXT, USERID, commentDate) values (2, "집에서 댓글", 'ggoomter', now());

/* 어렵지만 정석 방법 */
insert into COMMENT
(bbsID, commentID, commentText, userID , commentDate)
values
(
    ${bbsID}, 
    (select coalesce(max(commentID), 0) + 1
    from COMMENT
    where bbsID = ${bbsID}),
    "집에서 댓글",
    'ggoomter',
    now()
);

/* 동적 파라미터 바인딩 */
select ? from dual;
select ${now} from dual;