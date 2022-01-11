SELECT HOST, USER, AUTHENTICATION_STRING, PLUGIN  FROM MYSQL.USER;
SELECT * FROM MYSQL.USER;
SELECT * FROM ALL_USERS;


/* 유저 권한 확인*/
SELECT GRANTEE, GRANTED_ROLE FROM DBA_ROLE_PRIVS WHERE GRANTEE='SCOTT';


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
SHOW GRANTS FOR 'root'@'localhost';	-- 해당유저의 권한조회
GRANT ALL PRIVILEGES ON *.* to 'ggoomter'@'localhost'  with grant option; -- 모든권한부여
GRANT ALL PRIVILEGES ON *.* to 'ggoomter'@'%' with grant option; -- 모든권한부여
-- with grant option을 주면 자기가 가진 권한을 남에게 줄수 있음

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
