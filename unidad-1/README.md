# Data mining - Unit 1
### Practices


  - [Practice 1 - Law Of Large Numbers](#practice-1---law-of-large-numbers)
  - [R functions](#r-functions)
  - [Practice 3 - Revenue analysis](#practice-3-revenue-analysis)
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

## Practice 3 - Revenue analysis
# x - profit for each mounth 
# x - profit after tax for each month (the tax rate is 30%)
# x- profit margin for each month - equal to profit after tax divided by revenue
# x- good months - where the profit after tax was greater than the mean for the year
# x- bad months - where the profit after tax was less then the mean for years
# x- the best month - where the profit after tax was max for the year
# x- the worst month - where the profit after tax was min for the year

# All results need to be presented as vectors.

# Results for dollar values need to be calculate with $0.01 precision, but need to be
# presented in Units of $1,000(i.e. 1k) with no decimal point.


These vectors contain a sample of data and will be the data were are analising
```R
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
```


To calculate the profit of each months we take the difference between revenue over expenses
```R
profit <- revenue - expenses
profit
```
Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
```r
tax <- round(0.30 * profit, 2)
tax 
```
x - profit after tax for each month (the tax rate is 30%)
```r
profitAfterTax <- profit + tax
profitAfterTax
```
x- profit margin for each month - equal to profit after tax divided by revenue
```r
profitMargin <- round( profitAfterTax / revenue, 2) * 100
profitMargin
```
Year average
```r
yearAvg <- mean(profitAfterTax)
yearAvg
```
Good months
To obtain the good months we are applying a filter function passing a condition that will be aplied to each month in wich if a month is higher than the average it's going to be considered a good month
```r
aboveAvg <- function(el) 
    { 
        el[ ifelse(el>=yearAvg, TRUE,FALSE)]
    }
goodMonths <- Filter( avobeAvg, profitAfterTax)
goodMonths
```

bad months
same as good months
```r
belowAvg <- function(el) 
    { 
        el[ ifelse(el<=yearAvg, TRUE,FALSE)]
    }
badMonths <- Filter( belowAvg, profitAfterTax)
badMonths
```
Best month
```r
bestMonth <- max(profitAfterTax)
bestMonth
```

Worst month
```r
worstMonth <- min(profitAfterTax)
worstMonth
```
Convert All Calculations To Units Of One Thousand Dollars
```r
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0)
profitAfterTax.1000 <- round(profitAfterTax / 1000, 0)
```
Print Results
```r
revenue.1000
expenses.1000
profit.1000
profitAfterTax.1000
profitMargin
goodMonths
badMonths
bestMonth
worstMonth
```