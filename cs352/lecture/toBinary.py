def toString(n):
    if n == 0:
        return
    else:
        toString(n // 2)
        print(n % 2, end="")

def toBinary(n):
    if n == 0:
        print(n)
        return
    else:
        toString(n)
        print()

def toBinaryStr(n):
    if n == 0:
        return ""
    else:
        return toBinaryStr(n // 2) + str(n % 2)

for n in range(0, 32):
    print(toBinaryStr(n))

def toBin(n, ib):
    print(">", n, ib)
    if n < 2: #base 2
        ib = ib * 10 + n
    else:
        ib = ib * 10 + (n % 2)
        toBin(n // 2, ib)

def toBinaryTail(n):
    ib = 0
    toBin(n, ib)
    return str(ib)
