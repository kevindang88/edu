SBOX = [
        '1001','0100','1010','1011',
        '1101','0001','1000','0101',
        '0110','0010','0000','0011',
        '1100','1110','1111','0111'
        ]

RC_J = ['10000000', '00110000'] # given

# perform bitwise XOR on the two specified operands
def xor(a, b):
    size = len(a)
    r = [None] * size
    for i in range(size):
        r[i] = '1' if a[i] != b[i] else '0'
    return r

# perform S-Box lookup and return corresponding value
def sbox(s):
    s = "".join(s) # convert list to string
    return SBOX[int(s, 2)]

# perform g function on specified word value and round number
def g_func(w, r):
    half = len(w) // 2
    # split word into two nibble-sized halves
    b0 = w[:half]
    b1 = w[-half:]
    # s-box
    b0 = sbox(b0)
    b1 = sbox(b1)
    w = b1 + b0 # implicit swap
    # xor with current round's RC value
    w = xor(w, RC_J[r - 1])
    return w

# program begins here
def main():
    # test key: 0100 1010 1111 0101
    K0 = input("Enter the 16-bit key:")
    half = len(K0) // 2
    w0 = K0[:half]
    w1 = K0[-half:]
    w2 = xor(w0, g_func(w1, 1))
    w3 = xor(w2, w1)
    w4 = xor(w2, g_func(w3, 2))
    w5 = xor(w4, w3)
    K1 = (w2 + w3)
    K2 = (w4 + w5)
    keys = [K0, K1, K2]
    words = [w0, w1, w2, w3, w4, w5]
    for i in range(len(keys)):
        print("K{:d}:".format(i))
        print("".join(keys[i]))
    for i in range(len(words)):
        print("w{:d}:".format(i))
        print("".join(words[i]))

main()

