
#' Fit a linear model
#'
#' @description This function passes parameters to the lm function.
#' @param formula a formula
#' @param data a data.frame
#' @return An lm object
#' @importFrom stats lm
#' @examples
#' fit <- linear_model(Sepal.Length ~., iris)
#' summary(fit)
#' @export
linear_model <- function(formula, data) {
  mm<-model.matrix(formula,data)
  mf<-model.frame(formula, data)
  y<-mf[as.integer(row.names(mm)),1]
  QR<-qr(mm)
  
  ##coefficients
  b<-qr.coef(QR,y)
  
  ##lm.object
  flm<-list()
  
  ##residuals
  mm2<-mm[,!is.na(b)]
  b2<-b[!is.na(b)]
  residuals<-as.vector(y-mm2%*%b2)
  
  ##effects 
  effects<-qr.qty(QR,y)
  
  ## rank   the rank of design matrix
  rank<-QR$rank
  
  ##fitted.values
  fitted.values<-as.vector(mm2%*%b2)
  
  ##assign 
  assign<-attr(QR$qr,"assign")
  
  ##qr  QR  qr qraux pivot  tol rank
  qr<-QR
  
  ##df.residual
  df.residual<-dim(mm2)[1]-dim(mm2)[2]
  
  ##contrasts 
  contrasts<-attr(QR$qr,"contrasts")
  
  ##xlevels
  xlevels<-.getXlevels(terms(formula,data=data),m=mf)
  
  ##call
  call = match.call(lm,call("lm",formula=formula))
                    
  ##terms
  terms<-terms(formula,data=data)
  
  ##model 
  model<-mf[as.integer(row.names(mm)),]
  
  
  flm <- list(coefficients = b,
              residuals=residuals,
              effects=effects,
              rank=rank,
              fitted.values=fitted.values,
              assign=assign,
              qr=qr,
              df.residual=df.residual,
              contrasts=contrasts,
              xlevels=xlevels,
              call=call,
              terms=terms,
              model=model)
 class(flm)<-"lm"
  return(flm)
}





