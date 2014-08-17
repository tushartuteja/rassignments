pollutantmean  <- function(directory, pollutant, id = 1:332) {
datalist = c()
  for (i in id){
    
    i = sprintf("%03d", i)
    filename=paste(directory,i,sep="/")
    filename=paste(filename,".csv",sep="")
    data = read.csv(filename)
    data = data[pollutant]
    data = data[,1]
    datalist=c(data,datalist)
  }
  
mean(datalist,na.rm=TRUE)


}

