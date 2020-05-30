
#Se selecciona el folder de donde se van a solicitar los datos
getwd()
setwd("/Users/Eduardo/Stuff/Mineria\ de\ Datos/data-mining-class/unidad-2/evaluacion")
getwd()
#instalar ggplot en caso de ser necesario
#install.packages("ggplot2")

#instalar dplyr en caso de ser neceasrio
#install.packages('dplyr')

# manipulación de data frames

#read del archivo csv y store en variable
movies <- read.csv("Project-Data.csv")

#revision de los primeros datos
head(movies)

#revision de los ultimos datos
tail(movies)

#revision de la estructura interna del objeto
str(movies)

#revision de las caracteristicas generales del objeto
summary(movies)

#se instancia la libreria
library(dplyr)

#creacion de los vectores para la filtracion de datos
GenreFilter<- c("action","adventure", "animation", "comedy", "drama")
StudioFilter <- c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB")

#uso de la funcion filter de dplyr para extraer la data que necesitamos
movies <- filter(movies, Genre %in% GenreFilter, Studio %in% StudioFilter)

# se instancia la libreria
library(ggplot2)

# creacion de la grafica con la data filtrada y modificacion de label
plot <- ggplot(movies, aes(x= movies$Genre, y= movies$Gross...US, size=movies$Budget...mill., color=movies$Studio)) + ggtitle("Domestic Gross % by Genre") + labs(x = "Genre", y="Gross%US",title = "Domestic Gross % by Genre", size="Budget $M", color="Studio") + theme(plot.title  = element_text(color = "limegreen"))

#se añade la grafica jitter para generar una grafica esparcida de los datos asi como boxplot como apoyo para visualizar mejor los datos
plot + geom_jitter() + geom_boxplot(aes(color= movies$Budget...mill., alpha = 0.5), show.legend = F, outlier.alpha = F)
