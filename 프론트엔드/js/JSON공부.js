const rabbit = {
  name : 'tori',
  color : 'white',
  size : null,
  birthDate : new Date(),
  jump : () =>{
    console.log(`${name} jumping!`);
  }
};


//직렬화. json으로 만들기
let json = JSON.stringify(rabbit);
console.log(json);  //전체 출력
let jsonPart = JSON.stringify(rabbit, ['name', 'color']);
console.log(jsonPart);  //뽑은것만 출력


//역직렬화. object로 만들기
const obj = JSON.parse(json);
console.log(obj); //변환했다가 변환. 함수 없어짐
rabbit.jump();  //점프잘됨
obj.jump(); //점프못함

//심화
// 생일은 어떻게될까? 객체라면 Date객체안에 있는 함수를 뽑아서 쓸수있겠지.
