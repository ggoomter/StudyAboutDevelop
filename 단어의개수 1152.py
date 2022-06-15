# 앞뒤 공백 자르고 띄워쓰기갯수 +1하면 될듯
# 예시 답에는 다 맞는데 틀렸다고 하네.   => 위의 편접으로는 빈 문자열을 주면 0을 반환해야 되는데 1을 반환함.
# 매우쉬운것처럼 보이지만 정답률 낮은 문제임. 

# 띄워쓰기 갯수+1로 편접으로 하려고 했던것
# inputStr = str(input()).strip();
# spaceNum = inputStr.count(' ')
# print(spaceNum + 1)



inputStr = input().split();
spaceNum = len(inputStr)
print(spaceNum)
