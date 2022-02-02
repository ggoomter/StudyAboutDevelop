const ajax = new XMLHttpRequest(); //사용하기위해서 메뉴얼 검색
const NEWS_URL = 'https://api.hnpwa.com/v0/news/1.json';  //url을 변수로 별도 저장.

ajax.open('GET', NEWS_URL, false); //false는 동기적으로 가져오겠다는 뜻.
ajax.send();  //이때서야 실제로 데이터 가져옴

const newsFeed = JSON.parse(ajax.response); //response로 있는건 보기가 불편해서 json parse
const ul = document.createElement('ul');

for(let i = 0; i < 10; i++) {
  const li = document.createElement('li');
  li.innerHTML = newsFeed[i].title;
  ul.appendChild(li);
}

document.getElementById('root').appendChild(ul);
