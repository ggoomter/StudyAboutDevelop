/* 문제 */
// 1.인풋값을 하나 넘겨줄거다.
// 해당값이 홀수인지, 짝수인지, 실수(소수점)인지, 영어인지, 한글인지
// 최종구분값을 반환하는 함수를 만드세요.
//
// 2.
// let input = [1004, "1004", "lion", "펭귄", 501, , 5002, "5.19", "3.14", 3.1415, "PI", 파이];
// 이런 데이터가 담긴 배열이 있다.
// 당신이 만든 함수를 사용하여
// 실수(소수)인 데이터만 뽑아내 보시오
//
// 3. 배열의 내장함수 forEach를 사용하여 변경.
// forEach는 인자로 콜백함수를 받도록 되어있음.
// 그 콜백함수에 우리가 만든 함수로 변경

/* 초보자용 문제 */
// 1. 더하기(인자2개를 더한수를 리턴)함수를 만드세요.
// 2. 데이터 생성. (배열에 여러 숫자)
// 3. 내가만든 더하기 함수를 사용하여 그 배열안에 담긴 숫자 모두를 더해보세요.



//데이터
let input = [1004, "1004", "lion", "펭귄", 501, , 5002, "5.19", "3.14", 3.1415, "PI", "파이"];

// //1. 홀수 짝수 구분하는 함수
function sortation(b) {
  const regExpK = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g; //한글
  const regExpE = /[a-zA-Z]/g; // 영어

  if (b % 2 == 1) {
    return "홀수";
  } else if (b % 2 == 0) {
    return "짝수";
  } else if (regExpK.test(b) == true) {
    return "한글"
  } else if (regExpE.test(b) == true) {
    return "영어"
  } else if (Number.isInteger(b) == false) {
    return "실수";
  }
}


// 2. 반복
// let output = [];
// function printTest(){
//     for(let item in input){
//         if(sortation(input) == "실수"){
//             output.push(item);
//             return output;
//         }
//     }
// }
//
// console.log(printTest);


//3. foreach
input.forEach((currentElement, index, array) => {
    if(sortation(currentElement) == "실수"){
      console.log("요소 : " + currentElement);
      console.log("index : " + index);
    }
});
