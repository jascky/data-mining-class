# Data mining - Unit 4

## Evaluation - Kmeans
implement kmeans in iris.csv dataset 



# K-Means Clustering
Set our workspace
```R
getwd()
setwd("/Users/jasc/Documents/9no/data-mining-class/unidad-4/evaluacion")
getwd()
```

Importing the dataset
```R
dataset = read.csv('iris.csv')
dataset = dataset[1:4]
```

Using the elbow method to find the optimal number of clusters
```R
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
```
Fitting K-Means to the dataset
```R
set.seed(29)
kmeans = kmeans(x = dataset, centers = 3)
y_kmeans = kmeans$cluster
```
Visualising the clusters
```R
install.packages('cluster')

library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of species'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')
```
