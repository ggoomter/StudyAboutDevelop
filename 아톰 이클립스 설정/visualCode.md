사이드바 아이콘 잘 활용하자.
<단축키>
ctrl p : 파일로 이동  //이클립스의 ctrl shift r
ctrl shift f : 전체에서 찾기
    한번에 바꾸기 가능
ctrl , : 설정
    윈도우크기 : zoom 검색.   또는 아예 윈도우- 보기탭 의 확대, 축소
    텍스트크기 : font size 검색. 
    내모니터 해상도에서 자동 줄바꿈해서 보여주기 : word wrap 검색.  off를 on으로 변경
ctrl shift p : 명령어 팔레트
    사이드바 표시
f5  : 실행
f12 : 현재열린 파일을 패키지에서 선택

ctrl shift e : 만든 폴더 불러오기
f12 : 함수정의부로 이동
ctrl + b : 함수 정의 부분으로 이동
ctrl ' : 터미널 실행
ctrl shift \ : 괄호짝 이동
ctrl k s : 단축키 확인
ctrl shift p : 명령어 팔레트
ctrl k f : 자동 정렬
ctrl alft 화살표 : 열모드

파이썬 패스 에러나면 ctrl shift p 에서 python쳐서 interpreter다시 선택. 안되면 다 지우고 재설정 하니까 쉽게 고쳐진다.

- 스크롤바 너비 늘리기
    setting.json에서 
     "editor.scrollbar.verticalScrollbarSize": 40
   ,"editor.scrollbar.horizontalScrollbarSize": 15

<tab관련 설정>
Insert Spaces : 체크하면 탭을 스페이스로 변경.

왼쪽 사이드바 없애기 : 보기-모양-사이드바표시  (에디트창외의영역 클릭한 상태에서 shift b)

# 플러그인
왼쪽 테트리스같은 아이콘 = 확장 마켓플레이스 = ctrl shift x
비쥬얼스튜디오코드 홈페이지의 extensions 선택해서 마켓플레이스의 most popular보면 좋은것들 많다.

- korean lanauage pack for visual studio code
- Theme : 테마. ctrl K, ctrl T
- 포맷터
  - prettier : 들여쓰기 강제 적용. alt shift f
  - Beautify : 들여쓰기 조금 자유로운 적용. 
    단축키 셋팅. File > Preferences > Keyborad Shortcuts > beautify selection 나는 ctrl alt b
- Mithril Emmet : 에밋
- dark-plus-syntax
- HTML CSS Support
- color picker
- indent-rainbow  : 들여쓰기 마다 배경을 약간 색깔
- IntelliSense for CSS class names in HTML
- Material Icon Theme
- Material Theme
- Auto Rename Tag : html태그 하나 수정하면 쌍태그도 같이 변경됨
- live server : alt l, o
- Better Comments : 주석을 더 잘보이게 해주고 색상옵션
- polacode-2020 : 질문할때 바로 캡처
- diff : 파일에서 서로다른것 확인
- diff folders
- git history
- git graph
- git lens : 깃사용할때 필수
- Path Intellisense  : 파일경로 자동완성
- tabout : 따옴표과 괄호에서 tab키로 빠져나옴
- Color Highlight : 색깔에 해당색을 표시해줌.
- **error lens** : 에러를 인라인으로 바로 표시해줌
- Bracket Pair Colorizer2
- beauty : 자동 들여쓰기. ctrl shift b
- Highlight Matching Tag
- Markdown All in One : ctrl shift v
- Markdown Preview Enhanced : ctrl k, v
- Makrdown
- Markdown Them Kit
- Markdown Shortcuts
- Markdown Header Coloring  : 헤더에 색깔 표시
- markdownlint : 마크다운 문법 잡아줌 근데 html태그를 못쓰게 해놓음
- Copy Markdown As HTML : 마크다운문서를 html로 변환시켜줌
- Code Runner : 코드를 vsCode에서 바로 실행해서 결과를 볼 수 있음
  - 출력에 안나오고 터미널에 나온다면 Ctrl +, (설정) 에서 Code-runner:Run In Terminal 체크 해제
  - 한글이 깨지면 NodeJs 재설치 후 vsCode재시작
- Settings Sync : 설정동기화. VSCode에 이제 디폴트로 포함됨.
    업로드 : alt shift u
    
    다운받기 : 파일 - 기본설정 - 설정 동기화
    vscode 오른쪽밑에 로그인된 계정있고, 로컬버튼 누르면 원격을 로컬로 덮어쓴다.
    vscode://vscode.github-authentication/did-authenticate?windowid=1&code=9f61fe70af30da335a4b&state=3e5cdc2a-8d04-4a10-abd5-de8544ed9e3d

    다른컴퓨터에 받는법
    vsCode 설치후 파일 - 기본설정 - 설정동기화
    동일계정으로 로그인하면 병합 또는 바꾸기 대화상자. 병합.

- 에러
  - 사용자 설정에 쓸 수 없습니다. 사용자 설정을 열어서 오류/경고를 수정하고 다시 시도하십시오.
  => json파일에 주석이 있기 때문

- ctrl shift p(명령어팔레트)에서 settings.json 들어가서 아래코드 추가
- 주석색깔, 선택한줄 색깔 바꾸기
-         // 선택영역 색상 변경
    "workbench.colorCustomizations": {
        "editor.lineHighlightBackground": "#2d9b33",  //선택된 라인 전체의 백그라운드 색상
        "editor.selectionBackground": "#f0102e",      //선택된 영역만의 배경 색상 
        "editor.wordHighlightBackground": "#ffffff",  //선택된 영역만의 글자 색상
        "editorCursor.foreground": "#f10808",         //선택된 영역에서의 커서 색상
    },

    // 주석(comments) 색상 변경
    "editor.tokenColorCustomizations": {
        "textMateRules": [
        {
            "scope": "comment",
            "settings": {
            "fontStyle": "italic",          //주석의 폰트체를 이탤릭 처리
            "foreground": "#f3a32b",      //주석의 색상을 변경
            }
        }
        ]
    },

    ### conda가상환경이랑 연결
    ctrl shift p(커맨드팔레트) 누른후 python:select interpreter 찾아서 가상환경 선택