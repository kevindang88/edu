from random import randint

L = [randint(0, 99) + 1 for i in range(1000)]
print("L ->", L[:5], "...", L[-5:])

# (1) each element is double the value of corresponding element in L
A = list(map(lambda n: n + n, L))
print("1 ->", A[:5], "...", A[-5:])

# (2) each element is a squared value of each odd element in L
B = list(map(lambda n: n * n, filter(lambda n: n & 1 == 1, L)))
print("2 ->", B[:5], "...", B[-5:])

def is_prime(n):
    for i in range(2, n//2 + 1):
        if n % i == 0:
            return False
    return True

# (3) all prime numbers from L
C = list(filter(lambda n: n > 1 and is_prime(n), L)) 
print("3 ->", C[:5], "...", C[-5:])

