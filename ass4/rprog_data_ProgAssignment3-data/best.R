best <- function (state, outcome){
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data <- data[data$State==state,]
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
  data=data[order(data[,columnNumber],data[,2]) ,]
  data=data[,2]
  data[1][1]
  
}