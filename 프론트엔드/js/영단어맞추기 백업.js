//영어를 보여주고 한글을 맞추는 영한사전 문제

let dictionary = new Map([
  ['Apricot', '살구'],
  ['Grapefruit ', "자몽"],
  ['Grape',    "포도"],
  ['WaterMelone', "수박"],
  ['Mango', '망고'],
  ['Banana', '바나나'],
  ['Apple', '사과'],
  ['Melon', '멜론'],
  ['Pear', '배'],
  ['Peach', '복숭아']
]);

//map.entries() 메서드는 요소의 [키, 값]을 한 쌍으로 하는 이터러블 `객체` 반환합니다.
//Array.from() 메서드는 유사 배열 객체(array-like object)나 반복 가능한 객체(iterable object)를 얕게 복사해 `새로운Array` 를 만듭니다.
let EngList = Array.from(dictionary.keys());
let KorList =  Array.from(dictionary.values());
let userInput = "포도";


//최소정수<=랜덤숫자<최대정수 인 랜덤숫자 만드는 함수
function getRandomInt(min, max) {
  //https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Math/random
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min; //최댓값은 제외, 최솟값은 포함
}


//랜덤숫자로 랜덤키(영단어) 뽑기
function selectOneEngWord(){
    let randomNum = getRandomInt(0, dictionary.size); //0부터 9까지 랜덤값
    let selectedWord = EngList[randomNum];
    return selectedWord;
}

//유저가입력한값(한글)과  문제(키)를 넘기고,  답과 일치하는지 판단
function isMatching(inputKorean, key){
    if(inputKorean == dictionary.get(key)){
        return true;
    }
    else{
        life--;
        return false;
    }
};

//정답을 맞췄는지 결과를 알려주는 함수
function showResult(result){
    if(result){
        alert("맞추셨습니다.");
    }else{
        alert("틀렸습니다.");
    }
}



//게임을 시작하는 함수
function startQuiz(){
    life = 3;
    while(life>0){    //비어있지않고 목숨이0개 초과일때 반복

        //1. 문제 뽑기
        let question = selectOneEngWord();

        //2. 유저에게 문제 제출하고 유저의답 입력받기
        let userInput = prompt(`남은목숨 : ${life}
            \n${question}은 한글로 무엇입니까?`);

        //정답확인전에 취소누르면 반복문 나가기
        if(userInput==null){
            alert("취소하셨습니다.");
            break;
        }

        //틀렸으면 목숨하나 깎기

        //3. 정답확인
        let result = isMatching(userInput, question);

        //4. 확인결과 알려주기
        showResult(result);
    }
    (life == 0) ? alert("당신은 죽었습니다.") : alert("프로그램을 종료하겠습니다.");
    return 1;
}

startQuiz();
