>오라클에서는 시스템권한, 객체권한으로 분류한다.
<시스템권한>
- 문법 : GRANT 시스템권한명 TO 사용자 [WITH ADMIN OPTION];
WITH ADMIN OPTION을 사용하면 부여받은 권한을 다른사용자에게 부여할수있는 권한을 부여받게된다.

<객체 권한>
특정 사용자가 생성한 테이블, 인덱스, 뷰, 시퀀스 등과 관련된 권한.
- 문법 : GRANT [객체권한 또는 ALL PRIVILEGES] ON [스키마.객체명] TO [사용자명 또는 역할이름 또는 PUBLIC] [WITH GRANT OPTION];
예) GRANT INSERT ON TEMP TO ORCLSTUDY;

<권한 뺏기>
REVOKE 시스템권한 FROM 사용자이름;


SELECT HOST, USER, AUTHENTICATION_STRING, PLUGIN  FROM MYSQL.USER;
SELECT * FROM MYSQL.USER;
SELECT * FROM ALL_USERS;


/* 유저 권한 확인*/
SELECT GRANTEE, GRANTED_ROLE FROM DBA_ROLE_PRIVS WHERE GRANTEE='C##SCOTT'; --특정 유저의 권한 확인
select * from user_sys_privs ;	--오라클에서 현재 세션의 사용자 권한 확인
select * from dba_role_privs where granted_role='DBA'; --오라클에서 DBA권한 가진 유저

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
with grant option 은  revoke당하면 내가준애들의 권한도 같이 회수
with admin option 은  revoke당하면 내것만 회수
grant connect, dba, resource to 유저명 with admin option;

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


#### 오라클 19C
시스템계정으로 로그인해서 
일반계정은 ALTER SESSION SET "_ORACLE_SCRIPT"=true;
계정 생성
CREATE USER 계정명 IDENTIFIED BY 비번;
권한주기
GRANT CONNECT, RESOURCE TO 계정명 
공용계정은 아이디 넣는칸에 c## 붙여야됨.

테이블 생성하려고 하면 "ORA-01950 테이블스페이스 'users'에 대한 권한이 없습니다." 에러남
테이블스페이스권한 줘야함
alter user 사용자계정 default tablespace users quota unlimited on users;


### 테이블스페이스
- 데이터저장단위중 가장 상위에 있는 단위
- 원하는 유저에 디폴트로 할당할수 있고 
지정하지 않는다면 USERS 테이블스페이스가 할당된다.
그래서 19C에서 유저로 테이블 만들고 INSERT할때 USERS 테이블스페이스에 대한 접근권한없다고 에러뜰수있음



##### 테이블의 테이블스페이스 확인
SELECT TABLESPACE_NAME, TABLE_NAME
FROM ALL_ALL_TABLES
WHERE TABLE_NAME LIKE '%찾고싶은테이블이포함된이름%';

#### 유저에게 테이블스페이스 부여
ALTER USER 유저이름 QUOTA 100M ON USERS;
GRANT UNLIMITED TABLESPACE TO 유저이름;

#### 유저에 테이블스페이스 권한부여
GRANT UNLIMITED TABLESPACE TO 타겟유저명;

### 테이블의 테이블 스페이스 변경
alter table 테이블명 move tablespace 테이블 스페이스명;


-- 1. 사용자에게 부여된 시스템 권한 확인
SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE = '사용자명' ;

-- 2. 사용자에게 부여된 롤 확인(시스템 권한이 롤에 포함됨)
SELECT * FROM DBA_ROLE_PRIVS
WHERE GRANTEE = '사용자명' ;

-- 3. 사용자에게 부여된 롤에 부여된 시스템 권한 확인
SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE = '롤명' ;

-- 4. 타 사용자에게 부여한 객체(테이블등) 권한 확인
SELECT * FROM DBA_TAB_PRIVS
WHERE OWNER = '테이블소유자명' ;
또는,
SELECT * FROM DBA_TAB_PRIVS
WHERE GRANTEE = '권한부여자명' ;

--DBA권한 부여
GRANT CONNECT, RESOURCE, DBA TO 유저ID;
