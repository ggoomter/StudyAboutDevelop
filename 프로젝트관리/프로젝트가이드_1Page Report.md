- 실무 개발 프로세스  100억에 6개월짜리면 3개월차정도 되어야 실질적인 개발시작. 요구사항 분석과 설계에 반넘게 사용.
1. 클라이언트 요구사항 명세서 ->
2. 개발자 입찰(내가 언제까지 얼마에) -> 낙찰 ->
3. 기능명세서(클라이언트, 컨설턴트) ->
4. 화면명세서(클라이언트, 컨설턴트)->
5. DB설계(DB설계자) ->
6. 개발(.apk, localhost) ->
7. 테스트 ->
8. 배포(클라이언트가 직접 사용할수있는 환경에 프로그램을 올리는것) ->
9.  유지보수

# 설계
문제로부터 출발. 현상에서 진짜 문제점 발견
고객의 대안
페르소나. 머리에 불붙은 고객을 찾아라.
만들기전에 테스트
확장전략
비지니스 모델
결국 so what. 해결하고자 하는 문제를 해결했나?



# One page report
1. ### 개요
    신체정보를 바탕으로 목표 도달을 한페이지에 보여주는 웹페이지
1. ### 기간
    2021/07/26(월) 17시~ 2021/07/29(목) 12시

1. ### 주요기능
    - 유저로부터 신체정보를 입력받는다.
    (성별, 나이, 키, 몸무게, 현재체지방률, 운동의정도, 시작일)
    - 신체정보와 목표체지방률을 바탕으로 기초대사량, 활동대사량, 권장섭취량, 추천 다이어트 기간을 계산해준다.

1. 사용기술
(왜 이기술을 사용했는지. 딱히 이유가 없다면
기술의 탄생배경, 대안기술, 점유율로 설명)
    - HTML5, CSS3, Javascript
    - BootStrap, Jquery

1. 아키텍쳐(있다면)
    - 예) 계층화, 클라리언트-서버, 마스터-슬레이브, 파이프-필터, 브로커
    피어투피어, 이벤트-버스, 모델-뷰-컨트롤러, 블랙보드, 인터프리터
- 디자인패턴(있다면)

1. ### 생각해야할 요소
    - #### UX, UI
        - 어떻게 하면 입력과 출력을 편하고 재미있게 할수있을지
        - 디자인 컨셉, 메인 컬러, 서브 컬러
        - 열거된 FORM형태가 아니라 큼직하게 이미지와 함께 보여줄까?
        - 자신의 체지방을 모르는 사람들의 불편함을 어떻게 해결해줄수있을까?
        - 계산된 칼로리가 음식과 운동으로 따지면 어느정도인지 알고싶지 않을까?
        - 회원가입, 로그인기능을 구현할수 없는데, 나의 데이터를 저장하는 방법은 없을까?
        https://ko.javascript.info/localstorage
    - #### 설계
        - 고객이 진짜 원하는게 뭘까?
        - 무엇을 객체와 함수로 묶어낼수 있을까?
        - 어떤 기능들을 어떤 화면에 묶어내면 좋을까?
        - 이 고객의 정보로 할 수 있는 다른일들은 뭐가 있을까?
        - 원페이지 리포트를 받은후에 어떤 기능이 있으면 매출을 발생시킬수 있을까?
        - 이게 만들어지면 가장 좋아할 사람들이 누굴까? 그 사람들이 필요한 기능은 뭘까? 그사람들은 어떤 특성을 가지고있지?
    - #### 개발
        - 화면이 몇개가 나올거고 예상시간은 얼마나 될까
        - 그 화면을 개발하는데 예상되는 어려움은?
        - 앞으로 계속 프로젝트를 할때 이번에 했던것을 또 써먹으려면 코드를 어떻게 짜야할까?
        - 내가 만들려고 하는걸 이미 누가 만들어서 공유해놓지 않았을까? (라이브러리 활용)
    - #### 테스트
        - 음수값, 빈값, 너무 크거나 작은값, 소수 등 유효하지 않은값들 넣어보기
        - 어떻게 하면 테스트에 드는 비용을 줄일수 있을까?
        - 이대로 개발하면 고객의 요구를 다 충족했는가?

