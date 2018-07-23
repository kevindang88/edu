from collections import deque # needed for rotate() function
P10 = [3, 5, 2, 7, 4, 10, 1, 9, 8, 6]
P8 = [6, 3, 7, 4, 8, 5, 10, 9]

# example plaintext and key
plaintext = "01110010"
key = "1010000010"

# permutate with p10
def p10(key):
    s = deque([None] * len(P10))
    for i in range(0, 10):
        s[i] = key[P10[i] - 1]
    return list(s) 

# split into left and right halves
def split(p_key): 
    halfway = len(p_key) // 2
    return p_key[:halfway], p_key[halfway:]
 
# shift left i times
def shift_left(p_key, i):
    s = deque(p_key)
    s.rotate(-i)
    return list(s)
   
# permutate with p8
def p8(p_key):
    s = [None] * len(P8)
    for i in range(0, 8):
        s[i] = p_key[P8[i] - 1] 
    return s

############################################################

print("key:\n", key)

p10_result = p10(key)
print("after P10: \n", p10_result)

left, right = split(p10_result)
print("left and right halves: \n", left, right)

l1 = shift_left(left, 1)
r1 = shift_left(right, 1)
print("left and right after shift 1: \n", l1, r1)

K1 = p8(l1 + r1)
print("K1: \n", K1)

l2 = shift_left(left, 2)
r2 = shift_left(right, 2)
K2 = p8(l2 + r2)
print("K2: \n", K2)
