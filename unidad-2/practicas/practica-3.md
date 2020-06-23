## Practice 3
### Backward Elimination
When building a machine learning model, it is very important that we select only those features or predictors which are necessary.
There are various ways in which you can find out which features have very little impact on the model and which ones you can remove from your dataset. 
Backward Elimination is a technique that will help us with this task.
```R
# SL will be our significance level or also know as P-value in most cases, a 5% significance level is used
SL = 0.05

# receives as arguments the data set and significance level
backwardElimination <- function(x, sl) {
  # assigns the length of the dataset
  numVars = length(x)
  # an loop that wil itarate from 1 to the size of the dataset
  for (i in c(1:numVars)){
    # We use the formula notation to specify that Profit will be the dependent variable and that all other columns are independent.
    regressor = lm(formula = Profit ~ ., data = x)
    # from the regression we obtain the highest coefficients when Pr is greater than t
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
       # find the coefficient that was found previously
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}
training_set
backwardElimination(training_set, SL)
```