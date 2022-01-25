function decideLevel(num){  //함수이름 잘못됨
  num /= 10;  //10을 왜 나눠줌?
  switch(num){ //switch가 아니라 swich였음
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        console.log("가"); //들여쓰기 잘못됨
        break;
      case 6:
        console.log("양");
        break;
      case 7:
        console.log("미");
        break;
      case 8:
        console.log("우");
        break;
      case 9:
      case 10:
        console.log("수");
      break;
      default : //들여쓰기 잘못됨
        console.log("asd"); //들여쓰기 잘못됨

  }
}
let num = 40;
console.log('hello');
decideLevel(num);
