
## HTML이란?
웹브라우저에서 보여지도록 설계된 문서 -> 웹브라우저에서 보는 문서(화면)
"Hypertext Markup Language"
하이퍼텍스트를 가장 중요한 특징으로 하는 / 마크업이라는 형식을 가진 / 언어.
하이퍼텍스트 : 하이퍼링크가 걸려있는 텍스트
하이퍼링크 : 다른 텍스트로 이동할수있는 연결 고리

마크업 : 정보에 '형식과 구조'를 명시하는 것
  예를들어 <h3>제목</h3>   제목이라는 값에 3번째 등급으로 중요한 텍스트라는 구조. 그리고 그렇게 표현하도록 하는 형식.
마크다운 : 마크업 언어의 일종.  서식에 글쓰는 흐름이 끊기지 않도록 좀더 편하게 쓰도록 만든것.
  예를들어 <h3>제목</h3> 을 ### 제목 으로 쓸수있게함.

언어란? : 사과라고 하면 사과가 떠오르는것처럼. 링고(일본어)라고 하면 사과가 안떠오르는것 처럼.  서로간의 의사소통에 미리 정해놓은 약속.

즉 HTML은 다른 웹페이지로 이동할수 있는 **형식과 구조**가 명시된 언어. HTML의 본질은 '정보'
프로그래밍 언어가 아니라 마크업언어. 굉장히 쉬워서 오늘 하루만에 배울수있다. 그러나 매우 중요하다.
공부를 할때는 쉽고 효율이 좋은걸 먼저 배워야 한다.
실습 > a.html만들고 hello world 치고 브라우저에서 띄우기.

#### 강의
[생활코딩](https://www.youtube.com/watch?v=tZooW6PritE&list=PLuHgQVnccGMDZP7FJ_ZsUrdCGH68ppvPb)

## HTML의 구조
실습 > 각자 아무 웹페이지 들어가서 요소 검사 또는 F12누르면 개발자모드.
헤드(메타정보. 타이틀,  캐릭터셋:문자집합 ASCII, UNICODE 등.   인코딩:문자셋과바이트 매핑규칙. EUC-KR, UTF-8 등).
바디(HEADER, NAV, MAIN, ASIDE, FOOTER).   눈으로 보이는 부분.
  태그공부 : 콘텐츠를 감싸서 그 정보의 '형식과 구조'를 정의.
  모질라 https://developer.mozilla.org/ko/docs/Web/HTML
  w3스쿨 https://www.w3schools.com/
  tcp스쿨 http://tcpschool.com/

## 요소 element
<여는태그 속성="값">컨텐츠<닫는태그>

## 태그
이상한 태그를 쓰더라도 브라우저는 에러임을 알지만 문서는 읽을수 있도록 자체적으로 처리하고 보여주기는한다. 실행이 안되는거 아니다.
태그는 본질적으로 BOX형태로 이루어져있다.
  박스는 컨텐츠(content : 내용)와 보더(border:테두리)가 있고 보더 바깥으로 마진(margin : 여백), 보더 안으로 패딩(padding : 안쪽여백)
  대표적인 BOX TAG : header/nav/footer, main/section/aside, article
  Box는 Block(공간이 충분해도 하나가 한줄을 다 차지한다.)과 Inline(공간이 허용하는한 한줄에 여러개) 디스플레이로 나뉜다.
    Block의 예 : div, h1~h6, header, footer, p, li, table
    Inline의 예 : span, a, img,
![태그사용율](../이미지/html태그사용율.png)
  - a
    anchor 닻. html의 가장 중요한 태그. 다른 문서로 이동할수 있게 해준다. 목적지 href 속성이 반드시 필요함
  - div
    무색 무취의 태그.block요소의 대표. division의 약자. 구분. 분류.
  - span
    무색 무취의 태그.Inline요소의 대표. 
  - H1~6
    Highlight. Headlight. 제목을 표현할때 쓴다.
  - buttton
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
    데이터를 입력받을수 있는 태그. 여러가지 datatype이 있다.
  - img , audio, video
  - script
    <script type="text/javascript">내용</script>
    <script type="text/javascript" src="경로"></script>
  - link
    <link href="경로" rel="stylesheet">
    <link href="favicon.ico" rel="icon" >
  - iframe
    inline frame의 약자. 웹페이지안에 어떠한 제한없이 또 하나의 웹페이지 삽입
    <iframe src="삽입할페이지주소"></iframe>
  - canvas, SVG(Scalable Vector Graphics)
      <canvas id="drawCanvas" style="width:300px; height:200px; border: 1px solid #993300;"></canvas>
  - 추가공부
    - data-
     사용자가 임의로 명명한 속성임을 표현하는 접두어  
     예) data-clk="tct.next" 


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
이유 : SEO(Search Engine Optimization. 검색엔진최적화)란 , Accessibility(접근성), For Developer(개발, 유지보수)
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

예1)
<div class="head1">제목1</div>
.head1{
  폰트사이즈 30
  볼드처리
  가운데정렬
}
위와 아래의 차이.
<h1>제목1</h1>

눈으로 보이는건 똑같이 만들어도 담고있는 정보가 다르다.
h1은 가장 중요한 정보라는 의미를 내포하고있고
클래스로 디자인한것은 디자인 적으로만 큰것 뿐이다.


예2) <div class="nav">네비게이션</div>
본질이 div이며 클래스의 이름이 nav일 뿐이다. 시멘틱하지 않음
<nav>  이건 태그자체에 navigation이라는 정보를 담고있다. 이게 시맨틱.


### 커스텀 태그
html은 <abcd>같은 태그를 써도 에러 안난다.
단, 아무런 기능은 일어나지 않는다.
반면에 메타데이터를 저장해서 의미가 있는 커스텀 태그를 만들수도 있다.
HTML5부터 data-로 시작하는 속성을 지정할 수 있다.
<xyx
  id="electriccars"
  data-columns="3"
  data-index-number="12314"
  data-parent="cars">
...
</xyx>
이렇게 만든 데이터 속성은 순 HTML속성이기 때문에 CSS에서도 접근 가능하다.


### 헷갈리는 HTML 태그와 시멘틱
[엘리](https://www.youtube.com/watch?v=T7h8O7dpJIg)
1. article vs section
article : 이 자체만으로 독립적으로 다른페이지에 보여줬을때 문제 없을 때 사용.
section : 연관있는 내용 하나

2. i vs em
em : 강조하는 이탤릭
i : 시각적으로만 이탤릭
3. b vs strong
strong : 중요한 진하게
b : 시각적으로만 진하게

용어를 설명할때 사용하는 3개
dl : description(definition) list
dt : description(definition) term(title)
dd : description(definition) detail

4. img vs background-image
img: 페이지내에서 중요한 요소로서 작동될때. 
background-image : 스타일링 목적일때. 이미지가 없어도 문서의 내용에 지장이 없을때

5. button vs a
button : 특정한 액션을 위해
a :  어디론가 이동할때

6. table vs css
정말 데이터면 table이 좋음
스타일링을 위한거면 flex나 grid사용