# 0 1 0 2 0 1 0
# 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
# 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0

def pattern(n):
    if n == 0:
        print(0, end=" ")
    else:
        pattern(n - 1)
        print(n, end=" ")
        pattern(n - 1)

for n in range(0, 5):
    pattern(n)
    print()
