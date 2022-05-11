# 편도시간 왕복시간 계산하는게 아님. 1이 1초가 아니라 2초임에도 유의.
# 1: 2초
# 2: ABC : 3초
# 3 : DEF : 4초
# 9 : WXYZ : 10초

# ord함수 안써도됨

dial = ['ABC', 'DEF', 'GHI', 'JKL', 'MNO', 'PQRS', 'TUV', 'WXYZ']
inputStr = input()
time = 0
for j in range(len(inputStr)):  #받은 문자열 각 문자에 대해서
    for i in dial:
        if inputStr[j] in i:    #배열에 있는 문자열 하나에 포함되어있으면
            time += dial.index(i)+3
            # 0번째 배열이 3초이기 때문에
print(time)
