## 선행지식
- 자바 변수, 메서드, 클래스
- 자바 자료형, 객체생성
- 제어문, 반복문
- 기본 HTML(form 만들수 있어야함, DOM 구조), CSS, JS

## 준비물
- JDK
- 톰캣
- 데이터베이스
- IDE

## 서블릿이 무엇이고 JSP가 무엇인지에 대해서는 백엔드공부.md에 정리


##문법
간단하게 말하면 꺽쇠% 안에 자바코드   <% 자바코드 %>
복잡하게는 아래와 같다.
    - 지시자     : <%@ directive %>              : 페이지의 속성을 지정한다.  page, include, taglib
    - 주석       : <%-- comment --%>
    - 선언       : <%! declaration %>            : 변수, 메소드 선언
    - 표현식     : <%= expression %>             : 결과값 출력, 선언된 메소드나 변수의 "값"만 간단하게 String으로 변환
    - 스크립트릿 : <% scriptlet %>               : JAVA 코드
    - 액션태그   : <jsp:action> </jsp:action>    : WAS동작을 제어.      forward, include, useBean, setProperty, getProperty

## 주석
<% --   내용  -- %>

## JSP가 처리되는 과정
1. 웹브라우저에 주소 입력
2.1 JSP에 해당하는 서블릿이 없는경우
    JSP페이지로부터 자바코드를 생성
    자바코드를 컴파일해서 서블릿 클래스를 생성
    서블릿에 클라이언트 요청을 전달
    서블릿이 요청을 처리한 결과를 응답으로 생성
    응답을 웹 브라우저에 전송
2.2 JSP에 해당하는 서블릿이 있는경우
    서블릿에 클라이언트 요청을 전달
    서블릿이 요청을 처리한 결과를 응답으로 생성
    응답을 웹브라우저에 전송
즉, JSP를 실행한다는 말은 곧 JSP페이지를 컴파일한 결과인 서블릿 클래스를 실행한다는 말이다.
예)   1. 웹브라우저의 요청 : http://블라블라/helloworld.jsp    
        2. 서블릿으로 변환   : helloworld.jsp -> helloworld_jsp.java
        3. class로 변환      : helloworld_jsp.java -> helloword_jsp.class
        4. 웹브라우저 응답   : HTML형태로 응답


## 세상 가장 간단한 JSP만들기
- 톰캣 폴더에 webapps폴더만들고 time.jsp파일 작성하고 시간찍기
```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= new java.util.Date() %>
</body>
</html>
```

## 조금 어려운 jsp 만들기
```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
    var a = 10;    // javascript code
    document.write("a: ", a);    // js 는 브라우저가 해석
</script>
<%
    int b = 10;    // java code
    out.println("b: " + b);    // jsp는 서버에서 해석
%>
<br>
<%
    /* jsp파일은 service 메소드를 오버라이딩한 하나의 메소드이다. */
    //private String str = "";    // * err : jsp 는 전체가 하나의 메소드
    String ir = "홍길동";    // 지역변수
    out.println(ir + "의 홈페이지입니다.");
%>
<h1>제목 태그</h1>
<h3>제목 태그</h3>
<h6>제목 태그</h6>
<%
    for(int i = 1; i < 7; i++){
        out.print("<h" + i + ">");
        out.print("제목 태그(자바로 작성)");
        out.println("</h" + i + ">");
    }
%>

</body>
</html>


```


