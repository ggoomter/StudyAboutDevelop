let str = "JavaScript and Java";

// 1. includes 함수 안쓰고 포함됐는지 구분하기
function isIncludes(first, last){
    return first.indexOf(last)>-1?true:false;  //indexOf는 특정문자열을 찾고 그 문자열이 첫번째로 나타내는 위치 리턴. 없으면 -1리턴함.
}
console.log("정답 : "+isIncludes("abcdefg abc", "ab"));


// 2. includes함수 안쓰고 몇개포함됐는지 찾기
function howManyIncludes(first, last){
    let sample = first.concat("");
    let count = 0;
    for(let i=0; i< first.length-last.length; i++){
        //첫글자 sample[i]와 마지막글자 sample[i+last.length]
        if(first.startsWith(last, i)){  //문자열이 특정 문자열로 시작하는지 체크, 두번째인자를 주면 시작위치
            console.log(`인덱스 ${i} 에서 발견`);
            count++;
        }
    }
    return count;
}
//console.log("정답 : "+howManyIncludes("abcdefg abc", "ab"));