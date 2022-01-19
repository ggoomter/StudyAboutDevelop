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

# JSP를 공부하기 전에 먼저알아야 되는 서블릿

# 서블릿 Servlet
  -Server + Applet.  자바를 이용하여 웹에서 실행되는 프로그램을 작성하는 기술
  - 클라이언트의 요청을 받아서 동적으로 그 결과로 HTML을 생성해서 응답으로 반환하는 Servlet쿨래스의 구현 규칙을 지킨 자바 웹 프로그래밍 기술(프로그램).
  - 클라이언트가 요청을 하면 그에대한 결과를 다시 전송해주는 역할을 하는 자바프로그램. 확장자는 .java
  - MVC패턴에서 컨트롤러로 이용된다.
  - 초창기 CGI방식 웹서버의 성능개선을 목적으로 썬마이크로시스템스에서 발표하였다.
	CGI는 멀티프로세스로 동작하기 때문에 다수의 클라이언트 요청이 들어오면 큰 부하가 걸린다.
	서블릿은 자바 기반이기 때문에 멀티쓰레드로 동작해서 많은 클라이언트의 요청에 더 잘견딘다.
	또한 JVM위에서 동작하기 때문에 플랫폼 독립적이다.
        *CGI = Common Gateway Interface
  - 브라우저를 통해 자바클래스가 실행되도록 하기 위해서는 javax.servlet.http.HttpServlet을 상속받아 서블릿 클래스를 구현해야한다.
    HttpServlet에 있는 메소드 중 클라이언트 (사용자)가 요청한 정보에 따라 처리해야 할 메소드(doGet, doPost등)를 오버라이딩 해서 구현한다.
    즉 서블릿 클래스에 있는 doGet, doPost메소드가 호출되는것이다. 무엇에 따라?
    클라이언트(브라우저)에서 submit의 method형태가 get이냐 post이냐에 따라.
    action속성값으로는 어떤 서블릿으로 보낼건지 결정.
    그 이름을 찾는것은 누가하냐? WAS(톰캣)가 그 이름을 가진 .class파일을 찾아서 실행한다.

  - JDK에는 웹 애플리케이션을 제작할 수 있는 클래스가 제공되지 않고 톰캣을 설치해야 클래스가 제공되는데 그 클래스가 바로 HttpServlet이며 이 클래스를 상속받은 클래스를 서블릿이라고 한다.
  - 브라우저를 통해 외부에서 실행되기 때문에 접근제한자는 반드시 public이여야 한다.


  - [동작방식]
    1. 사용자(클라이언트)가 URL을 입력하면 HTTP Request가 Servlet Container로 전송합니다.
    1. 요청을 전송받은 Servlet Container는 HttpServletRequest, HttpServletResponse 객체를 생성합니다.
    1. web.xml을 기반으로 사용자가 요청한 URL이 어느 서블릿에 대한 요청인지 찾습니다.
    1. 해당 서블릿에서 service메소드를 호출한 후 클라이언트의 GET, POST여부에 따라 doGet() 또는 doPost()를 호출합니다.
        //즉 서블릿은 Event-Driven Programming으로 사용자의 요청이 들어오면 동작을 시작한다.
    1. doGet() or doPost() 메소드는 동적 페이지를 생성한 후 HttpServletResponse객체에 응답을 보냅니다.
    1. 응답이 끝나면 HttpServletRequest, HttpServletResponse 두 객체를 소멸시킵니다.

 - [서블릿의 장점]
 수행속도가 빠르다. 그 이유는 두번째 요청부터는 첫번째 요청과 다르게 처리되기 때문.
 인스턴스를 다시 생성하는것이 아니라 메모리에 남은 서블릿 인스턴스를 재활용하여 서비스를 제공한다.
 반면에 PHP, ASP는 요청될때마다 인터프리터 방식으로 코드를 재해석한다.


    ## 서블릿 컨테이너
    - 그냥 서버에 서블릿을 만들어서 위치시킨다고 클라이언트의 Request/Response를 처리해줄리가 없다.
    결론적으로 서블릿을 관리해주는 서블릿 컨테이너가 있어야 한다. 아파치 톰캣이 바로 서블릿/JSP 컨테이너다.
    <img src="이미지/서블릿.png" width="100%" height="100%"/>
    - 예) doGet, doPost, doPut, doDelete, init, destroy 이런 함수 있는 클래스
    ```java
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    		// TODO Auto-generated method stub

    		response.getWriter().append("Served at: ").append(request.getContextPath());

    	}
    ```
