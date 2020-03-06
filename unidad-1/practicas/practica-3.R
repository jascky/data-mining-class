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

#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)



# profit for each mounth 
profit <- revenue - expenses
profit

#Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
tax <- round(0.30 * profit, 2)
tax 

# x - profit after tax for each month (the tax rate is 30%)
profitAfterTax <- profit + tax
profitAfterTax

# x- profit margin for each month - equal to profit after tax divided by revenue
profitMargin <- round( profitAfterTax / revenue, 2) * 100
profitMargin

# Year average
yearAvg <- mean(profitAfterTax)
yearAvg

# Good months
aboveAvg <- function(el) 
    { 
        el[ ifelse(el>=yearAvg, TRUE,FALSE)]
    }
goodMonths <- Filter( avobeAvg, profitAfterTax)
goodMonths

# bad months
belowAvg <- function(el) 
    { 
        el[ ifelse(el<=yearAvg, TRUE,FALSE)]
    }
badMonths <- Filter( belowAvg, profitAfterTax)
badMonths

# Best month
bestMonth <- max(profitAfterTax)
bestMonth

# Worst month
worstMonth <- min(profitAfterTax)
worstMonth

#Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0)
profitAfterTax.1000 <- round(profitAfterTax / 1000, 0)

#Print Results
revenue.1000
expenses.1000
profit.1000
profitAfterTax.1000
profitMargin
goodMonths
badMonths
bestMonth
worstMonth
