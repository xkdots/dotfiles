from random import randrange

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

print("random")
size = 100
print(randrange(size))
print(format(random(),"020b"))
