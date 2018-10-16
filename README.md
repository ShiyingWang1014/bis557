[![Build Status](https://travis-ci.org/ShiyingWang1014/bis557.svg?branch=master)](https://travis-ci.org/ShiyingWang1014/bis557)

BIS557
===

This is a repository for storing all code, documentation, and digital 
artifacts for BIS557.

Now, we have two functions.
The first one called `linear_model` is used to perform linear regression.
You can use it like this:

```{R}
library(bis557)
fit <- linear_model(Sepal.Length ~., iris)
summary(fit)
```

The second one called `ridge_reg` is used to perform ridge regression.
You can use it like this:

```{R}
ridge.fit <- ridge_reg(Sepal.Length ~.,lambda=1, iris)
ridge.fit
```
