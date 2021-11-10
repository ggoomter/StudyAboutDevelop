function log(obj){
    console.log(obj);
}

log(typeof 5);
log("잘되는지 체크");
const simplePrint = () => console.log('simplePrint!');
simplePrint();

//document.getElementsByTagName("tag_name")
//document.getElementsByName("name_attribute")
let control1 = document.getElementById("para1");

function changetoRed(target){
    console.log(target);
    //RGB에러가 나서 따옴표 달아줌.,
    document.getElementById(target).style.backgroundColor ='rgb(247, 151, 194)';
    document.getElementById(target).style.color = 'rgb(247, 47, 149)';
}

function useCssSelector(){
    let el = document.querySelector(".myButton");
    el.style.backgroundColor = 'rgb(141, 210, 28)';
    el.style.color = 'rgb(219, 10, 10)';
}

function useClassName(){
    let el = document.getElementsByClassName("myButton");
    el[3].style.backgroundColor = 'rgb(33, 147, 82)';
}


function myMove() {
  //https://www.w3schools.com/js/tryit.asp?filename=tryjs_dom_animate_3
  let id = null;
  const elem = document.getElementById("animate");
  let pos = 0;
  id = setInterval(frame, 5);   //일정시간마다 함수를 실행한다.

  function frame() {
    if (pos == 350) {
      clearInterval(id); //setInterval로 반복하는것을 멈추게한다.
    } else {
      pos++;
      elem.style.top = pos + "px";
      elem.style.left = pos + "px";
    }
  }

}

/**
 * 오른쪽하단끝에 도달하면 방향 변경, 이미지변경, 위치에 따라 배경색 변경,
 */
function myMove2(){
    const elem = document.getElementById("animate");
    let pos = 0;
    let inverted = false;        //방향을 바꿔주기위한 변수

    clearInterval();  //현재 돌아가고있는 setInterval을 멈춘다.
    setInterval(frame, 5);  //0.005초마다 frame함수를 실행

    function frame() {
        if (pos >= 350) {   //부모의 가로세로가 400이고 자식의 가로세로가 50이므로 제일 오른쪽밑으로 왔을때의 자식의 왼쪽끝이 350이 된다.
            inverted = true;
        }
        if (pos <= 0 ){
            inverted = false;
        }

        pos +=  (inverted ? -1 : 1) ;   //interted가 true이면 -1, false이면 1을 원래위치에서 더하게됨.
        elem.style.top = pos + "px";
        elem.style.left = pos + "px";
        elem.style.backgroundColor = `hsl(${pos}, 100%, 50%)`;  //위치값에 따라서 배경색을 다르게 지정
        elem.style.transform = `scale(1.${Math.floor(pos/100)})`;
    }
}

/**
 * 하나가 이동하고있을시 두번째 애니메이션은 발생하지 않도록
 */
function myMove3(){
    const elem = document.getElementById("animate");
    let pos = 0;
    let inverted = false;        //방향을 바꿔주기위한 변수

    clearInterval();  //현재 돌아가고있는 setInterval을 멈춘다.
    setInterval(frame, 5);  //0.005초마다 frame함수를 실행

    function frame() {
        if (pos >= 350) {   //부모의 가로세로가 400이고 자식의 가로세로가 50이므로 제일 오른쪽밑으로 왔을때의 자식의 왼쪽끝이 350이 된다.
            inverted = true;
        }
        if (pos <= 0 && inverted){
            inverted = false;
        }

        pos +=  (inverted ? -1 : 1) ;   //interted가 true이면 -1, false이면 1을 원래위치에서 더하게됨.
        elem.style.top = pos + "px";
        elem.style.left = pos + "px";
        elem.style.backgroundColor = `hsl(${pos}, 100%, 50%)`;  //위치값에 따라서 배경색을 다르게 지정
        elem.style.transform = `scale(1.${Math.floor(pos/100)})`;
    }
}




function mOver(obj) {
  obj.innerHTML = "로렘 입섬"
}

function mOut(obj) {
  obj.innerHTML = "Lorem Ipsum"
}

function displayDate() {
    document.getElementById("demo").innerHTML = Date();
}

function createNode(parent){
    const para = document.createElement("p");   //p라는 앨리먼트 생성
    const node = document.createTextNode("이것은 동적으로 만들어진 컨텐츠입니다.");  //text노드 생성
    para.appendChild(node); //텍스트 노드를 p앨리먼트의 자식으로 붙여넣음
    const element = document.getElementById(parent);    //parent라는 id를 가진노드를 변수에 저장
    element.appendChild(para);  //parent안에 자식으로 위에서 만든놈들을 넣어줌
}


function printScreenSize(){
    let width = screen.width;
    let height = screen.height;
    alert("width : "+width +"\n"+
        "height : " + height)
}


//버튼에 마우스 이벤트
var x = document.getElementById("myBtn");
x.addEventListener("mouseover", myFunction);
x.addEventListener("click", mySecondFunction);
x.addEventListener("mouseout", myThirdFunction);

function myFunction() {
  document.getElementById("demo").innerHTML += "Moused over!<br>";
}

function mySecondFunction() {
  document.getElementById("demo").innerHTML += "Clicked!<br>";
}

function myThirdFunction() {
  document.getElementById("demo").innerHTML += "Moused out!<br>";
}



//동물원
// 3종류의 동물을 담은 객체 생성.
// 동물이라는 객체를 만들고, 객체를 여러개 담고있는 배열에 담으면되겠구나.
//     동물종류 : 예)tiger
//     이름 : naruto
//     나이 : 2
//     몸무게 : 35
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
//
//
// let ourAnimal = [Animal1, Animal2, Animal3];
// log(typeof ourAnimal);
//
//
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
// let Animal1 = new Animal("tiger", "호치", 20, 250, "어흐으응");
// let Animal2 = new Animal("monkey", "뭉치", 5, 30, "우끼끼끼");
// let Animal3 = new Animal("bird", "marco", 10000, 250, "나는불사조라네");
// let Animal4 = new Animal("Whale", "대왕이", 500, 25000, "흐어엉");
// let ourAnimal = [Animal1, Animal2, Animal3];
// ourAnimal.push(Animal4);
// console.log(ourAnimal);
// ourAnimal[2].cry();
// ourAnimal[3].cry();
