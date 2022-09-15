//선언하기 전에 사용가능
console.log(r);
r = 5;
var r;


// console.log(result);   
// age = 50;
// if(age<100){
//     result = "100살 이하입니다.";
//     console.log("if문안에서 찍은 result : "+result);
// }


// 정리
// 1. 함수내에서 var안쓰고 바로쓰면 지역변수에서 찾고 없으면 전역변수에서 찾는다.
// 2. var는 함수스코프 이기 때문에 같은 함수내에서는 var로 선언된 변수를 모두 공유할 수 있다.



//재선언가능
var name = 'tiger';
var name = 'rabbit';
console.log(name);


//블록유효범위 안지킴
var number = 10;
if(number>5){
    var number = 50;
}
console.log(number);    //바깥쪽 변수니까 10이 찍혀야되는데 50으로 변경됨

//선언도 안한것 에러없이 호출가능
console.log(result);    //undefined. 있긴있는데 정의되지 않았다.
age = 50;
if(age<100){
    var result = "100살 이하입니다.";
}

//var를 전역변수로 선언하면 윈도우 객체의 속성이 된다.
var voo = 'voo';
let loo = 'loo';
console.log(window.voo);
console.log(window.loo);




//var 의 문제점1. 함수가 아닌 블록에서 지역변수 전역변수 구분 못함
for(var j=1; j<5; j++){
  console.log(j);
}
console.log("포문마치고 j : "+j);


//var의 문제점1. 함수가 아닌 블록에서 지역변수 전역변수 구분 못함
var problem = "전역변수";

function thisIsProblem(){
  var problem = "지역변수";      //함수스코프 내의 var는 지역변수로 선언된것이다.
  console.log("PROBLEM : ", problem); // 지역변수가 우선시된다.
}

console.log("global : ",problem); // 전역
thisIsProblem();
console.log("global : ",problem); // 전역


//var의 문제점2. 재선언됨.
var u = 1;
console.log(u);
var u = 2;
console.log(u);


console.log(x);
let x = 100;