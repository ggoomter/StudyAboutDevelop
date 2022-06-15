# 인풋 : 서로다른 9개의 자연수 
# 아웃풋 : 첫째줄에 최대값, 둘째잘에 몇번째수인지 

arr = []
for i in range(9):
    arr.append(int(input()))
print(max(arr))
print(arr.index(max(arr))+1)