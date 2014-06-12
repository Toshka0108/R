complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    setwd(paste("~/Desktop/R/course/",directory,"/",sep=""))
    dat <- data.frame(cbind(id,rep(0, times = length(id))))
    colnames(dat) <- c("id", "nobs")
    n <- length(id)
    for (i in 1:n){
        if (id[i] > 99) {cur_csv <- read.csv(  paste(id[i],".csv",sep = "")  ,header=TRUE)}
        else if (id[i]>9) { cur_csv <- read.csv(  paste("0",id[i],".csv",sep = "")  ,header=TRUE)}
        else { cur_csv <- read.csv(  paste("00",id[i],".csv",sep = "")  ,header=TRUE)}
        dat[i,2] <- sum(   complete.cases(cur_csv)    )
    }
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    dat
}