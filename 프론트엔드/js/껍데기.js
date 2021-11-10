//함수를 만들어달라고 하면서 요청 : 첫번째 인자로는 배열을 받도록 만들어주세요.
//함수를 만드는 사람이 공지 : 첫번째인자로는 배열을 넣어주세요.


/*함수정의. 3개의 인자를 받을도록 만들었고,
1번째 인자를 answer, 2번째 인자를 printTrue로, 3번째 인자를 printFalse로 쓰겠다.
4번째 인자가 들어오면 무시되고,
인자가 하나나 두개만 들어오면 그것만 사용됩니다.
사용하는사람이 첫번째 요소로 무엇을 넘기든지 나는 그것을 answer라는 이름으로쓸거야.
매우매우매우매우 중요. 자바스크립트는 dynamic typed language다. 데이터가 들어올때 타입이 정해진다.
*/

function matchQuiz(answer, a, printFalse){
    if(answer[0]==="무령왕릉"){
        a();
    }else{
        printFalse();
    }
}

function printTrue(){
    console.log("맞췄습니다.");
}

function printFalse(){
    console.log("틀렸습니다.");
}


//이런걸 생각해서 함수를 정상적으로 호출해보세요.
answer = ["고구려", "무령왕릉", "삼국사기", "김유신"];
oneAnswer = "무령왕릉";
matchQuiz(answer, printTrue, printFalse);



//기본문제
유저는 "삼각형", "사각형", "원"의 너비를 구하고싶다.
개발자에게 '인자 3개를 받고 그 넓이를 구해주는 함수'를 만들어주세요. 라고 부탁한다.
--함수 이름은 calFigure로 해주세요.
--첫번째 인자는 도형의 타입
--두번째 인자는 그 도형의 너비
--세번째 인자는 그 도형의 높이
원은 반지름만 있으면 되니까 2번째 인자를 반지름으로 처리해주세요.

function calFigure(type, width, height){
    let result = null;
    if(type == "삼각형"){
        result = calTriangle(width, height);
    }else if(type == "사각형"){
        return width * height;
    }
}

//심화문제
// 다하신분은 6각형도 추가해보세요
// 6각형의 넓이 = (3√3 *한변의길이)/ 2
// 자바스크립트에서 루트를 구하는 내장함수 = Math.sqrt

//
//삼각형 넓이
// function calTriangle(width, height){
//     return 0.5 * width * height;
// }
//
// //사각형 넓이
// function calSquare(width, height){
//     return width * height;
// }
//
// //원 넓이
// function calCircle(radius){
//     return radius * radius * 3.14;
// }
//
// //6각형 넓이
// function calHexagon(side){
//     return (3*Math.square(3)*side)/ 2;
// }
//
// function calFigure(type, param1, param2){
//     let result = 0;
//     switch(type){
//         case "삼각형":
//             result = calTriangle(param1, param2);
//             break;
//         case "사각형":
//             result = calSquare(param1, param2);
//             break;
//         case "원":
//             result = calCircle(param1, param2);
//             break;
//         case "6각형":
//             result = calHexagon(param1, param2);
//             break;
//     }
//     return result;
// }






예1) array1.forEach(element => console.log(element));
//forEach를 만든사람이 첫번째 요소로 함수를 받을것이라고 지정했다.
array1.forEach( 함수명 );
호출하는것이 아니라 함수를 인자로 전달한것.

function 함수명 (element) = {
console.log(element)
}
위는 화살표함수 문법에 의해 아래와 같다.
(element) => console.log(element)   //그런데 인자가 하나일때 ()가 생략가능해서
element => console.log(element)가 된다.
즉 함수 이름을 전달한것이다.

array1.forEach(function(element){
  console.log(element)
})
즉 맨위와 맨아래의 이 함수는 같은것이다. 3줄을 한줄로 표현
맨위와 맨 아래의 혼용에 익숙해져야한다.
