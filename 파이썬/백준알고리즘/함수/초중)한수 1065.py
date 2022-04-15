# 각자리가 등차수열을 이루는수를 한수라고 한다.
# N이 주어졌을때 1<=한수<=N  인 한수의 갯수를 출력하는 프로그램을 작성하시오.
# N은 1000보다 작거나 같은 자연수.

def hansu(num) :
    cnt = 0
    for i in range(1, num+1):
        num_list = list(map(int,str(i)))
        if i <= 99: ##생각해보면 1부터 99까지는 모두 한수
            cnt += 1
        elif num_list[0]-num_list[1] == num_list[1]-num_list[2]:
            cnt += 1  # x의 각 자리가 등차수열이면 한수
        print(num_list)
    return cnt

num = int(input())
print(hansu(num))