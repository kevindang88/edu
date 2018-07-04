from functools import reduce
file = open("bible.txt", "r", encoding="utf-8")

words = file.read().split()
#text = file.read()

#J = text.count("Jesus")
#print(J)
#G = text.count("God")
#print(G)

J = list(filter(lambda w: w.lower() == "jesus", words))
#J = list(map(lambda w: w if w == "Jesus", words))

print(len(J))

#G = list(filter(lambda w: w == "God", words))



# extra stuff
words = "hello world one two three one".split()

#replacements = (',', '.')
#s = reduce(lambda s, sep: s.replace(sep, ' '), replacements, words)
#print(s)

def condx(e, c):
    return 1 if e.lower() == c.lower() else 0

sum = reduce(lambda x, y: x + condx(y, "one"), words, 0)

print(sum)
