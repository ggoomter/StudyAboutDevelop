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