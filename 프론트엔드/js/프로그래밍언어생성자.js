
// 프로그래밍언어(progLanguage) 생성자.
//  속성 : 한글이름, 영어이름, 창시자, 창시년도, 특징
//   Java, C, C++, C#, Python, Javascript

// 1. 창시년도가 1990년 이후인 언어들의 한글이름만 출력해주세요.
// 2. 영어 이름에 C가 들어간 언어들의 영어 이름과 특징을 출력해보세요.
// 3. 귀도 반 로섬이 창시한 언어의 한글 이름은 무엇입니까?
//    -> 함수로 만들기.    인풋 : 배열, 창시자이름     아웃풋 : 언어의 한글이름
// 4. progLanguage생성자함수를 건드리지말고 
//      새로운언어를 기존배열에 추가하는 함수 addLanguage(기존배열, 추가할언어)  만들어주세요. 
//    함수의 정의와 호출 깔끔하게 이해하지 못하면 어려울것임.
// 5. 어려운 문제.   창시년도를 기준으로 오름차순으로 정렬해주세요. 
//      sortAsInitYear(배열)   콜백함수, 화살표함수 알면 쉽고, 못해도 조건문, 반복문으로 할 수 있음.
// 6. 더 어려운 문제.   sortAsCri(배열, 기준)     동적으로 받은 기준으로 배열을 오름차순 정렬

function progLanguage(korName, engName, initiator, initYear, characteristic){
    this.korName =  korName;
    this.engName =  engName;
    this.initiator = initiator;
    this.initYear =  initYear;
    this.characteristic = characteristic;
}

let Java = new progLanguage("자바", "Java", "제임스고슬링", "1995", "객체지향. 플랫폼 독립적");
let C = new progLanguage("C언어", "C", "데니스리치", "1972", "시스템개발에 적합, 메모리 제어 가능");
let Cpp = new progLanguage("씨쁠쁠", "C++", "비야네 스트롭스트룹", "1979", "기존의 C언어에 여러 가지 기능을 추가. 절차 지향적. 객체 지향적.");
let Csharp = new progLanguage("씨샵", "C#", "마이크로소프트", "2000", ".NET 프로젝트와 함께 발표된 객체 지향 프로그래밍 언어");
let python = new progLanguage("파이썬", "python", "귀도 반 로섬", "1991", "인터프리터방식. 문법이 매우 쉬움. 학습용으로 좋음");
let JavaScript = new progLanguage("자바스크립트", "javascript", "브랜든 에이크", "1995", "자바의 유명세에 업힐려고 이름지어짐. 웹에서 동작하는 유일한 언어");

let pl = [];
pl.push(Java, C, Cpp, Csharp, python, JavaScript);

//1번답.
function printKorplOver(year){
    // for(let i=0; i<pl.length; i++){
    //     if(pl[i].initYear > year){
    //         console.log(pl[i].korName);
    //     }
    // }

    for(let ele of pl){
        if(ele.initYear > year){
            console.log(ele.korName);
        }
    }
}
printKorplOver(1990);


//2번답.
function printIncludC(list){
    for(let ele of list){
        if(ele.engName.includes("C")){
            console.log(ele.engName, ele.characteristic);
        }
    }
}
printIncludC(pl);


//3번답. 귀도 반 로섬이 창시한 언어의 한글 이름. 함수로 만들기
//인풋 : 배열,창시자이름     아웃풋 : 언어의 한글이름
function whatLanguage(arr, who){
    for(let ele of arr){
        if(ele.initiator === who){
            return ele.korName;
        }
    }
}
let result = whatLanguage(pl, "귀도 반 로섬");
console.log(result);

//4번답.
function addLanguage(arr, newLang){
    arr.push(newLang);
}
let dotNet = new progLanguage("루비", "Ruby", "마츠모토 유키히로", "1995", " 동적 객체 지향 스크립트 프로그래밍 언어. 순수 객체 지향 언어. 인간 중심으로 설계");
addLanguage(pl, dotNet);
console.log("추가된언어 : "+pl[pl.length-1].korName);


//5번답.
function sortAsInitYear(arr){
    let result = arr.sort( compare_year );
    return result;
}
//sort()는 인자로 비교함수를 받을수있다.
// 비교함수는 인자로 2개를 받는다.
//sort함수는 return 이 1이상이면 b가 먼저(내림차순), -1이면 a가 먼저(오름차순), 0이면 그대로


function compare_year( a, b )
  {
  if ( a.initYear < b.initYear){
    return -1;
  }
  if ( a.initYear > b.initYear){
    return 1;
  }
  return 0;
}
//console.log(sortAsInitYear(pl));

//6번답 이동원
// function sortAsCri(arr, standard){

//     if(standard == 'korName'){
//           arr.sort(function(a,b){
//           return a.korName < b.korName ? -1 : a.korName > b.korName ? 1 : 0;
//       });
  
//     } else if(standard == 'engName'){
//           arr.sort(function(a,b){
//           return a.engName < b.engName ? -1 : a.engName > b.engName ? 1 : 0;
//       });
  
//     } else if(standard == 'inititator'){
//           arr.sort(function(a,b){
//           return a.inititator < b.inititator ? -1 : a.inititator > b.inititator ? 1 : 0;
//       });
  
//     } else if(standard == 'initYear'){
//           arr.sort(function(a, b){
//           return a.initYear - b.initYear;
//       });
  
//     } else if(standard == 'Characteristic'){
//           arr.sort(function(a,b){
//           return a.Characteristic < b.Characteristic ? -1 : a.Characteristic > b.Characteristic ? 1 : 0;
//       });
//     }
    
//     console.log(arr);
//   }
//   // 테스트
//   //sortAsCri(pl, 'korName');
//   // sortAsCri(pl, 'engName');
//   // sortAsCri(pl, 'inititator');
//    sortAsCri(pl, 'initYear');
//   // sortAsCri(pl, 'point');

//6번답. 김현수
console.log("66666666666666");
function sortAsCri(list,target){
    //[]는 받은 문자열을 속성값으로 가져오는 문법
    result=list.sort((a,b)=>a[target] < b[target] ? -1 :  0);
    return result;
}

//ProgLanguageList(korName,engName,initiator,initYear,feature)
aa=sortAsCri(pl,"initiator");
console.log(aa);