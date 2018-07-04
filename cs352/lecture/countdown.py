def countdown(n):
    if n == 0:
        print("Blastoff!!!")
    else:
        #print(n)
        countdown(n - 1)
        print(n)

countdown(100)

