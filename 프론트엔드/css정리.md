# 본질
HTML의 본질은 정보
CSS의 본질은 디자인
JS의 본질은 기능

#### 강의
[생활코딩](https://www.youtube.com/watch?v=Ok0bBJPtgJI&list=PLuHgQVnccGMAnWgUYiAW2cTzSBywFO75B)

- ### 정의
    - Cascading Style Sheet. 캐스캐이딩은 작은폭포. 폭포처럼 쏟아지는 물. 연속.   즉 위에서 계속 떨어지는 느낌.
    - Author style(코딩으로 넣은거) -> User style(=사용자가 다크모드, 확대, 등) -> Browser
    - 개발자 모드로 캐스캐이딩 되는거 보여주기
    - user agent stylesheet : 브라우저에서 정한 css
 

- ### css를 넣는 3가지 방법
    1. 인라인 : 태그내에서 수정.
    예) ```<태그 style="color:gray; font-weight:700">```
    1. 내부파일 :  style태그 따로빼서.
    예) ``` <style> 내용 </style>```
    1. 외부파일 : style 태그에 경로 myStyle.css
    전체 스타일을 일관성있게 동시다발적으로 변경할수있어서 제작의 효율성이 높음. 관리가 편함.
    예)  <link rel="stylesheet" href="경로와 이름.css">


- ### 기본 문법 : 문법은 매우 간단해서 배울게 없을정도이나 실제로 내가원하는대로 스타일하기는 어렵다.
        선택자 {
            속성1 : 값1,
            속성2 : 값2
        }
        예를들어  button:hover{
          color : red;
          background : baige;
        }

- ### CSS 셀렉터(선택자)
    - 선택자 : html의 어떤 태그를 선택할지 고르는것. html만들때 박스구조로 레이블링을 잘해놓으면 선택하기가 쉽다.
        - 태그 : 그냥
        - 클래스 : .
        - 아이디 : #
        - 자손 :  그냥띄우기
        - 자식 :  >
        - 여러개 :  ,
        - 전체 : *

        - 가상클래스 :   :      예) :active, :hover, :empty, :focus
        - 가상요소   :  ::      예) ::after, ::before, ::first-letter
            꾸밈을 위해서 의미없는 태그를 더 추가해야 될 때, 태그 대신에 가상으로 처리해 주는 쓸모 많은 css 기능
            :와 ::의 차이는 최신브라우저에서는 상관없다. 그치만 본질에 맞게 쓰는것이 좋다.
            :before, ::before는 선택한 요소의 첫 자식으로 의사 요소를 하나 생성
            :after(::after)는 선택한 요소의 맨 마지막 자식으로 의사 요소를 하나 생성
            의사클래스와 의사요소를 구분하기 위해 CSS3부터 ::after가 도입됨.
        - 속성 : []
        선택된 태그의 지정된클래스만 : 태그.클래스
        A바로옆에 있는 B  :    A+B는
        A바로옆에있는 B들 :    A~B는
        제일 위에 있는거  :    :first-child
        형제들 중에 A번째 :    선택자:nth-child(A)

- #### 게임으로 공부 (https://flukeout.github.io/)
    7번 : 최초의 고비
    16번부터 어려움. 18까지만 하면됨. 이후는 퍼블리셔나 22번까지도 괜찮음.
    1.  plate apple,plate:only-child가 안됨.  plate apple:only-child, plate pickle:only-child
    부모:first-child = 형제들이 있을때 첫번째
    답 : plate:apple, plate:pickle


