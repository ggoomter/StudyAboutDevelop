let Person = function(){
    this.a = 1;
    this.b = 2;
    this.run = function(){console.log("Person이 달립니다.")};
}
let kim = new Person();  //a:1, b:2
Person.prototype.b = 3;      //Person.b:2  이지만 Person.prototype.b :3
Person.prototype.c = 4;      //human의 프로토타입에 c라는 속성이 추가되고 값이 4가됨.

console.log("기본");
console.log(kim.a);   //1
console.log(kim.b);   //2
console.log(kim.c);   //4
console.log(kim.d);   //undefined
kim.run();
kim.__proto__.run();

console.log("\n심화");
console.log(kim.prototype); //undefined
console.log(kim.__proto__); //b:3, c:4, constructor : human
console.log(kim.__proto__.b);//3
