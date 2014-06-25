rankall <- function(outcome, num = "best") {
    curdat <- data
    if(outcome == "heart attack"){
        pos <- 3
    }
    else if(outcome == "heart failure"){
        pos <- 4
    }
    else if(outcome == "pneumonia"){
        pos <- 5
    }
    else(stop("invalid outcome"))
    
    curdat <- curdat[complete.cases(curdat[,pos]),]
    splited <- split(curdata,curdata$State)
    
    orderr <- function(x){
        x <- x[order(x[,1]),]
        x <- x[order(x[,pos]),]
        if(num == "best"){return(x[1,1])}
        else if(num == "worst"){return(x[nrow(x),1])}
        else if(num > nrow(x)){return(NA)}
        else(return(x[num,1]))  
    }
    a <- lapply(splited,orderr) 
    a <- data.frame(unlist(a),names(a))
    colnames(a) <- c("hospital", "state")
    a
}
