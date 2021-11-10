// let num = 5;
// console.log(num);
// console.log(num/0);     //무한
// console.log(-(num)/0);  //-무한
// console.log(num/"사자");

// let pi = 314159265358979323846264338327950288419716939937510582097494459230786406286208998628034825342117067982148086513282306647093844609550582231725359408128481117450284102701938521105559644622948954930381964428810975665933446128475648233786783165271201909145648566923460348610454326648213393607260249141273724587006606315588174881520920962829254091715364367892590360011330530548820466521384146951941511609433057270365759591953092186117381932611793105118548074462379962749567351885752724891227938183011949129833673362440656643086021394946395224737190702179860943702770539217176293176752384674818467669405132000568127145263560827785771342757789609173637178721468440901224953430146549585371050792279689258923542019956112129021960864034418159813629774771309960518707211349999998372978049951059731732816096318595024459455346908302642522308253344685035261931188171010003137838752886587533208381420617177669147303598253490428755468731159562863882353787593751957781857780532171226806613001927876611195909216420198959515076069479451096596094025228879710893145669136867228748940560101503308617928680920874760917824938589009714909675985261365549781893129784821682998948722658804857564014270477555132379641451523746234364542858444795265867821051141354735739523113427166102135969536231442952484937187110145765403590279934403742007310578539062198387447808478489683321445713868751943506430218453191048481005370614680674919278191197939952061419663428754440643745123718192179998391015919561814675142691239748940907186494231961;
// console.log(pi);

// -------------------------1. 연산자-------------------------
//산술
console.log("산술");
console.log(5+3);
console.log(5-3);
console.log(5*3);
console.log(5/3);
console.log(5%2);   //나머지
console.log(5**2);  //거듭제곱
console.log('\n');

//증감
console.log("증감");
let num = 2;
console.log(num++); //후위 증감연산자. 사용하고난 다음 증가
console.log(++num); //전위 증감연산자. 증가하고난 다음 사용
console.log('\n');

//할당
console.log("할당");
let amount = 5;
amount += 10;   //amount = amount + 10;
amount *= 5;    //amount = amount * 5;
console.log(amount);
console.log('\n');

//비교
console.log("비교");
let ten_String = "10";
let ten_Number = 10;
console.log(ten_String == ten_Number);  //데이터만 봄
console.log(ten_String != ten_Number);  //데이터만본것의 반대
console.log(ten_String === ten_Number); //데이터와 데이터타입도 봄
console.log(ten_String !== ten_Number); //데이터와 데이터타입도 봄의 반대


// 객체는 원시데이터타입들이 모여있는 큰 데이터타입.
// <link> <a> <img> 의 정보만 주면 뭘 할수가없는것 처럼
// 그 객체만 덜렁주면 어떤 데이터를 가져올지 결정못한다. 그래서 여러개의 값들을 가지고있는 주소값을 전달한다.
console.log('객체 비교');
let animal1 = {name : 'tiger'};
let animal2 = {name : 'whale', age : 18};
console.log(animal1 == animal2);
console.log(animal1 === animal2);
animal2 = animal1;
console.log(animal1 == animal2);
console.log(animal1 === animal2);
console.log('\n');

// -- boolean : 참과 거짓.
// false : 0, null, undefined, NaN, ''
// true : 다른 모든 값
console.log("불린 비교. 주석빼고 맞춰보기");
console.log(0 == false);            //둘다 false지 -> true
console.log(0 === false);           //0은 number타입, false는 boolean타입이라 다르지. -> false
console.log('' == false);           //스트링은 데이터없으면 false지 -> true
console.log('' === false);          //당연히 false
console.log(null == undefined);     //제일 어려운문제.  둘다 false의 값을 가지고있기때문에 -> true
console.log(null === undefined);    //당연히 데이터 타입은 다르지. false
console.log('\n');

console.log(typeof null);      //null이 아니라 object가 나옴.
    console.log(null == false);     //true가 나와야할것같은데 false.
    console.log(null == true);      //이것도 false
//null은 값이 정해지지 않았기 때문에 false도 아니고 true도 아니다. false쪽으로 기울어진 가짜 false

//논리
console.log("논리");
let isTrue1 = false;
let isTrue2 = false;
let isTrue3 = true;
console.log(isTrue1 || isTrue2 || isTrue3);
console.log('\n');
//true면 바로 멈추고 뒤는 실행자체를 안하기 때문에. 확률이높은것, 가벼운것을 앞으로 무거운것을 뒤로. 이게 노하우.
//&&면 처음이 false면 뒤는 실행자체를 안하기 때문에. 무거운것을 뒤로.


//삼항
console.log("삼항");
var age = 20;
var status = (age>18) ? "성인" : "미성년자";
console.log(status);


