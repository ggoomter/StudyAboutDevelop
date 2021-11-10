// 1. 원본
// fetch('data/html').then(function(response){
//         response.text().then(function(text){
//         alert(text);
//     })
// })
/* fetch(파일명) = 웹브라우저야 서버한테 저요청을 보내서 결과값을 가져와줘
.then  = 서버가 응답을 해줄건데 시간이 많이 걸릴수 있다.
그 시간동안 기다리지 않고 다른일을 하다가
작업이 **끝나면 콜백함수 실행**시켜줘. 바로 이것이 비동기. Ajax의 어싱크로노스.
*/

2. 함수로 분리
fetch('data/html').then(콜백함수)
    이니까
fetch('data/html').then(callbackMe)
로 변환된다. 함수를 호출하는것이 아니라 함수명을 전달하는것에 유의.

선언형이였으면
function callbackMe(response){
    response.text().then(function(text){
        alert(text);
    })
}


표현형이였으면
var callbackMe = function(response){
    response.text().then(function(text){
        alert(text);
    })
}


3. callbackMe함수 업그레이드 : 데이터확인
function callbackMe(response){
    console.log(response);  //어떤 데이터가 담겨오는지 확인. status가 있는거 확인
    response.text().then(function(text){
        alert(text);
    })
}

4. callbackMe함수 업그레이드 : 결과값에 따라 분기처리
function callbackMe(response){
    if(response.status == '404'){
        alert("해당 파일이 없습니다.");
    }else{
        response.text().then(function(text){
        alert(text);
        })
    }
}

5. callbackMe함수 업그레이드 : alert가 아니라 HTML요소에 넣어서 보여주기
function callbackMe(response){
    if(response.status == '404'){
        alert("해당 파일이 없습니다.");
    }else{
        response.text().then(function(text){
            document.querySelector('article').innerHTML = text;
        })
    }
}
