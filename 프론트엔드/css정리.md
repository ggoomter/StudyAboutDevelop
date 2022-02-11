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
	예)  <link rel="stylesheet" href="join.css">


- ### CSS 셀렉터
    - 선택자 : html의 어떤 태그를 선택할지 고르는것. html만들때 박스구조로 레이블링을 잘해놓으면 선택하기가 쉽다.
        태그 : 그냥
		아이디 : #
		클래스 : .
		상태 : ::
		속성 : []
        자손 :  그냥띄우기
	    자식 :  >
		여러개 :  ,
		선택된 태그의 지정된클래스만 : 태그.클래스
        A바로옆에 있는 B : A+B는
		A바로옆에있는 B들 : A~B는

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
문서상의 요소를 배치하는 방법을 지정
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
    단점 : 절대값이라서 주변과 어울리지 못한다.
        부모요소가 변경되면 나도 깨진다.
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
    - 단위 :
        - px : pixel.
        - em 부모 요소의 대문자 너비를 기준으로 상대적인 배수가 적용됨.  자식에 계속 쓰면 계속 배수가 누적되어 적용됨.
        그것을 막기위해 rem(root em) 사용.단위 :
        - % : 부모 요소의 길이를 기준으로 상대적인 값(%)
        - vh(viewport height) : 뷰포트의 높이값의 1%
        - vw(viewport width) : 뷰포트의 너비값의 1%

- ### 미디어 쿼리
