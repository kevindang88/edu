def ACC_SOME(L, test, base_val, fn, acc_op):
    if len(L) == 0:
        return base_val
    elif test(L[0]):
        return acc_op(fn(L[0]), ACC_SOME(L[1:], test, base_val, fn, acc_op))
    else:
        return ACC_SOME(L[1:len(L)], test, base_val, fn, acc_op)

L = [3, 1, 4, 1]

is_odd = lambda n: n & 1 == 1
add = lambda a, b: a + b
is_num = lambda n: type(n) is int or type(n) is float

print("L ->", L)
print("COUNT_ODD ->", ACC_SOME(L, is_odd, 0, lambda n: 1, add))
print("SUM_ODD ->", ACC_SOME(L, is_odd, 0, lambda n: n, add))

L = ['A', 1, 2, 'B', 3]
print("L ->", L)
print("COUNT_NUM ->", ACC_SOME(L, is_num, 0, lambda n: 1, add)) 
print("SUM_NUM ->", ACC_SOME(L, is_num, 0, lambda n: n, add))

'''
L -> [3, 1, 4, 1]
COUNT_ODD -> 3
SUM_ODD -> 5
L -> ['A', 1, 2, 'B', 3]
COUNT_NUM -> 3
SUM_NUM -> 6
'''
