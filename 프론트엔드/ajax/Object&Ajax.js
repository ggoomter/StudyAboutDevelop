let Car = {
    color : 'black',
	name : 'sonata',
	price : 20000000,
	maxSpeed : 220,
	presentSpeed : 0,
	speedUp : function(num){
		this.presentSpeed += num;
	},
	printSpeed : function(){
		console.log(presentSpeed);
	}
}

/* student 객체.   이름, 나이, 성별    출석하다, 시험치다 */
let student = {
	name : '',
	age : 0,
	gender : '',
	attend : function(){
		console.log('출석하다');
	},
	test : function(){
		console.log('시험치다');
	}
}

/* 객체 */
let rabbit = {
	name : 'tori',
	color : 'white',
	size : 'small',
	weight : 10,
	birthDate : new Date(),
	jump : function(){
		console.log(`${this.name}은 jump를 합니다.`);
	}
};

/* json으로 변환 */
let rabbitJSON = JSON.stringify(rabbit);
console.log(rabbitJSON);	//**json으로 변환하면 함수가 사라진것을 알 수 있다.**

/* json으로 만들때 필요한 속성만 변환 */
let JsonParsing = JSON.stringify(rabbit, ['name', 'color', 'size']);



/* 다시 json에서 객체로 변환 */
let changedRabbit = JSON.parse(rabbitJSON);
//changedRabbit.jump();	/* 안되는것 확인 */


/* ajax */
let btn = document.getElementById("ajax_btn");
let jqueryBtn = document.getElementById("jquery_btn");
let fetchBtn = document.getElementById("fetch_btn");
console.log("ajax테스트");
/* 순수 바닐라 스크립트 */
btn.addEventListener("click", ()=>{
	console.log('클릭 이벤트 발생');
	let xhr = new XMLHttpRequest();	//httpRequest 객체를 생성함
	let url = "https://api.hnpwa.com/v0/news/1.json";
	xhr.open("GET", url, true);	//url에 get요청을 보냄. true는 비동기적으로 보내겠다는 말
	xhr.send();	//이때서야 비로소 데이터를 가져오는 작업을 함
	xhr.onload = function(){
		if(xhr.status == 200){
			console.log("통신 성공");
			console.log(xhr.response);
		}else{
			console.log("통신 실패");
		}
	}
});


jqueryBtn.addEventListener("click", ()=>{
	$.ajax({
		url : 'https://api.hnpwa.com/v0/news/1.json',
		type : 'get',
		success : function(response){
			console.log("통신 성공");
			console.log(response);
		},
		error : function(){
			console.log("통신 실패");
		}
	})
});
//js를 통해서 특정url에 요청을 하고 받아온 정보를 console에 출력

// 실전에서 생각해야될 것
// 1. 요청을 처리하는 서버의 서비스를 만들어야돼.
// 2. console에 출력하는것이 아니라 html에 출력해줘야됨
//	이미있는 dom요소의 값을 바꿀건가?   숨김처리된 dom요소를 보이게 할건가?
//	없던 dom요소를 동적으로 만들어줄건가?
// 3. 서버에서는 클라이언트의 요청이 제대로 됐는지 체크,
//    화면에서는 서버가 응답을 제대로했는지 정상적으로 줬는지 체크


fetchBtn.addEventListener("click", ()=>{
	let url = "https://api.hnpwa.com/v0/news/1.json";
	fetch(url)
		.then((response)=>{	//통신이 성공적으로 되면 할일
			return response.json();	//json데이터를 자바스크립트 객체로 변환
		})
		.then((obj)=>{
			console.log(obj);
		})
		.catch(()=>{
			console.log('에러발생');
		})
});
