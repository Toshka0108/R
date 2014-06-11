pi <- function(){
  pii <- function(){
    a <- 9
    center <- c(a/2,a/2)
    ln <- function(point,cntr){
      sqrt((point[2]-cntr[2])^2+(point[1]-cntr[1])^2)
    }
    num_inside <- 0
    num_outside <- 0
    for (i in 1:100000){
      random_point <- c(runif(1,0,a),runif(1,0,a))
      #print(random_point)
      #print(ln(random_point,center))
      if (ln(random_point,center)>a/2){
        num_outside <- num_outside + 1 
      }
      else {
        num_inside <- num_inside + 1 
      }
    }
    S_okr = a^2 * num_inside/(num_outside+num_inside)
    pi = S_okr / ((a/2)^2)
    pi
  }
  h <- 10
  x <- 1:h
  for (i in 1:h){
    x[i]<- pii()
  }
  mean(x)
}