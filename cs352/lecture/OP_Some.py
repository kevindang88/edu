def OP_Some(L, test, f):
    if len(L) == 0:
        return []
    elif test(L[0]):
        return [f(L[0])] + OP_Some(L[1:], test, f)
    else:
        return OP_Some(L[1:], test, f)

def OP_Some2(L, test, f):
    if len(L) == 0:
        return []
    elif test(L[0]):
        return [f(L[0])] + OP_Some2(L[1:], test, f)
    else:
        return [L[0]] + OP_Some2(L[1:], test, f)

L = [3, 5, 4, 7]

print(L)

print(OP_Some(L, lambda n: n & 1 == 1, lambda n: n * n))
print(OP_Some2(L, lambda n: n & 1 == 1, lambda n: n * n))


