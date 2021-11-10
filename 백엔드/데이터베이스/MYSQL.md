Mysql
공식 다큐먼트 = https://dev.mysql.com/doc/refman/5.7/en/alter-user.html#alter-user-password-management
스키마 만들면 C:\ProgramData\MySQL\MySQL Server 8.0\Data 안에 들어간다.


<소개>
MySQL은 가장 널리쓰이고있는 RDBMS(관계형 데이터베이스 관리 시스템).
오라클이 인수했음.
키워드와 문자열은 대소문자 구분하지 않음.
테이블명과 컬럼명은 대소문자 구분함
일반적으로 모두 대문자로 작성하며 인덴트(줄띄우기) 중요.

<팁>
- 여전이 DIVIDE AND CONQUER 전략이 중요하다.
- 테이블 CRUD, 데이터 CRUD  쿼리는 파일로 남겨놓는게 좋다.  빈번하게 수정작업이 일어나기 때문에.
- 울트라에디트나, 노트패드, 아톰등의 에디터의 멀티커서 기능을 이용하면 좋다.
- 카멜케이스, 스네이크 케이스를 알아야 한다.
- CRUD중 데이터의 변경이 일어나는 CUD 인 경우 SELECT를 먼저 해보고 변경하는것이 안전하다.
- 하나씩 실행하면서 단계별로 COMMIT하고 잘못되었으면 ROLLBACK
- select @@autocommit;	 했을때 1이면 자동커밋되고있음


<연습문제>
https://junetudie.tistory.com/11
sqlzoo.net
https://programmers.co.kr/learn/challenges?tab=sql_practice_kit
https://www.codecademy.com/learn/learn-sql





<설치>
설치방법 : https://congsong.tistory.com/54
다운로드경로 : https://dev.mysql.com/downloads/mysql/
	installer는 설치되는것이고 압축파일로 받으면 무설치버전이다. 초보는 설치버전이 좋다.
	최신버전 os맞춰서 용량큰거 - 로그인안하고 밑에 No thanks, just start myu download 클릭하면됨.
	next, Execute만 하면된다. //Visual Studio version 2015, 2017 or 2019 가 반드시 깔려야된다고 경고뜸
	다깔고나면 기본포트 3306
	8.x버전부터 비밀번호 생성규칙이 생겼지만 그냥 숫자4자리 됨.(절대 잊어버리면 안됨)
	다설치하고 Connect To Server화면에서 로그인한뒤 Check버튼으로 연결 확인
	
	<완전삭제>
	처음설치가 아니라 이전에 다른버전을 깔았다면 제어판에서 지우는것으로 깔끔한 삭제가 안된다.
	c:\ProgramData\Mysql 여기 반드시 지워야 계정정보같은거 날아간다.
	
	<설치정보>
	설치위치 : C:\Program Files\MySQL\MySQL Server 8.0
	데이터위치 : C:\ProgramData\MySQL\MySQL Server 8.0
	루트관리자 : root / system123
	새롭게 만든 유저 : ggoomter / 0070
	
	<설치에러>
	1. 3306 aleady use 떴으면 현재 그 포트번호를 누군가 사용하고있다는말
	Win+R을 누른 뒤 "resmon.exe" 입력하여 네트워크탭 - 수신대기포트 - 포트번호 3306을 찾자
	또는 커맨드 창에서 netstat -ano | findstr 3306
	pid를 기억하고 관리자모드로 cmd열어서 taskkill /f /pid pid번호

	
	<설치확인>
	다설치되었으면 시작메뉴에 mysql 쳐서 mysql 버전 Command Line Client
	비번치고 들어가서
	select now();
	select version(); 해보기
	
	
	<WorkBench 사용법>
	- 제일위의 홈에서 연결 관리한다.
	- 일단 왼쪽 탭을 Schema로 바꾼다.
	단축키
	ctrl + Enter = 커서의 쿼리만 실행.   하나의 쿼리의 기준은 ;
	ctrl + shift + enter = 선택한 다중 쿼리 실행
	ctrl + b : 자동 정렬
	ctrl + / : 주석
	
	<DBEAVER.  무료인것중에 추천하는 sql editor>
	기본설치위치 : C:\Program Files\DBeaver
		<에러1> public Key Retrieval is not allowed 
			커넥션 우클릭 Driver properties 탭 - allowPublicKeyRetrieval True로 변경
		<에러2> Access denied for user '입력한유저아이디'@'localhost' (using password: YES)
		원인 : mysql설치할때 원격 접속을 못하게 해놓아서. 
			root는 인증방식을 local에 있는 unix domain socket으로 하기 때문에 root권한이 있어야만 연결이 가능하다.
			운영서버는 저런정책을 갖는게 맞겠지만 로컬이나 개발용은 불편하니 편하게 인증방식을 변경할 필요가 있다.
			https://www.lesstif.com/dbms/mysql-error-1698-28000-89555999.html
			cmd창에서 아무거나로 들어간다음
			mysql -u -아이디 -p
			use mysql;
			update user set plugin='caching_sha2_password' where user='root';
				//플러그인을 사용하여 암호화해서 저장함
			flush privileges;
			SELECT User, Host, plugin FROM mysql.user;
			//이렇게만 하면 일회성으로만 접근되고 또 풀리는것 같다. 권한도 같이 부여해줘야.
			https://blog.naver.com/whiteyoung00/70027557536
			GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '비번' WITH GRANT OPTION;


