import math

count = 0

def bsqrt(x, epsilon = 0.000000001):
    global count
    guess = x / 2
    cond = True
    while cond:
        count += 1
        r = x / guess
        guess2 = (guess + r) / 2
        cond = abs(guess - guess2) > epsilon
        guess = guess2
    return guess

def main():
    x = float(input("Enter x? "))
    print(math.sqrt(x))
    print(bsqrt(x, 50))

main()
