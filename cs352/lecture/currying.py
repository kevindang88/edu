def partial(op, value):
    return lambda x: op(x, value)

def add(a, b):
    return a + b

def mul(a, b):
    return a * b

add5 = partial(add, 5)
mul10 = partial(mul, 10)
print(add5(3))
print(mul10(85))
