getwd()
setwd("/Users/Eduardo/Stuff/Mineria\ de\ Datos/data-mining-class/unidad-3/evaluacion")
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
#library(caret)
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
