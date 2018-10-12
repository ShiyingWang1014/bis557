
#' Perform a ridge regression
#'
#' @description This function perform ridge regression.
#' @param formula a formula
#' @param data a data.frame
#' @param lambda a value for lambda
#' @return A ridge_reg object
#' @importFrom stats lm
#' @examples
#' fit <- ridge_reg(Sepal.Length ~.,1, iris)
#' fit
#' @export
ridge_reg <- function(formula, lambda, data) {
  
  mm<-model.matrix(formula,data)
  mf<-model.frame(formula, data)
  y<-mf[,1]
  
  SVD<-svd(mm)
  U<-SVD$u
  V<-SVD$v
  sigular.value<-SVD$d
  
  D<-diag(sigular.value/(sigular.value^2+lambda))
  beta<-V %*% D %*% t(U) %*% y
  rownames(beta)<-colnames(mm)
  
  ridge<-list(coefficients=beta,lambda=lambda,call=match.call(),form=formula)
  class(ridge)<-"ridge_reg"
  ridge
  }

 
  