## JSP페이지의 구성요소
- ### 1. 내장객체 9가지 (***중요***)
    - ### request
    JSP에서 가장 많이 사용하는 기본객체.
    웹브라우저가 전송한 파라미터를 읽어올 수 있는 메서드를 제공하고있다.
    브라우저의 요청 정보를 저장하고 있는 객체
    HTTP헤더와 HTTP바디로 구성되어있다. 웹컨테이너는 HttpServletRequest객체로부터 사용자의 요구사항을 얻어낸다.
        - String getParameter(String name) : 파라미터 변수 name에 저장된 변수를 얻어내는 메소드로, 이때 변수의 값은 String으로 리턴된다. 
        - String[] getParameterValues(String name) : 파라미터 변수 name에 저장된 모든 변수값을 얻어내는 메소드. 하나의 이름으로 여러 데이터값을 넘길때 사용한다. checkbox에서 주로 사용된다.
        - Enumeration getParameterNames() :요청에 의해 넘어오는 모든 파라미터 변수를 java.util.Enumeration 타입으로 리턴한다. 
        - getParameterMap()

    - ### response
    request와 반대의 기능을 수행한다.
    서버가 웹브라우저에게 보내는 응답정보를 담고있다.
    브라우저의 요청에 대한 응답 정보를 저장하고 있는 객체
    응답 정보는 HttpServletResponse 객체에 담아보낸다.
    헤더 추가 함수들을 제공하는데 리턴타입은 모두 void다. 응답헤더를 직접설정해야 하는 경우가 많지 않기 때문에 익숙하지 않아서 정리도 하지 않겠다.
    반면에 response객체의 .sendRedirect(String 주소) 는 많이 사용하는 기능이다.
        - void setHeader(name, value)                         헤더 정보의 값을 수정하는 메소드로, name에 해당하는 헤더 정보를 value값으로 설정한다. 
        - void setContentType(type)                           웹 브라우저의 요청의 결과로 보일 페이지의 contentType을 설정한다. 
        - void sendRedirect(url)                              페이지를 이동시키는 메소드로, url로 주어진 페이지로 제어가 이동한다. 

    - ### session
        getSession(), getRequestedSessionID(), isRequestedSessionIdValid()
    - ### out
        - boolean isAutoFlush()                               출력 버퍼가 다 찼을 때 처리 여부를 결정하는 것으로, 자동으로 플러시 할 경우에는 true를 리턴하고, 그렇지 않을 경우 false를 리턴한다. 
        - int getBufferSize()                                 출력 버퍼의 전체 크기를 리턴한다. 
        - int getRemaining()                                  현재 남아 있는 출력 버퍼의 크기를 리턴한다. 
        - void clearBuffer()                                  현재 출력 버퍼에 저장되어 있는 내용을 웹 브라우저에 전송하지 않고 비운다. 
        - String println(str)                                 주어진 str 값을 웹 브라워저에 출력한다. 이때 줄 바꿈은 적용되지 않는다. 
        - void flush()                                        현재 출력 버퍼에 저장되어 있는 내용을 웹 브라우저에 전송하고 비운다. 
        - void close()                                        현재 출력 버퍼에 저장되어 있는 내용을 웹 브라우저에 전송하고 출력 스트림을 닫는다. 
    - ### pageContext = JSP페이지에 대한 정보
    - ### application = 어플리케이션 Context의 정보를 저장하고 있는 객체
    - ### page = 페이지를 구현한 자바 클래스
    - ### config = JSP 페이지에 대한 설정 정보를 저장하고 있는 객체
    - ### exception = 예외가 발생한 경우에 사용되는 객체

    ```jsp
    form.jsp 에서
    <form action="경로/viewParameter.jsp" method="post">
    로 줬으면 form 태그안의 name들이 다 타고넘어간다.

    받는 viewParameter.JSP에서
    이름 = <% request.getParameter("name") %>
    주소 = <% request.getParameter("address") %>
    이런식으로 가져올수 있다.
    ```
    - <개념> 리다이렉트 vs 포워딩

    - ### response
    - ### pageContext
    - ### Session
    - ### application
    - ### out

