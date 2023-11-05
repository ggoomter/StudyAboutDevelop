# https://github.com/ggoomter/springboot_congsong

# 1. 게시판 환경설정
> 원본 : https://congsong.tistory.com/12
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
          인텔리제이 좌측 Customize / import Settings에서 압축해제한 settings폴더선택. import and restart
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
  (7개 Spring Boot DevTools, Lombok, Spring Configuration Processor, Spring Web, Thymeleaf, MyBatis Framework, MariaDB Driver)
  2. 하단의 GENERATE 버튼
  3. 다운로드한 프로젝트를 인텔리제이로 Import
     C:\develop\workspace 에 Board.zip압축풀고
     인텔리제이 Projects / Open / 프로젝트 경로 선택후 Ok
     Trust Project
     2분정도 기다리기

  ### 1.3 인텔리제이 환경설정 및 플러그인
  설정(Settings) : Ctrl Alt S  


# 2. 게시판 프로젝트 구조 알아보기
원본 : https://congsong.tistory.com/13
- src/main/java 디렉토리
- BoardApplication 클래스. @SpringBootApplication 어노테이션
- src/main/resources 디렉터리
  스프링부트는 기본적으로 template폴더, static폴더, application.properties 파일이 생성됨
- src/text/java 디렉토리
- build.gradle 파일


# 3. MariaDB(HikariCP) 연동
- MariaDB 설치 : https://congsong.tistory.com/62
- Dbeaver 등의 쿼리툴에서 MariaDB 커넥션 연결
 Host : localhost
 Port : 3306 -> 3360
 username : root / system123
 - board 테이블 생성

# github 업로드
https://github.com/ggoomter/springboot_congsong.git

# 4. 게시판 CRUD처리하기
https://congsong.tistory.com/15
인텔리제이 한글깨짐 https://da-nyee.github.io/posts/intellij-console-encoding-issue/
- tb_post 테이블생성
- 롬복 설치하기
  IntelliJ 2020.03 이후버전에서는 기본으로 설치되어있다.
  이클립스에서는 https://congsong.tistory.com/31
  인텔리제이에서는 File/Settings/Plugins/Marketplace 에서 lombok 검색후 설치.  
