getwd()
setwd("/Users/jasc/Documents/9no/data-mining-class/unidad-2/practicas")
getwd()

# Importing the dataset
dataset <- read.csv('SAT-SCORES.csv')


library(caTools)
set.seed(123)
split <- sample.split(dataset$Gpa, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

regressor = lm(formula = Gpa ~ Sat,
               data = dataset)
summary(regressor)

y_pred = predict(regressor, newdata = test_set)

library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$Sat, y=training_set$Gpa),
             color = 'red') +
  geom_line(aes(x = training_set$Sat, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('GPA vs SAT (Training Set)') +
  xlab('SAT') +
  ylab('GPA')

ggplot() +
  geom_point(aes(x=test_set$Sat, y=test_set$Gpa),
             color = 'red') +
  geom_line(aes(x = training_set$Sat, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('GPA vs SAT (Test Set)') +
  xlab('SAT') +
  ylab('GPA')