- #### 우선순위
        - css는 본질적으로 캐스캐이딩의 특성을 가지고있기 때문에 하나의 요소에 여러가지 명령들이 동시에 내려진다. 
        예를들어 일병이 쓰레기버리고와라,
                병장이 이불좀 접어라,
                당직사관이 당직실로와라. 
        - 일반적인 범위보다 구체적인 범위가 우선순위가 높다.   
        - 태그 1점 < 클래스 100점 < 아이디 1000점 
          - 동메달, 은메달, 금메달같은거다. 동메달 아무리 많아도 은메달 하나에게 안된다.
        - 메달로 변환한 점수가 동급이면 아래가 우선순위가 높다.
        예) <div class="myclass yourclass">일때 
           .myclass에서 빨간색    .yourclass에서 노란색 
        - <div class="myclass">
            <div class="yourclass"></div>
          </div>
          yourclass에는 초록색,     myclass의 자식인 yourclass 빨간색.
          //부모와 자식을 비교한게 아니고, B와  A밑의B를 비교한것.
        - 아이디보다 더 센 2놈이 있는데 inline < !important  이 둘은 좀 급이 다른 레벨이다.
        - 무조건 우선순위가되는 !important는 여러개 쓸수록 그 의미가 퇴색되며 캐스캐이딩의 연결을 끊기 때문에 최대한 사용하지 말아야 한다.


- #### margin, padding
컨텐츠를 기준으로 테두리까지의 여백 = padding
border를 기준으로 바깥으로 여백 = margin
마진상쇄 : https://velog.io/@raram2/CSS-%EB%A7%88%EC%A7%84-%EC%83%81%EC%87%84Margin-collapsing-%EC%9B%90%EB%A6%AC-%EC%99%84%EB%B2%BD-%EC%9D%B4%ED%95%B4
2개이상의 블록요소의 상하마진이 겹칠때 큰쪽의 값을 적용하는 브라우저의 렌더링 규칙

- ### display
  - 모든 css의 요소는 박스모델인데 크게 인라인과 블록 요소로 나뉜다.
  - ##### inline
        : 줄바꿈없이 한줄에 나란히 배치된다.
        **★★★★★width, height 속성을 지정해도 무시★★★★★**되고 컨텐츠만큼만 공간을 차지한다. 
        margin, padding의 **상하간격은 무시**되고 좌우간격만 반영된다.
        <a>, <span>이 대표적이다.
  - ##### block
        : 전후 줄바꿈이 들어간다. 다른엘리먼트들을 다른줄로 밀어내고 혼자 한줄을 차지한다.
        width, height, margin, padding 속성이 모두 반영된다.
        <div>, <p>, <h1>이 대표적이다.
  - ##### inline-block
        : 기본적으로 inline.
        그러나 순수 inline에서 불가능한 width, height 지정가능, margin, padding의 상하간격 지정가능.  여러 앨리먼트를 한줄에 정확히 원하는 너비만큼 배치할 수 있기 때문에 레이아웃에 주로 활용한다.
        <button>, <input>, <select>가 대표적이다.