- #### 2. 디렉티브(지시어)
    - 문법
        <%@ 디렉티브이름 속성1="값1" 속성2="값2" ... %>

    - 디렉티브 종류
        |이름|설명|주요속성|
        |---|---|---|
        |page|JSP 페이지에 대한 설정정보 지정.  JSP가 생성하는 문서의 타입, 출력버퍼크기, 에러페이지 등|contentType, import, session, buffer, autoFlush, info, errorPage, isErrorPage, pageEncoding, isELIgnored|
        |taglib|JSP페이지에서 사용할 태그 라이브러리를 지정|
        |include|JSP 페이지의 특정 영역에 다른 문서를 포함시킴|
        캐릭터셋을 생략할경우 기본이 ISO-8859-1인데 이것은 한글을 제대로 표현할 수 없다. 그래서 UTF-8로 변경
        캐릭터셋은 대소문자를 구분하지 않고 입력하면 된다.

- #### 3. 스크립트 요소
    - 표현식(Expression) : 값을 출력
        - 문법 : <%= 표현식%>
    - 스크립트릿(Scriptlet) : 자바코드를 실행
        - 문법 : <% 자바코드%>
    - 선언부(Declaration) : 자바 메서드를 생성.
        - 문법 : <%! 자바메소드 정의 코드 %>
- #### 4. 액션태그
- ### 5. 표현언어   (Expression Language : EL표기법)
    자바코드와 HTML의 표현을 섞게되면 복잡해지는데 그것을 쉽게 사용하기 위한 기술
    JSP 2.0부터 사용가능
    - 문법
        ${  표현식 }
        예1)   객체 접근:              ${ObjectName}
        예2)   property에 접근:    ${ObjectName.property}
        예3)
        ```html
        <%
            int a = Integer.parseInt(request.getParameter("a"));
            int b = Integer.parseInt(request.getParameter("b"));
        %>
        a * b = <%= a*b %>
        ```
        이것을 표현언어를 사용하면 아래와같이 간결하게 사용할 수 있다.
        ```html
        a * b = ${param.a * param.b}
        ```

- ### 6. JSTL (JSP Standard Tag Library). 표준액션태그와 태그라이브러리
    - 문법
        <jsp:액션태그이름 속성1="값1" 속성2="값2" ... />
    - 커스덤태그
        : JSP를 확장시켜주는 기능. 개발자가 직접 개발할 수 있고 해야한다.
    - JSTL (JSP Standard Tag Library)
        : 커스덤 태그중에서 자주 사용하는것들을 별도로 표준화한 태그라이브러리를
	- <c:if test="${변수>2000}">
			html내용
	  </c:if>



### 인코딩
HTTP표준에는 GET방식으로 전달되는 파라미터값을 인코딩할때 어떤 캐릭터셋을 사용해야하는지에 대한 표준이 없다.
그리고 WAS마다 GET방식의 파라미터 값을 읽어올때 사용하는 기본 캐릭터셋도 다르다.

### 캐시
웹어플맄케이션을 개발하다 보면 새로운 내용을 DB에 추가했는데도 웹브라우저에 출력되는 내용이 바뀌지 않는 경우가 종종있다. 이는 웹브라우저가 서버가 생성한 결과를 출력하지 않고 캐시에 저장된 데이터를 출력하기 때문이다.
내용이 자주 바뀌지 않는 사이트는 웹브라우저 캐시를 사용해서 빠른 응답을 제공할 수 있지만,
게시판처럼 내용이 자주 변경되는 사이트는 캐시가 적용되면 사용자는 변경된 내용을 확인할 수 없게 된다.


