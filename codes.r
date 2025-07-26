#Arthimetic operations

a<- 120
b<-203
print(a ^ b)
print(a + b)
print(a - b)
print(a * b)
print(a / b)
print(a %% b)
print(a %/% b)

#Binary operations
a <- 5  # Binary: 0101
b <- 3  # Binary: 0011

bitwAnd(a, b)   # 0101 & 0011 = 0001 → 1
bitwOr(a, b)    # 0101 | 0011 = 0111 → 7
bitwXor(a, b)   # 0101 ^ 0011 = 0110 → 6
bitwNot(a)      # ~0101 = -6 (in two's complement)
bitwShiftL(a, 1) # 0101 << 1 = 1010 → 10
bitwShiftR(a, 1) # 0101 >> 1 = 0010 → 2
