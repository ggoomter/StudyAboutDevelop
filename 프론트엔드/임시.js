function Person(name, age, height, weight){
    this.name = name;
    this.age = age;
    this.height = height;
    this.weight = weight;
}

function Student(name, age, grade){
    Person.call(this, name, age);   //받을수있는것만 상속받는다.
    this.grade = grade;
}

Student.prototype = Object.create(Person.prototype);
Student.prototype.constructor = Student;

let Hong = new Student("홍길동", 20, 180, 80);
//name: "홍길동", age: 20,   height: undefined, weight: undefined,   grade: 180
//정의할때 순서대로 name, age, grade니까.
// console.log(Hong);


function Animal(name, age){
    this.name = name;
    this.age = age;
    console.log(name);
    console.log(age);
}

let a = new Animal("이름", "나이");
console.log(a);     //이름 나이 찍히고  Animal {name: "이름", age: "나이"}
let b = new Animal("이름");
console.log(b);     //이름 찍히고  Animal {name: "이름", age: undefined}
let c = Animal("이름", "나이", "키");
console.log(c);     //이름 나이 찍히고 undefined
