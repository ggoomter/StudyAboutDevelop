--tablespace 조회
select * from dba_tablespaces;
--tablespace 생성
create tablespace [테이블스페이스명] datafile 'C:\oraclexe\app\oracle\oradata\XE\[테이블스페이스명].dbf' size 500m;
--uwer default tablesapce 변경
alter user ggoomter default tablespace SYSTEM;

--전체 테이블 조회
select * from all_tables where tablespace_name = 'C##GGOOMTER';
select * from all_tables where owner = '[유저명]';
select * from all_tables where tablespace_name = '[테이블스페이스명]';



--계정. 오라클 12c부터는 대소문자 구분한다.
전역 데이터베이스 이름 : orcl
포트 : 1521
SYS 	: 오라클 db관리자, super USER.  DATA dictionary 를 가지고있음. 현재 비번 sys1234
SYSTEM 	: SYS와 동일하지만 DB를 생성할 권한이 없음. 현재 비번 sys1234
SCOTT 	: 오라클에서 제공하는 샘플 사용자 계정. 		기본 비번 : tiger
root   : mysql에서 최고 관리자    내 비번 : system1234
ggoomter	: 내가 주로 쓰는 계정   0070


<관리자로 접속>
일반유저처럼 접속하면 안된다.
유저 id 치는곳에서  아이디 as sysdba


<비밀번호 만료 푸는것. 보통 180일>
1. 관리자로 접속
connect SYS as sysdba
2. 만료기한 확인
select * from dba_profiles where profile = 'DEFAULT';
3. 만료기한 무한으로 변경
alter profile default limit password_life_time unlimited;
4. 계정 락 해제
alter user 계정명 account unlock;

<대소문자>
11g버전부터 대소문자 구분함;
그런데 orage나 dbeaver나 이런 툴에서 자동으로 대문자로 바꾸거나 하는 작업이 있음.
show PARAMETER sec_case;



<사용자 생성>
CREATE USER 아이디 IDENTIFIED BY 비번;
use mysql;
CREATE USER c##ggoomter IDENTIFIED BY 0070;
CREATE USER c##SCOTT IDENTIFIED BY TIGER;
-- 오라클 12c부터 계정이름앞에 c##을 붙여줘야 한다. 따옴표도 없어야 한다.
-- 예전 방식으로 하고 싶다면 ALTER SESSION SET "_ORACLE_SCRIPT"=true;


create user ggoomter@localhost identified by '0070';	-- mysql
create user scott@localhost identified by 'tiger';	-- mysql
create user gganbu@localhost identified by 'world';	-- mysql



<비번 변경>
ALTER USER 계정명 IDENTIFIED BY 새비번;
alter user 'root'@'localhost' IDENTIFIED by 'system1234';

<사용자 정보조회>;
SELECT * FROM ALL_USERS WHERE USERNAME = 'C##SCOTT'; -- oracle

use mysql;
SELECT * FROM user WHERE user = 'scott';	-- mysql

<사용자 삭제>
DROP USER 사용자명;
