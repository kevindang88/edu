# CS 460 - Diffie-Hellman Key Distribution Lab
from random import randint

# get prime number p and base value b from user
def getPrimeAndBase():
    p, b = input("Enter a prime number (p) and a base value (b): ").split()
    return int(p), int(b)

# generate secret (random) number in range 0 to 99 
def secretNumber():
    return randint(0, 100)

# compute value to be exchanged
def compose(x, p, b):
    return (b ** x) % 23

# compute secret value from exchanged value
def decompose(X, x, p):
    return (X ** x) % p 

# program starts here
def main():
    p, b = getPrimeAndBase()
    x = secretNumber()
    y = secretNumber()
    X = compose(x, p, b)
    Y = compose(y, p, b)
    s_b = decompose(Y, x, p)
    s_a = decompose(X, y, p)
    print("s_b: ", s_b, "s_a: ", s_a)
    
main()
