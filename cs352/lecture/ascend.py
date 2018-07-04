def isAscending(list):
    print(list)
    prev = list[0]
    i = 1
    while i < len(list):
        if list[i] < prev:
            return False
        prev = list[i]
        i+=1
    return True

list = [1, 2, 3, 4, 5]
print(isAscending(list))
list = [5, 4, 3, 2, 1]
print(isAscending(list))
list = [1, 2, 3, 4, 3]
print(isAscending(list))
list = [2, 3, 3, 5, 6, 6, 9]
print(isAscending(list))