- MybatisX플러그인 설치
- url매핑 이해 (https://lng1982.tistory.com/169)

# 5. 게시판 등록기능 구현
https://congsong.tistory.com/16
- 이전글에서 Mapper영역을 모두 처리하였으니 서비스영역 차례임.
- 서비스는 MVC모델에서 Model부분. 클라이언트의 요구사항을 처리하는 핵심적인 영역
- PostService 클래스 생성
savePost, findPostById, updatePost, deletePost, findAllPost
- 어노테이션
  @Controller, @GetMapping, 
- 화면처리
스프링부트가 기본적으로 html파일 읽는 경로 : src/main/resources/templates
write.html 만들고 localhost:8080/post/write.do 에서 화면 테스트
- static.zip 압축풀고 src/main/resources밑에 갖다놓기
- 타임리프 적용   layout/basic
- 화면에서 글쓰고 db에 들어가는것까지 테스트

# 6. 게시글 리스트 조회
https://congsong.tistory.com/17
목록 화면과 화면처리 컨트롤러만 손봐주면 된다.

# 7. 게시글 상세정보 조회 기능
https://congsong.tistory.com/19
자바스크립트 좀 건듦
핵심 : <a th:href="@{/post/view.do( id=${row.id} )}" th:text="${row.title}"></a>

# 8. 게시글 삭제 구현
https://congsong.tistory.com/20

# 9. 컨트롤러에서 알러트 처리
https://congsong.tistory.com/22
- 메세지처리용 MessageDto 생성
- messageRedirect.html 히든폼과 자바스크립트만 있음
  th:each,  th:name,  th:value
- 데이터가 있으면 동적 form 생성.

# 10. Logback으로 쿼리 출력
https://congsong.tistory.com/23
- logback-spring.xml 추가   //resources하위
- logjdbc 라이브러리 추가하고 gradle 빌드
- 인텔리제이 ctrl shift a로 Edit Custom VM Options 에서 utf-8과 램 설정
  -Xms4096m
  -Xmx10240m
  -Dfile.encoding=utf-8
  -Dconsole.encoding=utf-8
- 내장톰캣 vm옵션 추가
  Run - Edit Configurations - Modify options클릭 -  Add VM options
- resources하위에 log4jdbc.log4j2.properties 파일 추가
- application.properties 의 데이터소스 설정 변경

# 11. 스프링 인터셉터
https://congsong.tistory.com/24
- HandlerInterceptor 인터페이스를 구현한 LoggerInterceptor 생성
  - 3개의 추상메서드 중 2개. preHandler 과 postHandle 구현
  - @Slf4j = 롬복에서 제공. 로깅 추상화. 로깅을 직접 하지 않고 로깅 구현체를 찾아 기능을 사용할 수 있게 해줌. 쉽게 말해 해당 어노테이션이 선언된 클래스에 자동으로 로그객체를 생성한다. 이름은 log
- WebMvcConfigurer 인터페이스를 구현한 WebMvcConfig 클래스 생성
  - WebMvcConfigurer 인터페이스를 구현하면 @EnableWebMvc 의 자동설정을 베이스로 개발자가 원하는 설정까지 추가할 수 있음
  - addInterceptors와 excludePathPatterns() =  전달하는 주소와 경로는 인터셉터 호출에서 제외
    반대로 addPathPatterns()는 전달하는 주소와 경로에 인터셉터 추가

# 12. AOP
https://congsong.tistory.com/25
- LoggerAspect 클래스
- execution 구문은 포인트컷을 지정하는데 접근제어자, 리턴타입, 파라미터 타입, 예외타입, 메서드 등을 조합해서 정교하게 지정할 수 있다.
- ProceedingJoinPoint 인터페이스는 JoinPoint 인터페이스를 상속
  JoinPoint인터페이스는 getArgs, getKind, getSignature, getTarget, getThis 메소드를 포함한다.

# 12.5 트랜잭션
PostService 의 수정과 삽입에 있는 @Transactional



# 13. 페이징, 검색 (어려움)
https://congsong.tistory.com/26
- 관리해야할 속성이 많기에 따로 SearchDto클래스 생성
  - 쿼리의 #{offset} 은 getOffset() 리턴값임.  조회할 데이터의 시작위치
- 매퍼, 서비스, 컨트롤러 쭉 바꿔주기
  파라미터에 SearchDto사용하도록
- @ModelAttribute    파라미터로 수집한 객첼르 자동으로 뷰단으로 
  뷰에서 사용할 별칭 지정
  @ModelAttribute("a") SearchDto params 로 선언했다면 뷰에서는
  "${a.page}" 와 같은 방법으로 객체에 접근가능
- TRUNCATE tb_post; 이후 test로 데이터넣고 자가복제
- http://localhost:8080/post/list.do?page=5&recordSize=15
url로 확인
- Pagination 페이지네이션 처리용 클래스
- SearchDto에서 멤버변수로 Pagination갖도록 수정
- 페이지네이션 전용 응답클래스 PagingResponse 추가
- 서비스 수정

# 14. 페이징, 검색 2 (어려움)
https://congsong.tistory.com/27
- 검색을 했을때는 페이지 번호는 항상1. movePage(1)
- searchType, keyword
- movePage변경
-http://localhost/post/list.do?page=3&recordSize=10&pageSize=10&searchType=writer&keyword=테스터900
위 주소 넣으면 아직 서치타입과 키워드 작업안해서 정확히 필터는 못하지만 에러는 안나고 페이징 처리는 된다.
- 다이나믹쿼리
- setQueryStringParams 함수에서 쿼리스트링에 포함된 각 파라미터를 개체화하여 세팅
- 수정/삭제/뒤로가기에도 페이지 정보유지
list.html의 list.forEach부분에서 
<td class="tl"><a href="/post/view.do?id=${row.id}">${row.title}</a></td>
를 
<td class="tl"><a href="javascript:void(0);" onclick="goViewPage(${row.id});"> ${row.title}</a></td> 로 변경

view.html의 버튼에 href에서 온클릭에 자바스크립트함수연결
<p class="btn_set">
    <a th:href="@{/post/write.do( id=${post.id} )}" class="btns btn_bdr4 btn_mid">수정</a>
    <button type="button" onclick="deletePost()" class="btns btn_bdr1 btn_mid">삭제</button>
    <a th:href="@{/post/list.do}" class="btns btn_bdr3 btn_mid">뒤로</a>
</p>

 에서 

<p class="btn_set">
  <button type="button" onclick="goWritePage();" class="btns btn_bdr4 btn_mid">수정</button>
  <button type="button" onclick="deletePost();" class="btns btn_bdr1 btn_mid">삭제</button>
  <button type="button" onclick="goListPage();" class="btns btn_bdr3 btn_mid">뒤로</button>
</p>

- 컨트롤러에 queryParamsToMap 함수생성
하고 MessageDto 생성자 호출할때 마지막 파라미터로 전달

# 15. REST API
https://congsong.tistory.com/28
- Representational State Transfer
- 하나의 URI는 하나의 고유한 리소스를 대표하도록 설계
- 디바이스의 종류에 상관없이 공통적으로 데이터를 처리할 수 있도록 한다. 화면이 아니라 결과를 리턴
- https://meetup.nhncloud.com/posts/92
- RestApiTestController 만들어서  locahost/members로 확인
- JSON 포매터 (https://jsonformatter.curiousconcept.com/)

# 16. REST API방식으로 CRUD 처리
https://congsong.tistory.com/29
- 댓글 테이블 생성
create table tb_comment (
      id bigint not null auto_increment comment '댓글 번호 (PK)'
    , post_id bigint not null comment '게시글 번호 (FK)'
    , content varchar(1000) not null comment '내용'
    , writer varchar(20) not null comment '작성자'
    , delete_yn tinyint(1) not null comment '삭제 여부'
    , created_date datetime not null default CURRENT_TIMESTAMP comment '생성일시'
    , modified_date datetime comment '최종 수정일시'
    , primary key(id)
) comment '댓글';
- 제약조건 추가
alter table tb_comment add constraint fk_post_comment foreign key(post_id) references tb_post(id);
- @NoArgsConstructor 기본생성자
- 일반적인 REST API방식에서는 FORM 자체를 전송하지 않고 JSON 문자열 포멧으로 데이터를 전송하기 때문에 set메서드가 필요하지 않다.
- CommentRequest, CommentResponse

# 17. 댓글 REST API 컨트롤러와 AJAX
https://congsong.tistory.com/30
- @RestController 응답으로 화면이 아닌 데이터(객체) 리턴
- @RequestBody 프론트에서 json으로 보낸것을 자바객체에 바인딩
- 화면은 상세글보기 VIEW.HTML 만 변경
- contentType = 서버로전송할데이터형식.  application/json
- dataType = 서버에서 응답으로 내려받을 데이터형식  text, html, xml, json

# 18. 댓글목록 표시
https://congsong.tistory.com/32
view.html에서 댓글 표시할 영역
onload에 ajax로 가져오는 findAllComment() js함수 추가
댓글저장함수 수정


# 19. 댓글수정
https://congsong.tistory.com/33
- Modal이라 불리는 레이어팝업 이용(창 컨트롤 불가)
- CommentApiController에 댓글상세정보조회, 기존댓글 수정 함수 추가
- view.html의 content영역에 댓글수정영역 추가
- 댓글 수정 팝업 js함수  openCommentUpdatePopup(글아이디) 추가
  댓글 수정 팝업 colose 함수 closeCommentUpdatePopup()추가
- 수정버튼에 클릭 이벤트에 openCommentUpdatePopup 연결 
- 테스트 : 댓글목록에서 수정버튼 클릭하면 레이어팝업
- 레이어팝업에서 수정완료 버튼눌렀을때 실행할 updateComment(글아이디) 함수정의
서버로 내용전달하고 완료되면 댓글재조회
- 테스트 : 댓글 수정후 즉시반영

# 20. 댓글삭제
https://congsong.tistory.com/34
- 컨트롤러에 처리함수 추가
- 삭제버튼에 온클릭 이벤트
- 삭제처리하는 JS함수추가

# 21. REST API 방식으로 댓글 페이징
어렵고 김
https://congsong.tistory.com/35
- 글 번호만 넘겨줘서 페이징 하던데서 CommentSearchDto로 변환하고 그에따라 주루룩 변환
CommentApiController, CommentService, CommentMapper
- 반복되는 ajax 호출때문에 공통함수 정의.
function.js에 getJson, callApi만들고
view.html에서 댓글저장(saveComment), 댓글수정(updateComment), 댓글삭제(deleteComment), 댓글수정팝업오픈함수(openCommentUpdatePopup) 함수에서 사용하도록 수정
- 댓글 렌더링(cm_list) 영역 아래에 댓글 페이징 표시할 html 영역추가
- 댓글 html을 그리는 drawComments함수의 파라미터 변경
- 페이징 html을 그리는 drawPage함수 선언
- findAllComment 에서 drawComments, drawPage 호출로 랜더링
- 테스트

# 22. History API
https://congsong.tistory.com/36
비동기통신은 url변경이 없기 때문에 새로고침했을때 페이지 유지
- hisoty객체 이용.
history.replaceState(state, title, url) 로 현재페이지의 세션 기록 수정할것임
- drawPage()함수 수정
- findAllComment()함수 수정
  기존에는 페이지네이션에서 활성화(on)된 페이지번호를 기준으로 페이지 세팅.
  이제는 주소에서 페이지 번호


# 23. 회원가입 기능 구현
https://congsong.tistory.com/37
- tb_member 테이블 생성
- enum Gender 생성
- MemberRequest 클래스 생성
- MemberResponse 클래스 생성
- MemMapper 인터페이스와 xml생성
- SecurityConfig 생성
- MemberController
- MemberService
- templates 폴더에 member폴더 추가. login.html
- 회원가입 테스트. http://localhost/login.do

# 24. 로그인 로그아웃
https://congsong.tistory.com/38
- MemberService에 login 함수 추가
- MemberController에 login함수 추가
- com.study.interceptor아래 LoginCheckInterceptor 클래스 추가
- 이 인터셉터도 스프링이 인식할수 있도록 Config클래스에 등록해야함
  WebMvcConfig에 인터셉터 패턴 추가
- login.html에 onload()와 login()함수 추가
- 로그인 테스트
   http://localhost/post/list.do 하면 http://localhost/login.do로 이동됨
   회원가입시 생년월일 8자리인데 6자리만 치는것 유의
- body.html의 header태그에 하드코딩이름 반갑습니다를 이름출력으로 변경  변경

추가해야할것 : 로그아웃, 8자리 말고 넣었을때 얼러트

# 25. 파일 업로드/다운로드
https://congsong.tistory.com/39
- 파일 테이블 생성 tb_file
- 파일 정보를 저장(INSERT)하는 용도로 사용할 파일 요청 클래스 FileRequest 
- 롬복의 @Builder. 빌더 패턴
- FileService 생성
- 공통파일처리용 유틸클래스 FileUtils  게시글번호를 알필요도 받을필요도 없다.
---백엔드끝. 프론트 시작
- write.html
saveform의 enctype변경
함수 생성

# 26. 파일 업로드/다운로드 2
https://congsong.tistory.com/44
게시글에 등록된 파일을 상세 페이지에 출력하는 기능과, 게시글을 수정할 때 파일을 추가/변경/삭제하는 기능, 그리고 기존에 등록된 파일을 그대로 유지하는 기능
- FileResponse  클래스
- FileMapper 인터페이스
- FileMapper XML 쿼리작 성
- FileService에 파일관련 처리 함수
- FileApiController //API처리 전용
- view.html 게시글 상세 페이지 수정
  파일 리스트 표시할 영역 추가
  findAllFile 함수 정의와 호출
- 테스트
- 수정하는 화면 write.html에 첨부파일 추가/변경/삭제
  - 전역변수의 문제점과 전역변수 피하기 https://sunmerrr.github.io/javascript/globalVariable/
  복잡하고 양 많음

# 27. 파일 업로드/다운로드 3 : 첨부파일 다운
https://congsong.tistory.com/45
- 상세페이지에서 파일명을 클릭했을때 해당파일의 id를 컨트롤러로 전달해야함
- findFileById를 인터페이스, 서비스, 매퍼에 추가
- 스프링은 Resource 라는 인터페이스 제공. 리소스에 대한 접근을 추상화하기위해 사용.  https://always-develop.tistory.com/37
- db의 데이터를 이용해서 디스크상에 업로드된 물리적 파일 객체를 읽어와야한다. FileUtils 에 readFileAsResource 메서드 추가.
- FileApiController 에 FileUtils를 멤버로 선언하고, downloadFile( ) 메서드를 추가
- view.html - findAllFile( ) 함수수정. 준비중입니다 돼있던에 파일 다운로드 링크 추가
- 파일 다운로드 테스트

---

# 28. ORM (**중요**)
https://congsong.tistory.com/51
myBatis 이제 그만.
JPA(Java Persistence API) : 자바진영의 ORM 기술 표준 (인터페이스)
- JPA 스펙의 대표적인 구현체로는 '하이버네이트'가 있다.
- Repository 는 Mybatis의 Mapper 역할
- 참고로 엔티티(Entity) 클래스와 레파지토리(Repository) 인터페이스는 꼭! 같은 패키지에 위치해야 한다.
- Entity 클래스는 테이블과 레코드 역할을 하는 데이터베이스 그 자체로 생각해야 하고 절대로 요청이나 응답에 사용되어서는 안된다. 그래서 Request, Response 클래스를 따로 구분해서 생성해줘야한다.
- @Entity
해당클래스가 테이블과 매핑되는 JPA의 엔티티 클래스임을 의미한다.
기본적으로 클래스명을 테이블명으로 매핑한다.
클래스명과 테이블이 다르면 @Table을 선언하고 이름을 넣어준다. 예를들어 @Table(name="jpa_element")
- @id
해당멤버가 엔티티의 pk임을 의미.
보통 db에서는 bigint, 엔티티에서는 Long
- @GeneratedValue(strategy = GenerationType.IDENTITY)
PK자동증가
Mysql같이 auto_increment를 지원하면 이것 사용.
오라클같이 시퀀스를 이용하면  GenerationType.SEQUENCE 이용.
GenerationType.AUTO 설정하면 db에서 제공하는 pk생성전략을 가져감
- Builder
롬복에서 제공. 생성자 대신에 이용하는 패턴. 
- @Setter가 없는 이유
에티티는 테이블 그 자체의 역할을 하기 때문에 컬럼에 대한 setter를 써버리면 객체의 값이 어느 시점에 변경되었는지 알 수가 없다. 때문에 Entity클래스에서는 절대로 set클래스가 존재해서는 안된다.
- 리파지토리 인터페이스
JpaRepository 인터페이스를 상속받을때 엔티티클래스의 타입과 pk에 해당하는 데이터타입으로 선언하면
해당 테이블의 CRUD기능을 사용할 수 있다.
- Optional
반복적인 null처리를 피하기 위해서 자바8에서 최초로 도입된 클래스

# 29. 전역 예외처리
- BoardApiController
- GlobalExceptionHandler
  - @RestControllerAdvice
  컨트롤러 전역에서 발생할 수 있는 예외를 잡아 Throw해준다. @ControllerAdvice에 @ResponseBody가 합쳐진 형태
  - @ExceptionHandler
  예외의 타입별로 예외처리
- 모든 예외를 한곳에서 관리하기 Enum클래스 ErrorCode 생성. 항상 동일한 구조의 포맷을 미리 설계
- 예외 응답을 처리할 Response 클래스 ErrorResponse 생성
- Custom 예외 처리용 예외클래스 CustomException 생성  RuntimeException 상속. Unchecked Exception
- GlobalExceptionHandler 수정


# 30. JPA로 CRUD 전체적으로 구현
https://congsong.tistory.com/55