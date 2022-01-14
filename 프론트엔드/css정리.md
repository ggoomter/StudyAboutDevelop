- ### 정의
    - Cascading Style Sheet. 캐스캐이딩은 작은폭포. 폭포처럼 쏟아지는 물. 연속.   즉 위에서 계속 떨어지는 느낌.
    - Author style(코딩으로 넣은거) -> User style(=사용자가 다크모드, 확대, 등) -> Browser
    - 캐스캐이딩의 연결을 끊는것은 !important

- ### css를 넣는 3가지 방법
    1. 인라인 : 태그내에서 수정.
    예) ```<태그 style="color:gray;">```
    2. 파일 내에서 :  style태그 따로빼서.
    예) ``` <style> 내용 </style>```
    3. 외부 파일로 : style 태그에 경로 myStyle.css
    전체 스타일을 일관성있게 동시다발적으로 변경할수있어서 제작의 효율성이 높음. 관리가 편함.


- ### CSS 셀렉터
    - 선택자 : html의 어떤 태그를 선택할지 고르는것. html만들때 박스구조로 레이블링을 잘해놓으면 선택하기가 쉽다.
        그냥 태그,     #아이디,       .클래스 :상태,       []속성
        자손은 그냥띄우기,    자식은 >  ,  여러개는 ,    , 선택된 태그의 지정된클래스만 : 태그.클래스    /
        A+B는 A바로옆에 있는 B,     A~B는 A바로옆에있는 B들

    - 스타일링 : 문법은 매우 간단해서 배울게 없을정도이나 실제로 내가원하는대로 스타일하기는 어렵다.
        선택자 {
            속성 : 값;
        }
        예를들어  button:hover{
          color : red;
          background : baige;
        }

    - 게임으로 공부 (https://flukeout.github.io/)
    16번부터 어려움. 18까지만 하면됨. 이후는 퍼블리셔나 22번까지도 괜찮음.
    16. plate apple,plate:only-child가 안됨.  plate apple:only-child, plate pickle:only-child
    부모:first-child = 형제들이 있을때 첫번째


- ### 변화. 진화
[참고링크](https://dongwoo.blog/2017/02/07/%EB%B2%88%EC%97%AD-css%EC%9D%98-%EC%A7%84%ED%99%94-css-%EB%B6%80%ED%84%B0-sass-bem-css-%EB%AA%A8%EB%93%88-%EC%8A%A4%ED%83%80%EC%9D%BC%EB%93%9C-%EC%BB%B4%ED%8F%AC%EB%84%8C%ED%8A%B8-%EA%B9%8C/)
    1. CSS
        (CSS파일간 값을 공유할 수 없음)
    2. SCSS, Less, Sass
        (   CSS를 전처리 엔진 형태의 프로그래밍 언어로 변형
            변수, import, Nesting 등 도입. 여전히 스타일이 겹치는 문제는 해결못함.
            모범사례가 없다면 문제를 해결해주기보다는 더 많은 문제를 만들어냄
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

- ### 선택자
    .클래스   #아이디
    :가상클래스(상태)  예) :active, :hover, :empty, :focus
    ::가상요소
                꾸밈을 위해서 의미없는 태그를 더 추가해야 될 때, 태그 대신에 가상으로 처리해 주는 쓸모 많은 css 기능
       예) ::after, ::before, ::first-letter
    :after(::after)는 선택한 요소의 맨 마지막 자식으로 의사 요소를 하나 생성
    의사클래스와 의사요소를 구분하기 위해 CSS3부터 ::after가 도입됨.
    content:'' : 가상선택자에 필수로 들어가는 요소.
    가상선택자는 부피가 없으므로, 아이콘을 표현할 땐 꼭 너비와 높이를 정해주어야 한다.
    css선택 게임 https://flukeout.github.io/

- ### 포지션(position)
속성의 위치를 지정
    - static : 디폴트. 부모요소를 기준으로 한 위치.
    - relative : 자기자신이 원래 있어야할 위치가 기준.
    - absolute : static속성이 아닌 부모를 기준으로 한 위치. 그런부모가 아무도없다면 body가 기준.
            일반적인 문서흐름에서의 배치위치를 제거하며 페이지레이아웃에 공간을 배정하지 않는다.
            (마치 포토샵에서 새로운 레이어를 추가하는 효과와 같다고 생각하면 된다.)
            컨텐츠만큼만 크기(width, height)를 차지하게 된다.
            최종위치는 top, right, bottom, left 값이 지정한다.
            자기콘텐츠만큼만 표현하는것이 디폴트.
    - fixed : 마찬가지 일반적인 문서흐름에서의 배치위치를 제거하며 페이지레이아웃에 공간을 배정하지 않는다.
            (마치 포토샵에서 새로운 레이어를 추가하는 효과와 같다고 생각하면 된다.)
            최종위치는 top, right, bottom, left 값이 지정한다.
            브라우저 창을 기준으로 스크롤을 내려도 고정됨.
    - sticky : 부모요소를 기준으로 한 위치를 기준으로 top, right, bottom, left의 오프셋이 적용된다.
            그위치에 끈끈하게 붙어버린다.

- #### 가운데정렬 방법들
    1. position:absolute;
       left : 50%;
       top : 50%;
       transform:translate(-50%, -50%);
            또는 margin-left : 가로너비의반;
                margin-top : 세로너비의반;
    부모엘리먼트의 위치를 기준으로 가운데에 나의 왼쪽끝이 오게한다음, 나의 크기의 반쪽 오른쪽, 아래로 이동하는 방법.
    단점 : 부모요소가 변경되면 나도 깨진다.
        그리고  height를 수작업으로 계산하는것이 힘들다.

    2. 선택자{
        display : flex;
        justify-content : center;
        align-items : center;
    }

    3. vertical-align,  text-align
    단점 : 동일한 레벨의 다른 엘리먼트의 높이에 영향을 받고, 부모엘리먼트의 높이가 변할때 따라서 변하지 않음

    4. line-height    폰트 기반의 아이콘을 중앙정렬할때 간단하게 사용하는 방법
    아이콘을 span으로 감싸고 line-height : 보통은 부모엘리먼트의 높이 그대로;

    5. margin : auto;   메인 콘텐츠 컨테이너를 수평 중앙에 둘때 사용.
    세로가운데 정렬 하려면 position : absolute;   left : 0;   top:0;
    장점 : 가로 가운데정렬 쉽게 할수 있다.
    단점 : display가 inline이나 inline-block일때 제대로 작동 안함.

    - ### 이미지 가운데정렬 대표적 방법 2가지.
        1. 부모요소에 text-align:center; 추가
        2. img 의 디스플레이 속성을 block으로 바꾼후 margin :auto;

    6. text-align : center
    엘리먼트안의 구성요소가 inline계열일때 사용. 수평중앙만 맞출수있다.
    line-height 를 통해 수직 중앙도 맞출 수 있다.


- ### float
https://ddorang-d.tistory.com/12
https://velog.io/@anrun/CSS-%EC%9C%84%EC%B9%98-%EC%A7%80%EC%A0%95%ED%95%98%EA%B8%B0position-float-inline-block-hyk5xn5nql
    - clear : 상위요소의 float는 유지하면서 float다음에 오는 일반요소에게 float가 적용되지 않도록 함.
        none, left, right, both
    - text-align : block요소에만 지정할 수 있다. 그러면 block안에있는 inline요소에 적용된다.(텍스트만 적용되는것이 아님)
    - 단위 : - em 현재의 폰트사이즈에 배수가 적용됨.  자식에 계속 쓰면 계속 배수가 누적되어 적용됨.
        그것을 막기위해 rem(root em) 사용.
        - vh(vertical height) : 뷰포트의 높이값의 1%
        - vw(vertical width) : 뷰포트의 너비값 1%
        - 뷰포트란? 화면의 표시 영역. 데스크탑은 브라우저창의 뷰포트와 같고, 사용자가 브라우저창의 크기를 조정하면서 뷰포트의 크기도 조절할수 있지만, 모바일은 창보다 크거나 작을수 있고, 상하좌우로 움직이거나 줌인 줌아웃 등을 통해 뷰포트의 배율을 변경할 수 있다.
        html 헤드안에 <meta name="viewport" content="width=device-width, initial-scale=1">
        - vmin, vmax 뷰포트 너비와 높이를 기준으로 하는 최소값


- ## Bootstrap
  ## 부트스트랩
    <정의>
    - 트위터에서 만든 세상에서 가장 인기있는 프론트엔드 프레임워크.
    웹개발을 빠르고, 편하게 할수있도록 도와준다.

    <참고>
    https://udlab.tistory.com/6?category=897580

    <설치>
    - 파일로 내려받거나 cdn으로 경로 지정해주면된다.
    - 버전4부터는 jquery와 popper.js를 필요로 하니 같이 세팅해줘야한다.

    <사용방법>
    - 클래스만 지정해주면된다.
    - UI컴포넌트, 그리드(12 colums)에 대한 이해가 되어야 제대로 사용할 수 있다.
        - 그리드의 법칙
            1. 개별컬럼은 항상 좌우행에 직접 연결된 자식 개체여야 한다.
            2. 행은 오로지 컬럼 단위만 표현할 수 있다. 개별컨텐츠를 넣지말아야 한다.
            3. 행은 언제나 컨테이너(부트스트랩 최상위 오브젝트) 안에 배치되어야 한다.
            4. 행은 언제나 1개이상의 컬럼을 담고있어야 한다.
            부트스트랩4는 2가지 타입의 컨테이너가 있다. 이걸로 레이아웃을 쉽게 짤 수 있다.
            <div class="container"></div>  또는 container-fluid
    - 컬럼사이의 간격을 gutter라고 한다.


- #### 해상도 크기. 브레이크 포인트
    - xs : Xsamll. 디폴트. 화면너비가 576px보다 작을 경우 해당.
        (디폴트이기 때문에 col-xs-6 이라고 안하고 col-6이라고만 해줘도 된다.)
    - sm : Samll. 화면너비가 576px보다 클 경우 해당
    - md : Medium. 화면너비가 768px보다 클 경우에 해당
    - lg : Large. 화면너비가 992px보다 클 경우에 해당
    - xl : X Large. 화면너비가 1200px보다 클 경우에 해당


- ## 폰트바꾸기, 폰트변경
1. 구글 웹폰트에서 글꼴 선택하고 코드 얻기
2. 코드복사(standard 또는 @import)
3. 폰트 포함
     <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
4. 사용
    ```
      p {
            font-family: "Nanum Gothic", sans-serif;
            font-size: 23px;
          }
     ```




- ### 레이아웃
    - 원하는 위치에 원하는 사이즈로 배치하는것이 기본.
    여기서 끝낸다는 마음가짐으로 해야지 아니면 계속 헷갈리고 할때마다 헤매는데 엄청난 시간낭비.
    - display
        - 종류 : block, inline, inline-block, none, flex, grid
        - display block의 대표주자 div,    display inline의 대표주자 span
        - ☆☆☆원래 block요소는 부모크기만큼 너비를 잡고, 자식높이만큼이 설정되어있다.
        - 눈에 보이지는 않지만 div가 차지하고 있는 공간이 존재한다. margin이 차지하게 된다.☆☆☆
        - inline-block은 한줄로 나열이 되면서 컨텐츠가 있는 영역은 block처럼 width, height, margin 등을 줄 수 있다.
    - position
        - relative : 원래있어야되는자리에서 상대적으로 이동
        - absolute : 상자안에서 이동
        - fixed : 윈도우안에서 이동
        - css의꽃 : Flex box


- #### 색상선택방법
    - #rrggbb
    - #rrggbbaa,
    - #rgb,
    - #rgba
    - 정해진 영어


- #### 브라우저에서 css적용이 적용알될때
    ctrl shift r   (쿠키 지우면서 새로고침)
