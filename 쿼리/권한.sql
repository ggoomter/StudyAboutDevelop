>오라클에서는 시스템권한, 객체권한으로 분류한다.
<시스템권한>
- 문법 : GRANT 시스템권한명 TO 사용자 [WITH ADMIN OPTION];
WITH ADMIN OPTION을 사용하면 부여받은 권한을 다른사용자에게 부여할수있는 권한을 부여받게된다.
- 권한취소 : REVOKE 시스템권한 FROM 사용자이름;

SELECT * FROM ALL_USERS WHERE USERNAME  = 'SCOTT';
CREATE USER scott IDENTIFIED BY tiger;

<객체 권한>
특정 사용자가 생성한 테이블, 인덱스, 뷰, 시퀀스 등과 관련된 권한.
- 문법 : GRANT [객체권한 또는 ALL PRIVILEGES] ON [스키마.객체명] TO [사용자명 또는 역할이름 또는 PUBLIC] [WITH GRANT OPTION];
예) GRANT INSERT ON TEMP TO ORCLSTUDY;

SELECT HOST, USER, AUTHENTICATION_STRING, PLUGIN  FROM MYSQL.USER;
SELECT * FROM MYSQL.USER;
SELECT * FROM ALL_USERS;


/* 유저 권한 확인*/
SELECT GRANTEE, GRANTED_ROLE FROM DBA_ROLE_PRIVS WHERE GRANTEE='C##SCOTT';
select * from user_sys_privs ;	--오라클에서 현재 세션의 사용자 권한 확인

/* 유저 비밀번호 바꾸기 */
ALTER USER 'ggoomter'@localhost IDENTIFIED WITH auth_plugin BY '0070';	-- 비밀번호 변경
ALTER USER 'ggoomter'@'localhost' IDENTIFIED WITH mysql_native_password BY '0070';
ALTER USER SCOTT IDENTIFIED BY TIGER;
/*plugin 'auth_plugin' is not loaded*/


FLUSH PRIVILEGES;

/* 지우고 삭제하면 올바르게 됨. 그러나 여전이 디비버에서는 접속안됨 */
drop user 'ggoomter'@'localhost';
drop user 'ggoomter'@'%';
FLUSH PRIVILEGES;
create user 'ggoomter'@'localhost' identified by '0070';
create user 'ggoomter'@'%' identified by '0070';

/* 권한 부여 */
SHOW GRANTS FOR 'root'@'localhost';	-- 해당유저의 권한조회
GRANT ALL PRIVILEGES TO super with grant option; -- 모든권한부여
GRANT ALL PRIVILEGES ON *.* to 'ggoomter'@'%' with grant option; -- 모든권한부여
GRANT ALL PRIVILEGES TO C##SCOTT with admin option; -- 오라클 모든권한부여

USE BBS;
grant all privileges on *.* to 'ggoomter'@'localhost'; -- mysql 
grant all privileges on *.* to 'scott'@'localhost'; -- mysql 
grant all privileges on *.* to 'gganbu'@'localhost'; -- mysql 
-- with grant option을 주면 자기가 가진 권한을 남에게 줄수 있음
-- Access denied for user 'scott'@'%' (using password: YES) 

*.*을 썼을때 공통 사용자 또는 롤 이름이 부적합합니다. 테이블명이 부적합합니다. 디폴트 테이블 스페이스를 설정해주지 않아서 그런것.
12c부터는 공통계정앞에 c##을 붙이도록 네이밍 규칙이 바뀌었기 되어있기때문에
(CDB = Containder DB   와 PDB(Pluggable DB)의 개념이 등장했기 때문)
dbeaver에서도 c## 붙여줘야한다.



use mysql;

update user set authentication_string=PASSWORD('0070') where User='ggoomter';
-- 플러그인 바꾸기
SELECT HOST, USER, AUTHENTICATION_STRING, PLUGIN  FROM MYSQL.USER;
	update user set plugin="mysql_native_password" where User='ggoomter';	-- 이전
	update user set plugin="caching_sha2_password " where User='ggoomter';	-- 8버전이후
-- 비번 바꾸기
alter user 'ggoomter'@'localhost' identified with caching_sha2_password by '0070';	-- operation alter user failed for 'ggoomter'@'localhost'
alter user 'ggoomter'@'localhost' identified with mysql_native_password by '0070';
alter user 'ggoomter'@'localhost' identified with caching_sha2_password as '0070';
