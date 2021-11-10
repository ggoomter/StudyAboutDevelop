select now() from dual;

select @@autocommit;
SET SQL_SAFE_UPDATES = 0;

USE SYS;
CREATE TABLE USER_TEST(
	ID	VARCHAR(30) primary KEY,
    PASSWORD VARCHAR(30),
    NAME VARCHAR(30),
    GENDER varchar(1)
);

DROP TABLE USER_TEST;

SELECT * FROM USER_TEST;

INSERT INTO USER_TEST
     VALUES
     (
		'GGOOMTER', '0070', '배성원', '남'
        'SUPERMAN', '1234', '슈퍼맨', '남'
     )
;

DELETE FROM USER_TEST WHERE ID = 'GGOOMTER';
     
    