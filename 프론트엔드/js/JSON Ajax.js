//0. 순수바닐라 핵심만
// function loadJsonUsingVanillaJS(){
//     var ourRequest = new XMLHttpRequest();
//     ourRequest.open('GET','JSON샘플데이터.json');
//     ourRequest.send();
//     ourRequest.onload = function(){
//         console.log(ourRequest.responseText);
//     }
//
// }




// 1. 순수 자바스크립트 XMLHttpRequest 사용
let xhr = new XMLHttpRequest();
let target = "https://jsonplaceholder.typicode.com/posts/1";
let paramVal = "paramVal";
xhr.open("GET", target, true); //전달방식, URL, 동기/비동기
xhr.send(); //요청,

xhr.onreadystatechange = function() {
    if (xhr.readyState === XMLHttpRequest.DONE) { //완료되었는지 확인
        if (xhr.status == 200) { //정상결과를 받았는지 확인
            let loadedJSON = xhr.responseText;  //현재JSON데이터
            let contentArea = document.getElementById("content");
            contentArea.innerHTML = ("아래는 받아온 JSON \<br\>" + JSON.parse(loadedJSON).title + "<br>");
            //객체로 변환한다음 title요소만 뽑음
        } else {
            alert("fail to load. "+xhr.status);
        }
    }
}

//2. 순수 자바스크립트 fetch 사용
// const data = new Promise((resolve, reject) => {
//     fetch('./Data.json').then(respond => {
//         resolve(respond.json())
//     }).catch(err => {
//         reject(err)
//     })
// }) console.log(data)



//3. JQEURY사용
// $.get("URL", {
//     name: value
// }).done(function(data) {
//     console.log(data);
// }).fail(function(data) {
//     console.log("Fail to load\nError code: " + data);
// });
