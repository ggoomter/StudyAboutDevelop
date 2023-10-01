# REST
1. ## 뜻
    Representational State Transfer : 자원의 상태 전달 - 네트워크 아키텍쳐


1. ## 특징
    - Client, Server
        - 클라이언트와 서버가 서로 독립적으로 분리되어 있어야 한다.
    - Stateless
        - 요청에 대해서 클라이언트의 상태를 서버에 저장하지 않는다.
    - Cache
        - 클라이언트는 서버의 응답을 임시저장 할 수 있어야 한다.
        - 클라이언트가 Cache를 통해서 응답을 재사용할 수 있어야 하며, 이를 통해서 서버의 부하를 낮춘다.
    - 계층화
        - 서버와 클라이언트 사이에 방화벽, 게이트웨이, Proxy 등 다양한 계층 형태로 구성이 가능해야 하며, 이를 확장 할 수 있어야 한다.
    - 인터페이스 일관성 **RESTful하게 개발**
        - 자원의 식별
            - 리소스접근에 URI를 사용. https://foo.co.kr/user/100
        - 메세지를 통한 리소스 조작
            - 데이터 전체 자체가 아니라 메세지로 변환하여 전달
        - 자기서술적 메세지
            - 어떻게 처리되어야 하는지 요청만 봐도 알 수 있어야 한다.
            - GET : https://foo.co.kr/user/100  /*요청*/
              POST : https://foo.co.kr/user /*생성*/
              PUT : https://foo.co.kr/user  /*수정*/
              DELETE : https://foo.co.kr/user/100 /*삭제*/
        - 애플리케이션 상태에 대한 엔진으로써 하이퍼미디어
            - 리소스에 대한 Link 정보도 같이 포함해서 응답
    - Code on Demand(Optional)
        - 자바애플릿, 자바스크립트, 플래시 등 특정한 기능을 서버로부터 클라이언트가 전달받아 코드를 실행 할 수 있어야 한다.


## URI 설계 패턴
- URI : Uniform Resource Identifier
인터넷에서 자원의 위치를 식별하는 유일한 논리 주소
예) https://www.naver.com/resource/sample/1

- URL : Uniform Resource Locator.
인터넷에서 자원이 실제 위치한 물리 주소값.(실제위치)
예) https://www.naver.com/naverinfo.pdf\

-  URL은 URI의 하위개념.   URI여러개가 URL하나에 대응될수 있겠네.

- URI설계 가이드(RFC-3986
    - 슬래시 구분자는 계층관계를 나타내는데 사용
    - URI마지막 문자로 슬래시는 포함하지 않는다.
    - 하이픈은 UIR가독성을 높이는데 사용
    - 밑줄은 사용하지 않는다.
    - URI경로에는 소문자가 적합
    - 파일확장자는 URI에 포함하지 않는다.
    - 프로그래밍언어에 의존적인 확장자를 사용하지 않는다. .do같은
    - 구현에 의존적인 경로를 사용하지 않는다. servlet/같은
    - 세션ID를 포함하지 않는다.
    - 프로그래밍 언어의 Method명을 이용하지 않는다.
    - 명사는 단수형보다 복수형
    - 컨트롤러는 동사형
    - 경로 부분중 변하는 부분은 유일한 값으로 대체
    - CRUD기능을 나타내는것은 URI에 사용하지 않는다.
    - URI Qeury Parameter 디자인
    - URI 쿼리는 컬렉션의 결과를 페이지로 구분하여 나타내는데 사용.
    - API에 있어서 서브도메인은 일관성 있게 사용해야합니다.
    - 클라이언트 개발자 포탈 서브 도메인은 일관성있게 만든다.

## HTTP Protocol
- Hyper Text Transfer Protocol.
- 웹에서 데이터를 주고받는 프로토콜. (프로토콜은 권장이 아니고 반드시 따라야 하는 규칙)
- TCP를 기반으로 한 REST의 특징을 모두 구현하고있다.
- 이름에는 하이퍼텍스트가 들어있지만 실제로는 컴퓨터에서 다룰 수 있는것은 모두 전송할 수 있다.
- Request 와 Response형태의 통신방법.