----웹개발----
가장 중요한것은 클라이언트가 어떻게 서버에게 요청하는지와
서버가 처리한 결과를 어떻게 서버에게 응답하는지를 아는 것.

--------------본격적인 JSP --------------------
# JSP란
  - Java Server Pages
  - (HTML에 JAVA코드를 넣어) 동적인 웹페이지를 작성하는데 사용되는 자바의 표준기술
	쉽게말하면 HTML안에 JAVA코드가 들어있는것. <% 자바코드 %>. 이 <% %> 기호를 스크립트릿이라고 한다.
  - 서블릿의 단점(프론트엔드와 백엔드의 협업이 굉장히 불편)을 보완하고자 만든 서블릿 기반의 스크립트 기술.
    웹서버에서 실행되는 페이지이기 때문에 웹서버가 있어야 실행할 수 있다.
  - Servlet기술을 확장한 기술.(서블릿의 모든 기능 + 추가적인 기능)
  - HTML은 브라우저의 번역기가 돌리고, JSP는 톰캣이나 제티같은 WAS가 번역하여 그 결과를 HTML로 변환한다.
	- WAS에서 JSP실행 -> JSP가 서블릿으로 변환 -> 서블릿에서 HTML생성 -> 클라이언트 응답전송
	- WAS마다 지원하는 JSP버전이 다르고, JSP버전마다 해당하는 서블릿 버전이 다르다.

  - 화면 인터페이스 구현에 너무 많은 코드를 필요로 하는 서블릿을 작성하지 않고도 간편하게 웹프로그래밍을 구현하게 만든 기술

  - jsp를 사용하기 위해서는 문서 최상단에 jsp를 사용한다는 문구를 적어줘야한다.
    <%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
  - 이후 자바코드를 <% %>안에 처리해주면 된다.
  - 넘어오는 모든 데이터는 request객체에 담겨져있다.
  - jsp에서 jsp로 데이터 넘기는 법
    ```javascript
    //보내는쪽에서
    <a href="confirm.jsp?name='요롱이' ">  //name이라는 변수에 값을 담아 이동

    //받는쪽에서
    <%
      request.setCharacterEncoding("UTF-8");
      String name = request.getParameter("name");
    %>
    <p>이름은 <%= name %></p>
    ```

    ## [jsp include로 영역 나누기](https://n-che-sw.tistory.com/39)


## 문법
쉽게는 선언문, 스크립트릿, 표현식 3가지고 복잡하게는 아래와 같다.
    - 지시자     : <%@ directive %>              : 페이지의 속성을 지정한다.  page, include, taglib
    - 주석       : <%-- comment --%>          : html의 주석은 클라이언트에 공개되지만 jsp의 주석은 클라이언트가 볼수없다.
    - 선언       : <%! declaration %>            : 변수, 메소드 선언
    - 표현식     : <%= expression %>             : 결과값 출력, 선언된 메소드나 변수의 "값"만 간단하게 String으로 변환
          서블릿컨테이너는 <%= %>를 만나면 out.print()로 변환한다.
          예를들어 <%= a %>  라고 하면 out.print(a)와 같다. 때문에 안에 ;를 찍어서 a;처럼 기술하면 안된다.
    - 스크립트릿 : <% scriptlet %>               : JAVA 코드. 브라우저로 전송되기전에 자바 코드로 변환된다.
    - 액션태그   : <jsp:action> </jsp:action>    : WAS동작을 제어.      forward, include, useBean, setProperty, getProperty


## JSP가 처리되는 과정
1. 웹브라우저에 주소 입력
2. JSP에 해당하는 서블릿이 없는경우
  1. JSP페이지로부터 자바코드를 생성
  2. 자바코드를 컴파일해서 서블릿 클래스를 생성
  3. 서블릿에 클라이언트 요청을 전달
  4. 서블릿이 요청을 처리한 결과를 응답으로 생성
  5. 응답을 웹 브라우저�PNG