- ### 변화. 진화
- 프론트엔드 개발자에게나 중요하다. 백엔드 개발자는 이런게 있다 정도만 알면된다.
[참고링크](https://dongwoo.blog/2017/02/07/%EB%B2%88%EC%97%AD-css%EC%9D%98-%EC%A7%84%ED%99%94-css-%EB%B6%80%ED%84%B0-sass-bem-css-%EB%AA%A8%EB%93%88-%EC%8A%A4%ED%83%80%EC%9D%BC%EB%93%9C-%EC%BB%B4%ED%8F%AC%EB%84%8C%ED%8A%B8-%EA%B9%8C/)
    1. CSS
        (CSS파일간 값을 공유할 수 없음) = 변수값 사용불가
    2. SCSS, Less, Sass
        (   CSS를 전처리 엔진 형태의 프로그래밍 언어로 변형
            변수, import, Nesting 등 도입. 여전히 스타일이 겹치는 문제는 해결못함.
            모범사례가 없다면 문제를 해결해주기보다는 더 많은 문제를 만들어냄
            $가 보이면 Sass
        )
    3. BEM
        ( 블록, 요소, 변경자 컨벤션을 사용함으로써 클래스명의 유일함을 보장하여 스타일이 겹치는 위험성을 줄일 수 있게 해줌.
        블럭뒤에 __를 붙여주고 엘리먼트 이름)
        단점 : 모든개발자가 이 명명규칙을 이해하고 있어야 일괄적으로 적용가능하다.
        이름이 길어진다.
    4. CSS-Modules
        (모든 스타일에 동적으로 파일에 선언된 CSS선택자에 고유한 해시문자열을 추가하여 CSS속성이 겹치지 않게 만드는 방식.
        단점 : 컴포넌트마다 따로 CSS파일을 만들어줘야 되기 때문에 많은 CSS파일을 관리해야함)
    5. CSS in JS
        (방대한 CSS파일을 관리해야하는것을 해결하기 위해 나온 방법론.
        단점 : 인터렉션이 늦다. JS번들의 크기가 커진다.)
    6. Styled-Component

- ### 포지션(position)
에밋 사용  .item.item$*10
[TCP SCHOOL](http://www.tcpschool.com/css/css_position_position)
[DaleSeo](https://www.daleseo.com/css-position-absolute/)
[생활코딩](https://www.youtube.com/watch?v=0kA0mBvumrg)
- 문서상의 요소를 배치하는 방법을 지정한다. 아래의 5가지 방식이 있다.
    - ##### static(정적)
      - 디폴트(기본값). 단순히 웹 페이지의 흐름에 따라 차례대로 요소를 위치시키는 방식.
      오프셋의 영향을 받지 않는다.
      웹페이지의 기본 흐름은 위에서 아래, 왼쪽에서 오른쪽, 부모가 있다면 부모를 기존으로 자식결정
    -  ##### relative(상대)
       -  정적위치 방식일때 결정되는 위치에서 offset 만큼 이동. 즉 offset을 쓰지않았다면 자기위치는 static과 같다.
       -  **offset**(top, right, bottom, left)은 웹페이지상에서 해당요소를 해당기준에서 얼마나 떨어져야 하는지를 결정한다.
    -  ##### absolute(절대)
       -  **static방식이 아닌 방식으로 위치가 설정된 조상요소를 절대적 기준**으로 삼는다. 때문에 **공중부양** 되면서 다른요소들이 채워진다. 
       오프셋이 있다면 **부모위치**에서 오프셋만큼 이동한다.
       그런부모가 아무도없다면 body가 기준.
       때문에 static이 아닌 부모가 아무도없다면 쉽게 body의 모든요소에 자유롭게 위치할 수 있다.
       - 일반적인 문서흐름에서 벗어나 독립된 배치문맥을 가진다. (마치 포토샵에서 새로운 레이어). 새로운레이어이기 때문에 어디든지 자유롭게 위치 가능
       - 컨텐츠만큼만 크기(width, height)를 차지하게 된다.
       - 자기콘텐츠만큼만 표현하는것이 디폴트.
    -  ##### fixed(고정)
       -  일반적인 문서흐름에서 벗어나 독립된 배치문맥을 가진다. (마치 포토샵에서 새로운 레이어). 새로운레이어이기 때문에 어디든지 자유롭게 위치 가능
       -  offset 속성(top, left, bottom, right)이 적용
       -  브라우저 창을 기준으로 첫위치 그대로 계속 고정
    - ##### sticky(끈적)
       - 부모요소를 기준으로 한 위치를 기준으로 top, right, bottom, left의 오프셋이 적용된다.
       - 최초에는 relative처럼 동작하다가 스크롤이 특정 지점까지 도달하면 fixed속성으로 동작하여 그위치에 끈끈하게 붙어버린다.
- 겹칠때는 z-index 속성으로 지정한다. 양수와 음수 모두 설정할수있으며 크기가 클수록 앞쪽에 위치하게 된다.
position : relative 일때만 사용가능하다.
- HTML의 부모자식 관계이며 CSS를 부모요소 Relative, 자식요소 Absolute로 줬으면 자식은 부모의 바운더리 밖을 넘어갈 수 없다.
  포지션을 명시하지않으면 부모자식이 함께 움직인다.     right:0, bottom:0 하면 부모의 오른쪽 밑으로 붙는다.
- #### 가운데정렬(#### 중앙정렬) 방법들  
http://hong.adfeel.info/frontend/position%EC%9C%BC%EB%A1%9C-%EA%B0%80%EC%9A%B4%EB%8D%B0-%EC%A0%95%EB%A0%AC%ED%95%98%EA%B8%B0/
  1. 인라인, 인라인 블록
    <수평>
    text-align : center를 부모에 사용.
    <수직>
    padding-top과 padding-bottom에 동일한값
    패딩을 사용할 수 없는 경우 height 와 line-height에 동일한 값

  2. 블록
    <수평>
    너비를 명시적으로 지정 후 margin : auto;
    너비가 없다면 너비는 full width가 되므로 중앙정렬이 필요없다.
    <수직>
    부모 포지션 relative, 자기 포지션 absolute;
    top:50%;
    /*요소의 높이의 반(50%) 만큼 위로 이동*/
    transform: translateY(-50%);

  3. 다수의 블록
  기본적으로 수직정렬된다.
  수평정렬 하기 위해서는 부모 블록을 인라인블록으로 변경한 후 부모에 text-align : center;를 해주면된다.
    
  2. position:absolute;
       left : 50%;
       top : 50%;
       transform:translate(-50%, -50%);
            또는 margin-left : 가로너비의반;
                margin-top : 세로너비의반;
    부모엘리먼트의 위치를 기준으로 가운데에 나의 왼쪽끝이 오게한다음, 나의 크기의 반쪽 오른쪽, 아래로 이동하는 방법.
    단점 : 절대값이라서 주변과 어울리지 못한다.
        부모요소가 변경되면 나도 깨진다.
        그리고  height를 수작업으로 계산하는것이 힘들다.

  3. 선택자{
        display : flex;
        justify-content : center;
        align-items : center;
    }

  4. ### vertical-align,  text-align
    단점 : 동일한 레벨의 다른 엘리먼트의 높이에 영향을 받고, 부모엘리먼트의 높이가 변할때 따라서 변하지 않음
    //vertical-align. inline또는 table-cell의 수직정렬을 지정함
            사용가능한값 : baseline, sub, super, tex-top, text-bottom, middle, 길이, 퍼센트, top, bottom
            초기값 : baseline.  부모의 baseline에 맞추어 해당 엘리먼트의 baseline을 정렬한다.
            inline-block에서 세로 레이아웃 깨질때 top주면됨.

  5. line-height    폰트 기반의 아이콘을 중앙정렬할때 간단하게 사용하는 방법
    아이콘을 span으로 감싸고 line-height : 보통은 부모엘리먼트의 높이 그대로;

  6. 플렉스박스



  - ### 이미지 가운데정렬 대표적 방법 2가지.
        1. 부모요소에 text-align:center; 추가
        2. img 의 디스플레이 속성을 block으로 바꾼후 margin :auto;




- ### float
https://ddorang-d.tistory.com/12
https://velog.io/@anrun/CSS-%EC%9C%84%EC%B9%98-%EC%A7%80%EC%A0%95%ED%95%98%EA%B8%B0position-float-inline-block-hyk5xn5nql
    - clear : 상위요소의 float는 유지하면서 float다음에 오는 일반요소에게 float가 적용되지 않도록 함.
        none, left, right, both
    - text-align : block요소에만 지정할 수 있다. 그러면 block안에있는 inline요소에 적용된다.(텍스트만 적용되는것이 아님)
    예) .content > img{ float: left }
- ### 단위
        - px : pixel
        - em 부모 요소의 대문자 M 너비를 기준으로 상대적인 배수가 적용됨.  자식에 계속 쓰면 계속 배수가 누적되어 적용됨.
        - rem(root em) 위의 문제를 막기위해사용.단위 :
        - % : 부모 요소의 길이를 기준으로 상대적인 값(%)
        - vh(viewport height) : 뷰포트의 높이값의 1%
        - vw(viewport width) : 뷰포트의 너비값의 1%
        //뷰포트 : Display상의 표시 영역

- ### 미디어 쿼리
  - 반응형웹(해상도에 반응하여 다르게 보이는 것)을 구현하는 기술. Responsive Web 
    - 예) 햄버거메뉴, 기사가 큰화면에서는 3개씩보이다가 작은화면에서는 1개씩 보이는거
    - @media는 서로다른 미디어타입에 각각의 스타일을 지정하는것을 가능하게 한다.
    - 미디어유형 : all, print, screen, speech
        @media screen and (max-width: 600px) {  //600이하일때 적용
            body {
            background-color: olive;
            }
        }

- #### 폰트 바꾸기(글꼴 바꾸기)
1. cdn으로 구글 폰트 가져오기 (https://fonts.google.com/)
   language korean하고 원하는 글꼴 선택후 Select this style
2. link방식이나 import방식 복사해서 style 적용
3. 원하는 선택자에 font-family: 폰트명  적용

- ## bootstrap 부트스트랩
    - 트위터에서 오픈 소스로 공개한 웹 프론트엔드 프레임워크
    - 사용법 : 
        1. 구글에서 bootstrap쳐서 공식사이트에 접속
        2. 왼쪽위 버전확인하고 download버튼 클릭
        3. cdn참조 또는 파일 다운로드로 참조(부트스트랩 공식사이트. 
        버전5는 jqeury의존성 없어졌다. document도 5로 맞춰서 봐라.)
        1. 참조하고 싶은 디자인 찾기
        2. 클래스를 부여하여 디자인
    - 반응형 디자인이 다 적용되어있다.

    - Layout
        - container
        <div class="container">  이거 잘쓰면 엄청 좋다.


        - grid
        하나의 행은 12개의 컬럼으로 구성되었다는 컨셉
        <div class="row">  <div class="col">
            - xs  xsmall    < 576px 일때 적용     .col-
            - sm  small     >= 576px 일때 적용    .col-sm-
            - md  midium    >= 768px 일때 적용    .col-md-  많이쓴다.
            - lg  large     >= 992px 일때 적용    .col-lg-
            - xl  xlarge    >= 1200px 일때 적용   .col-xl-
            - xxl xxlarge   >= 1440px 일때 적용   .col-xxl-
            - 이 숫자를 break point라고 한다.
        class="col" 로 하면 알아서 col갯수만큼 나눈다.
        class="col-sm-8" 이런식으로 col-숫자를 하게되면 수동으로 디테일하게 나눈거다.  small 사이즈일때 8칸을 차지하도록 css설정.
    - 색깔
    primary, secondary, success, danger, warning, info, light, dark

    - 부트스트랩으로 반응형 햄버거 네비 만들어보기
        <!-- 네비게이션바 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
    <div class="container-fluid">
        <a class="navbar-brand" href="{{ url_for('main.index') }}">Pybo</a>
        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#">계정생성</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">로그인</a>
                </li>
            </ul>
        </div>
    </div>
</nav>




sweetalert

### 개발자모드에서 바꾼거 바로 저장하는 법
1. Elements에서 바꾸고 오른쪽에 경로로 들어감
2. Sources 탭에서 파일 우클릭 - save as

- ### Sass   #### SCSS
> SASS가 먼저생겼고 나중에 SCSS가 생겼지만 서로 완벽하게 호환되고 요즘은 SCSS를 쓴다. SCSS는 SASS의 상위호환.
> 미세한 표기법의 차이
- SCSS가 중괄호와 세미콜론을 사용한다. SCSS가 순수CSS와 문법이 같은 방식이라 더 사용하고 이해하기 쉽다.
> Syntactically Awesome StyleSheets (문법적으로 짱 멋진)
> Sassy Cascading Style Sheets   (엽기적인. 매우 나이스한. )
CSS pre processor로서 CSS의 한계와 단점을 보완하여 가독성이 높고 코드재사용에 유리한 CSS를 생성하기위한 CSS 의 확장판.
> 사용이유
    - 선택자를 만들때 불필요한 부모 요소 선택자를 매번 적지 않아도 된다.
    - 규모가 큰 프로젝트의 경우에도 일원화된 자동화
    - 조건문 반복문으로 동적 css 사용가능
> 단점
    - CSS로 컴파일을 거쳐야 한다. 라이브서버로 preview안된다. 그런데 vscode의 live sass compiler가 해결해준다.
> 어떻게 사용하나요?
[링크](https://inpa.tistory.com/entry/SCSS-%F0%9F%92%8E-SassSCSS-%EB%9E%80-%EC%84%A4%EC%B9%98-%EB%B0%8F-%EC%BB%B4%ED%8C%8C%EC%9D%BC)
1. 컴파일환경 구성
다양한 방법이 있다. SassMeister페이지 접속, Node.js 또는 플러그인, Webpack, Parcel

### div사이 간격 없애기
* {
   padding : 0px;
   margin : 0px;
   font-size: 0px;  
}