### 동빈나 - jsp로 MVC1 따라하기
[1번](https://windorsky.tistory.com/entry/JSP-%EA%B2%8C%EC%8B%9C%ED%8C%90-%EB%A7%8C%EB%93%A4%EA%B8%B0-1?category=831922)

1.jdk 15 , tomcat 9 설치, sts설치후 환경변수
환경변수 설정, cmd에서 실행시켜보기
동일한 폴더에 워크스페이스, 톰캣 지정하자.
다이나믹 웹 프로젝트.  WebContent 안에 index.jsp 만들고 실행 확인
2. [로그인 화면](https://www.youtube.com/watch?v=MtxFWczSFqU&list=PLRx0vPvlEmdAZv_okJzox5wj2gG_fNh_6&index=2)
    1. index.jsp(메인)으로 오면 로그인페이지로 강제 이동
    2. login.jsp
    헤더영역의 nav 작성
3. [mysql로 회원데이터베이스 구축](https://www.youtube.com/watch?v=kN8xRG6UPZM&list=PLRx0vPvlEmdAZv_okJzox5wj2gG_fNh_6&index=3)
    1. mysql설치
    2. 테이블 생성
    create database bbs;
    use bbs;
    show databases;

    create table USER(
        userID varchar(20),
        userPassword varchar(20),
        userName varchar(20),
        userGender varchar(20),
        userEmail varchar(50),
        primary key(userID)
    );

    3. jsp에서 가져오기위한 User클래스 생성 06:00
    getter/setter 생성
    이것이 [자바 빈즈](https://opentutorials.org/module/3569/21296)
    
4. [로그인 기능 구현](https://www.youtube.com/watch?v=RYo3OGlRoJw&list=PLRx0vPvlEmdAZv_okJzox5wj2gG_fNh_6&index=4)
loginAction.jsp
데이터베이스에 접근하기 위한 dao생성
Connection, PreparedStatement, ResultSet
생성자에서 연결하도록
5. [회원가입 페이지디자인] join.jsp
6. [회원가입 기능 구현]	joinAction.jsp
7. [세션관리] loginAction.jsp, joinAction.jsp, main.jsp수정, logoutAction.jsp
8. [메인페이지디자인](https://www.youtube.com/watch?v=pCqaGoexV5c&list=PLRx0vPvlEmdAZv_okJzox5wj2gG_fNh_6&index=8)
9. [게시판 데이터베이스 구축]
10. [글쓰기 기능]
11. [글목록 기능]
12. [게시글 디테일 조회 기능]
13. [게시글 수정 및 삭제]
14. [메인페이지 디자인 수정]
15. [완성 및 배포]
16. [검색]
17. [댓글] (https://m.blog.naver.com/2ejhi/222018209920)
(https://lkg3796.tistory.com/37)
comment라는 이름으로 package만들고 Comment.java, CommentDAO만들기
view.jsp(보드 상세내역 보는 화면)에서 
18. [사진첨부] multipart/form-data
서버에 올리기
미리보기 보여주기
19. [페이징](https://blog.naver.com/PostView.nhn?blogId=heartflow89&logNo=221014400238&redirect=Dlog&widgetTypeCall=true&directAccess=false)
https://unabated.tistory.com/search/gopage
    1. 몇개씩 보여줄것인지 정하기(기본은 10)
    2. 화면하단에 페이지 리스트 번호 출력하기  ( 예를들어 글이 19개이면 1,2 보여야함)
         1~10이면 1,  11~20이면 1,2     32개면 1,2,3이구나.  규칙파악해서 일반화
    3. 페이지처리를 위해 데이터 구축(글 하나하나 화면으로 넣지말고 쿼리로 빨리 넣기)
    4. 
    


<에러>
The superclass "javax.servlet.http.HttpServlet" was not found on the Java Build Path
=> 서버 설정 잘못된거

4. 로그인구현할때 Loading class `com.mysql.jdbc.Driver'. This is deprecated. The new driver class is `com.mysql.cj.jdbc.Driver'. The driver is automatically registered via the SPI and manual loading of the driver class is generally unnecessary.
java.sql.SQLException: Access denied for user 'root'@'localhost' (using password: YES)
=> Bitnami랑 충돌일어나고있었음
검색에서 bitnami쳐서 서비스 종료시키면 해결

<확실하게 해야되는것>
단순히 <%  안에 자바코드안에 선언한 변수는 마찬가지로 <% 밖에 못쓰고
EL표기법으로 가져올려면 내장객체속에 넣어야한다.