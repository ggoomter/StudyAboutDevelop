console.log("배열.js 로드 완료");

myArr = new Array('🚗','🚓','🚕');
console.log(myArr);

myArr2 = ['🥝','🍍','🥥'];
myArr2.push('🍇', '🍈');    //데이터 삽입
console.log(myArr2);
console.log("인덱스2인것의 값 : ", myArr2[2]);     //3번째
console.log("포도의 인덱스 : ", myArr2.indexOf('🍇'));
myArr2.pop();
console.log("pop실행후 배열 : ", myArr2);

//'🍇','🍈','🍉','🍊','🍋'
