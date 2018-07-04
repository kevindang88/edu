def sort(L, order1, index1=0, order2=None, index2=1):
    if len(L) <= 1:
        return L
    else:
        L1, L2, L3 = partition(L, [], [], [], L[0], order1, index1)
        if order2 is not None and len(L2) > 1:
            L2 = sort(L2, order2, index2)
        return sort(L1, order1, index1) + L2 + sort(L3, order1, index1)

def partition(L, L1, L2, L3, p, order, i=0):
    if len(L) == 0:
        return L1, L2, L3
    else:
        l1, l2, l3 = order(L[0], p, i)
        L1 += l1
        L2 += l2
        L3 += l3
        return partition(L[1:], L1, L2, L3, p, order, i)

def desc(a, b, i=0):
    if type(a) is list:
        condA = a[i]
        condB = b[i]
    else:
        condA = a
        condB = b
    if condA > condB:
        return [a], [], []
    elif condA == condB:
        return [], [a], []
    else:
        return [], [], [a]

def asc(a, b, i=0):
    if type(a) is list:
        condA = a[i]
        condB = b[i]
    else:
        condA = a
        condB = b
    if condA < condB:
        return [a], [], []
    elif condA == condB: 
        return [], [a], []
    else:
        return [], [], [a]

L = [1, 4, 2, 9, 5]
LL = [["maria", 78], ["ted", 65], ["alex", 70], ["kimmy", 90], ["ben", 81]]
LLL = [["maria", 78], ["ted", 65], ["alex", 70], ["kimmy", 90], ["ben", 81],
        ["ken", 78], ["john", 70]]

print(sort(L, desc))
print(sort(LL, asc))
print(sort(LLL, desc, 1, asc, 0))

############################################################

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

############################################################

'''Part 1: Generic (high-order) sort output:
[9, 5, 4, 2, 1]
[['alex', 70], ['ben', 81], ['kimmy', 90], ['maria', 78], ['ted', 65]]
[['kimmy', 90], ['ben', 81], ['ken', 78], ['maria', 78], ['alex', 70], ['john', 70], ['ted', 65]]
'''

'''Part 2: ACC_Some output:
L -> [3, 1, 4, 1]
COUNT_ODD -> 3
SUM_ODD -> 5
L -> ['A', 1, 2, 'B', 3]
COUNT_NUM -> 3
SUM_NUM -> 6
'''
