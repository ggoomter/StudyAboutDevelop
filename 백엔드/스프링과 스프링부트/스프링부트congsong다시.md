원본 : https://congsong.tistory.com/12
# 1. 게시판 환경설정
- 프레임워크 : 스프링부트
- 화면처리 : 타임리프
- 설정 : xml아니라 자바기반
- 데이터베이스 : MaraiDB
- 퍼시스턴스 프레임워크 : Mybatis
- IDE : IntelliJ Free버전(https://www.jetbrains.com/ko-kr/idea/download/#section=windows)
- WAS (Tomcat) : 스프링부트이기 때문에 내장톰캣있어서 필요없음
        설치시 체크할때 숏컷생성, path 수정, Context Menu, Association 에 자바 체크
        인텔리제이 단축키처럼 쓰고싶다면 링크의 settings.zip다운
        //웬만하면 하자. 인코딩, 키맵, 코드폴딩 등
        //추천 플러그인 : https://code-boki.tistory.com/4
- 빌드툴 : Gradle
- 자바버전 : JDK11(https://github.com/ojdkbuild/ojdkbuild)
  jdk푸는경로 : c:\develop\jdk\ojdk-11
  워크스페이스경로 : c:\develop\workspace
  환경변수설정 : JAVA_HOME : C:\develop\jdk\ojdk-11
                PATH : %JAVA_HOME%\bin
                      PATH의 제일 상단으로 이동
                CLASSPATH : %JAVA_HOME%\lib
   환경변수 설정 확인 : cmd에서 java, javac

  ### 1.1 프로젝트 생성
  https://start.spring.io/
  Gradle-Groovy, Java, 2.7.9    (3.x버전은 JDK 17이상이여야함)
  Group : com.study
  Artifact, Name : Board
  Package name : com.study
  Packaging : Jar
  Java : 11

  ### 1.2 의존성 추가(라이브러리 추가)
  1. 우측상단 ADD DEPENDENCIES
  Ctrl키를 누른채로 라이브러리 선택하면 창을 닫지않고 계속 추가
  (Spring Boot DevTools, Lombok, Spring Configuration Processor, Spring Web, Thymeleaf, MyBatis Framework, MariaDB Driver)
  2. 하단의 GENERATE 버튼
  3. 다운로드한 프로젝트를 인텔리제이로 Import
     C:\develop\workspace 에 Board.zip압축풀고
     인텔리제이 Projects / Open / 프로젝트 경로 선택후 Ok
     Trust Project
     2분정도 기다리기

  ### 1.3 인텔리제이 환경설정 및 플러그인
  설정(Settings) : Ctrl Alt S  