//switch문
// let input = "검은감자";
// switch(input){
//     case "고구마" :
//         console.log("고구마");
//         break;
//     case "감자" :
//         console.log("감자");
//         break;
//     case "피자" :
//         console.log("피자");
//         break;
//     default :
//         console.log("기타 아무거나 음식");
// }
// console.log('\n');
//--------------------------1. 끝-------------------------



// 2. -----반복문, switch 배우고나서 함수없이 반복문으로 이상한 구구단출력.------
// 아무숫자를 입력받아 구구단처럼 1부터 9까지 곱한것을 콘솔로 출력하는 프로그램을 만들어라.
// 단, 짝수일때만 출력하고, 홀수나 이상한수(예를 들어 소수)일 경우는 출력하지말라.
//원래 화면에서 유저입력을 받을건데 빠른실행을 위해서 그냥 하드코딩으로 input데이터 입력

    // 풀이1
    // let InputDan = 5;
    // let oddOrEven = "홀짝";
    //
    // if(InputDan%2 == 0){
    //     oddOrEven = "짝수";
    // }else if (InputDan%2 == 1){
    //     oddOrEven = "홀수";
    // }else{
    //     oddOrEven = "이상한수";
    // }
    //
    // switch(oddOrEven){
    //     case "짝수":
    //         for(let i=1; i<=9; i++){
    //             console.log(InputDan + " * " +i+ " = " + InputDan*i);
    //         }
    //         break;
    //     case "홀수":
    //         break;
    //     case "이상한수":
    //         break;
    // }

    //풀이2
    // let dan = 5;
    // for(let i=1; i<=9; i++){
    //     console.log( dan + " * " + i + " = " + dan*i);
    //     console.log(`${dan} * ${i} = ${dan * i}`);
    // }


    // 심화문제1
    // 1. 유저로부터 출력할 단을 입력받는다.
    // 2. 위와같은 구구단형태를 출력할건데 단, 조건이 있다.
    // 3. 입력받은 값이 짝수일때만 출력하고, 홀수이거나 구구단의 범위(2~9단)을 벗어난 숫자를 입력시 출력하지 않는다.
    //
    // 샘플1
    //console.log("심화문제1");
    // let num1 = prompt("단 수를 입력해주세요 (짝수)");
    // if(num1%2 == 0 && num1>=2 && num1<=9){
    //     for(let i = 1; i<= 9; i++){
    //         console.log(num1+" * "+i+" = "+num1*i);
    //     }
    // }else{
    //     console.log("잘못된 입력 값 입니다.")
    // }

    // 샘플2
    // let input = prompt("숫자를 입력해주세요");
    // if (input <=9 && input%2 == 0){
    //     for(let i=1; 9>=i; i++)
    //         console.log(input +"x"+ i +"="+ input*i);
    // }else if (input <=9 && input%2 != 0){
    //     console.log("홀수라서 출력하지 않습니다 ");
    // }else{
    //     console.log("1~9 사이의 값을 입력해 주세요 ");
    // }


    // 심화문제2
    // 2단부터 유저가 입력한 단까지 출력. 단이 바뀔때는 줄띄움을 하여 보기좋게
    // console.log("심화문제2");
    // let num1 = prompt("마지막 단수를 입력해주세요.");
    // for(let i = 2; i <= num1; i++){
    //     for(let j = 1; j <= 9; j++){
    //         console.log(i +" * "+ j +" = "+ i*j);
    //     }
    //     console.log('\n');
    // }

    // 남한얼
    // let a = prompt("몇단을 입력하시겠습니까?");
    // let c ="";
    // for(let b=2; b<=a; b++){
    //     for(let i=1; i<10; i++){
    //         c=`${c}${b}x${i}=${b*i}\t`;
    //     }
    //         c=`${c}\n`;
    // }
    // console.log(c);


    // ------------------완전심화1. 가로출력----------------
    //심화문제2에서 하나의 단은 줄띄움이 없이 한행에 다 표현되도록 출력
    //단이 바뀌면 줄띄움
    // console.log("더 심화문제2. 한행은 한줄에 표현");
    // let userInput = prompt("몇단까지 출력하겠습니까?");
    // let result = "";
    // for(let dan = 2; dan <= userInput; dan++){
    //     console.log();
    //     for(let j = 1; j <= 9; j++){
    //         result += `${dan} * ${j} = ${dan * j}   `;
    //     }
    //     console.log(`${dan}단 출력 : ${result}`);
    //     result = "";
    // }


    //경모님
    // let num1 = prompt("2단부터 9단까지 마지막 단수를 입력해주세요.");
    //
    // if (num1 >= 2 && num1 <= 9) {
    //     for (let i = 2; i <= num1; i++) {
    //         let str = ""
    //         for (let j = 1; j <= 9; j++) {
    //             console.log(i+"단 출력.")
    //             str += i + " * " + j + " = " + i * j+"  ";
    //         }
    //         console.log(str);
    //     }
    // } else {
    //     console.log('잘못된 입력 값 입니다.')
    // }


    //현호님
    // {
    //    let post = '';
    //    outer : do {
    //       let val = prompt("어느 단까지 출력할까요?\n\n2부터 9까지의 자연수 중, 짝수만 유효합니다."+post);
    //       switch(true) {
    //          case (val === null):
    //             post = "\n\n취소하셨습니다.";
    //             break;
    //          case (val === ""):
    //             post = "\n\n값을 입력해주세요.";
    //             break;
    //          case (/^\d+$/):
    //             post = "\n\n자연수만 입력해주세요.";
    //             break;
    //          case (val < 2):
    //             post = "\n\n2 이상의 값만 입력 가능합니다.";
    //             break;
    //          case (val > 9):
    //             post = "\n\n9 이하의 값만 입력 가능합니다.";
    //             break;
    //          case (val % 2 !== 0):
    //             post = "\n\n짝수 값만 입력해주세요.";
    //             break;
    //          default:
    //             val = parseInt(val);
    //             for(let i=2; i<=val; i++) {
    //                let result = `${i}단 : `;
    //                for(let j=1; j<=9; j++) {
    //                   const z = i*j;
    //                   result += `${i} * ${j} = ${z<10?' ':''}${z}${j===9?'':'  |  '}`;
    //                }
    //                console.log(result);
    //             }
    //             break outer;
    //       }
    //    } while (true);
    // }