1. ### 추가 기능
    - 음식칼로리 공공데이터나 API로 받아와서 입력한 음식들의 칼로리 계산
    - 운동의 종류, 무게, 횟수를 계산하여 운동칼로리 계산
    - 운동의 종류별로 가능한 무게, 횟수로 1RM을 계산하여 내 운동능력(레벨) 계산
    - 운동의 레벨별 로드맵 (네비게이션)
    - 추천하는 식단
    - 연예인들, 운동선수, 보디빌더들의 비결 소개

1. ### 매우 후일의 추가 기능
    - 내 레벨에 맞추어 운동의 포인트 지급
    (같은 운동을 하더라도 신체능력이 더 좋은사람은 더 작은 포인트를 지급하도록)
    - 내 레벨을 넘어서는 운동기록이 들어왔을 경우 레벨테스트를 거치고, 통과하지못했을경우 기록했던것을 무효화
    - 사람들끼리 레벨, 포인트 비교
    - 내 레벨에 맞는 아이템 추천
    - 근처의 헬스장 소개
    - 경쟁요소 활용
    - 천안시 동남동의 턱걸이 순위
    - 천안시 추남헬스장의 출석순위
    - 오늘 제일 많이 먹은 사람의 칼로리 등등
    - 협력 요소 활용
    - 그룹(길드)
    - 그룹간의 경쟁
    - 출석 포인트 지급
    - 포인트의 현금화
    - 내 현재 신체스펙과 목표를 입력하면 여러가지 업체나 서비들이 역경매로 목표 도달해주게 하는 서비스. 달성하지 못하면 금액 환불. 진짜 업체만 살아남도록.
    -

1. 보완요소
1. 추후 업데이트 예정일시와 기능

### 시작이 어려울 때
why, what, how
1. Why : 왜 이것을 하고자 하는지. 이것을 함으로서 내가 얻고자 하는게 뭔지
(포트폴리오. 즉, 취업을 위한 준비물. 나 이정도까지 만들어봤다.)
**기획은 무슨산업의 무슨문제가 아니라 구체적인 사람의 구체적인 문제를 해결해야한다.**
그게 그거 아니냐? 할수있지만 완전히 다른길이다. 앞은 공무원 고위직, 정치를 해야지 창업이 아니다.
1. What : 그 수단(주제)이 바로 이 프로젝트(원페이지 리포트)
1. 다시 What. 이 프로젝트에 어떤 기능들이 있어야되는지 나열해본다.
1. 그것을 더 잘게잘게 쪼개어본다.
1. 화면을 그려본다.
1. 화면을 HTML로 레이아웃을 잡는다.
1. 대강의 CSS를 만들어서 작업이 쉽게 한다. 상세작업은 나중에
1. 중요한 화면의 중요한 기능, 쉬운것부터 JAVASCRIPT.
1. How: 쪼개진 작은 기능을 개발하기위해 프로그래밍 언어의 어떤 개념을 사용해야 하는지 생각해본다.
    1. 쪼개진 작은 것을 하려면 어떤 데이터가 있어야 하고(인풋 파라미터)
    1. 어떤 알고리즘을 거쳐서(본문)
    1. 어떤 결과값을 반환할것인지(아웃풋. 리턴)
    1. 함수를 정의
    1. 함수가 제대로 실행되는지 테스트 후 다른작업.
1. 할수없다면 어디까지 할수있는지 찾아보고

### 프로젝트하다가 질문방법
- html로 구성을 짜지를 못하겠다.
- 자바스크립트 함수 정의를 못하겠다.
- 자바스크립트 함수 호출을 못하겠다.
- 자바스크립트로 html의 요소 선택을 못하겠다.
- 자바스크립트로 html을 조작을 못하겠다.


### 프로젝트 개발팁
1. 회원가입, 로그인 먼저 적용시키지마라.
    => 먼저만들면 어떤 기능할때마다 로그인해줘야돼서 귀찮아진다.
2. 인코딩, 테이블, 계정, 파일명명규칙, 함수 명명규칙, 화면 레이아웃 등 공통적인 작업 먼저
3. 프로젝트도 버전별로 쪼개고, 기능이나 화면도 하나할때마다 하나 테스트
4. 깃 연동은 처음부터 하고 시작해야지 나중에 합치면 충돌 병합 어렵다.
5. 뭔가 기능을 만들었다면 바로 팀원들과 공유.
    이미 누군가가 만들어놨는지, 누군가가 또 만들어야 하는지, 의도대로 만들었는지 체크
