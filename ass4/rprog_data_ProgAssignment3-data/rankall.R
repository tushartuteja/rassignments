rankall <- function (outcome,rank="best"){
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states = data[,7]
  states = unique(states)
  nodata <- data.frame(hospital= character(), state= character())
  for (state in states ) {
    hospital = rankhospital(state,outcome,rank)
    newRow <- data.frame(hospital=hospital, state=state)
    nodata<-rbind(nodata,newRow)
  }
  nodata[order(data[,2],data[,1]) ,]
}