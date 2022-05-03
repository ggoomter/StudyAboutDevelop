word = input().upper()
characterList = list(set(word))
cntList = []

for i in characterList: ##각 요소에 대해서 몇개있나 검사
    cnt = word.count(i)
    cntList.append(cnt)

if cntList.count(max(cntList)) > 1:
    print('?')
else:
    maxIndex = cntList.index(max(cntList))  ## 제일 많은갯수수의 문자가 몇번째인지 파악
    print(characterList[maxIndex].upper())