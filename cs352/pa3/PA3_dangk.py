def quicksort(L):
    if len(L) <= 1:
        return L
    else:
        L1, L2, L3 = partition(L, [], [], [], L[0])
        return quicksort(L1) + L2 + quicksort(L3) 
        
def partition(L, L1, L2, L3, p):
    if len(L) == 0:
        return L1, L2, L3
    elif L[0] < p:
        L1 += [L[0]]
    elif L[0] == p:
        L2 += [L[0]]
    else:
        L3 += [L[0]]
    return partition(L[1:], L1, L2, L3, p)

L = [50, 25, 67, 38, 19, 50, 38, 73, 22, 25, 50]

print(quicksort(L))

############################################################

def sumSq(L, sum=0):
    if len(L) == 0:
        return sum
    else:
        sum += L[0] * L[0]
        return sumSq(L[1:len(L)], sum)

L = [1, 5, 2, 4, 9]

print(sumSq(L))

############################################################

def reverse(s, r=""):
    if len(s) <= 1:
        return r + s 
    else:
        return reverse(s[:-1], r + s[-1])

s1 = "abc"
s2 = "hello, looking backwards!"

print(reverse(s1))
print(reverse(s2))

############################################################

'''quicksort output:
[19, 22, 25, 25, 38, 38, 50, 50, 50, 67, 73]
'''

'''sumSq output:
127
'''

'''reverse output:
cba
!sdrawkcab gnikool ,olleh
'''
