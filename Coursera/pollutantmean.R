pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  setwd(paste("~/Desktop/R/course/",directory,"/",sep=""))
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  x <- pollutant
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  dat <- data.frame(NULL)
  for (i in id){
    if (i > 99) {cur_csv <- read.csv(  paste(id,".csv",sep = "")  ,header=TRUE)}
    else if (i>9) { cur_csv <- read.csv(  paste("0",id,".csv",sep = "")  ,header=TRUE)}
    else { cur_csv <- read.csv(  paste("00",id,".csv",sep = "")  ,header=TRUE)}
    
    dat <- cbind(dat, cur_csv$x[!is.na(cur_csv$x)] )
  }
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  dat
}



pollutantmean("specdata", "nitrate", 3)