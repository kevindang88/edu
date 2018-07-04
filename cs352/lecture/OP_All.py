def OP_All(L, f):
    if len(L) == 0:
        return []
    else:
        return [f(L[0])] + OP_All(L[1:], f)

L = [-40, 32, 98.6, 212]

# print(OP_All([3, 1, 4, 1], lambda n: n * n))
# print(OP_All([3, 1, 4, 1], lambda n: n + 1))

# Temperature conversion: F to C
print(OP_All(L, lambda f: 5 * (f - 32) / 9))
