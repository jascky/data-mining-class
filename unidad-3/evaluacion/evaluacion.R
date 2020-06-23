getwd()
setwd("/Users/jasc/Documents/9no/data-mining-class/unidad-3/evaluacion")
getwd()
#install.packages("e1071")
SNA <- read.csv("Social_Network_Ads.csv")
str(SNA)
summary(SNA)

#eliminamos la primera columna
SNA$User.ID <- NULL

#convertir a factor sin libreria
SNA$Age <- as.factor(SNA$Age)
SNA$EstimatedSalary <- as.factor(SNA$EstimatedSalary)
SNA$Purchased <- as.factor(SNA$Purchased)
str(SNA)

#convertir a factor usando libreria
#library(dplyr)
# all character columns to factor:
#mutado1 <- mutate_if(SNA, is.integer, as.factor)
#str(mutado1)
# select character columns 'char1', 'char2', etc. to factor:
#mutado2 <- mutate_at(SNA, vars('Age', 'EstimatedSalary', 'Purchased'), as.factor)
#str(mutado2)


#se instancia la libreria e1071
library(e1071)
library(caret)
set.seed(2020)
#se crean los datos de entrenamiento
t.id <- createDataPartition(SNA$Purchased, p=0.67, list = F)
#se crea el modelo con la funcion naiveBayes()
model <- naiveBayes(Purchased ~ ., data = SNA[t.id,])
model
#se crea la prediccion
prediction <- predict(model, SNA[-t.id,])

#se genera una tabla para visualizar el estado actual, la prediccion
tabla <- table(SNA[-t.id,]$Purchase, prediction, dnn = c("Actual", "Prediccion"))

#se revisa la matriz de confusion para observar la eficacia
confusionMatrix(tabla)




?seq
?min

library(ElemStatLearn)
# seleccion de columnas
set = SNA

# se generan los ejes con secuencias
X1 = seq(min(set[, 4]) - 1, max(set[, 4]) + 1, by = 0.01)
X2 = seq(min(set[, 5]) - 1, max(set[, 5]) + 1, by = 0.01)

grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(model, newdata = grid_set)

# Se genera grafica 
plot(set[, -3], main = 'Test Naive Bayes Results',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


