--계정. 오라클 12c부터는 대소문자 구분한다.
전역 데이터베이스 이름 : orcl
포트 : 1521
SYS 	: 오라클 db관리자, super USER.  DATA dictionary 를 가지고있음. 현재 비번 sys1234
SYSTEM 	: SYS와 동일하지만 DB를 생성할 권한이 없음. 현재 비번 sys1234
SCOTT 	: 오라클에서 제공하는 샘플 사용자 계정. 		기본 비번 : tiger
ggoomter	: 내가 주로 쓰는 계정


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


<사용자 생성>
CREATE USER 아이디 IDENTIFIED BY 비번;

<비번 변경>
ALTER USER 계정명 IDENTIFIED BY 새비번;

<사용자 정보조회>
SELECT * FROM ALL_USERS WHERE USER NAME = '계정명';

<사용자 삭제>
DROP USER 사용자명;
