use erd;

CREATE TABLE `Student` (
	`name`	varchar(20)	NOT NULL,
	`gender`	varchar(2)	NULL,
	`age`	int(2)	NULL
);

CREATE TABLE `Subject` (
	`code`	varchar(20)	NOT NULL,
	`name`	varchar(20)	NULL,
	`teacher_name`	varchar(20)	NULL
);

CREATE TABLE `Test` (
	`code`	varchar(20)	NOT NULL,
	`name`	varchar(20)	NOT NULL,
	`score`	int(3)	NULL
);

ALTER TABLE `Student` ADD CONSTRAINT `PK_STUDENT` PRIMARY KEY (
	`name`
);

ALTER TABLE `Subject` ADD CONSTRAINT `PK_SUBJECT` PRIMARY KEY (
	`code`
);

ALTER TABLE `Test` ADD CONSTRAINT `PK_TEST` PRIMARY KEY (
	`code`,
	`name`
);

ALTER TABLE `Test` ADD CONSTRAINT `FK_Subject_TO_Test_1` FOREIGN KEY (
	`code`
);


REFERENCES `Subject` (
	`code`
);

ALTER TABLE `Test` ADD CONSTRAINT `FK_Student_TO_Test_1` FOREIGN KEY (
	`name`
)
REFERENCES `Student` (
	`name`
);


insert into Student values('홍길동', '남', 20);
insert into Student values('아이유', '여',23);
insert into Student values('김철수', '남', 30);

insert into SUBJECT VALUES ('java001', '자바', '배성원');
insert into SUBJECT VALUES ('spring002', '스프링', '배성원');
insert into SUBJECT VALUES ('java002', '자바', '양우영');
select * from student;
select * from subject;
select * from test;

insert into test values('java001', '홍길동', 90);
insert into test values('java001', '아이유', 90);
insert into test values('spring002', '홍길동', 60);

