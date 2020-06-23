# Unit 3
## Navie Bayes Classifier
Navie Bayes it is a classification technique based on Bayes’ Theorem with an assumption of independence among predictors. In simple terms, a Naive Bayes classifier assumes that the presence of a particular feature in a class is unrelated to the presence of any other feature.

For example, a fruit may be considered to be an apple if it is red, round, and about 3 inches in diameter. Even if these features depend on each other or upon the existence of the other features, all of these properties independently contribute to the probability that this fruit is an apple and that is why it is known as ‘Naive’.



To import naive bayes model will need the next line
```r
install.packages("e1071")
```
Reads the dataset from the csv file
```r
SNA <- read.csv("Social_Network_Ads.csv")
str(SNA)
summary(SNA)
```

We set to null the first columns since we don't need it
```r
SNA$User.ID <- NULL
```

Converting colums to factor
```r
SNA$Age <- as.factor(SNA$Age)
SNA$EstimatedSalary <- as.factor(SNA$EstimatedSalary)
SNA$Purchased <- as.factor(SNA$Purchased)
str(SNA)
```


We instanciate e1071 library to access the model
```r
library(e1071)
library(caret)
set.seed(2020)
```
create the test set
```r
t.id <- createDataPartition(SNA$Purchased, p=0.67, list = F)
```
We create our model passing our dataset
```r
model <- naiveBayes(Purchased ~ ., data = SNA[t.id,])
model
```

We creaet the prediction for our model
```r
prediction <- predict(model, SNA[-t.id,])
```

Create a table to see each individual varibale probability
```r
tabla <- table(SNA[-t.id,]$Purchase, prediction, dnn = c("Actual", "Prediccion"))
```

```r
confusionMatrix(tabla)
```
To create the graph we'll use ElemStatLearn packge wich is broadly use for this specifc algorithm in R, and since there plenty example online where are making this graph based on that
```r
library(ElemStatLearn)
set = SNA
```
We create the exes for the graph
```r
X1 = seq(min(set[, 4]) - 1, max(set[, 4]) + 1, by = 0.01)
X2 = seq(min(set[, 5]) - 1, max(set[, 5]) + 1, by = 0.01)
```
Setting the columns
```r
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(model, newdata = grid_set)
```
Aesthetics definition for the graph
```r
plot(set[, -3], main = 'Test Naive Bayes Results',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

