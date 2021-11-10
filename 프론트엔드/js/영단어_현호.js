/*
0723
{
   const dict = new Map([
      ["사과","apple",],
      ["고양이","cat",],
      ["개","dog",],
      ["돼지","pig",],
      ["염소","goat",],
      ["말","horse",],
      ["코끼리","elephant",],
      ["포도","grape",],
      ["커피","coffee",],
      ["자바",'java']
   ]);

   function getRandomTo(max) {
      return Math.floor(Math.random() * max);
   }

   while(true) {
      const entries = Array.from(dict.entries());
      const index = getRandomTo(dict.size);
      console.log(entries, index);
      const input = prompt(`${entries[index][1]}는 무엇인가요?`);

      if(input === null) {
         alert('취소하셨습니다.');
         break;
      }
      // console.log(input, dict.get(input), entries[index][0]);
      alert((dict.get(input) === entries[index][1])
         ? "정답입니다."
         : "틀렸습니다.");
   }
}
*/


//0726. 대소문자 구분없음. 맞춘건 목록에서 제거됨.
{
   const SETTING = {
      dictionary: [
         ["사과", "apple", ],
         ["고양이", "cat", ],
         ["개", "dog", ],
         ["돼지", "pig", ],
         ["염소", "goat", ],
         ["말", "horse", ],
         ["코끼리", "elephant", ],
         ["포도", "grape", ],
         ["커피", "coffee", ],
         ["자바", 'java'],
         ["길", 'road'], // 종성 구분 테스트
         ["코틀린", 'kotlin'], // 종성 구분 테스트
      ],
      korean: true,
      // korean 값이 true일 경우, 한국어 단어를 제시하고 영문을 입력받습니다.
      max_life: 3,
      // max_life 값이 true일 경우, 기회가 무제한입니다.
      delete_correct: true,
      // delete_correct 값이 true일 경우, 맞춘 단어를 목록에서 삭제합니다. 모든 단어가 삭제될 경우 축하 메시지를 출력합니다.
   };

   function start() {
      let dict = new Map(SETTING.korean
         ? SETTING.dictionary.map(e => [e[0], e[1]] = [e[1], e[0]])
         : SETTING.dictionary);
      let life_remaining = SETTING.max_life;

      while (SETTING.max_life === true || life_remaining > 0) {
         const entries = Array.from(dict.values());
         const index = getRandomTo(dict.size);
         const question = entries[index];
         const input = prompt([
            `${question}${(SETTING.korean && hasJongsung(question)) ? '은' : '는'} ${SETTING.korean ? '영어로' : '한국어로'} 무엇인가요?`,
            '\n\n',
            (SETTING.max_life === true) ? '라이프가 무제한입니다.' : `잔여 라이프: ${life_remaining}`
         ].join(''));

         if (input === null) {
            alert('취소하셨습니다.');
            break;
         }

         if(dict.get(input.toLowerCase()) === question) {
            alert([
               `정답입니다.`,
               (SETTING.delete_correct === true) ? '' : `\n\n${question}${(SETTING.korean && hasJongsung(question)) ? '이' : '가'} 목록에서 제거됩니다.`,
            ].join(''));
            if(SETTING.delete_correct) dict.delete(input.toLowerCase());

            if(dict.size === 0) {
               alert('목록 사이즈가 0이 되었으므로 게임에서 승리합니다. 축하합니다!');
            }
         } else {
            alert([
               "틀렸습니다.",
               (SETTING.max_life === true) ? '' : '\n\n라이프가 1 감소합니다.',
            ].join(''));
            life_remaining--;

            if(life_remaining === 0) {
               alert('잔여 라이프가 0이므로 종료합니다.');
            }
         }
      }
   }

   function getRandomTo(max) {
      return Math.floor(Math.random() * max);
   }

   function hasJongsung(str) {
      return (str[str.length-1].charCodeAt() - 0xAC00) % 28 !== 0;
   }

   start();
}
