선택자
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
이미지 가운데정렬 대표적 방법 2가지.
    1. 부모요소에 text-align:center; 추가
    2. img 의 디스플레이 속성을 block으로 바꾼후 margin :auto;
- ★★★ 포지션 ★★★
position : 속성의 위치를 지정
    static : 디폴트. 부모요소를 기준으로 한 위치.
    relative : 자기자신이 원래 있어야할 위치가 기준.
    absolute : static속성이 아닌 부모를 기준으로 한 위치. 그런부모가 아무도없다면 body가 기준.
            일반적인 문서흐름에서의 배치위치를 제거하며 페이지레이아웃에 공간을 배정하지 않는다.
            (마치 포토샵에서 새로운 레이어를 추가하는 효과와 같다고 생각하면 된다.)
            컨텐츠만큼만 크기(width, height)를 차지하게 된다.
            최종위치는 top, right, bottom, left 값이 지정한다.
            자기콘텐츠만큼만 표현하는것이 디폴트.
    fixed : 마찬가지 일반적인 문서흐름에서의 배치위치를 제거하며 페이지레이아웃에 공간을 배정하지 않는다.
            (마치 포토샵에서 새로운 레이어를 추가하는 효과와 같다고 생각하면 된다.)
            최종위치는 top, right, bottom, left 값이 지정한다.
            브라우저 창을 기준으로 스크롤을 내려도 고정됨.
    sticky : 부모요소를 기준으로 한 위치를 기준으로 top, right, bottom, left의 오프셋이 적용된다.
            그위치에 끈끈하게 붙어버린다.
- 가운데정렬 방법들
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
    3.vertical-align,  text-align
    단점 : 동일한 레벨의 다른 엘리먼트의 높이에 영향을 받고, 부모엘리먼트의 높이가 변할때 따라서 변하지 않음
    4. line-height    폰트 기반의 아이콘을 중앙정렬할때 간단하게 사용하는 방법
    아이콘을 span으로 감싸고 line-height : 보통은 부모엘리먼트의 높이 그대로;
    5. margin : auto;   메인 콘텐츠 컨테이너를 수평 중앙에 둘때 사용.
    세로가운데 정렬 하려면 position : absolute;   left : 0;   top:0;
    장점 : 가로 가운데정렬 쉽게 할수 있다.
    단점 : display가 inline이나 inline-block일때 제대로 작동 안함.
- display : block, inline, inline-block, none, flex, grid
☆☆☆원래 block요소는 부모크기만큼 너비를 잡고, 자식높이만큼이 설정되어있다.
눈에 보이지는 않지만 div가 차지하고 있는 공간이 존재한다. margin이 차지하게 된다.☆☆☆
6. text-align : center
    엘리먼트안의 구성요소가 inline계열일때 사용. 수평중앙만 맞출수있다.
    line-height 를 통해 수직 중앙도 맞출 수 있다.


    inline-block은 한줄로 나열이 되면서 컨텐츠가 있는 영역은 block처럼 width, height, margin 등을 줄 수 있다.
- float
https://ddorang-d.tistory.com/12
https://velog.io/@anrun/CSS-%EC%9C%84%EC%B9%98-%EC%A7%80%EC%A0%95%ED%95%98%EA%B8%B0position-float-inline-block-hyk5xn5nql
    -clear : 상위요소의 float는 유지하면서 float다음에 오는 일반요소에게 float가 적용되지 않도록 함.
        none, left, right, both
- text-align : block요소에만 지정할 수 있다. 그러면 block안에있는 inline요소에 적용된다.(텍스트만 적용되는것이 아님)
- 단위 : - em 현재의 폰트사이즈에 배수가 적용됨.  자식에 계속 쓰면 계속 배수가 누적되어 적용됨.
        그것을 막기위해 rem(root em) 사용.
        - vh(vertical height) : 뷰포트의 높이값의 1%
        - vw(vertical width) : 뷰포트의 너비값 1%
        - 뷰포트란? 화면의 표시 영역. 데스크탑은 브라우저창의 뷰포트와 같고, 사용자가 브라우저창의 크기를 조정하면서 뷰포트의 크기도 조절할수 있지만, 모바일은 창보다 크거나 작을수 있고, 상하좌우로 움직이거나 줌인 줌아웃 등을 통해 뷰포트의 배율을 변경할 수 있다.
        html 헤드안에 <meta name="viewport" content="width=device-width, initial-scale=1">
        - vmin, vmax 뷰포트 너비와 높이를 기준으로 하는 최소값
