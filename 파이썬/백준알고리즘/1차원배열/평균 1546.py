n = int(input())  # 과목 수
dataList = list(map(int, input().split()))
max_score = max(dataList)

new_list = []
for score in dataList :
    new_list.append(score/max_score *100)  # 새로운 점수 생성
test_avg = sum(new_list)/n
print(test_avg)