<기본 문법>
	- 데이터베이스(스키마) 선택 
		USE 스키마명;
	- 테이블 생성
		CREATE TABLE 테이블명(
			컬렴명 데이터타입,
			컬럼명 데이터타입,
			컬럼명 데이터타입,
		);
	- 테이블 삭제
		DROP TABLE 테이블명;
	- 테이블 수정
		- 컬럼(필드, 열) 추가
			ALTER TABLE 테이블명 ADD 컬럼명 데이터타입;
		- 컬럼(필드, 열) 타입 변경
			ALTER TABLE 테이블명 MODIFY COLUMN 컬럼명 데이터타입
		- 컬럼(필드, 열) 삭제
			ALTER TABLE 테이블명 DROP 컬럼명
			
			
	- 데이터 읽기
			SELECT 컬럼명 FROM 테이블명;
	- 데이터 (레코드, 행) 추가
			INSERT INTO 테이블명 VALUES (값, 값, 값...);
	- 데이터 수정
			UPDATE 테이블명 SET 컬럼명 = 값 WHERE 조건
	- 데이터 삭제
			DELETE FROM 테이블명 WHERE 조건;


<에러>
1. Error Code: 1175. You are using safe mode and you tried to update a table without a WHERE that uses a KEY column To disable safe mode.
(원인) sql에디터가 개발자의 실수를 방지하기 위해 삽입이상, 수정이상, 삭제이상이 의심되는애들을 막아놨다
(해결) SET SQL_SAFE_UPDATES = 0;

2. SQLException: No suitable driver found for jdbc:mysql://localhost:3306/sys/serverTimezone=UTC
java.sql.SQLException: No suitable driver found for jdbc:mysql://localhost:3306/sys/serverTimezone=UTC
(원인) connector가 없어서일 가능성이 제일 높다.
(해결) 오라클은 ojdbc, mysql은 Connector/J를 다운받는다. https://dev.mysql.com/downloads/connector/j/ 에서 platform independency
안에서 jar파일 하나만 꺼내서 자바홈의 Jre/lib안에 넣어주면 된다.
앞으로 만들어지는 소스는 이제 자동으로 되는데 현재 만들어진 순수 자바 프로젝트는 자동으로 못넣기 때문에 프로젝트 빌드패스에 external jar로 추가해준다.

3. sql명령어로는 접속되는데 sqlplus나 워크벤치나 dbeaver로 접속안되는 경우 
=> mysql -u 아이디 -p    하고 비번치고 들어가면 잘됨.
sqlplus는 mysql이 아니라 oracle 커맨드 툴이다.


<쿼리실행 순서>


<조인>
ANSI조인과 오라클 조인
2개의 테이블을 연결(join)해야될때 사용. 조인방식에 따라 기준이 달라진다.
- INNER JOIN
- LEFT JOIN, RIGHT JOIN
- FULL OUTER JOIN
	기본예제
	SELECT A.NAME
		 , B.NAME
	  FROM 근로자 A
	  LEFT JOIN 고객 B
	  ON B.NAME = A.NAME



<응용 문법>








<사용자 권한>
<확인>
SHOW GRANTS FOR 아이디@호스트;
예) SHOW GRANTS FOR test@localhost;

<권한부여>
GRANT ALL PRIVILEGES ON 디비명.테이블 TO '아이디'@'호스트' IDENTIFIED BY '비밀번호';
예) 구버전 GRANT ALL PRIVILEGES ON *.* TO 'ggoomter'@'localhost' IDENTIFIED BY '0070';
**신버전** GRANT ALL PRIVILEGES ON *.* to ggoomter@localhost;


<쿼리에러>
check the manual that corresponds to your MySQL server version
=> 따옴표를 안써서 나타남.
mysql 버전이 올라가면서 문법적으로 순서가 바뀐경우도 있다.





