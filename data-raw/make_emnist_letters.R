setwd("/Users/shiyingwang/Desktop/bis557/data_raw")
load_emnist <- function() {
  load_image_file <- function(filename) {
    ret = list()
    f = file(filename,'rb')
    readBin(f,'integer',n=1,size=4,endian='big')
    ret$n = readBin(f,'integer',n=1,size=4,endian='big')
    nrow = readBin(f,'integer',n=1,size=4,endian='big')
    ncol = readBin(f,'integer',n=1,size=4,endian='big')
    x = readBin(f,'integer',n=ret$n*nrow*ncol,size=1,signed=F)
    ret$x = matrix(x, ncol=nrow*ncol, byrow=T)
    close(f)
    ret
  }
  load_label_file <- function(filename) {
    f = file(filename,'rb')
    readBin(f,'integer',n=1,size=4,endian='big')
    n = readBin(f,'integer',n=1,size=4,endian='big')
    y = readBin(f,'integer',n=n,size=1,signed=F)
    close(f)
    y
  }
  train = load_image_file('emnist-letters-train-images-idx3-ubyte')
  test = load_image_file('emnist-letters-test-images-idx3-ubyte')
  train$y = load_label_file('emnist-letters-train-labels-idx1-ubyte')
  test$y = load_label_file('emnist-letters-test-labels-idx1-ubyte')  
  r<-list(train=train, test=test)
  r
}
emnist <- load_emnist()
save(emnist, file = "../data/emnist_letters.rda")
