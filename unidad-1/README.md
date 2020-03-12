# Data mining - Unit 1
### Practices


  - [Practice 1 - Law Of Large Numbers](#practice-1---law-of-large-numbers)
  - [R functions](#r-functions)

## Practice 1 - Law Of Large Numbers
The objective of this exersice is to practice the fundamentals of R langage. 
The pratice consists of creating an R script that will count how many N random normally distributed numbers with mean = 0, stdev=1 fall between -1 and 1 and divide.
```R
size <- 100
mean <- 0
stdev <- 1
# 2. Initialize counter
count <- 0
# 3. loop for(i in rnorm(size))
for(i in rnorm(size, mean, stdev)) {
    if (i < 1 && i > -1) {
        count <- count + 1
    }
}
result <- count / size
print(result)
```
## R functions
The objective of this exercise is to find and use 20 R native functions.
**Functions**

seed
```R
set.seed(123)
```
reverses the elements of X
```r
rev(x)
```
returns a vector of the same length than x with the elements of x which are in y (NA otherwise)
```R
match(x, y)
```
number of characters
```R
char(x)
```

maximum of the elements of x
```R
max(x)
```
minimum of the elements of x
```R
min(x)
```

```R
id. thenc(min(x), max(x))
```
Range
```R
range(x)
```
sum of the elements of x
```R
sum(x)
```
lagged and iterated differences of vector x
```R
diff(x)
```
product of the elements of x
```R
prod(x)
```

mean of the elements of x
```R
mean(x)
```
median of the elements of x
```R
median(x)
```

id. for the maximum
```R
pmax(x,y,...)
```
a vector whichith element is the sum fromx[1]tox[i]
```R
cumsum(x)
```
id. for the product
```R
cumprod(x)
```
id. for the minimum
```R
cummin(x)
```
id. for the maximum
```
cummax(x)
```
plot of the values ofx(on they-axis) ordered on thex-axis
```R
plot(x)
```

bivariate plot ofx(on thex-axis) andy(on they-axis)
```R
plot(x, y)
```

histogram of the frequencies ofx
```R
hist(x)
```
draws a line of slopeb and intercept a
```R
abline(a,b)
```
draws a horizontal line at ordinate y
```R
abline(h=y)
```
draws a vertical line at abcissa x
```R
abline(v=x)
```