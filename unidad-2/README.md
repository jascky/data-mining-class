# Data mining - Unit 2
### Practices

  - [Practice 1 - Simple Linear Regression](#practice-1---simple-linear-regression)
  - [Practice 2 - Multiple Linear Regression](#practice-2---multiple-linear-regression)
  - [Practice 3 - Backward eliminaiton](#practice-3---backward-eliminaiton)
  - [Practice 4 - Logistic regression](#practice-4---logistic-regression)
  - [Practice 5 -  Supprt Vector Machine](#practice-5---supprt-vector-machine)
  - [Practice 6 -  Desicion tree](#practice-6---desicion-tree)

## Practice 1 - Simple Linear Regression		
Simple linear regression is useful for finding relationship between two continuous variables. One is predictor or independent variable and other is response or dependent variable.
In this exercise we are using a student scores dataset containing their scores in the SAT examen and comparing it with their gpa so whe con find the corealation between these tow.

Splitting the dataset into the Training set and Test set
```R
set.seed(123)
split <- sample.split(dataset$Gpa, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

Fitting Simple Linear Regression to the Training set
```R
regressor = lm(formula = Gpa ~ Sat,
               data = dataset)
summary(regressor)
```

Predicting the Test set results
```R
y_pred = predict(regressor, newdata = test_set)
```

## Practice 2 -  Multiple Linear Regression	
Multiple linear regression (MLR), also known simply as multiple regression, is a statistical technique that uses several explanatory variables to predict the outcome of a response variable. The goal of multiple linear regression (MLR) is to model the linear relationship between the explanatory (independent) variables and response (dependent) variable.

We'll start spliting our data set in a 80 - 20 split ratio for out training and test sets.
```R
split <- sample.split(dataset$Price_house, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```
Fitting Multiple Linear Regression to the Training set and setting the prediction to the test set results
```R
regressor = lm(formula = Price_house ~ .,
               data = training_set )

summary(regressor)


y_pred = predict(regressor, newdata = test_set)
y_pred

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
```

## Practice 3 -  Backward eliminaiton
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

## Practice 4 - Logistic regression
In statistics, the logistic model (or logit model) is used to model the probability of a certain class or event existing such as pass/fail, win/lose, alive/dead or healthy/sick. This can be extended to model several classes of events such as determining whether an image contains a cat, dog, lion, etc. Each object being detected in the image would be assigned a probability between 0 and 1 and the sum adding to one.

Splitting the dataset into the Training set and Test set
```R
library(caTools)
set.seed(123)
split <- sample.split(dataset$Sold, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

Feature scaling
```R
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])
```

Fitting Logistic Regression to Training set
```r
classifier = glm(formula = Sold ~ .,
                 family = binomial,
                 data = training_set)
```

Predicting the Test set results
```r
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred
```
Making the Confusion Metrix
```r
cm = table(test_set[, 3], y_pred)
cm
```

## Practice 5 -  Supprt Vector Machine
In machine learning, support-vector machines are supervised learning models with associated learning algorithms that analyze data used for classification and regression analysis. Given a set of training examples, each marked as belonging to one or the other of two categories, an SVM training algorithm builds a model that assigns new examples to one category or the other, making it a non-probabilistic binary linear classifier.


Splitting the dataset into the Training set and Test set

```r
set.seed(123)
split = sample.split(dataset$Sold, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
Feature Scaling
```r
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
Fitting SVM to the Training set
```r
library(e1071)
classifier = svm(formula = Sold ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')
svm
```

Predicting the Test set results
```r
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
```
Making the Confusion Matrix
```r
cm = table(test_set[, 3], y_pred)
cm
```

## Practice 6 -  Desicion tree
Decision tree learning is one of the predictive modelling approaches used in statistics, data mining and machine learning. It uses a decision tree (as a predictive model) to go from observations about an item (represented in the branches) to conclusions about the item's target value (represented in the leaves).

Splitting the dataset into the Training set and Test set
```r
set.seed(123)
split = sample.split(dataset$Debt, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

Feature Scaling
```r
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
Fitting Decision Tree Classification to the Training set
```r
library(rpart)
classifier = rpart(formula = Debt ~ .,
                   data = training_set)
```
Predicting the Test set results
```r
y_pred = predict(classifier, newdata = test_set[-3], type = 'class')
y_pred
```
Making the Confusion Matrix
```r
cm = table(test_set[, 3], y_pred)
cm
```
