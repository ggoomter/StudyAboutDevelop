
## HTML이란?
웹브라우저에서 보여지도록 설계된 문서 -> 웹브라우저에서 보는 문서(화면)
"Hypertext Markup Language"
하이퍼텍스트를 가장 중요한 특징으로 하는 / 마크업이라는 형식을 가진 / 언어.
하이퍼텍스트 : 하이퍼링크가 걸려있는 텍스트
하이퍼링크 : 다른 텍스트로 이동할수있는 연결 고리

마크업 : 정보에 '형식과 구조'가 명시한 것
  <h3>제목</h3>   제목이라는 값에 3번째 등급으로 중요한 텍스트라는 구조. 그리고 그렇게 표현하도록 하는 형식.
마크다운 : 마크업 언어의 일종.  서식에 글쓰는 흐름이 끊기지 않도록 <div></div>처럼 쓰던 마크업을 좀더 편하게 쓰도록 만든것.

언어란? : 사과라고 하면 사과가 떠오르는것처럼. 링고(일본어)라고 하면 사과가 안떠오르는것 처럼.  서로간의 의사소통에 미리 정해놓은 약속.

즉 HTML은 다른 웹페이지로 이동할수 있는 **형식과 구조**가 명시된 언어. HTML의 본질은 '정보'
프로그래밍 언어가 아니라 마크업언어. 굉장히 쉬워서 오늘 하루만에 배울수있다. 그러나 매우 중요하다.
공부를 할때는 쉽고 효율이 좋은걸 먼저 배워야 한다.
실습 > a.html만들고 hello world 치고 브라우저에서 띄우기.


## HTML의 구조
실습 > 각자 아무 웹페이지 들어가서 요소 검사.
헤드(메타정보. 타이틀,  캐릭터셋:문자집합 ASCII, UNICODE 등.   인코딩:문자셋과바이트 매핑규칙. EUC-KR, UTF-8 등).
바디(HEADER, NAV, MAIN, ASIDE, FOOTER).   W3C. 브라우저.
  태그공부 : 콘텐츠를 감싸서 그 정보의 '형식과 구조'를 정의.
  모질라 https://developer.mozilla.org/ko/docs/Web/HTML
  w3스쿨 https://www.w3schools.com/
  tcp스쿨 http://tcpschool.com/


  (H1~6, BUTTON, A, IMG 등)
  이상한 태그를 쓰더라도 브라우저는 에러임을 알지만 문서는 읽을수 있도록 자체적으로 처리하고 보여주기는한다. 실행이 안되는거 아니다.
  태그는 본질적으로 BOX형태로 이루어져있다.
    대표적인 BOX TAG : header/nav/footer, main/section/aside, article
    Box는 Block(공간이 충분해도 한줄에 하나)과 Inline(공간이 허용하는한 한줄에 여러개) 디스플레이로 나뉜다.
      Block의 예 : header, footer, p, li, table, div, h1~h6
      Inline의 예 : span, a, img,
검사 : validator.w3.org

## 요소 element
<여는태그 속성="값">컨텐츠<닫는태그>

## 태그
이상한 태그를 쓰더라도 브라우저는 에러임을 알지만 문서는 읽을수 있도록 자체적으로 처리하고 보여주기는한다. 실행이 안되는거 아니다.
태그는 본질적으로 BOX형태로 이루어져있다.
  대표적인 BOX TAG : header/nav/footer, main/section/aside, article
  Box는 Block(공간이 충분해도 하나가 한줄을 다 차지한다.)과 Inline(공간이 허용하는한 한줄에 여러개) 디스플레이로 나뉜다.
    Block의 예 : header, footer, p, li, table, div, h1~h6
    Inline의 예 : span, a, img,
![태그사용율](../이미지/html태그사용율.png)
  - a
    anchor. html의 가장 중요한 태그. 다른 문서로 이동할수 있게 해준다. 목적지 href 속성이 반드시 필요함
  - div
    division의 약자. 구분. 분류.   무색 무취의 태그. 칸이 남아도 자기가 한칸 다쓴다.
  - span
    무색 무취의 태그.    자기 콘텐츠영역만 칸을 쓴다.
  - H1~6
  - BUTTON
  - Table
    - tr(table row) : 행 추가
    - th(table header)
    - td(table data) : 데이터(컬럼) 추가
    - (colspan, rowspan)
  - ol, ul (ordered list, unordered list)
    - li  (list item)
  - form
    - action 속성 : 어디로 폼데이터를 보낼것인가
    - method 속성 : 어떤 HTTP 메소드를 사용해서 데이터를 보낼것인가
  - input
  - img , audio, video
  - script
    <script type="text/javascript">내용</script>
    <script type="text/javascript" src="경로"></script>
  - link
    <link href="경로" rel="stylesheet">
    <link rel="icon" href="favicon.ico">
  - iframe
    <iframe src="삽입할페이지주소"></iframe>
  - canvas, SVG(Scalable Vector Graphics)
      <canvas id="drawCanvas" style="width:300px; height:200px; border: 1px solid #993300;"></canvas>
  - Web Storage(localStorage)
    function clickCounter() {
        if(typeof(Storage) !== "undefined") {
            if (localStorage.clickcount) {
                localStorage.clickcount = Number(localStorage.clickcount) + 1;
            } else {
                localStorage.clickcount = 1;
            }
            document.getElementById("counter").innerHTML = "카운터의 현재 횟수는 " + localStorage.clickcount + "입니다!";
        }
    }

### head
script, meta, title, link

### body (2시간)
  3.1 블록과 인라인
  3.2 태그  140개정도. 의미 있는것만
  3.3 블록 인라인 (30분)
    3.4 태그의 중첩과 시멘틱, doctype (30분)
  3.5 특별한 안경 장착. 어떤 웹사이트를 보든 구조를 파악할수있도록
  아무웹페이지 접속해서 우클릭 - 페이지 소스보기. 개발자모드 영역 표시.
  block부분 다시 설명, 마진 패딩   div, span다시 설명
  뭐가 뭔지 하나도 모를겁니다. 오늘 강의들으면 눈에 보인다. 아는만큼 보이는 느낌. 그 즐거움.
  3.6 따라해보기 실습과제 (2시간+과제)
    4시에 과제 첨삭, 질의응답, 접근성, 반응형 웹, 검색엔진최적화



## 시멘틱, 중첩을 잘써야 멋진 html을 만든다.
Sementic : 의미상의.
HTML의 본질인 '정보의 전달'이라는 본질에 집중한 의미론적 태그
<article>
<aside>
<details>
<figcaption>
<figure>
<footer>
<header>
<main>
<mark>
<nav>
<section>
<summary>
<time>

예) <div class="nav">네비게이션</div>
본질이 div이며 클래스의 이름이 nav. 시멘틱하지 않음
<nav>  이게 시맨틱.

