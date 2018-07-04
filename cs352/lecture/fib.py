# recursive
def fib(n):
    if n < 2:
        return n
    else:
        return fib(n - 1) + fib(n - 2)

# my iterative attempt
def ifib(n):
    if n < 2:
        return n
    else:
        a = 1
        b = 1
        f = 0
        for i in range(2,n):
            f = a + b
            a = b
            b = f
        return f

# iterative
def fib2(n):
    a, b = 0, 1
    while n > 0:
        a, b = b, a + b
        n -= 1
    return a

# one-liner
def fib3(n): return n if n < 2 else fib(n - 1) + fib(n - 2)

# tail-recursive with helper function
def fib_tr(n):
    def fib_help(a, b, n):
        return fib_help(b, a + b, n - 1) if n > 0 else a
    return fib_help(0, 1, n)

fib_tr(5)

for n in range(20):
    print(fib(n), end=" ")
print()
