- 오픈소스 크로스플랫폼 자바스크립트 런타임 환경
- 브라우저의 외부에서 구글 크롬의 핵심인 v8 Engine을 실행

---
nodejs설치
.msi 14버전으로

버전확인
node -v
npm -v

nvm설치
https://github.com/coreybutler/nvm-windows/releases 
에서 nvm-setup.zip 다운

cmd다시 키고
nvm list available

nvm install 원하는버전
nvm list            //현재 사용할수있는 리스트
nvm use 사용할버전

exit status 1 에러뜸
관리자권한으로 해도 안됨
nvm 설치경로에 공백있을 경우 안된다고함  : 알고보니 nodejs가 제대로 안깔려있었음


### npm
npm은 nodejs의 설치매니저다.
- npm init     =  package.json 파일이 작성하는 프로세스로 넘어간다. 대부분의 항목에서는 enter를 눌러 기본값을 쓴다.
- npm install express --save    = 현재 디렉터리에 Express를 설치한 후 종속 목록에 저장
		(종속적이지 않게 임시로 express를 설치하려면 npm install express)
		npm install    = 종속목록에 있는것 모두 설치
- app.js를 만들고 가장간단한 hello world만들어보기
```js
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
```
- 앱실행  =    node app.js
- 브라우저에서 결과물 확인 =    http://localhost:3000/

---
### Express
애플리케이션 생성기 도구
- npm install express-generator -g
- 


---
## 영가에듀에서 실습
1. 버전확인 : cmd에서 node -v  하면 v20.13.1
    aws에서는 node 16.18.1, express 4.19.2
    라서 https://nodejs.org/en/blog/release/v16.18.1 여기서 다운
    

1. Express 샘플 예제
   https://expressjs.com/ko/starter/hello-world.html
1. npm install express --save
