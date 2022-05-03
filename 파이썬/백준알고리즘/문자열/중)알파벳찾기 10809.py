
word = input()
aNum = int(ord('a'))
zNum = int(ord('z'))
alphabet = list(range( aNum  ,zNum+1 ))  # 아스키코드 숫자 범위

for x in alphabet :
    print(word.find(chr(x)), end=' ') 