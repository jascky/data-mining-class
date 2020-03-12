# Data mining - Unit 1
### Practices


  - [Practice 1 - Law Of Large Numbers](#practice-1---law-of-large-numbers)
  - [R functions](#r-functions)
  - [Practice 3 - Revenue analysis](#practice-3-revenue-analysis)
  - [Practice 4 - Revenue analysis](#practice-4-revenue-analysis)
  - [Practice 5 - Filter excercise](#practice-5-filter-excercise)
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

## Practice 4 - Revenue analysis
You have been supplied data for two more additional in-game statistics:
* Free Throws
* Free Throws Attempts

You need to create three plots that portray the following insights:
* Free Throw Attempts per game
* Accurancy of Free Throws
* Player playing style (2 vs 3 points preference) excluding Free Throws

- Each Free Throw is worth 1 point

The data has been supplied in the form of vectors. You will have to create
two matrices before you proceed with the analysis.

```r

#Free Trows
KobeBryant_FT <- c(696,667,623,483,439,483,381,525,18,196)
JoeJohnson_FT <- c(261,235,316,299,220,195,158,132,159,141)
LeBronJames_FT <- c(601,489,549,594,593,503,387,403,439,375)
CarmeloAnthony_FT <- c(573,459,464,371,508,507,295,425,459,189)
DwightHoward_FT <- c(356,390,529,504,483,546,281,355,349,143)
ChrisBosh_FT <- c(474,463,472,504,470,384,229,241,223,179)
ChrisPaul_FT <- c(394,292,332,455,161,337,260,286,295,289)
KevinDurant_FT <- c(209,209,391,452,756,594,431,679,703,146)
DerrickRose_FT <- c(146,146,146,197,259,476,194,0,27,152)
DwayneWade_FT <- c(629,432,354,590,534,494,235,308,189,284)
#Matrix for Free Throws
#Bind the given vectors to form the matrix
FreeThrows <- rbind(KobeBryant_FT, JoeJohnson_FT, LeBronJames_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
#Remove vectors - we don't need them anymore
rm(KobeBryant_FT, JoeJohnson_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, LeBronJames_FT, ChrisPaul_FT, DerrickRose_FT, DwayneWade_FT, KevinDurant_FT)
#Rename the columns
colnames(FreeThrows) <- Seasons
#Rename the rows
rownames(FreeThrows) <- Players

#Check the matrix
FreeThrows

#Free Trows Attempts
KobeBryant_FTA <- c(819,768,742,564,541,583,451,626,21,241)
JoeJohnson_FTA <- c(330,314,379,362,269,243,186,161,195,176)
LeBronJames_FTA <- c(814,701,771,762,773,663,502,535,585,528)
CarmeloAnthony_FTA <- c(709,568,590,468,612,605,367,512,541,237)
DwightHoward_FTA <- c(598,666,897,849,816,916,572,721,638,271)
ChrisBosh_FTA <- c(581,590,559,617,590,471,279,302,272,232)
ChrisPaul_FTA <- c(465,357,390,524,190,384,302,323,345,321)
KevinDurant_FTA <- c(256,256,448,524,840,675,501,750,805,171)
DerrickRose_FTA <- c(205,205,205,250,338,555,239,0,32,187)
DwayneWade_FTA <- c(803,535,467,771,702,652,297,425,258,370)
#Matrix for Free Throw Attempts
#Bind the given vectors to form the matrix
FreeThrowAttempts <- rbind(KobeBryant_FTA, JoeJohnson_FTA, LeBronJames_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, DwayneWade_FTA)
#Remove vectors - we don't need them anymore
rm(KobeBryant_FTA, JoeJohnson_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, LeBronJames_FTA, ChrisPaul_FTA, DerrickRose_FTA, DwayneWade_FTA, KevinDurant_FTA)
#Rename the columns
colnames(FreeThrowAttempts) <- Seasons
#Rename the rows
rownames(FreeThrowAttempts) <- Players

#Check the matrix
FreeThrowAttempts

#Re-create the plotting function
myplot <- function(z, who=1:10) {
  matplot(t(z[who,,drop=F]), type="b", pch=15:18, col=c(1:4,6), main="Basketball Players Analysis")
  legend("bottomleft", inset=0.01, legend=Players[who], col=c(1:4,6), pch=15:18, horiz=F)
}

#Visualize the new matrices
myplot(FreeThrows)
myplot(FreeThrowAttempts)

#Part 1 - Free Throw Attempts Per Game 
#(You will need the Games matrix)
myplot(FreeThrowAttempts/Games)
#Notice how Chris Paul gets fewer attempts per game

#Part 2 - Free Throw Accuracy
myplot(FreeThrows/FreeThrowAttempts)
#And yet Chris Paul's accuracy is one of the highest
#Chances are his team would get more points if he had more FTA's
#Also notice that Dwight Howard's FT Accuracy is extremely poor
#compared to other players. If you recall, Dwight Howard's
#Field Goal Accuracy was exceptional:
myplot(FieldGoals/FieldGoalAttempts)
#How could this be? Why is there such a drastic difference?
#We will see just now...
```

## Practice 5 - Filter excercise

Filter countries by Low income
```r
stats[stats$Income.Group == "Low income", "Country.Name", drop=F]
```
Filter countries by Lower middle income
```r
stats[stats$Income.Group == "Lower middle income", "Country.Name", drop=F]
```
Filter countries by Upper middle income
```r
stats[stats$Income.Group == "Upper middle income", "Country.Name", drop=F]
```
Filter by countrie Malta
```r
stats[stats$Country.Name == "Malta",]
```
Filter by countrie Qatar
```r
stats[stats$Country.Name == "Qatar",]
```
Filter by countrie Netherlands
```r
stats[stats$Country.Name == "Netherlands",]
```
Filter by countrie Norway
```r
stats[stats$Country.Name == "Norway",]
```