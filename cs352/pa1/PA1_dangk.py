import math

leg1 = float(input("Enter the length of the first leg: "))
leg2 = float(input("Enter the length of the second leg: "))
hypotenuse = math.hypot(leg1, leg2)

print("Length of hypotenuse:", hypotenuse)

"""
[kevin@kd-laptop cs352]$ python hypotenuse.py
Enter the length of the first leg: 3
Enter the length of the second leg: 4
Length of hypotenuse: 5.0

[kevin@kd-laptop cs352]$ python hypotenuse.py
Enter the length of the first leg: 10
Enter the length of the second leg: 20
Length of hypotenuse: 22.360679774997898
"""

############################################################

price = float(input("Enter the price for a pack of candy: "))
amount = int(input("Enter the number of packs you'll buy: "))
tax_rate = float(input("Enter the tax rate: ")) / 100

subtotal = price * amount
tax = subtotal * tax_rate
total = subtotal + tax

print("Subtotal: $%.2f" %subtotal)
print("Tax charged: $%.2f" %tax)
print("Total: $%.2f" %total)

"""
[kevin@kd-laptop cs352]$ python candy.py
Enter the price for a pack of candy: 5.4
Enter the number of packs you'll buy: 12
Enter the tax rate: 9.5
Subtotal: $64.80
Tax charged: $6.16
Total: $70.96

[kevin@kd-laptop cs352]$ python candy.py
Enter the price for a pack of candy: 5
Enter the number of packs you'll buy: 100
Enter the tax rate: 10
Subtotal: $500.00
Tax charged: $50.00
Total: $550.00
"""
