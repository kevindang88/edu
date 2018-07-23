# CS 460 - Simplified AES

SBOX = [
        '1001','0100','1010','1011',
        '1101','0001','1000','0101',
        '0110','0010','0000','0011',
        '1100','1110','1111','0111'
        ]

RC_J = ['10000000', '00110000'] # given

MULT4 = [
        '0000', '0100', '1000', '1100',
        '0011', '0111', '1011', '1111',
        '0110', '0010', '1110', '1010',
        '0101', '0001', '1101', '1001'
        ] # multiplication by 4 according to GF(16)

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

# generate subkeys K0, K1, K2 from a given key
def generateSubkeys(key):
    K0 = key
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
    return keys

# nibble substitution (s-boxes), assuming c is 16 bits
def substitute(c):
    return sbox(c[:4]) + sbox(c[4:8]) + sbox(c[8:-4]) + sbox(c[-4:]) 

# swap 2nd nibble and 4th nibble, assuming c is 16 bits
def shiftRows(c):
    return c[:4] + c[-4:] + c[8:-4] + c[4:8]

# apply matrix multiplication using the constant matrix
def mixColumns(s):
    s_00 = s[:4]
    s_10 = s[4:8]
    s_01 = s[8:-4]
    s_11 = s[-4:]
    s_00p = xor(s_00, MULT4[int(s_10, 2)]) 
    s_10p = xor(MULT4[int(s_00, 2)] , s_10)
    s_01p = xor(s_01, MULT4[int(s_11, 2)])
    s_11p = xor(MULT4[int(s_01, 2)], s_11)
    return s_00p + s_10p + s_01p + s_11p

# program begins here
def main():
    # hard-code test values:
    # plaintext = '1101011100101000'
    # key = '0100101011110101'
    plaintext = input("Enter 16-bit plaintext: ")
    key = input("Enter 16-bit key: ")

    # Generate subkeys
    K0, K1, K2 = generateSubkeys(key)

    # Encryption: Round 0
    cipher = xor(plaintext, K0) # add Round 0 key

    # Round 1
    cipher = substitute(cipher)
    cipher = shiftRows(cipher)
    cipher = mixColumns(cipher)
    cipher = xor(cipher, K1) # add Round 1 Key

    # Final Round
    cipher = substitute(cipher)
    cipher = shiftRows(cipher) 
    ciphertext = xor(cipher, K2) # add Round 2 key
    print("ciphertext:", "".join(ciphertext))

main()

