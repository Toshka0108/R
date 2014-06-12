pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    setwd(paste("~/Desktop/R/course/",directory,"/",sep=""))
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    dat <- data.frame(matrix(nrow = 0 , ncol = 4))
    for (i in id){
        if (i > 99) {cur_csv <- read.csv(  paste(i,".csv",sep = "")  ,header=TRUE)}
        else if (i>9) { cur_csv <- read.csv(  paste("0",i,".csv",sep = "")  ,header=TRUE)}
        else { cur_csv <- read.csv(  paste("00",i,".csv",sep = "")  ,header=TRUE)}
        dat <- rbind(dat, data.frame(cur_csv) )
    }
    
    
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    if (pollutant == "sulfate"){ return(mean(dat[,2], na.rm = T))}
    if (pollutant == "nitrate"){ return(mean(dat[,3], na.rm = T))}
}




