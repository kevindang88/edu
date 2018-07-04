def reverse(s):
    if len(s) < 2:
        return s
    else:
        return reverse(s[1:]) + s[0]

print(reverse("abc"))
print(reverse("hello, world!"))

############################################################

def pattern(n):
    if n == 0:
        print(0, end=" ")
    else:
        pattern(n - 1)
        print(n, end=" ")
        pattern(n - 1)

for n in range(0, 5):
    pattern(n)
    print()

############################################################

def isPalindrome(s):
    if len(s) < 1:
        return True
    if (s[0] != s[-1]):
        return False;
    else:
        return isPalindrome(s[1:-1])

test_list = ["noon", "civic", "radar", "book", "hello", "word"]

for s in test_list:
    print(s, isPalindrome(s))

############################################################
# OUTPUT
############################################################

'''
$ python reverse.py
cba
!dlrow ,olleh
'''

'''
$ python pattern.py
0
0 1 0
0 1 0 2 0 1 0
0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
0 1 0 2 0 1 0 3 0 1 0 2 0 1 0 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
'''

'''
$ python palindrome.py
noon True
civic True
radar True
book False
hello False
word False
'''
