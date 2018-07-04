def quad(a, b, c):
    if a == 0:
        return -b / c, -b / c
    else:
        det = = b * b - 4 * a * c
            return "no root/imaginary"
        else:
            return (-b + det ** 0.5) / (2 * a), (-b - det ** 0.5) / (2 * a)

a = 1
b = 3
c = -4

quad(a, b, c)
