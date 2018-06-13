add2<-function(x,y){
   x+y
}
big<-function(x){
     d<-x>10
     x[d]
}
colmeans<-function(x,removeNA=TRUE){
      nc<-ncol(x)
      means<-numeric(nc)
      for(i in 1:nc){
        means[i]<-mean(x[,i],na.rm=removeNA)
      }
      means
  
}