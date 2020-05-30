# Data mining - Unit 2
### Practices

  - [Practice 1 - Simple Linear Regression](#practice-1---simple-linear-regression)
  - [R functions](#r-functions)
  - [Practice 3 - Revenue analysis](#practice-3---revenue-analysis)
  - [Practice 4 - Basketball data analysis](#practice-4---basketball-data-analysis)
  - [Practice 5 - Filter excercise](#practice-5---filter-excercise)

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
