# Functions

# Practice find 20 more functions in R and make an example of it.

set.seed(123)

# reverses the elements of X
rev(x)

# returns a vector of the same length than x with the elements of x which are in y (NA otherwise)
match(x, y)

# number of characters
char(x)

# maximum of the elements of x
max(x)

# minimum of the elements of x
min(x)

# id. thenc(min(x), max(x))
range(x)

# sum of the elements of x
sum(x)

# lagged and iterated differences of vector x
diff(x)

# product of the elements of x
prod(x)

# mean of the elements of x
mean(x)

# median of the elements of x
median(x)

# id. for the maximum
pmax(x,y,...)

# a vector whichith element is the sum fromx[1]tox[i]
cumsum(x)

# id. for the product
cumprod(x)

# id. for the minimum
cummin(x)

# id. for the maximum
cummax(x)

# plot of the values ofx(on they-axis) ordered on thex-axis
plot(x)

# bivariate plot ofx(on thex-axis) andy(on they-axis)
plot(x, y)

# histogram of the frequencies ofx
hist(x)

# draws a line of slopeb and intercept a
abline(a,b)

# draws a horizontal line at ordinate y
abline(h=y)

# draws a vertical line at abcissa x
abline(v=x)