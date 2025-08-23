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



#vectors
#vecrors have 6 data types
#numeric, integer, logical/boolean, character/string, vector, matrix, array, list, data-fram
#1-Dimensional Structure: In R, a vector is essentially a 1-dimensional array. An array in other languages can be multi-dimensional (2D, 3D, etc.).
#Homogeneous Elements: A vector in R can only contain elements of the same type (e.g., all numbers, or all characters).
#In contrast, arrays in some languages like Python or JavaScript can store elements of different types (like a mix of numbers and strings).
numbers <- c(1,2,3,4,5)
sum(numbers) #to find the sum of the lememnts inside an vector
mean(numbers) # to find the avg of the numbers

vec1 <- c(1, 2, 3)
vec2 <- c(1.5,7.4,10.02)
vec3 <- c(TRUE,FALSE,FALSE)
vec4<-c(1+2i,75+123654i,0+1i)
vec5<-c("kratos","bruce","tyler","hp,","lenovo" )
print(length(vec1))

cat(vec4)
cat(vec3)
cat(vec2)
cat(vec1)
cat(vec5[2])
cat(vec3[1])

cat(sum(vec1,vec2,vec3,vec4))
cat(mean(vec1))

df <- data.frame(name = c("elden ring", "sekiro", "dmc"), price = c(200,300,400))
print(df)


arr1 <- array(1:10 , dim = c(10))
print(arr1)

arr2<- array(1:-9 , dim= c(3,3))
print(arr2)

arr3 <- array(1:100 ,dim =c(5,5,4))


func <- function(x) {
  return(x * 10)
}
print(func(arr1))



#Why Use $?
#Column Access: When you use $, you're accessing a specific column by its name, which is much more readable than using numeric indices. For example, df$a is easier to understand than df[, 1].
#Modify Columns: You can modify or assign new values to a specific column with $. For example, df$a <- new_values would update column "a" in the data frame df.

# Creating a data frame
df <- data.frame(a = c(1, 2, 3), b = c(4, 5, 6))

# Accessing the 'a' column
df$a
# Output: [1] 1 2 3

# Modifying the 'a' column by multiplying each element by 2
df$a <- df$a * 2
# df now looks like this:
#   a b
# 1 2 4
# 2 4 5
# 3 6 6
