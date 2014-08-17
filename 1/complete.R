complete  <- function(directory, id = 1:332) {
  nodata <- data.frame(id= integer(0), nobs= integer(0))
  for (i in id){
    
    idforfile = sprintf("%03d", i)
    filename=paste(directory,idforfile,sep="/")
    filename=paste(filename,".csv",sep="")
    data = read.csv(filename)
    data = data[complete.cases(data),]
    rows <- nrow (data)
    newRow <- data.frame(id=i, nobs=rows)
    nodata<-rbind(nodata,newRow)
  }
  
 nodata
  
  
}