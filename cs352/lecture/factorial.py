def nrfact(n):
    if n == 0:
        return 1
    else:
        p = 1
        for i in range(n):
            p *= i + 1
        return p

def fact(n):
    if n == 0 or n == 1:
        return 1
    else:
        return n * fact(n - 1)

for n in range(0, 1000, 1):
    print(fact(n))
