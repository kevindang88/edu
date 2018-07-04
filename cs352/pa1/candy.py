price = float(input("Enter the price for a pack of candy: "))
amount = int(input("Enter the number of packs you'll buy: "))
tax_rate = float(input("Enter the tax rate: ")) / 100

subtotal = price * amount
tax = subtotal * tax_rate
total = subtotal + tax

print("Subtotal: $%.2f" %subtotal)
print("Tax charged: $%.2f" %tax)
print("Total: $%.2f" %total)
