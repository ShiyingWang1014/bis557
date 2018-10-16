setwd("/Users/shiyingwang/Desktop/bis557/data_raw")
ridge_test <- read.csv("ridge_test.csv",header=T)
save(ridge_test, file = "../data/ridge_test.rda")
