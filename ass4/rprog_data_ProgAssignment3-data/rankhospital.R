rankhospital <- function (state, outcome, rank){
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data <- data[data$State==state,]
  data = data[complete.cases(data),]
  if (nrow(data)<1){
    stop("invalid state")
  }
  if(!(outcome=="heart attack" || outcome=="heart failure" || outcome=="pneumonia")){
    stop("invalid outcome")
  }
  if(outcome=="heart attack"){
    columnNumber = 11
  }
  if(outcome=="heart failure"){
    columnNumber = 17
  }
  if(outcome=="pneumonia"){
    columnNumber = 23
  }
  
  data[,columnNumber]=as.numeric(data[,columnNumber])
  data = data[complete.cases(data),]
  data=data[order(data[,columnNumber],data[,2]) ,]
  data=data[,2]
  if(rank=="best"){
    rank=1
   
  }
  if(rank=="worst"){
  rank=length(data)
  
  }
  
  if(rank>length(data)){
    return(NA)
  }

  data[rank]
  
}