//------------------완전심화2. 세로출력 ------------------
//상단에 단을 노출하고,  그아래 세로로 구구단을 2단부터 9단까지 출력

//-------------------------2.끝----------------------------------

//객체 생성
// var person = {
//   name: ['Bob', 'Smith'],
//   age: 32,
//   gender: 'male',
//   interests: ['music', 'skiing'],
//
//   bio: function() {
//     alert(this.name[0] + ' ' + this.name[1] + ' is ' + this.age + ' years old. He likes ' + this.interests[0] + ' and ' + this.interests[1] + '.');
//   },
//   greeting: function() {
//     alert('Hi! I\'m ' + this.name[0] + '.');
//   }
// };
//
// console.log(person);
// console.log(person.name);
// console.log(person.name[0]);
// console.log(person.age);
// console.log(person.interests[1]);
// person.bio();
// person.greeting();

/*3. 오브젝트 메모리 저장.-------------------------
 const이지만 주소값을 바꿀수없는것이지 값은 바꿀수있다.*/

const mouse = {maker : 'Samsung', color:'black', price:20000, click : function(){alert('클릭하셨네요');}};
// console.log(mouse.maker);
// mouse.maker = 'dell';
// console.log(mouse.maker);

//함수정의
// let myName = "배성원";
//
// hello(myName);  //호이스팅되어 정상실행
// function hello(name){   //함수 선언식. 호이스팅됨.
//     console.log(name +"님, 안녕하세요. 반갑습니다.");
// }
//
// hi(myName); //호이스팅 되지 않아 에러
// var hi = function(name){    //함수 표현식. 호이스팅 안됨.
//     console.log(name +"님, 안녕하세요. 반갑습니다.");
// }



// 원시형은 값 그대로 복사. 상식적임.
let originalMessage = "hello world";
let copyMessage = originalMessage;
console.log("copyMessage : "+copyMessage);  //hello world
copyMessage = "changed world";
console.log("copyMessage : "+copyMessage);  //changed world
console.log("originalMessage : "+originalMessage);  //hello world

// 객체의 얕은 복사(참조에 의한 주소 복사)
let copy = mouse;           //마우스의 메이커는 삼성이였음.
copy.maker = "Apple";       //복사본의 메이커를 애플로 변경.
console.log("mouse.maker : "+mouse.maker);  //원본의 메이커  애플이 찍힘.
console.log("copy.maker : "+copy.maker);    //카피의 메이커  애플이 찍힘.
// 서로다른 변수가 같은 객체를 바라보고있다.


//객체의 깊은복사 : 반복문 돌리면서 키와 값을 하나씩 옮겨야함
let kakasi = clone(mouse);
kakasi.maker = "Razer";
console.log("mouse.maker : "+mouse.maker);      //애플
console.log("kakasi.maker : "+kakasi.maker);    //Razer


/*end of 3-------------------------*/

// 직접만든 클론함수
function clone(input){
    var output = {};
    for(var i in input){    //input에있는 모든 아이템들에 대해서 for(var i=0; i<input.length; i++)
        output[i] = input[i];   //인풋i번째를 아웃풋i번째로 대입
    }
    return output;
}
