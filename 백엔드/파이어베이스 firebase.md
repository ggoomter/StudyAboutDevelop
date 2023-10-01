https://www.youtube.com/playlist?list=PLfLgtT94nNq3PzZinqs9Afuiai--r5NB_
백엔드도 공통화해서 서비스로 제공할수 있을것같은데? 라는 생각으로 서비스했는데 구글이 인수함
# 1. firebase설치
#### 호스팅 없는 설치
> html파일에 js파일 경로 몇개 넣으면 fireabase설치 끝
```javascript
<script src="https://www.gstatic.com/firebasejs/8.6.5/firebase-app.js"></script> <script src="https://www.gstatic.com/firebasejs/8.6.5/firebase-auth.js"></script> <script src="https://www.gstatic.com/firebasejs/8.6.5/firebase-firestore.js"></script> <script src="https://www.gstatic.com/firebasejs/8.6.5/firebase-storage.js"></script> 

<script> 
var firebaseConfig = {  
	apiKey: "AIzaSyD4Jbqd9RgZd_AHeLNX-n",   
	authDomain: "test-78694.firebaseapp.com",   
	projectId: "test-78694",  
	등 파이어베이스 콘솔에 있던 SDK 설정내용 ~~ ``
};
firebase.initializeApp(firebaseConfig); 
</script>
```
#### 호스팅까지 설치
- Firebase console 에서 프로젝트 하나 생성
	- 빌드 / Authentication / 시작하기
	- 빌드 / Firestore Database / 데이터베이스만들기 / 다음 / asia-northeast3
	- 빌드 / Storage / 시작하기
	- 빌드 / Hosting / 시작하기
- nodejs설치
	- vsCode에서 폴더열고 Terminal / New Terminal에서
		- npm install firebase
		- npm install -g firebase-tools
	- 설치됐으면 명령어로 서비스 설치 가능하다.
		- firebase login  //브라우저 창뜨는데 거기에 로그인하면 된다.
		- firebase init    //y   하면 선택.  spacebar 와 방향키
		  firestore, hosting, storage 선택하고 enter키
		  use on existing project 선택후 아까 만든 프로젝트 선택
		  rule 물어보면 엔터
		  인덱스 뭘쓸거냐? 엔터
		  public directory 물어보면 엔터
		  싱글페이지 안니까 n
		  깃헙 안쓰니까 n
		  스토리지 뭘쓸거냐? 엔터
		  그럼 initialization complete
	  - index.html 열어보면 여러개 보인다. 아까 체크한 서비스만 남겨도된다.
	  - firebase console / 프로젝트 설정 / 하단에 web 버튼 누르셈 / 앱닉네임 / sdk추가하라고 코드나오는데 script 안 본문만 복붙
	  - html파일 미리 보기 띄우기
		  - vscode 터미널에서 firebase serve
		    하면 url뜬다. 

#### 
- 부트스트랩5버전 css파일링크, js파일링크 넣기, jquery 3버전 mini로 넣기
- navbar 갖다넣기
- firebase console 에서 firestore database
	- 우리가 쓸건 nosql. object처럼 데이터 저장
	- 컬렉션 시작 = 폴더만들기. product(중고물품)
	- 문서 추가 = 상품1
	- +필드추가.   가격 number 1000
	                       제목 string 면도기
	- 이걸 메인페이지에서 갖다 쓰는법
		- 