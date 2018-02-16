# Applied Statistical Programing 
# Homework 5 - Problem Set 4
# Gangyi Sun (441748)


# Part 1: Getting started 
# The following code needs to be debugged and improved
myFunction<-function(doorthing, doorthing2, x){
  doorthing1<-doorthing2<-sample(1:3, 1)
  if (doorthing1==doorthing2){ x<-TRUE } else { x==FALSE }
  x
}
myFunction(sample(1:3, 1), sample(1:3, 1))
# Should return a TRUE if these samples are equal and
# a false if they are not
