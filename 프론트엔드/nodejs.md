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


---
## 영가에듀에서 실습
1. 버전확인 : cmd에서 node -v  하면 v20.13.1
    aws에서는 node 16.18.1, express 4.19.2
    라서 https://nodejs.org/en/blog/release/v16.18.1 여기서 다운
    

1. Express 샘플 예제
   https://expressjs.com/ko/starter/hello-world.html
1. npm install express --save
