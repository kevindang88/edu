from random import randint

# generate one thousand random temperatures in Fahrenheit
T_F = [randint(-100, 200) for i in range(1000)]

# write list of random temperatures to file
file = open("temps_f.txt", "w")
for t in T_F:
    file.write(str(t) + "\n")

# read from file containing temperatures
file = open("temps_f.txt", "r")
T_F = []
line = file.readline()
while line:
    T_F += [float(line)]
    line = file.readline()

# convert all temperatures to Celsius
T_C = list(map(lambda f: 5 * (f - 32) / 9, T_F))

# write all temperatures to another file
file = open("temps_c.txt", "w")
for t in T_C:
    file.write(str(t) + "\n")

file.close()


