from collections import deque # for rotate() function in left_shift()

P10 = [3, 5, 2, 7, 4, 10, 1, 9, 8, 6]
P8 = [6, 3, 7, 4, 8, 5, 10, 9]
EP = [4, 1, 2, 3, 2, 3, 4, 1]
IP = [2, 6, 3, 1, 4, 8, 5, 7]
P4 = [2, 4, 3, 1]
IP_inverse = [4, 1, 3, 5, 7, 2, 8, 6]
S0 = [
        ["01", "00", "11", "10"],
        ["11", "10", "01", "00"],
        ["00", "10", "01", "11"],
        ["11", "01", "11", "10"]]
S1 = [
        ["00", "01", "10", "11"],
        ["10", "00", "01", "11"],
        ["11", "00", "01", "00"],
        ["10", "01", "00", "11"]]
ROUNDS = 2

# permutate an input using the specified permutation scheme 
def permutate(permutation_list, p_key): 
    n_bits = len(permutation_list)
    result = [None] * n_bits
    for i in range(0, n_bits):
        result[i] = p_key[permutation_list[i] - 1]
    return result

# split input into left and right halves
def split(s_arg): 
    halfway = len(s_arg) // 2
    return s_arg[:halfway], s_arg[halfway:]
 
# shift left i times
def left_shift(p_key, i):
    s = deque(p_key)
    s.rotate(-i)
    return list(s)

# generate list of subkeys for each round 
def generateSubkeys(key, rounds):
    # P10
    p_key = permutate(P10, key)
    left, right = split(p_key)
    subkeys = [None] * rounds
    # generate subkey from left-shift and P8
    for i in range(0, rounds):
        left = left_shift(left, i + 1)
        right = left_shift(right, i + 1)
        subkeys[i] = permutate(P8, left + right)
    return subkeys 

# use specified S-Box to generate 2-bit output from 4-bit input
def s_box(box, s_input):
    row = int(s_input[0] + s_input[3], 2)
    column = int(s_input[1] + s_input[2], 2)
    return box[row][column]

# perform XOR on operands
def xor(a, b):
    result = ""
    for i in range(len(a)):
        if a[i] == b[i]:
            result += "0"
        else:
            result += "1"
    return result

# apply S-DES function F(P, K)
def func(f_input, subkey):
    left, right = split(f_input) 
    # expand and permutate
    f_right = permutate(EP, right) 
    # xor
    f_right = xor(f_right, subkey)
    r0, r1 = split(f_right)
    # sbox
    s0_output = s_box(S0, r0)
    s1_output = s_box(S1, r1)
    # P4
    p4_result = permutate(P4, s0_output + s1_output)
    # convert list to string for xor
    f_result = xor(left, p4_result) + "".join(right)
    return f_result 

# program starts here
def main():
    # prompt user for plaintext and key
    plaintext = key = ""
    while (len(key) != 10) and (len(plaintext) != 8):
        key = input("Enter 10-bit binary key: ")
        plaintext = input("Enter 8-bit binary plaintext: ")
    # generate subkeys
    subkeys = generateSubkeys(key, ROUNDS)
    # initial permutation (IP)
    f_input = permutate(IP, plaintext)
    for i in range(0, ROUNDS):
        # function F(P, K)
        f_result = func(f_input, subkeys[i])
        # switch
        left, right = split(f_result)
        f_input = right + left
    # IP-inverse
    ciphertext = (permutate(IP_inverse, f_result))
    # convert list to string and then print
    ciphertext = "".join(ciphertext)
    print("ciphertext:", ciphertext)

main()
