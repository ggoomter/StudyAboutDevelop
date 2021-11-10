/*변수 선언*/
let id = document.querySelector('#id');
let password = document.querySelector('#password');
let pwMsg = document.querySelector('#alertTxt');
let passwordConfirm = document.querySelector('#passwordConfirm');
let pwMsgArea = document.querySelector('.int_pass');
let userName = document.querySelector('#name');
let gender = document.querySelector('#gender');
let email = document.querySelector('#email');
let error = document.querySelectorAll('.error_next_box');


/* 이벤트 핸들러 */
id.addEventListener("change", checkId);
password.addEventListener("change", checkPw);
passwordConfirm.addEventListener("change", comparePw);
userName.addEventListener("change", checkName);
gender.addEventListener("change", function() {
    if(gender.value === "성별") {
        error[5].style.display = "block";
    } else {
        error[5].style.display = "none";
    }
})
email.addEventListener("change", isEmailCorrect);


/*콜백 함수*/
function checkId() {
    let idPattern = /[a-zA-Z0-9_-]{5,20}/;
    if(id.value === "") {
        error[0].innerHTML = "필수 정보입니다.";
        error[0].style.display = "block";
    } else if(!idPattern.test(id.value)) {
        error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
        error[0].style.display = "block";
    } else {
        error[0].innerHTML = "멋진 아이디네요!";
        error[0].style.color = "#08A600";
        error[0].style.display = "block";
    }
}

function checkPw() {
    let pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
    if(password.value === "") {
        error[1].innerHTML = "필수 정보입니다.";
        pwMsg.style.display = "block";
        pwMsgArea.style.paddingRight = "40px";
        error[1].style.display = "block";
    } else if(!pwPattern.test(password.value)) {
        error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        pwMsg.innerHTML = "사용불가";
        pwMsgArea.style.paddingRight = "93px";
        error[1].style.display = "block";
        pwMsg.style.color = "red";
        pwMsg.style.display = "block";
    } else {
        error[1].style.display = "none";
        pwMsg.innerHTML = "안전";
        pwMsgArea.style.paddingRight = "93px";
        pwMsg.style.color = "#03c75a";
        pwMsg.style.display = "block";
    }
}

function comparePw() {
    if(passwordConfirm.value === password.value) {
        error[2].style.display = "none";
    } else if(passwordConfirm.value !== password.value) {
        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[2].style.display = "block";
    }

    if(passwordConfirm.value === "") {
        error[2].innerHTML = "필수 정보입니다.";
        error[2].style.display = "block";
    }
}

function checkName() {
    let namePattern = /[a-zA-Z가-힣]/;
    if(userName.value === "") {
        error[3].innerHTML = "필수 정보입니다.";
        error[3].style.display = "block";
    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
        error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        error[3].style.display = "block";
    } else {
        error[3].style.display = "none";
    }
}


function isEmailCorrect() {
    let emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;

    if(email.value === ""){
        error[5].style.display = "none";
    } else if(!emailPattern.test(email.value)) {
        error[5].style.display = "block";
    } else {
        error[5].style.display = "none";
    }

}
