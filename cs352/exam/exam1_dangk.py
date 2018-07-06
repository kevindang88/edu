# Kevin Dang

# Problem 1(a)
def sumNCubes(n):
    return sumNCubes_helper(n, 0)

def sumNCubes_helper(n, sum):
    if n <= 1:
        return sum
    else:
        return sumNCubes_helper(n-1, sum + (n * n * n)) 

print(sumNCubes(3))
print(sumNCubes(5))

''' Problem 1(a) output:
35
224
'''

# Problem 1(b)
from random import randint
from functools import reduce
def sumNRand(n, m):
    L = [randint(1,m) for i in range(n)] 
    print(L) # print list to verify
    return reduce(lambda x, y: x + y, L) 

print(sumNRand(3,10))
print(sumNRand(5,100))

''' Problem 1(b) output:
[6, 3, 4]
13
[88, 95, 83, 2, 46]
314
'''

# Problem 2
E = ["Zero", "One", "Two", "Three", "Four", 
        "Five", "Six", "Seven", "Eight", "Nine"]
def digits(n):
    return digits_helper(n, "")
    
def digits_helper(n, s):
    if n // 10 == 0:
        return E[n % 10] + " " + s 
    else:
        return digits_helper(n // 10, E[n % 10] + " " + s)

print(digits(7))
print(digits(153))
print(digits(8256))

''' Problem 2 output:
Seven 
One Five Three 
Eight Two Five Six 
'''

# Problem 3
def power(x, n):
    return power_helper(x, n, 1)

def power_helper(x, n, r):
    if n <= 0:
        return r
    else:
        return power_helper(x, n-1, r * x) 

print(power(2, 4))
print(power(5, 3))

''' Problem 3 output:
16
125
'''

# Problem 4
L = [10, 19, 20, 43, 25, 30, 31, 71, 42, 17, 15]
# Problem 4(a)
print(list(map(lambda x: x * 2, L)))
# Problem 4(b)
print(list(map(lambda x: x * 2, filter(lambda x: x % 2 != 0, L))))

''' Problem 4 output:
[20, 38, 40, 86, 50, 60, 62, 142, 84, 34, 30]
[38, 86, 50, 62, 142, 34, 30]
'''

# Problem 5
def insertionSort(alist, order):
    for index in range(1, len(alist)):
        currentvalue = alist[index]
        position = index
        while position > 0 and order(alist[position-1], currentvalue) > 0:

            alist[position]=alist[position-1]
            position = position-1
        alist[position] = currentvalue
    return alist

def desc(a, b):
    if a > b:
        return -1 
    elif a == b:
        return 0
    else:
        return 1

def asc_num(a, b):
    if a[1] < b[1]:
        return -1
    elif a[1] == b[1]:
        return 0
    else:
        return 1

L = [54, 26, 93, 17, 77, 31, 44, 55, 20]
print(insertionSort(L, desc))
L = [["candy", 54], ["choc", 26], ["drinks", 93], ["cake", 17], ["bagel", 77], 
        ["ice-cream", 31], ["beer", 44], ["fruits", 55], ["fries", 20]]
print(insertionSort(L, asc_num))

''' Problem 5 output:
[93, 77, 55, 54, 44, 31, 26, 20, 17]
[['cake', 17], ['fries', 20], ['choc', 26], ['ice-cream', 31], ['beer', 44], ['candy', 54], ['fruits', 55], ['bagel', 77], ['drinks', 93]]
'''
