setwd("/Users/shiyingwang/Desktop/bis557/data_raw")
ridge_train <- read.csv("ridge_train.csv",header=T)
save(ridge_train, file = "../data/ridge_train.rda")
