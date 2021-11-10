let array1 = ["알라까비", "또깔라비", "또깔라비띠", 0, 100,'10000', '마지막값'];
let num = 500;

//1. 가장 기본적인 함수와
//   가장 기본적인 화살표함수
// function print(num){
//     console.log(num);
// }
// // (num) => {console.log(num);}
// // num => console.log(num)
//
// //2. 콜백함수로 전달되는 정석함수와
// //   콜백함수로 전달되는 가장 기본 화살표함수
// array1.forEach(print);
// array1.forEach(num => console.log(num));

/* 아래 2개는 완전히 같은 말 */
function(){
  console.log("hi!");
};
() => console.log("hi");


/* 아래 2개는 완전히 같은 말 */
let sayHi2 = function(){
  console.log("hi!");
};
let sayHi2 = () => console.log("hi!");
