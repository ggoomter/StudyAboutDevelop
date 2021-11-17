# ec2
아이디 ggoomter2@gmail.com
비밀번호 xxxx3#
name human_tester

https://jiwontip.tistory.com/45?category=367314
1. 아마존 회원가입(무료계정) 전화로 인증번호 4개 치는게 빠름
2. 오른쪽 위 서버 위치 한국으로 옮기기
3. 가상머신 시작	(//계정만들자 마자 바로는 안됨)
	1. freetier만 선택 체크하고 제일위에 있는 ubuntu 선택
		레드햇, 페도라, centOS계열은 yum사용
		데비안, 우분트 계열은 apt-get 사용
	2. 넥스트하다보면 디폴트 크기는 8기가인데 30기가 까지 무료로 늘릴수있음.
	3. 기존키페어 선택또는 키페어 생성 창
		(이미 받은 키가 있으면 그거 선택하면 됨)
		받은키가 없으면 새 키페어 생성. 텍스트치고 '키페어 다운로드' 하면 .pem 파일 받음.
		기억하기 쉬운곳에 저장하고 인스턴스 시작.
		
4. 네트워크및 보안 탭
보안그룹에 가서 inbound규칙 열어주기
http, https, ssh, 사용자정의(8080)의 모든 ip4
이미 열린 보안그룹이 있다면 그거 선택해주면됨.
5. 왼쪽 사이드바에 탄력적 ip찾아서 할당
작업 - 탄력적 ip주소 연결(릴리즈는 해제/삭제)


이제 서버(컴퓨터)만 받은것이다. 여기에 웹서비스가 가능하도록 설정해야한다.
인스턴스 id클릭해서 오른쪽위 '연결' 버튼 누르면 우리가 받은 리눅스 서버에 접속함
sudo su root  으로 루트계정으로 변신(안하면 명령어마다 앞에 sudo 써주면됨)
apt-get update
apt-get upgrade
java -version 해보면 없다.
	자바 설치 명령어까지 보여주는거 복사해서 설치(난 16버전)
마찬가지 javac -version 쳐서 jdk설치  (난 16버전)
	sudo apt install openjdk-16-jdk-headless
echo $JAVA_HOME 했을때 아무것도 없으면 환경변수 설정안된것. which java
	복사(ctrl shift c) 한다음 readlink -f 해서 나오는것 복사
	(/usr/lib/jvm/java-16-openjdk-amd64/bin/javac)
sudo vi /etc/profile
	열어서 맨밑에 3줄 추가
	export JAVA_HOME=/usr/lib/jvm/java-16-openjdk-amd64
	export PATH=$JAVA_HOME/bin/:$PATH
	export CLASS_PATH=$JAVA_HOME/lib:$CLASS_PATH
source /etc/profile로 reload
sudo reboot now (시간이 5분넘게걸림. 대쉬보드에서 2/2 확인 보고 아래실행)
재시작했으면 다시 터미널 켜서 echo $JAVA_HOME 확인, javac -version 확인

톰캣설치
<wget 설치 방법>
1. 다운받기 wget 주소.tar.gz		//톰캣에서 링크주소 복사. https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.55/bin/apache-tomcat-9.0.55.tar.gz
2. 압축풀기 tar -zvxf 압축파일이름.tar.gz
3. 압축풀린곳의 bin폴더밑의 startup.sh파일 실행



<apt-get 설치방법. 안됨 >
	sudo apt-get install tomcat9			//톰캣9 설치
	sudo /usr/share/tomcat9/bin/version.sh  //버전확인
	sudo ufw allow 8080/tcp					//uncomplicated firewall에 8080포트 등록
	sudo service tomcat9 start				//톰캣 실행


자기 ip복사해서 브라우저에서 주소:8080 으로 접속해서 톰캣 첫화면 뜨는지 확인.
안뜨면 inbound 사용자정의 8080 추가

netstat안돼서 설치. sudo apt install net-tools
netstat -npl	//톰캣 서버 실행중인지 확인
	

톰캣 고양이 화면 뜨는걸 완료했으면 앞으로 할일은 ftp로 프로젝트 파일을 WAS(톰캣)에 올리는것과
데이터베이스도 내컴퓨터에있던것을 서버에 구축하는것이다.
# war업로드
1. 파일질라 클라이언트 다운로드
2. 키 추가 (설정 - sftp - 가지고있는 .pem파일 추가)
3. 새사이트 추가 (sftp, 키추가, 사용자는 ubuntu)
4. 톰캣 폴더의 webapps 폴더안에 war파일 갖다놓고
5. 브라우저에서 ip주소:8080/war파일이름  치면 접속됨

# RDS
Relational Database Service
아마존에서 디비를 운영하는 2가지 방법이 있다. EC2인스턴스에 직접 설치, 운영하는방법과  RDS를 이용한 인스턴스 생성.
DB와 어플리케이션을 한서버에 설치해야하는 특별한 제약이 없는한 2번째방법이 좋다.
1. 서비스 - RDS - 데이터베이스 생성 버튼 클릭
	Region(지역) 선택
	db엔진 선택
	db인스턴스 크기 선택(프리티어)
	db식별자 설정, 마스터계정 설정
	스토리지 설정
	아래로 내리다가 퍼블릭 어세스 꼭 '예'로 설정
	최종관리자 아이디, 비밀번호 까먹지 않기.
2. 생성했으면 dbeaver로 접속해보자.(생성하는데 좀 시간걸림. 너무많이 걸린다싶으면 새로고침)
Hostname에 엔드포인트 전체 복사해서 입력
Username은 RDS생성할때 입력했던 마스터 계정



# putty
1. [다운로드](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
2. putty.gen.exe실행
3. RSA선택후 load후 키 선택
4. save private key 경고창 예
5. putty.exe 실행
세션의 host에 ip주소넣고
Connection-SSH-Auth 탭에 방금만든 ppk파일 로드하고 Open