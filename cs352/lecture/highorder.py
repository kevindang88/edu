import math

def func(op, a, b):
    print(op(a, b))

def add(a, b):
    return a + b

def mul(a, b):
    return a * b
"""
func(add, 1, 2)
func(mul, 1, 2)
func(mul, "Hello", 2)
"""

def convert(func, seq):
    "convert seq. of numbers to same type"
    return [func(eachNum) for eachNum in seq]

myseq = (123, 45.67, -6.2e-1, 50)
'''
print(convert(int, myseq))
print(convert(float, myseq))
print(convert(abs, myseq))
'''

def isSym(x, f):
    if (f(x) == f(-x)):
        return True
    else:
        return False

def square(n):
    return (n*n)

def cube(n):
    return (n*n*n)

print(isSym(2, square))
print(isSym(2, cube))
