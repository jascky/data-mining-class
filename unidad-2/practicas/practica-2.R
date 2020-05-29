getwd()
setwd("/Users/jasc/Documents/9no/data-mining-class/unidad-2/practicas")
getwd()

# Importing the dataset
dataset <- read.csv('houses.csv')

# Encoding categorical data 
dataset$City_type = factor(dataset$City_type,
                       levels = c('CAT A', 'CAT B', 'CAT C'),
                       labels = c(1,2,3))

dataset
# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Price_house, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
regressor = lm(formula = Price_house ~ .,
               data = training_set )

summary(regressor)

# Prediction the Test set results
y_pred = predict(regressor, newdata = test_set)
y_pred

# Assigment: visualize the siple liner regression model with R.D.Spend 
# Market_dist,Hospital_dist,Carpet_area
# Building the optimal model using Backward Elimination
regressor = lm(formula = Price_house ~ Market_dist + Hospital_dist + Carpet_area + City_type,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ Market_dist + Hospital_dist + Carpet_area,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ Market_dist + Hospital_dist,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ Market_dist+ Carpet_area,
               data = dataset )
summary(regressor)

y_pred = predict(regressor, newdata = test_set)
y_pred


# Homework analise the follow atomation backwardElimination function 
backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Price_house ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05
#dataset = dataset[, c(1,2,3,4,5)]
training_set
backwardElimination(training_set, SL)
