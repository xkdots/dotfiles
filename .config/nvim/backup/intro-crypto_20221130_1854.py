import random

m = 0b00000111110111111100
k = 0b11010101010101010101

c = m ^ k

print("xor in")
print(format(m,"020b"))
print(format(k,"020b"))
print(format(c,"020b"))

d = c ^ k

print("xor out")
print(format(c,"020b"))
print(format(k,"020b"))
print(format(d,"020b"))

print("\n")

print("random")
size = 10000
s = random.randint(0, 2**size - 1)
# print(s)
print(format(s,"b"))

m = random.randint(0, 2**size - 1)
k = random.randint(0, 2**size - 1)

c = m ^ k

print(format(k,"b"))


guess = 0
for i in bits(k):
    guess = i
    if c ^ guess == m:
        print "found you!"
        print guess
    else:
        guess += 1




