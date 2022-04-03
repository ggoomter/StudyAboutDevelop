# 두 정수 A와 B가 주어졌을 때, A와 B를 비교하는 프로그램을 작성하시오
# 첫째 줄에 A와 B가 주어진다. A와 B는 공백 한 칸으로 구분되어져 있다.
# 출력 : '>'    '<'    '=='


A,B = map(int,input().split())
if A > B:
    print('>')
elif A < B:
    print('<')
else:
    print('==')


# def compare_2_numbers(A, B):
#     answer = "=="
#     if A > B:
#         answer = ">"
#     elif A < B:
#         answer = "<"
        
#     return answer

# if __name__ == "__main__":
#     A, B = map(int, input().split())
#     print(compare_2_numbers(A, B))