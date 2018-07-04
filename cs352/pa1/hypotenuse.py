import math

leg1 = float(input("Enter the length of the first leg: "))
leg2 = float(input("Enter the length of the second leg: "))
hypotenuse = math.hypot(leg1, leg2)

print("Length of hypotenuse:", hypotenuse)
