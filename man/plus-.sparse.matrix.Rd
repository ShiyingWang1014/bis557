% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sparse.matrix.R
\name{+.sparse.matrix}
\alias{+.sparse.matrix}
\title{Use for adding two "sparse.matrix" objects}
\usage{
\method{+}{sparse.matrix}(a, b)
}
\arguments{
\item{a}{A "sparse.matrix object"}

\item{b}{A "sparse.matrix object"}
}
\value{
A "sparse.matrix" object
}
\description{
This function is used for adding two "sparse.matrix" objects
}
\examples{
sm0 <- sparse.matrix(i = c(1, 2), j = c(1, 1), x = c(2, 1),dims=c(2,3))
sm1 <- sparse.matrix(i = c(1, 2, 2), j = c(1, 1, 2), x = c(4.4, 1.2, 3),dims = c(2, 3))
sm0+sm1
}
