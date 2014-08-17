corr  <- function(directory, threshold = 0) {
  nodata <- c()
  id=1:332
  for (i in id){
    
    idforfile = sprintf("%03d", i)
    filename=paste(directory,idforfile,sep="/")
    filename=paste(filename,".csv",sep="")
    data = read.csv(filename)
    data = data[complete.cases(data),]
    rows <- nrow (data)
   if(rows>threshold){
     nitrate=data[,'nitrate']
     sulfate=data[,'sulfate']
     result=cor(nitrate,sulfate)
     nodata=c(nodata,result)
   }
  }
  
  nodata
  
  
}