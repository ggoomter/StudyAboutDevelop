# 격자판 입력받기
grid = [list(  map(int, input().split()) ) for _ in range(9)]

# 최댓값과 그 위치 초기화
max_value = 0
max_row = 0
max_col = 0

# 격자판 순회하며 최댓값 찾기
for row in range(9):
    for col in range(9):
        if grid[row][col] > max_value:
            max_value = grid[row][col]
            max_row = row
            max_col = col

# 결과 출력
print(max_value)
print(max_row + 1, max_col + 1)