<**mysql root 비밀번호 초기화**>
https://one-step-a-day.tistory.com/141
https://goodteacher.tistory.com/291

0. 현재 돌아가고있는 mysql종료
net stop mysql80

1. mysql 설치 폴더로 가기
(비밀번호가 없어도 들어가기 위해서 mysql설치폴더에서 skip할거다.)
C:\Program Files\MySQL\MySQL Server 8.0\bin
2. //mysqld.exe --skip-grant-tables --console --shared-memory    이걸로하니까 안됨.
mysqld --datadir="C:\Program Files\MySQL\MySQL Server 8.0\Data" --console --skip-grant-tables --shared-memory
3. 관리자권한으로 새로운 cmd창 열고 아래명령어 입력하면 비번없이 root계정 들어가진다.
	mysql -u root
4. 아래명령어 순차적으로 입력
use mysql;
**UPDATE user SET authentication_string=null WHERE User='root';**
//이렇게 하면 비번 적용되기 전으로 로우데이터 그대로 들어간다.
select authentication_string from user;
flush privileges;	//mysql의 사용자를 추가,삭제, 권한변경 등을 했을때 mysql 에 변경사항 적용

다 확인되었으면

5. 기존접속 종료하고 다시 비번없이 root로 접속
exit
mysql -u root

6. **비밀번호 바꾸기** https://to-dy.tistory.com/58
<5.7 이전버전>
update user set password=password('변경할비밀번호') where user='root';

<5.7 이후버전> 은 password필드를 authentication_string 필드가 대체한다. 그리고 암호화 방법도 달라졌다.
MySQL 8.0 이상에서는 **caching_sha2_password** 가 default authentication plugin 이다.
(기존은 mysql_native_password plugin이 default 였다.) 

com.mysql.cj.protocol.a.authentication.MysqlNativePasswordPlugin
com.mysql.cj.protocol.a.authentication.CachingSha2PasswordPlugin

ALTER USER로 바꾸는데 4가지 옵션이 있다.
auth_string은 (암호화되지않은)일반텍스트를 인증플러그인으로 반환하여 authentication_string 필드열에 저장된다.

-** ALTER user '아이디'@호스트 IDENTIFIED WITH auth_plugin BY '바꾸길원하는 비밀번호';	**	//해쉬키로 잘 들어감. 이걸로 하자
IDENTIFIED WITH auth_plugin BY 'auth_string'
https://stackoverflow.com/questions/37879448/mysql-fails-on-mysql-error-1524-hy000-plugin-auth-socket-is-not-loaded
//Plugin 'auth_plugin' is not loaded 에러남
-flush privileges;	//반드시 저징해줘야한다.
-quit

** 유저 추가 삭제 **
drop user;


7. **권한 주기**
select host, user, password, authentication_string from user;	//옛날버전은 password 임.
host의 종류에는 localhost와 %가 있다. 기본적으로는 localhost에서만 접속가능하고 외부에서는 접속이 불가능하게 되어있다.
외부접속이 가능하게 하려면 localhost를 %로 변경해야한다.

- 사용자별 권한 확인
SHOW GRANTS FOR '사용자계정'@'호스트';

- 해당유저에게 모든 권한주는법
★★★
여기서 %는 'localhost를 포함한 모든'을 의미한다.
GRANT ALL PRIVILEGES ON *.* to '아이디'@'%';
FLUSH PRIVILEGES;


SELECT HOST, USER, AUTHENTICATION_STRING, PLUGIN  FROM MYSQL.USER;
SELECT * FROM MYSQL.USER;

SHOW GRANTS FOR 'root'@'localhost';	-- 해당유저의 권한조회
GRANT ALL PRIVILEGES ON *.* to 'ggoomter'@'localhost'  with grant option; -- 모든권한부여
GRANT ALL PRIVILEGES ON *.* to 'ggoomter'@'%' with grant option; -- 모든권한부여
-- with grant option을 주면 자기가 가진 권한을 남에게 줄수 있음

ALTER user 'ggoomter'@localhost IDENTIFIED WITH auth_plugin BY '0070';	-- 비밀번호 변경
ALTER USER 'ggoomter'@'localhost' IDENTIFIED WITH mysql_native_password BY '0070';
/*plugin 'auth_plugin' is not loaded*/

FLUSH PRIVILEGES;




--- 
다른방법
- insert into mysql.user (host, user, authentication_string, ssl_cipher, x509_issuer, x509_subject) values ('%','사용자명', '비밀번호','','','');


8. 프로그램에서 실행할때 안된다면
net stop mysql80


