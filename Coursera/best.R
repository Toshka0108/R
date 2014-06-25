best <- function(state, outcome){
    if(state %in% data[,2]){
        curdat <- subset(data,data[,2] == state)
    }
    else(stop("invalid state"))
    
    if(outcome == "heart attack"){
        pos <- 3
    }
    else if(outcome == "heart failures"){
        pos <- 4
    }
    else if(outcome == "pneumonia"){
        pos <- 5
    }
    else(stop("invalid outcome"))
    curdat <- curdat[complete.cases(curdat[,pos]),]
    curdat <- curdat[  order(curdat[,pos]),  ]
    curdat[1,1]
}
