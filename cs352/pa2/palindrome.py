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
