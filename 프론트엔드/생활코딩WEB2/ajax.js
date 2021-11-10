//fetch함수사용
function getData(data){
    if(response.status == '404'){
        alert("해당 파일이 없습니다.");
    }else{
        response.text().then(function(text){
            // document.querySelector('article').innerHTML = text;
            $('article').html(text).html();
        })
    }
}


fetch('data/html').then(callbackMe);
