# 추천강의
[엘리](https://www.youtube.com/watch?v=LXJhA3VWXFA)
[얄코](https://www.youtube.com/watch?v=hWPv9LMlme8)
복잡하거나 매뉴얼이 없는 환경에 특히 유용.
각각 다른 실행환경에서 구현되어야 할때.
### 이미지
설치하는것을 녹화해놓고 그대로 실행하는 느낌.

[얄코]
VirtualBox, VMWare, 페럴릴즈 등의 가상컴퓨팅과 다른 개념. 
가상컴퓨팅은 한 물리적 컴퓨터안에 각 os를 돌리는 구조.
도커는 실행환경만 독립적으로 분리. 컨테이너. 집에서 딱 필요한 공간만 차지하고 자원은 공유해서 사용한다.
1. 도커 데스크탑 설치
2. 원하는 폴더생성. terminal을 열고 git으로 도커 설치.
3. hub.docker.com   이미지 검색.


[생활코딩]
고래가 컨테이너를 싣고가는 모양.
리눅스의 컨테이너 기술을 이용해서 가상화를 하지 않고 프로세스만 격리해서 빠르게 실행가능하게 해준다.
기존 운영체제 안에서 프로세스르 격리시키는 기술
리얼머신과 docker의 성능차이는? 99.8% 정도 같다. 성능 저하가 없다고 보면된다.
2014년에는 리눅스 전용이였다.




# Docker
git 다음으로 많이 쓰는 툴.
운영체제에 여러 소프트웨어를 깔아야 하는데 그것들을 설치하는게 매우 까다롭고 귀찮은 일이다.
전문가가 이미 잘 설치해놓은것을 그대로 설치할수 있으면 얼마나 좋을까?
즉 어플리케이션을 패키징 할수있는 툴.
컨테이너라는 하나의 작은 소프트웨어 유닛안에 어플리케이션, 시스템툴, 환경설정, 디팬던시를 하나로 묶어서 쉽게 배포하고 구동할수있도록 해준다.
한번 저장된 장비들을 지정한 형태로 언제든 불러낼 수 있다.
운영체제가 설치된 컴퓨터(host)에서 각각의 앱들을 컨테이너 환경에서 실행한다.
컨테이너를 이용해서 이런 기능을 제공해주는 서비스중 가장 유명한것이 Docker. 즉 도커는 컨테이너 엔진.
dosc.docker.com   사용설명서

vmware는 운영체제를 포함하고 있기때문에 무겁다.
container 는 vmware에서 운영체제를 덜어내고 경량화된 컨셉이다. host의 OS를 사용한다. 이미지를 고립된 환경에서 실행시킬수있는 환경.
Image는 지금 실행되고있는 어플리케이션의 상태를 스냅샷찍은 컨셉이다.
이미지를 클래스라 생각하고 클래스로 인스턴스들을 만들어내서 각각  동작하게 만들수있다(=컨테이너)의 개념으로 받아들이면 된다.

### 이미지
특정상태를 캡처해서 박제해놓은 상태
컨테이너를 찍어내는 틀 또는 무한생산 가능한 컨테이너 조립키트


### 도커 동작 순서
1. 컨테이너 생성(도커파일, 이미지, 컨테이너)
2. 컨테이너 배포(내컴퓨터에 도커설치, 서버에 도커설치)
3. 컨테이너 구동
![도커등록](./이미지/Docker.PNG)

### 엘리 실습
[엘리님nodejs 백쪽 코드](https://github.com/dream-ellie/docker-example)
1. 설치   (잘 못따라감)
    1. FROM node:16-alpine   (베이스 노드 버전 이미지 선택)
    1. WORKDIR /app   (워킹 디렉토리 경로설정)
    레이어 시스템이기 때문에 자주 바뀌게 되는것을 제일 마지막에 설치하는게 좋다.
    변경된 레이어 이전 레이어까지는 살릴 수 있다.
    1. COPY package.json package-lock.json ./    json에 명시된 라이브러리 다운
    2. RUN npm install   또는 RUN npm ci
    3. COPY static_assets ./
    4. COPY src ./
    3. COPY index.js .
    4. ENTRYPOINT ["node", "index.js"]
    5. RUN npm run build
1. docker build -f Dockerfile -t fun-docker .    도커이미지에 이름 부여
2. docker images
3. 실행
    docker run -d -p 8080:8080 fun-docker   (기다리지말고, 호스트의 포트와 컨테이너의 포트 매핑)
4. 명령어로 확인
    docker ps
5. 브라우저로 확인
    localhost:8080
6. 로그확인
    docker logs 컨테이너id

### 설치
도커같은 컨테이너는 리눅스 운영체제의 기술이다.
그럼 윈도우 쓰고있으면 못하나요?
아니, 도커가 알아서 가상머신도, 리눅스 설치도 해준다.
- docker.com
Developsers - Docs - Download and install
설치했으면 Docker Desktop 프로그램을 실행하면
오른쪽 메뉴에 Docker로고 생긴다.
클릭해서 DashBoard하면 GUI에서 제어할수 있다.
그러나 풀파워를 쓰고싶으면 명령창을 이용해야한다.
docker images
//IDE에 extension같이 깔면 좋다.

### 도커이미지 모음
깃헙같이 도커 사용자들의 여러앱들이 올라와있는곳.
- public
    - hub.docker.com(docker hub), RedHat quay.io,  GitHub Packages
- private
    - aws, google cloud, MS Azure


image : 도버허브에서 필요한 내컴퓨터로 다운받아진 프로그램
pull : image를 다운로드받는 행위
run : image를 container로 바꾸는 행위

httpd 검색해서 Apache HTTP 다운로드 받을수있다. 클릭하면 명령어 있다.
다운로드 잘 받았는지 확인하는법 : docker images     GUI라면 images탭


### 실행
이미지를 실행(run) 시켜서 컨테이너로 만드는 방법.
GUI라면 이미지중 실행할 이미지 선택후 run버튼 클릭.
    클릭하면 그 컨테이너의 프로세스가 뱉어내는 로그를 볼 수 있다.   STATS등 통계자료도 볼 수 있다.  STOP, START로 켜고 끌수있다.
명령어라면 docker run [옵션] image [명령어] [파라미터];
지금 실행되고 있는 프로세스 : docker ps
docker logs 컨테이너명 : 로그 보기
docker logs -f 컨테이너명 : 실시간으로 계속 로그 보기
docker rm 컨테이너명 : 컨테이너 삭제
    실행중이면 안지워진다 docker stop 컨테이너명   해서 중지후 삭제
docker rmi 이미지명 : 이미지 삭제



#### 네트워크
도커를 사용하려면 네트워크를 좀 알아야 한다.
포트포워딩


### 맥에 오라클 설치
docker.com에서 Docker Desktop  M1이면 AppleChip 다운로드
고래 드래그앤드랍
터미널에서 docker 치면 뭐라고 뜨면 설치완료
docker search oracle
내가원하는 버전
docker pull pvargacl/oracle-xe-18.4.0
다운받은 도커이미지를 컨테이로 올리기
docker run --name oracle18 -d -p 1521:1521 pvargacl/oracle-xe-18.4.0
dbeaver 다운로드
아까 설치한 오라클과 연결  xe, system, 비번
c## 안쓰기 위한 룰 추가 ALTER SESSION SET "_ORACLE_SCRIPT" TRUE;
유저생성, 권한부여
스키마 새로고침

#### 눈송이 서버(Snowflake Servers)
눈 결정이 서로 다르듯이 서버들도 서로 다른 모습이라는 말.
처음에는 각 서버의 차이가 미약하지만, 오래 운영하다보면 거대한 눈덩이가 된다. 