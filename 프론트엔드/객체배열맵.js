// let Animal1 = {
//     kind : "tiger",
//     name : "naruto",
//     age : 2,
//     weight : 300
// }
// let Animal2 = {
//     kind : "monkey",
//     name : "roopy",
//     age : 5,
//     weight : 30
// }
// let Animal3 = {
//     kind : "bird",
//     name : "marco",
//     age : 100,
//     weight : 5
// }

// let ourAnimal = [Animal1, Animal2, Animal3];


// function Animal(kind, name, age, weight, cryingSound){
//     this.kind = kind;
//     this.name = name;
//     this.age = age;
//     this.weight = weight;
//     this.cryingSound = cryingSound;
//
//     this.cry = function(){
//         console.log(this.cryingSound);
//     }
// }
//
// // 이 함수를 생성자로 쓰기위해서 만들었기 때문입니다.
// // 생성자는 new라는 키워드로 객체를 생성할수 있습니다.
// // 생성자의 이름 = 객체의 이름과 같고, 리턴값이 없습니다.
// let Animal1 = new Animal("tiger", "호치", 20, 250, "어흐으응");
// let Animal2 = new Animal("monkey", "뭉치", 5, 30, "우끼끼끼");
// let Animal3 = new Animal("bird", "marco", 10000, 250, "나는불사조라네");
// let Animal4 = new Animal("Whale", "대왕이", 500, 25000, "흐어엉");
// let ourAnimal = [Animal1, Animal2, Animal3];
// ourAnimal.push(Animal4);
// console.log(ourAnimal);
// ourAnimal[2].cry();
// ourAnimal[3].cry();
//



//내 소스
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

let userInput = "살구";
let matchedIndex = null;  //찾은 인덱스
let showingEngWord = null;   //보여지는 영단어
let showingIndex = getRandomNum(0, dictionary.size);   //인덱스로 쓸 수. 사이즈가 10이기 때문에 0~9까지 랜덤값 생성됨.
// showingEngWord = dictionary.get;
// console.log(showingEngWord);

//최댓값을 포함하는 정수 난수 생성하기
function getRandomNum(min, max) { //https://developer.mozilla.org/ko/docs/orphaned/Web/JavaScript/Reference/Global_Objects/Math/random
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min; //최댓값은 제외, 최솟값은 포함
}


//모든 요소들에 대해 콜백함수 실행
// dictionary.forEach((value, key) => {
//     console.log("english : " , key);
//     console.log("korean : ", value);
// });

dictionary.get('Grape'); //포도
//뽑은 영단어를 input과 비교하면 되겠네.


// //콜백함수가 true가 되는첫번째놈을 리턴
// let result = dictionary.find(function (korean){
//     return korean;
// })




//경모님 소스
// let dictionary = new Map([
//     ['apple', '사과'],
//     ['banana', '바나나'],
//     ['cucumber', '오이'],
//     ['dictionary', '사전'],
//     ['elephant', '코끼리'],
//     ['fish', '물고기'],
//     ['goose', '거위'],
//     ['horse', '말'],
//     ['important', '중요한'],
//     ['juice', '주스']
// ]);
// let randomKey = getRandomKey(dictionary);   //랜덤으로 뽑은 영단어
//
// //랜덤키(영단어)를 뽑는 함수
// function getRandomKey(collection) {
//     let keys = Array.from(collection.keys());
//     return keys[Math.floor(Math.random() * keys.length)];
// }
//
// let input = prompt(randomKey + "의 한글 뜻을 입력해주세요.");
//
// if(input == dictionary.get(randomKey)){
//     alert("정답입니다.");
// }else{
//     alert("오답입니다.");
// }
