# Data mining
### Practices
1. [Practice 1 - Law Of Large Numbers](#Practic-1-Law-Of-Large-Numbers)
2. [Decision Tree](#decision-tree)
3. [Random Forest](#random-forest)
4. [Gradient boosted tree](#gradient-boosted-tree)
5. [Multilayer Perceptron](#multilayer-perceptron)
6. [Support Vector Machine](#support-vector-machine)
8. [One vs All](#one-vs-all)
7. [Naive-Bayes](#naive-bayes)

## Practice 1 - Law Of Large Numbers
The objective of this exersice is to practice the fundamentals of R langage. 
The pratice consists of creating an R script that will count how many N random normally distributed numbers with mean = 0, stdev=1 fall between -1 and 1 and divide.
```R
size <- 100
mean <- 0
stdev <- 1
# 2. Initialize counter
count <- 0
# 3. loop for(i in rnorm(size))
for(i in rnorm(size, mean, stdev)) {
    if (i < 1 && i > -1) {
        count <- count + 1
    }
}
result <- count / size
print(result)
```