def reverse(s):
    if len(s) < 2:
        return s
    else:
        return reverse(s[1:]) + s[0]

print(reverse("abc"))
print(reverse("hello, world!"))
