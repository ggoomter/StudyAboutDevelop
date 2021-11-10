// // 함수 = input, 본문, output  3가지가 있는데 모두가 있어도 되고 없어도 된다.
// // function 함수이름(input){본문}         //본문안에 return
// 1. 인풋과 리턴 없는경우
//     function printHello(){
//         console.log('Hello');
//     }
//     printHello();
// 2. 인풋이 있고 리턴이 없는 경우
//     function printSome(what){
//         console.log('Hello '+what);
//     }
// 3. 리턴이 있는경우
//     function isValidGuGudan(dan){
//         if(dan>=2 && dan<=9){
//             return true;
//         }else{
//             return false;
//         }
//     }
//     let result = isValidGuGudan(5); //반환된값을 변수에 저장
//
// 4. 인풋과 리턴이 있는경우
//     function printThree(what){
//         return 3;
//     }
//     console.(printThree(1));    //3
//     console.(printThree(500));  //3
//     console.(printThree("누누")); //3
// ------------------------------------------------------------


//재귀함수1. 팩토리얼. 주어진수부터 1이 될때까지 1을 빼면서 모두 곱한다.
// function factorial(n) {
//     if (n <= 1) {
//        return 1;
//     }
//     return n * factorial(n-1); // 재귀함수
// }
// console.log(factorial(5)); //120

//재귀함수2. 시그마. 주어진수부터 1이 될때까지 1을 빼면서 모두 더한다.
function sigma(n){
    if(n <= 1){
        return 1;
    }
    return n + sigma(n-1);
}
console.log(sigma(5));






function Champion(name, q, w, e, r){
    this.name = name;
    this.q = q;
    this.w = w;
    this.e = e;
    this.r = r;
    this.hp = 1000;
    this.basicDamage = null;
    this.positionX = null;
    this.positionY = null;

    this.move = function(x, y){
        this.positionX += x;
        this.positionY += y;
    }

    this.setHP = function(hp){
        if(hp<0){
            console.log("음수의 체력은 세팅될수없습니다.");
        }else if(hp<20000){
            console.log("최대체력은 20000입니다.")
        }else{
            this.hp = hp;
        }

    }

    this.getHP = function(){
        return this.hp;
    }

    this.getDamaged = function(enemyDamage){
        this.hp -= enemyDamage;
        console.log(`${enemyDamage}를 받아 현재 체력이 ${this.hp}가 되었습니다.`)
        if(this.hp<=0){
            console.log("사망");
        }
    }
}


// let 야스오 = new Champion("Yasuo", "강철폭풍", "바람장막", "질풍검", "최후의숨결");
// let 누누 = new Champion("Nunu", "잡아먹기", "데굴데굴눈덩이", "눈덩이팡팡팡", "절대영도")
// 야스오.setHP(1200);
// console.log(야스오.getHP());
// 야스오.setHP(30000);
// console.log(야스오.getHP());
// console.log(야스오.q);
// console.log(누누.r);
// 누누.move(5,0);
// 누누.move(10,-2);
// console.log(`x위치 : ${누누.positionX}   y위치 : ${누누.positionY}`);
//
// 누누.getDamaged(500);
// 누누.getDamaged(600);


// ------------------------------------------------------------
1.인풋값을 하나 넘겨줄거다.
해당값이 홀수인지, 짝수인지, 실수(소수점)인지, 영어인지, 한글인지
최종구분값을 반환하는 함수를 만드세요.

2.
let input = [1004, "1004", "lion", "펭귄", 501, , 5002, "5.19", "3.14", 3.1415, "PI", 파이];
이런 데이터가 담긴 배열이 있다.
당신이 만든 함수를 사용하여
실수(소수)인 데이터만 뽑아내 보시오

3. 배열의 내장함수 forEach를 사용하여 변경.
forEach는 인자로 콜백함수를 받도록 되어있음.
그 콜백함수에 우리가 만든 함수로 변경

/* 초보자용 문제 */
1. 더하기(인자2개를 더한수를 리턴)함수를 만드세요.
2. 데이터 생성. (배열에 여러 숫자)
3. 내가만든 더하기 함수를 사용하여 그 배열안에 담긴 숫자 모두를 더해보세요.
