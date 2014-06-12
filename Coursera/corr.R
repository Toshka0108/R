corr <- function(directory = "specdata", threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    setwd(paste("~/Desktop/R/course/",directory,"/",sep=""))
    dat <- complete(directory)
    ok <- dat[,2] > threshold
    dat <- dat[ok,1]
    corr <- numeric(length(dat))
    print(length(dat) )
    if(length(dat) >0){
        for (i in 1:length(dat)){
            if (dat[i] > 99) {cur_csv <- read.csv(  paste(dat[i],".csv",sep = "")  ,header=TRUE)}
            else if (dat[i]>9) { cur_csv <- read.csv(  paste("0",dat[i],".csv",sep = "")  ,header=TRUE)}
            else { cur_csv <- read.csv(  paste("00",dat[i],".csv",sep = "")  ,header=TRUE)}
            corr[i] <- cor(cur_csv[,2], cur_csv[,3], use = "complete")
        }
    }
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    corr
}

