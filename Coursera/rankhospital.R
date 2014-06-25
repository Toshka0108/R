rankhospital <- function(state, outcome, num = "best") {
    if(state %in% data[,2]){
        curdat <- subset(data,data[,2] == state)
    }
    else(stop("invalid state"))
    
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
    curdat <- curdat[  order(curdat[,1]),  ]
    curdat <- curdat[  order(curdat[,pos]),  ]
    
    if(num == "best"){return(curdat[1,1])}
    else if(num == "worst"){return(curdat[nrow(curdat),1])}
    else if(num > nrow(curdat)){return(NA)}
    else(return(curdat[num,1]))  
}