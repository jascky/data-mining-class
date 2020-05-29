getwd()
setwd("/Users/jasc/Documents/9no/data-mining-class/unidad-2/practicas")
getwd()

# Importing the dataset
dataset <- read.csv('SAT-SCORES.csv')

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Gpa, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Gpa ~ Sat,
               data = dataset)
summary(regressor)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$Sat, y=training_set$Gpa),
             color = 'red') +
  geom_line(aes(x = training_set$Sat, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('GPA vs SAT (Training Set)') +
  xlab('SAT') +
  ylab('GPA')

# Visualising the Test set results
ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$Sat, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('GPA vs SAT (Test Set)') +
  xlab('SAT') +
  ylab('GPA')
