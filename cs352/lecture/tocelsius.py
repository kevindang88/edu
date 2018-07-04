def toCelsius(degree):
    "function to convert degree from F to C"
    c = 5 * (degree - 32) / 9
    return c

n = float(input("Enter a degree in F "))
print(n, " = ", toCelsius(n))
